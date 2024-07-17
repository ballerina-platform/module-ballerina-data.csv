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

import io.ballerina.runtime.api.PredefinedTypes;
import io.ballerina.runtime.api.TypeTags;
import io.ballerina.runtime.api.creators.TypeCreator;
import io.ballerina.runtime.api.creators.ValueCreator;
import io.ballerina.runtime.api.flags.SymbolFlags;
import io.ballerina.runtime.api.types.ArrayType;
import io.ballerina.runtime.api.types.Field;
import io.ballerina.runtime.api.types.IntersectionType;
import io.ballerina.runtime.api.types.MapType;
import io.ballerina.runtime.api.types.RecordType;
import io.ballerina.runtime.api.types.TupleType;
import io.ballerina.runtime.api.types.Type;
import io.ballerina.runtime.api.utils.TypeUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BTypedesc;
import io.ballerina.stdlib.data.csvdata.utils.Constants;
import io.ballerina.stdlib.data.csvdata.utils.CsvConfig;
import io.ballerina.stdlib.data.csvdata.utils.CsvUtils;
import io.ballerina.stdlib.data.csvdata.utils.DataUtils;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticErrorCode;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticLog;
import org.apache.commons.lang3.StringEscapeUtils;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import static io.ballerina.stdlib.data.csvdata.csv.CsvCreator.checkAndAddCustomHeaders;
import static io.ballerina.stdlib.data.csvdata.csv.CsvCreator.getHeaderValueForColumnIndex;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.checkRequiredFieldsAndLogError;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.getSkipDataRows;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.isCharContainsInLineTerminatorUserConfig;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.processNameAnnotationsAndBuildCustomFieldMap;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.validateExpectedArraySize;

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

    // TODO: Add this implementation after creating the object pool implementation
