/*
 * Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package io.ballerina.stdlib.data.csvdata.csv;

import io.ballerina.runtime.api.TypeTags;
import io.ballerina.runtime.api.creators.ValueCreator;
import io.ballerina.runtime.api.flags.SymbolFlags;
import io.ballerina.runtime.api.types.*;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.utils.TypeUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.stdlib.data.csvdata.utils.CsvConfig;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticLog;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticErrorCode;
import org.apache.commons.lang3.StringEscapeUtils;

import java.io.IOException;
import java.io.Reader;
import java.util.*;

import static io.ballerina.stdlib.data.csvdata.csv.CsvCreator.checkAndAddCustomHeaders;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.*;

/**
 * Convert Csv string to a ballerina record.
 *
 * @since 0.1.0
 */
public class CsvParser {
    private static final char CR = 0x000D;
    private static final char HZ_TAB = 0x0009;
    private static final char SPACE = 0x0020;
    private static final char BACKSPACE = 0x0008;
    private static final char FORMFEED = 0x000C;
    private static final char QUOTES = '"';
    private static final char REV_SOL = '\\';
    private static final char SOL = '/';
    private static final char EOF = (char) -1;
    private static final char NEWLINE = 0x000A;


    private static final ThreadLocal<StateMachine> tlStateMachine = ThreadLocal.withInitial(StateMachine::new);

    public static Object parse(Reader reader, Type type, CsvConfig config)
            throws BError {
        StateMachine sm = tlStateMachine.get();
        try {
            return sm.execute(reader, TypeUtils.getReferredType(type), config);
        } finally {
            // Need to reset the state machine before leaving. Otherwise, references to the created
            // CSV values will be maintained and the java GC will not happen properly.
            sm.reset();
        }
    }

    static class StateMachine {
        private static State HEADER_START_STATE = new HeaderStartState();
        private static State HEADER_END_STATE = new HeaderEndState();
        private static State ROW_START_STATE = new RowStartState();
        private static State ROW_END_STATE = new RowEndState();
        private static State STRING_ESCAPE_VALUE_STATE = new StringValueEscapedCharacterProcessingState();
        private static State STRING_UNICODE_CHAR_STATE = new StringValueUnicodeHexProcessingState();
        private static State HEADER_UNICODE_CHAR_STATE = new HeaderUnicodeHexProcessingState();
        private static State HEADER_ESCAPE_CHAR_STATE = new HeaderEscapedCharacterProcessingState();
        private static State STRING_QUOTE_CHAR_STATE = new StringQuoteValueState();
        private static State HEADER_QUOTE_CHAR_STATE = new HeaderQuoteValueState();



        private static char LINE_BREAK = '\n';

        Object currentCsvNode;
        Stack<String> currentEscapeCharacters = new Stack<>();
        ArrayList<String> headers = new ArrayList<>();
        BArray rootCsvNode;
        Map<String, Field> fieldHierarchy = new HashMap<>();
        Map<String, Field> fieldNames = new HashMap<>();
        private char[] charBuff = new char[1024];
        private int charBuffIndex;
        private int index;
        private int line;
        private int column;
        Type restType;
        Type expectedArrayElementType;
        int columnIndex = 0;
        int rowIndex = 1;
        int lineNumber = 0;
        ArrayType rootArrayType = null;
        CsvConfig config = null;
        boolean skipTheRow = false;
        boolean insideComment = false;
        boolean isCurrentCsvNodeEmpty = true;
        boolean isHeaderConfigExceedLineNumber = false;
        boolean isQuoteClosed = false;

        private StringBuilder hexBuilder = new StringBuilder(4);
        StateMachine() {
            reset();
        }