//    private static final ThreadLocal<StateMachine> LOCAL_THREAD_STATE_MACHINE
//            = ThreadLocal.withInitial(StateMachine::new);

    public static Object parse(Reader reader, BTypedesc type, CsvConfig config)
            throws BError {
        // TODO: Add this implementation after creating the object pool implementation
//        StateMachine sm = LOCAL_THREAD_STATE_MACHINE.get();
        StateMachine sm = new StateMachine();
        try {
            Object convertedValue = sm.execute(reader, TypeUtils.getReferredType(type.getDescribingType()),
                    config, type);
            return DataUtils.validateConstraints(convertedValue, type, config.enableConstraintValidation);
        } finally {
            // Need to reset the state machine before leaving. Otherwise, references to the created
            // CSV values will be maintained and the java GC will not happen properly.
            sm.reset();
        }
    }

    static class StateMachine {
        private static final State HEADER_START_STATE = new HeaderStartState();
        private static final State HEADER_END_STATE = new HeaderEndState();
        private static final State ROW_START_STATE = new RowStartState();
        private static final State ROW_END_STATE = new RowEndState();
        private static final State STRING_ESCAPE_VALUE_STATE = new StringValueEscapedCharacterProcessingState();
        private static final State STRING_UNICODE_CHAR_STATE = new StringValueUnicodeHexProcessingState();
        private static final State HEADER_UNICODE_CHAR_STATE = new HeaderUnicodeHexProcessingState();
        private static final State HEADER_ESCAPE_CHAR_STATE = new HeaderEscapedCharacterProcessingState();
        private static final State STRING_QUOTE_CHAR_STATE = new StringQuoteValueState();
        private static final State HEADER_QUOTE_CHAR_STATE = new HeaderQuoteValueState();



        private static final char LINE_BREAK = '\n';

        Object currentCsvNode;
        ArrayList<String> headers = new ArrayList<>();
        BArray rootCsvNode;
        Map<String, Field> fieldHierarchy = new HashMap<>();
        Map<String, String> updatedRecordFieldNames = new HashMap<>();
        HashSet<String> fields = new HashSet<>();
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
        boolean isValueStart = false;
        State prevState;
        int arraySize = 0;

        StateMachine() {
            reset();
        }

        public void reset() {
            currentCsvNode = null;
            headers = new ArrayList<>();
            rootCsvNode = null;
            fieldHierarchy.clear();
            updatedRecordFieldNames.clear();
            fields.clear();
            fieldNames.clear();
            charBuff = new char[1024];
            charBuffIndex = 0;
            index = 0;
            line = 1;
            column = 0;
            restType = null;
            expectedArrayElementType = null;
            columnIndex = 0;
            rowIndex = 1;
            lineNumber = 0;
            rootArrayType = null;
            config = null;
            skipTheRow = false;
            insideComment = false;
            isCurrentCsvNodeEmpty = true;
            isHeaderConfigExceedLineNumber = false;
            isQuoteClosed = false;
            hexBuilder = new StringBuilder(4);
            isValueStart = false;
            prevState = null;
            arraySize = 0;
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
            if (this.charBuffIndex == 0) {
                return "";
            }
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

        public Object execute(Reader reader, Type type, CsvConfig config, BTypedesc bTypedesc) throws BError {
            this.config = config;
            Type referredType = TypeUtils.getReferredType(type);
            if (referredType.getTag() == TypeTags.INTERSECTION_TAG) {
                for (Type constituentType : ((IntersectionType) referredType).getConstituentTypes()) {
                    if (constituentType.getTag() == TypeTags.READONLY_TAG) {
                        continue;
                    }
                    return CsvCreator.constructReadOnlyValue(execute(reader, constituentType, config, bTypedesc));
                }
            }

            if (referredType.getTag() == TypeTags.UNION_TAG) {
                expectedArrayElementType = referredType;
            } else if (referredType.getTag() != TypeTags.ARRAY_TAG) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, type);
            } else {
                rootArrayType = (ArrayType) referredType;
                expectedArrayElementType = TypeUtils.getReferredType(rootArrayType.getElementType());
                rootCsvNode = ValueCreator.createArrayValue(rootArrayType);
            }

            switch (expectedArrayElementType.getTag()) {
                case TypeTags.RECORD_TYPE_TAG:
                    RecordType recordType = (RecordType) expectedArrayElementType;
                    restType = (recordType).getRestFieldType();
                    fieldHierarchy = new HashMap<>(recordType.getFields());
                    fields = new HashSet<>(recordType.getFields().keySet());
                    updatedRecordFieldNames = processNameAnnotationsAndBuildCustomFieldMap(recordType, fieldHierarchy);
                    break;
                case TypeTags.TUPLE_TAG:
                    restType = ((TupleType) expectedArrayElementType).getRestType();
                    break;
                case TypeTags.MAP_TAG:
                case TypeTags.ARRAY_TAG:
                    break;
                case TypeTags.INTERSECTION_TAG:
                    for (Type constituentType : ((IntersectionType) expectedArrayElementType).getConstituentTypes()) {
                        if (constituentType.getTag() == TypeTags.READONLY_TAG) {
                            continue;
                        }
                        Object mapValue = execute(reader, TypeCreator.createArrayType(
                                TypeCreator.createMapType(PredefinedTypes.TYPE_STRING)
                        ), CsvConfig.createConfigOptionsForUnion(config), bTypedesc);
                        config.stringConversion = true;
                        return CsvCreator.constructReadOnlyValue(CsvTraversal
                                .traverse((BArray) mapValue, config, bTypedesc,
                                        TypeCreator.createArrayType(constituentType)));
                    }
                    throw DiagnosticLog.error(DiagnosticErrorCode.SOURCE_CANNOT_CONVERT_INTO_EXP_TYPE,
                            expectedArrayElementType);
                case TypeTags.UNION_TAG:
                    Object mapValue = execute(reader, TypeCreator.createArrayType(
                            TypeCreator.createMapType(PredefinedTypes.TYPE_STRING)
                    ), CsvConfig.createConfigOptionsForUnion(config), bTypedesc);
                    config.stringConversion = true;
                    return CsvTraversal.traverse((BArray) mapValue, config, bTypedesc);
                default:
                    throw DiagnosticLog.error(DiagnosticErrorCode.SOURCE_CANNOT_CONVERT_INTO_EXP_TYPE,
                            expectedArrayElementType);
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
                char separator = sm.config.delimiter;
                Object customHeader = sm.config.customHeader;
                int headerStartRowNumber = getHeaderStartRowWhenHeaderIsPresent(sm.config.header);
                for (; i < count; i++) {
                    ch = buff[i];
                    sm.processLocation(ch);
                    if (ch == EOF) {
                        handleEndOfTheHeader(sm);
                        return HEADER_END_STATE;
                    }
                    if (ch == Constants.LineTerminator.CR) {
                        CsvUtils.setCarriageTokenPresent(true);
                        continue;
                    } else if (!(CsvUtils.isCarriageTokenPresent && ch == Constants.LineTerminator.LF)) {
                        CsvUtils.setCarriageTokenPresent(false);
                    }

                    if (sm.lineNumber < headerStartRowNumber) {
                        sm.isHeaderConfigExceedLineNumber = true;
                        if (sm.isNewLineOrEof(ch)) {
                            sm.lineNumber++;
                        }
                        continue;
                    }
                    sm.isHeaderConfigExceedLineNumber = false;
                    if (customHeader != null) {
                        if (sm.isNewLineOrEof(ch)) {
                            checkAndAddCustomHeaders(sm, customHeader);
                            sm.lineNumber++;
                            state = HEADER_END_STATE;
                            break;
                        }
                        state = this;
                        continue;
                    }

                    if (ch == sm.config.comment) {
                        sm.insideComment = true;
                        state = this;
                    } else if (!sm.insideComment && ch == separator) {
                        addHeader(sm);
                        sm.columnIndex++;
                        state = this;
                        continue;
                    } else if (!sm.insideComment && ch == sm.config.textEnclosure) {
                        sm.prevState = this;
                        state = HEADER_QUOTE_CHAR_STATE;
                        break;
                    } else if (!sm.insideComment && ch == sm.config.escapeChar) {
                        sm.prevState = this;
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
                        if (sm.isValueStart) {
                            sm.append(ch);
                        }
                        state = this;
                        continue;
                    } else {
                        if (!sm.insideComment) {
                            sm.append(ch);
                            sm.isValueStart = true;
                        }
                        state = this;
                        continue;
                    }
                    break;
                }
                if (state == null) {
                    state = this;
                }
                sm.index = i + 1;
                return state;
            }
        }

        private static void handleEndOfTheHeader(StateMachine sm) throws CsvParserException {
            handleEndOfTheHeader(sm, true);
        }

        private static void handleEndOfTheHeader(StateMachine sm, boolean trim) throws CsvParserException {
            sm.isValueStart = false;
            if (!sm.peek().isBlank()) {
                addHeader(sm, trim);
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
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_TUPLE_SIZE, currentSize);
            }
        }

        private static void validateRemainingRecordFields(StateMachine sm) {
            if (sm.restType == null) {
                for (Field field : sm.fieldHierarchy.values()) {
                    if (sm.config.absentAsNilableType && field.getFieldType().isNilable()) {
                        return;
                    }
                    if (SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.REQUIRED)) {
                        throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_FIELD_IN_CSV, field.getFieldName());
                    }
                }
            }
        }

        private static void addHeader(StateMachine sm) {
            addHeader(sm, true);
        }

        private static void addHeader(StateMachine sm, boolean trim) {
            sm.isValueStart = false;
            String value = sm.value();
            if (trim) {
                value = value.trim();
            }
            if (sm.expectedArrayElementType instanceof RecordType) {
                String fieldName = CsvUtils.getUpdatedHeaders(
                        sm.updatedRecordFieldNames, value, sm.fields.contains(value));
                Field field = sm.fieldHierarchy.get(fieldName);
                if (field != null) {
                    sm.fieldNames.put(fieldName, field);
                    sm.fieldHierarchy.remove(fieldName);
                }
            }
            sm.headers.add(value);
        }

        private static class HeaderEndState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) {
                return ROW_START_STATE;
            }
        }

        private static class RowStartState implements State {
            char ch;
            State state = ROW_START_STATE;

            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                char separator = sm.config.delimiter;
                long[] skipLines = getSkipDataRows(sm.config.skipLines);

                for (; i < count; i++) {
                    ch = buff[i];
                    sm.processLocation(ch);
                    if (ch == Constants.LineTerminator.CR) {
                        CsvUtils.setCarriageTokenPresent(true);
                        continue;
                    } else if (!(CsvUtils.isCarriageTokenPresent && ch == Constants.LineTerminator.LF)) {
                        CsvUtils.setCarriageTokenPresent(false);
                    }

                    if (sm.skipTheRow) {
                        if (sm.isEndOfTheRowAndValueIsNotEmpty(sm, ch)) {
                            sm.insideComment = false;
                            sm.skipTheRow = false;
                            sm.clear();
                            if (ch == EOF) {
                                return ROW_END_STATE;
                            }
                        } else {
                            sm.append(ch);
                            sm.isValueStart = true;
                        }
                        continue;
                    }

                    if (sm.isCurrentCsvNodeEmpty) {
                        if (ignoreRow(skipLines, sm.rowIndex)) {
                            updateLineAndColumnIndexes(sm);
                            sm.skipTheRow = true;
                            continue;
                        }
                        initiateNewRowType(sm);
                    }
                    if (!sm.insideComment && ch == sm.config.comment) {
                        handleEndOfTheRow(sm);
                        sm.insideComment = true;
                        state = this;
                    } else if (!sm.insideComment && ch == separator) {
                        addRowValue(sm);
                        state = this;
                    } else if (!sm.insideComment && ch == sm.config.textEnclosure) {
                        sm.prevState = this;
                        state = STRING_QUOTE_CHAR_STATE;
                        break;
                    } else if (!sm.insideComment && ch == sm.config.escapeChar) {
                        sm.prevState = this;
                        state = STRING_ESCAPE_VALUE_STATE;
                        break;
                    } else if (sm.insideComment && sm.isNewLineOrEof(ch)) {
                        sm.insideComment = false;
                        if (ch == EOF) {
                            state = ROW_END_STATE;
                            break;
                        }
                    } else if (isEndOfTheRowAndValueIsNotEmpty(sm, ch)) {
                        handleEndOfTheRow(sm);
                        if (ch == EOF) {
                            state = ROW_END_STATE;
                            break;
                        }
                    } else if (StateMachine.isWhitespace(ch, sm.config.lineTerminator)) {
                        if (sm.isValueStart) {
                            sm.append(ch);
                        }
                        state = this;
                        // ignore
                    } else {
                        if (!sm.insideComment) {
                            sm.append(ch);
                            sm.isValueStart = true;
                        }
                        state = this;
                    }
                }
                if (state == null) {
                    state = this;
                }
                sm.index = i + 1;
                return state;
            }
        }

        private static void handleEndOfTheRow(StateMachine sm) throws CsvParserException {
            handleEndOfTheRow(sm, true);
        }

        private static void handleEndOfTheRow(StateMachine sm, boolean trim) throws CsvParserException {
            sm.isValueStart = false;
            handleCsvRow(sm, trim);
            checkRequiredFieldsAndLogError(sm.fieldHierarchy, sm.config.absentAsNilableType);
        }

        private static void handleCsvRow(StateMachine sm, boolean trim) throws CsvParserException {
            String value = sm.peek();
            if (trim) {
                value = value.trim();
            }
            if (!value.isBlank()) {
                addRowValue(sm, trim);
            }
            if (!sm.isCurrentCsvNodeEmpty) {
                finalizeTheRow(sm);
                updateLineAndColumnIndexes(sm);
            } else {
                updateLineAndColumnIndexesWithoutRowIndexes(sm);
            }
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
            if (rootArraySize == -1) {
                sm.rootCsvNode.append(sm.currentCsvNode);
            } else if (sm.arraySize < rootArraySize) {
                sm.rootCsvNode.add(sm.arraySize, sm.currentCsvNode);
            }
            sm.arraySize++;
        }

        private static void addRowValue(StateMachine sm) throws CsvParserException {
            addRowValue(sm, true);
        }

        private static void addRowValue(StateMachine sm, boolean trim) throws CsvParserException {
            Type type;
            Field currentField = null;
            sm.isValueStart = false;
            Type exptype = sm.expectedArrayElementType;
            String value = sm.value();
            if (trim) {
                value = value.trim();
            }

            if (exptype instanceof RecordType) {
                type = getExpectedRowTypeOfRecord(sm);
                currentField = getCurrentField(sm);
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
                        value, type, sm.config, exptype, currentField);
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
                    if (sm.config.allowDataProjection) {
                        return null;
                    }
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_TUPLE_SIZE, tupleTypes.size());
                }
            }
        }

        private static Type getExpectedRowTypeOfArray(StateMachine sm, ArrayType arrayType) {
            if (arrayType.getSize() != -1 && arrayType.getSize() <= sm.columnIndex) {
                sm.charBuffIndex = 0;
                if (sm.config.allowDataProjection) {
                    return null;
                }
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_ARRAY_SIZE, arrayType.getSize());
            }
            return arrayType.getElementType();
        }

        private static Type getExpectedRowTypeOfRecord(StateMachine sm) {
            String header = getHeaderValueForColumnIndex(sm);
            Map<String, Field> fields = sm.fieldNames;
            if (fields.containsKey(header)) {
                return fields.get(header).getFieldType();
            } else {
                Type restType = sm.restType;
                if (restType != null) {
                    return restType;
                } else {
                    sm.charBuffIndex = 0;
                    if (sm.config.allowDataProjection) {
                        return null;
                    }
                    throw DiagnosticLog.error(DiagnosticErrorCode.NO_FIELD_FOR_HEADER, header);
                }
            }
        }

        private static Field getCurrentField(StateMachine sm) {
            String header = getHeaderValueForColumnIndex(sm);
            Map<String, Field> fields = sm.fieldNames;
            if (fields.containsKey(header)) {
                return fields.get(header);
            }
            return null;
        }

        private static class RowEndState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) {
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
                    if (ch == EOF) {
                        handleEndOfTheRow(sm, false);
                        return ROW_END_STATE;
                    }
                    if (ch == Constants.LineTerminator.CR) {
                        CsvUtils.setCarriageTokenPresent(true);
                        continue;
                    } else if (!(CsvUtils.isCarriageTokenPresent && ch == Constants.LineTerminator.LF)) {
                        CsvUtils.setCarriageTokenPresent(false);
                    }

                    if (ch == sm.config.textEnclosure) {
                        if (sm.isQuoteClosed) {
                            sm.append(ch);
                            sm.isValueStart = true;
                            continue;
                        }
                        sm.isQuoteClosed = true;
                    } else if (ch == sm.config.delimiter && sm.isQuoteClosed) {
                        addRowValue(sm, false);
                        state = ROW_START_STATE;
                        sm.isQuoteClosed = false;
                        break;
                    } else if (sm.isNewLineOrEof(ch) && sm.isQuoteClosed) {
                        handleEndOfTheRow(sm, false);
                        state = ROW_START_STATE;
                        sm.isQuoteClosed = false;
                        break;
                    } else if (ch == sm.config.escapeChar) {
                        state = STRING_ESCAPE_VALUE_STATE;
                        sm.prevState = this;
                        sm.isQuoteClosed = false;
                        break;
                    } else if (!sm.isQuoteClosed && !sm.peek().isEmpty() && ch == EOF) {
                        throw new CsvParserException("unexpected end of csv stream");
                    } else {
                        if (!sm.isQuoteClosed) {
                            sm.append(ch);
                        } else {
                            sm.append(sm.config.textEnclosure);
                            sm.append(ch);
                            sm.isQuoteClosed = false;
                        }
                        sm.isValueStart = true;
                        state = this;
                    }
                }
                if (state == null) {
                    state = this;
                }
                sm.index = i + 1;
                return state;
            }
        }

        private static class HeaderQuoteValueState implements State {

            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count)
                    throws CsvParserException {
                State state = this;
                char ch;
                for (; i < count; i++) {
                    ch = buff[i];
                    sm.processLocation(ch);
                    if (ch == EOF) {
                        handleEndOfTheRow(sm);
                        return ROW_END_STATE;
                    }
                    if (ch == Constants.LineTerminator.CR) {
                        CsvUtils.setCarriageTokenPresent(true);
                        continue;
                    } else if (!(CsvUtils.isCarriageTokenPresent && ch == Constants.LineTerminator.LF)) {
                        CsvUtils.setCarriageTokenPresent(false);
                    }

                    if (ch == sm.config.textEnclosure) {
                        sm.isQuoteClosed = true;
                    } else if (ch == sm.config.delimiter && sm.isQuoteClosed) {
                        addHeader(sm, false);
                        sm.columnIndex++;
                        sm.isQuoteClosed = false;
                        state = HEADER_START_STATE;
                        break;
                    } else if (sm.isNewLineOrEof(ch) && sm.isQuoteClosed) {
                        handleEndOfTheHeader(sm, false);
                        state = HEADER_END_STATE;
                        sm.isQuoteClosed = false;
                        break;
                    } else if (!sm.isQuoteClosed && ch == sm.config.escapeChar) {
                        sm.isQuoteClosed = false;
                        sm.prevState = this;
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
                        sm.isValueStart = true;
                        state = this;
                        continue;
                    }
                    break;
                }
                if (state == null) {
                    state = this;
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
                    if (ch == EOF) {
                        handleEndOfTheRow(sm);
                        return ROW_END_STATE;
                    }
                    if (ch == Constants.LineTerminator.CR) {
                        CsvUtils.setCarriageTokenPresent(true);
                        continue;
                    } else if (!(CsvUtils.isCarriageTokenPresent && ch == Constants.LineTerminator.LF)) {
                        CsvUtils.setCarriageTokenPresent(false);
                    }

                    if ((ch >= '0' && ch <= '9') || (ch >= 'A' && ch <= 'F') || (ch >= 'a' && ch <= 'f')) {
                        sm.hexBuilder.append(ch);
                        sm.isValueStart = true;
                        if (sm.hexBuilder.length() >= 4) {
                            sm.append(this.extractUnicodeChar(sm));
                            this.reset(sm);
                            state = sm.prevState;
                            sm.prevState = this;
                            break;
                        }
                        state = this;
                        continue;
                    }
                    this.reset(sm);
                    StateMachine.throwExpected("hexadecimal value of an unicode character");
                    break;
                }
                if (state == null) {
                    state = this;
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
                    if (ch == Constants.LineTerminator.CR) {
                        CsvUtils.setCarriageTokenPresent(true);
                    } else if (!(CsvUtils.isCarriageTokenPresent && ch == Constants.LineTerminator.LF)) {
                        CsvUtils.setCarriageTokenPresent(false);
                    }
                    if (ch == EOF) {
                        handleEndOfTheRow(sm);
                        return ROW_END_STATE;
                    }
                    switch (ch) {
                        case '"':
                            sm.append(QUOTES);
                            state = sm.prevState;
                            break;
                        case '\\':
                            sm.append(REV_SOL);
                            state = sm.prevState;
                            break;
                        case '/':
                            sm.append(SOL);
                            state = sm.prevState;
                            break;
                        case 'b':
                            sm.append(BACKSPACE);
                            state = sm.prevState;
                            break;
                        case 'f':
                            sm.append(FORMFEED);
                            state = sm.prevState;
                            break;
                        case 'n':
                            sm.append(NEWLINE);
                            state = sm.prevState;
                            break;
                        case 'r':
                            sm.append(CR);
                            state = sm.prevState;
                            break;
                        case 't':
                            sm.append(HZ_TAB);
                            state = sm.prevState;
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
                if (state == null) {
                    state = this;
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