        public void reset() {
            index = 0;
            currentCsvNode = null;
            line = 1;
            column = 0;
            restType = null;
            rootCsvNode = null;
            columnIndex = 0;
            rowIndex = 1;
            fieldHierarchy.clear();
            fieldNames.clear();
            rootArrayType = null;
            config = null;
            lineNumber = 0;
            expectedArrayElementType = null;
            headers = new ArrayList<>();
            currentEscapeCharacters = new Stack<>();
            charBuff = new char[1024];
            charBuffIndex = 0;
            skipTheRow = false;
            isCurrentCsvNodeEmpty = true;
            isHeaderConfigExceedLineNumber = false;
            hexBuilder = new StringBuilder(4);
            isQuoteClosed = false;
        }

        private static boolean isWhitespace(char ch, Object lineTerminator) {
            return ch == SPACE || ch == HZ_TAB || ch == CR
                    || isCharContainsInLineTerminatorUserConfig(ch, lineTerminator);
        }

        private static void throwExpected(String... chars) throws CsvParserException {
            throw new CsvParserException("expected '" + String.join("' or '", chars) + "'");
        }

        private void processLocation(char ch) {
            if (ch == LINE_BREAK) {
                this.line++;
                this.column = 0;
            } else {
                this.column++;
            }
        }

        private String value() {
            String result = new String(this.charBuff, 0, this.charBuffIndex);
            this.charBuffIndex = 0;
            return result;
        }

        private void clear() {
            this.charBuffIndex = 0;
        }

        private String peek() {
            return new String(this.charBuff, 0, this.charBuffIndex);
        }

        public Object execute(Reader reader, Type type, CsvConfig config) throws BError {
            this.config = config;
            Type referredType = TypeUtils.getReferredType(type);
            if (referredType.getTag() != TypeTags.ARRAY_TAG) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, type);
            } else {
                rootArrayType = (ArrayType) type;
                rootCsvNode = ValueCreator.createArrayValue(rootArrayType);
                expectedArrayElementType = TypeUtils.getReferredType(((ArrayType) referredType).getElementType());
            }
            switch (expectedArrayElementType.getTag()) {
                // TODO: Handle readonly and singleton type as expType.
                case TypeTags.RECORD_TYPE_TAG:
                    RecordType recordType = (RecordType) expectedArrayElementType;
                    restType = (recordType).getRestFieldType();
                    fieldHierarchy = new HashMap<>(recordType.getFields());
                    break;
                case TypeTags.TUPLE_TAG:
                    restType = ((TupleType) expectedArrayElementType).getRestType();
                    break;
                case TypeTags.MAP_TAG:
                case TypeTags.ARRAY_TAG:
                    break;
                case TypeTags.UNION_TAG:
                    throw DiagnosticLog.error(DiagnosticErrorCode.UNION_TYPES_NOT_ALLOWED, expectedArrayElementType);
                default:
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, expectedArrayElementType);
            }

            State currentState;
            if (config.header != Boolean.FALSE) {
                currentState = HEADER_START_STATE;
            } else {
                if (config.customHeader != null) {
                    checkAndAddCustomHeaders(this, config.customHeader);
                }
                currentState = ROW_START_STATE;
                addFieldNamesForNonHeaderState();
            }
            try {
                char[] buff = new char[1024];
                int count;
                while ((count = reader.read(buff)) > 0) {
                    this.index = 0;
                    while (this.index < count) {
                        currentState = currentState.transition(this, buff, this.index, count);
                    }
                }
                currentState = currentState.transition(this, new char[] { EOF }, 0, 1);
                if (currentState != ROW_END_STATE && currentState != HEADER_END_STATE) {
                    if (!this.isHeaderConfigExceedLineNumber) {
                        throw new CsvParserException("Invalid token found");
                    }
                }
                return rootCsvNode;
            } catch (IOException e) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TOKEN, e.getMessage(), line, column);
            } catch (CsvParserException e) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TOKEN, e.getMessage(), line, column);
            }
        }

        private void  addFieldNamesForNonHeaderState() {
            for (Map.Entry<String, Field> entry: this.fieldHierarchy.entrySet()) {
                this.fieldNames.put(entry.getKey(), entry.getValue());
            }
        }

        private void append(char ch) {
            try {
                this.charBuff[this.charBuffIndex] = ch;
                this.charBuffIndex++;
            } catch (ArrayIndexOutOfBoundsException e) {
                /* this approach is faster than checking for the size by ourself */
                this.growCharBuff();
                this.charBuff[this.charBuffIndex++] = ch;
            }
        }

        private boolean isNewLineOrEof(char ch) {
            return ch == EOF || isCharContainsInLineTerminatorUserConfig(ch, config.lineTerminator);
        }

        private void growCharBuff() {
            char[] newBuff = new char[charBuff.length * 2];
            System.arraycopy(this.charBuff, 0, newBuff, 0, this.charBuff.length);
            this.charBuff = newBuff;
        }

        /**
         * A specific state in the Csv parsing state machine.
         */
        interface State {
            State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException;
        }

        private static class HeaderStartState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                char ch;
                State state = HEADER_START_STATE;
                //TODO: If the header is not present make the headers and fieldnames to be default values
                char separator = sm.config.delimiter;
                Object customHeader = sm.config.customHeader;
                int headerStartRowNumber = getHeaderStartRowWhenHeaderIsPresent(sm.config.header);
                for (; i < count; i++) {
                    ch = buff[i];
                    sm.processLocation(ch);
                    if (sm.lineNumber < headerStartRowNumber) {
                        sm.isHeaderConfigExceedLineNumber = true;
                        if (sm.isNewLineOrEof(ch)) {
                            sm.lineNumber++;
                        }
                        continue;
                    }
                    sm.isHeaderConfigExceedLineNumber = false;
//                    if (!(isWhitespace(ch, sm.config.lineTerminator) && sm.isNewLineOrEof(ch))) {
//                        headerStart = true;
//                    }
                    if (customHeader != null) {
                        if (sm.isNewLineOrEof(ch)) {
                            checkAndAddCustomHeaders(sm, customHeader);
                            sm.lineNumber++;
                            state = HEADER_END_STATE;
                            break;
                        }
                        continue;
                    }

                    if (ch == sm.config.comment) {
                        sm.insideComment = true;
                    } else if (!sm.insideComment && ch == separator) {
                        addHeader(sm);
                        sm.columnIndex++;
                        continue;
                    } else if (!sm.insideComment && ch == sm.config.textEnclosure) {
                        state = HEADER_QUOTE_CHAR_STATE;
                        break;
                    } else if (!sm.insideComment && ch == sm.config.escapeChar) {
                        state = HEADER_ESCAPE_CHAR_STATE;
                        break;
                    } else if (sm.insideComment && sm.isNewLineOrEof(ch)) {
                        sm.insideComment = false;
                        handleEndOfTheHeader(sm);
                        state = HEADER_END_STATE;
                    } else if (!sm.insideComment && isEndOfTheHeaderRow(sm, ch)) {
                        handleEndOfTheHeader(sm);
                        state = HEADER_END_STATE;
                    } else if (StateMachine.isWhitespace(ch, sm.config.lineTerminator)) {
                        state = this;
                        continue;
                    } else {
                        if (!sm.insideComment) {
                            sm.append(ch);
                        }
                        state = this;
                        continue;
                    }
                    break;
                }
                sm.index = i + 1;
                return state;
            }
        }

        private static void handleEndOfTheHeader(StateMachine sm) throws CsvParserException {
            if (!sm.peek().isBlank()) {
                addHeader(sm);
            }
            finalizeHeaders(sm);
            sm.columnIndex = 0;
            sm.lineNumber++;
        }

        private static int getHeaderStartRowWhenHeaderIsPresent(Object header) {
            return ((Long) header).intValue();
        }

        private static void finalizeHeaders(StateMachine sm) throws CsvParserException {
            if (sm.headers.size() == 0) {
                throw DiagnosticLog.error(DiagnosticErrorCode.HEADER_CANNOT_BE_EMPTY);
            }
            Type expType = sm.expectedArrayElementType;
            if (expType instanceof RecordType) {
                validateRemainingRecordFields(sm);
            } else if (expType instanceof ArrayType) {
                // TODO: Get the other validation into here
                //TODO: Replace arraysize -1 with
                // TODO: Can remove using fillers
                validateExpectedArraySize(((ArrayType) expType).getSize(), sm.headers.size());
            } else if (expType instanceof MapType) {
                //ignore
            } else if (expType instanceof TupleType) {
                validateTupleTypes((TupleType) expType, sm.restType, sm.headers.size());
            } else {
                throw new CsvParserException("Invalid expected type");
            }
        }

        private static void validateTupleTypes(TupleType tupleType, Type restType, int currentSize) {
            if (restType != null && tupleType.getTupleTypes().size() > currentSize) {
                // TODO: Can remove using fillers
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_TUPLE_SIZE, currentSize);
            }
        }

        private static void validateRemainingRecordFields(StateMachine sm) {
            if (sm.restType == null) {
                for (Field field : sm.fieldHierarchy.values()) {
                    if (SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.REQUIRED)) {
                        throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_FIELD_IN_CSV, field.getFieldName());
                    }
                }
            }
        }

        private static void addHeader(StateMachine sm) throws CsvParserException {
            String value = sm.value();
            if (sm.expectedArrayElementType instanceof RecordType) {
                Field field = sm.fieldHierarchy.get(value);
                if (field != null) {
                    sm.fieldNames.put(value, field);
                    sm.fieldHierarchy.remove(value);
                }
            }
            sm.headers.add(value);
        }

        private static class HeaderEndState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                return ROW_START_STATE;
            }
        }

        private static class RowStartState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                char ch;
                State state = ROW_START_STATE;
                char separator = sm.config.delimiter;
                long[] skipLines = getSkipDataRows(sm.config.skipLines);

                // TODO: Ignore this in future
                for (; i < count; i++) {
                    ch = buff[i];
                    sm.processLocation(ch);
                    if (sm.skipTheRow) {
//                        buff[i-10],buff[i-9],buff[i-8],buff[i-7],buff[i-6],buff[i-5],buff[i-4],buff[i-3],buff[i-2],buff[i-1],buff[i],buff[i+1],buff[i+2],buff[i+3]
                        if (sm.isEndOfTheRowAndValueIsNotEmpty(sm, ch)) {
                            sm.insideComment = false;
                            sm.skipTheRow = false;
                            sm.clear();
                            if (ch == EOF) {
                                state = ROW_END_STATE;
                            }
                        } else {
                            sm.append(ch);
                        }
                        continue;
                    }

                    //TODO: Handle empty values and create again and again
                    if (sm.isCurrentCsvNodeEmpty) {
                        if (ignoreRow(skipLines, sm.rowIndex)) {
                            updateLineAndColumnIndexes(sm);
                            sm.skipTheRow = true;
                            continue;
                        }
                        initiateNewRowType(sm);
                    }
                    if (!sm.insideComment && ch == sm.config.comment) {
                        handleEndOfTheRow(sm, ch);
                        sm.insideComment = true;
                        if (ch == EOF) {
                            state = ROW_END_STATE;
                        }
                    } else if (!sm.insideComment && ch == separator) {
                        addRowValue(sm);
                    } else if (!sm.insideComment && ch == sm.config.textEnclosure) {
                        state = STRING_QUOTE_CHAR_STATE;
                        break;
                    } else if (!sm.insideComment && ch == sm.config.escapeChar) {
                        state = STRING_ESCAPE_VALUE_STATE;
                        break;
                    } else if (sm.insideComment && sm.isNewLineOrEof(ch)) {
                        sm.insideComment = false;
                        if (ch == EOF) {
                            state = ROW_END_STATE;
                            break;
                        }
                    } else if (isEndOfTheRowAndValueIsNotEmpty(sm, ch)) {
                        handleEndOfTheRow(sm, ch);
                        if (ch == EOF) {
                            state = ROW_END_STATE;
                            break;
                        }
                    } else if (StateMachine.isWhitespace(ch, sm.config.lineTerminator)) {
                        // ignore
                    } else {
                        if (!sm.insideComment) {
                            sm.append(ch);
                        }
                    }
                }
                sm.index = i + 1;
                return state;
            }
        }

        private static void handleEndOfTheRow(StateMachine sm, char ch) throws CsvParserException {
//                if (sm.peek().isBlank()) {
//                    updateLineAndColumnIndexesWithoutRowIndexes(sm);
//                } else {
            handleCsvRow(sm);
            checkOptionalFieldsAndLogError(sm.fieldHierarchy);
//                }
        }

        private static void handleCsvRow(StateMachine sm) throws CsvParserException {
            if (!sm.peek().isBlank()) {
                addRowValue(sm);
            }
            if (!sm.isCurrentCsvNodeEmpty) {
                finalizeTheRow(sm);
            } else {
                updateLineAndColumnIndexesWithoutRowIndexes(sm);
            }
            updateLineAndColumnIndexes(sm);
        }

        private static void updateLineAndColumnIndexes(StateMachine sm) {
            sm.rowIndex++;
            updateLineAndColumnIndexesWithoutRowIndexes(sm);
        }

        private static void updateLineAndColumnIndexesWithoutRowIndexes(StateMachine sm) {
            sm.lineNumber++;
            sm.currentCsvNode = null;
            sm.isCurrentCsvNodeEmpty = true;
            sm.columnIndex = 0;
        }

        private static boolean ignoreRow(long[] skipLines, int lineNumber) {
            for (long skipLine: skipLines) {
                if (skipLine == lineNumber) {
                    return true;
                }
            }
            return false;
        }

        private static void initiateNewRowType(StateMachine sm) {
            sm.currentCsvNode = CsvCreator.initRowValue(sm.expectedArrayElementType);
        }

        private static void finalizeTheRow(StateMachine sm) {
            int rootArraySize = sm.rootArrayType.getSize();
            if (rootArraySize == -1 || sm.rowIndex < rootArraySize) {
                sm.rootCsvNode.append(sm.currentCsvNode);
            }
        }

        private static void addRowValue(StateMachine sm) throws CsvParserException {
            // TODO: Can convert all at once by storing in a Object[]
            Type type;
            Type exptype = sm.expectedArrayElementType;
            String value = sm.value();

            if (exptype instanceof RecordType) {
                type = getExpectedRowTypeOfRecord(sm);
            } else if (exptype instanceof MapType) {
                type = ((MapType) exptype).getConstrainedType();
            } else if (exptype instanceof ArrayType) {
                type = getExpectedRowTypeOfArray(sm, (ArrayType) exptype);
            } else if (exptype instanceof TupleType) {
                type = getExpectedRowTypeOfTuple(sm, (TupleType) exptype);
            } else {
                throw new CsvParserException("Unexpected expected type");
            }

            if (type != null) {
                CsvCreator.convertAndUpdateCurrentJsonNode(sm,
                        StringUtils.fromString(value), type, sm.config, exptype);
            }
            sm.columnIndex++;
        }

        private static Type getExpectedRowTypeOfTuple(StateMachine sm, TupleType tupleType) {
            List<Type> tupleTypes = tupleType.getTupleTypes();
            if (tupleTypes.size() > sm.columnIndex) {
                return tupleTypes.get(sm.columnIndex);
            } else {
                Type restType = sm.restType;
                if (restType != null) {
                    return restType;
                } else {
                    sm.charBuffIndex = 0;
                    return null;
                }
            }
        }

        private static Type getExpectedRowTypeOfArray(StateMachine sm, ArrayType arrayType) {
            // TODO: add to a constant
            if (arrayType.getSize() != -1 && arrayType.getSize() < sm.columnIndex) {
                sm.charBuffIndex = 0;
                return null;
            }
            return arrayType.getElementType();
        }

        private static Type getExpectedRowTypeOfRecord(StateMachine sm) {
            // TODO: These can be make as module level variables
            String header = CsvCreator.getHeaderValueForColumnIndex(sm);
            Map<String, Field> fields = sm.fieldNames;
            if (fields.containsKey(header)) {
                //TODO: Optimize
                return fields.get(header).getFieldType();
            } else {
                Type restType = sm.restType;
                if (restType != null) {
                    return restType;
                } else {
                    sm.charBuffIndex = 0;
                    return null;
                }
            }
        }

        private static class RowEndState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                return ROW_END_STATE;
            }
        }

        private static class StringQuoteValueState implements State {

            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count)
                    throws CsvParserException {
                State state = this;
                char ch;
                for (; i < count; i++) {
                    ch = buff[i];
                    sm.processLocation(ch);
                    if (ch == sm.config.textEnclosure) {
                        if (sm.isQuoteClosed) {
                            sm.append(ch);
                            continue;
                        }
                        sm.isQuoteClosed = true;
                    } else if (ch == sm.config.delimiter && sm.isQuoteClosed) {
                        addRowValue(sm);
                        state = ROW_START_STATE;
                        sm.isQuoteClosed = false;
                        break;
                    } else if (sm.isNewLineOrEof(ch) && sm.isQuoteClosed) {
                        handleEndOfTheRow(sm, ch);
                        if (ch == EOF) {
                            state = ROW_END_STATE;
                            break;
                        }
                        state = ROW_START_STATE;
                        sm.isQuoteClosed = false;
                        break;
                    } else if (ch == sm.config.escapeChar) {
                        state = STRING_ESCAPE_VALUE_STATE;
                        sm.isQuoteClosed = false;
                        break;
                    } else if (!sm.isQuoteClosed && ch == EOF) {
                        throw new CsvParserException("unexpected end of csv stream");
                    } else {
                        if (!sm.isQuoteClosed) {
                            sm.append(ch);
                        } else {
                            sm.append(sm.config.textEnclosure);
                            sm.append(ch);
                            sm.isQuoteClosed = false;
                        }
                        state = this;
                    }
                }
                sm.index = i + 1;
                return state;
            }
        }

        private static class HeaderQuoteValueState implements State {

            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count)
                    throws CsvParserException {
                State state = null;
                char ch;
                for (; i < count; i++) {
                    ch = buff[i];
                    sm.processLocation(ch);
                    if (ch == sm.config.textEnclosure) {
                        sm.isQuoteClosed = true;
                    } else if (ch == sm.config.delimiter && sm.isQuoteClosed) {
                        addHeader(sm);
                        sm.columnIndex++;
                        sm.isQuoteClosed = false;
                        state = HEADER_START_STATE;
                        break;
                    } else if (sm.isNewLineOrEof(ch) && sm.isQuoteClosed) {
                        handleEndOfTheHeader(sm);
                        state = HEADER_END_STATE;
                        sm.isQuoteClosed = false;
                        break;
                    } else if (!sm.isQuoteClosed && ch == sm.config.escapeChar) {
                        sm.isQuoteClosed = false;
                        state = HEADER_ESCAPE_CHAR_STATE;
                        break;
                    } else if (!sm.isQuoteClosed && ch == EOF) {
                        throw new CsvParserException("unexpected end of csv stream");
                    } else {
                        if (!sm.isQuoteClosed) {
                            sm.append(ch);
                        } else {
                            sm.append(sm.config.textEnclosure);
                            sm.append(ch);
                            sm.isQuoteClosed = false;
                        }
                        state = this;
                        continue;
                    }
                    break;
                }
                sm.index = i + 1;
                return state;
            }
        }

        private static class StringValueUnicodeHexProcessingState extends UnicodeHexProcessingState {

            @Override
            protected State getSourceState() {
                return STRING_UNICODE_CHAR_STATE;
            }

        }

        /**
         * Represents the state where an escaped unicode character in hex format is processed
         * from a field name.
         */
        private static class HeaderUnicodeHexProcessingState extends UnicodeHexProcessingState {

            @Override
            protected State getSourceState() {
                return HEADER_UNICODE_CHAR_STATE;
            }
        }

        /**
         * Represents the state where an escaped unicode character in hex format is processed.
         */
        private abstract static class UnicodeHexProcessingState implements State {

            protected abstract State getSourceState();

            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                State state = null;
                char ch;
                for (; i < count; i++) {
                    ch = buff[i];
                    sm.processLocation(ch);
                    if ((ch >= '0' && ch <= '9') || (ch >= 'A' && ch <= 'F') || (ch >= 'a' && ch <= 'f')) {
                        sm.hexBuilder.append(ch);
                        if (sm.hexBuilder.length() >= 4) {
                            sm.append(this.extractUnicodeChar(sm));
                            this.reset(sm);
                            state = this.getSourceState();
                            break;
                        }
                        state = this;
                        continue;
                    }
                    this.reset(sm);
                    StateMachine.throwExpected("hexadecimal value of an unicode character");
                    break;
                }
                sm.index = i + 1;
                return state;
            }

            private void reset(StateMachine sm) {
                sm.hexBuilder.setLength(0);
            }

            private char extractUnicodeChar(StateMachine sm) {
                return StringEscapeUtils.unescapeJava("\\u" + sm.hexBuilder.toString()).charAt(0);
            }

        }

        private static class HeaderEscapedCharacterProcessingState extends EscapedCharacterProcessingState {

            @Override
            protected State getSourceState() {
                return HEADER_ESCAPE_CHAR_STATE;
            }

        }

        private static class StringValueEscapedCharacterProcessingState extends EscapedCharacterProcessingState {

            @Override
            protected State getSourceState() {
                return STRING_ESCAPE_VALUE_STATE;
            }
        }

        private abstract static class EscapedCharacterProcessingState implements State {

            protected abstract State getSourceState();

            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                State state = null;
                char ch;
                if (i < count) {
                    ch = buff[i];
                    sm.processLocation(ch);
                    switch (ch) {
                        case '"':
                            sm.append(QUOTES);
                            state = this.getSourceState();
                            break;
                        case '\\':
                            sm.append(REV_SOL);
                            state = this.getSourceState();
                            break;
                        case '/':
                            sm.append(SOL);
                            state = this.getSourceState();
                            break;
                        case 'b':
                            sm.append(BACKSPACE);
                            state = this.getSourceState();
                            break;
                        case 'f':
                            sm.append(FORMFEED);
                            state = this.getSourceState();
                            break;
                        case 'n':
                            sm.append(NEWLINE);
                            state = this.getSourceState();
                            break;
                        case 'r':
                            sm.append(CR);
                            state = this.getSourceState();
                            break;
                        case 't':
                            sm.append(HZ_TAB);
                            state = this.getSourceState();
                            break;
                        case 'u':
                            if (this.getSourceState() == STRING_ESCAPE_VALUE_STATE) {
                                state = STRING_UNICODE_CHAR_STATE;
                            } else if (this.getSourceState() == HEADER_ESCAPE_CHAR_STATE) {
                                state = HEADER_UNICODE_CHAR_STATE;
                            } else {
                                throw new CsvParserException("unknown source '" + this.getSourceState() +
                                        "' in escape char processing state");
                            }
                            break;
                        default:
                            StateMachine.throwExpected("escaped characters");
                    }
                }
                sm.index = i + 1;
                return state;
            }
        }

        public static boolean isEndOfTheRowAndValueIsNotEmpty(CsvParser.StateMachine sm, char ch) {
            return sm.isNewLineOrEof(ch) && (ch == EOF || !(sm.isCurrentCsvNodeEmpty && sm.peek().isBlank()));
        }

        public static boolean isEndOfTheHeaderRow(CsvParser.StateMachine sm, char ch) {
            return sm.isNewLineOrEof(ch);
        }

        public static class CsvParserException extends Exception {
            public CsvParserException(String msg) {
                super(msg);
            }
        }
    }
}
