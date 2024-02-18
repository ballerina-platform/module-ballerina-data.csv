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
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticLog;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticErrorCode;

import java.io.IOException;
import java.io.Reader;
import java.util.*;

/**
 * Convert Csv string to a ballerina record.
 *
 * @since 0.1.0
 */
public class CsvParser {
    private static final char CR = 0x000D;
    private static final char NEWLINE = 0x000A;
    private static final char HZ_TAB = 0x0009;
    private static final char SPACE = 0x0020;
    private static final char BACKSPACE = 0x0008;
    private static final char FORMFEED = 0x000C;
    private static final char QUOTES = '"';
    private static final char REV_SOL = '\\';
    private static final char SOL = '/';
    private static final char EOF = (char) -1;


    private static final ThreadLocal<StateMachine> tlStateMachine = ThreadLocal.withInitial(StateMachine::new);

    public static Object parse(Reader reader, Type type)
            throws BError {
        StateMachine sm = tlStateMachine.get();
        try {
            return sm.execute(reader, TypeUtils.getReferredType(type));
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
        private static State STRING_COLUMN_START_STATE = new StringColumnStartState();
        private static State STRING_COLUMN_END_STATE = new StringColumnEndState();
        private static State NON_STRING_COLUMN_START_STATE = new NonStringColumnStartState();
        private static State NON_STRING_COLUMN_END_STATE = new NonStringColumnEndState();
        private static State MAP_START_STATE = new MapStartState();
        private static State MAP_END_STATE = new MapEndState();
        private static char LINE_BREAK = '\n';

        Object currentCsvNode;
        ArrayList<String> headers = new ArrayList<>();
        BArray rootCsvNode;
        // TODO: Need group same level field and keep the hierarchy.
        ArrayList<String> fieldNames;
        Map<String, Field> fieldHierarchy = new HashMap<>();
        private char[] charBuff = new char[1024];
        private int charBuffIndex;
        private int index;
        private int line;
        private int column;
        Type restType;
        Type expectedArrayElementType;
        int columnIndex = 0;
        int rowIndex = 0;

        StateMachine() {
            reset();
        }

        public void reset() {
            index = 0;
            currentCsvNode = null;
            line = 1;
            column = 0;
            fieldNames = new ArrayList<>();
            restType = null;
            rootCsvNode = null;
            columnIndex = 0;
            rowIndex = 0;
            fieldHierarchy.clear();
        }

        private static boolean isWhitespace(char ch) {
            return ch == SPACE || ch == HZ_TAB || ch == CR;
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

        public Object execute(Reader reader, Type type) throws BError {
            Type referredType = TypeUtils.getReferredType(type);
            if (referredType.getTag() != TypeTags.ARRAY_TAG) {
                return DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, type);
            } else {
                rootCsvNode = ValueCreator.createArrayValue((ArrayType) type);
                expectedArrayElementType = ((ArrayType) TypeUtils.getReferredType(referredType)).getElementType();
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
            boolean header = true;
            State currentState;
            if (header) {
                currentState = HEADER_START_STATE;
            } else {
                currentState = ROW_START_STATE;
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
                    throw new CsvParserException("Invalid token found");
                }
                return rootCsvNode;
            } catch (IOException e) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TOKEN, e.getMessage(), line, column);
            } catch (CsvParserException e) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TOKEN, e.getMessage(), line, column);
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

        private boolean isEndOfTheRow(char ch) {
            return ch == NEWLINE || ch == EOF;
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
                //TODO: Add separator here
                //TODO: If the header is not present make the headers and fieldnames to be default values
                char separator = ',';
                for (; i < count; i++) {
                    ch = buff[i];
                    sm.processLocation(ch);
                    if (ch == separator) {
                        addHeader(sm);
                        sm.columnIndex++;
                    } else if (sm.isEndOfTheRow(ch)) {
                        addHeader(sm);
                        finalizeHeaders(sm);
                        sm.columnIndex = 0;
                        state = HEADER_END_STATE;
                    } else if (StateMachine.isWhitespace(ch)) {
                        state = this;
                        continue;
                    } else if (ch == EOF) {
                        addHeader(sm);
                        state = HEADER_END_STATE;
                    } else {
                        sm.append(ch);
                        state = this;
                        continue;
                    }
                    break;
                }
                sm.index = i + 1;
                return state;
            }

            private void finalizeHeaders(StateMachine sm) throws CsvParserException {
                Type expType = sm.expectedArrayElementType;
                if (expType instanceof RecordType) {
                    validateRemainingRecordFields(sm);
                } else if (expType instanceof ArrayType) {
                    // TODO: Get the other validation into here
                    //TODO: Replace arraysize -1 with
                    // TODO: Can remove using fillers
                    ArrayType arrayType = (ArrayType) expType;
                    int size = arrayType.getSize();
                    validateExpectedArraySize(size, sm.headers.size());
                } else if (expType instanceof MapType) {
                    //ignore
                } else if (expType instanceof TupleType) {
                    validateTupleTypes((TupleType) expType, sm.restType, sm.headers.size());
                } else {
                    throw new CsvParserException("Invalid expected type");
                }
            }

            private void validateTupleTypes(TupleType tupleType, Type restType, int currentSize) {
                if (restType != null && tupleType.getTupleTypes().size() > currentSize) {
                    // TODO: Can remove using fillers
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_TUPLE_SIZE, currentSize);
                }
            }

            private void validateExpectedArraySize(int size, int currentSize) {
                if (size != -1 && size > currentSize) {
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_ARRAY_SIZE, currentSize);
                }
            }

            private void validateRemainingRecordFields(StateMachine sm) {
                if (sm.restType == null) {
                    for (Field field : sm.fieldHierarchy.values()) {
                        if (SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.REQUIRED)) {
                            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_FIELD_IN_CSV, field.getFieldName());
                        }
                    }
                }
            }

            private void addHeader(StateMachine sm) throws CsvParserException {
                String value = sm.value();
                if (sm.expectedArrayElementType instanceof RecordType) {
                    if (validateHeaderValueWithRecordFields(sm, value)) {
                        throw new CsvParserException("Header " + value + " does not match " +
                                "with any record key in the expected type");
                    }
                    sm.fieldHierarchy.remove(value);
                }
                sm.headers.add(value);
            }

            private boolean validateHeaderValueWithRecordFields(StateMachine sm, String value) {
                return sm.restType != null && sm.restType.getTag() != TypeTags.ANYDATA_TAG
                        && !sm.fieldHierarchy.containsKey(StringUtils.fromString(value));
            }
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
                //TODO: Add separator here
                char separator = ',';

                // TODO: Ignore this in future
                for (; i < count; i++) {
                    ch = buff[i];
                    sm.processLocation(ch);
                    //TODO: Handle empty values and create again and again
                    if (sm.currentCsvNode == null) {
                        initiateNewRowType(sm);
                    }
                    if (ch == separator) {
                        addRowValue(sm);
                        sm.columnIndex++;
                    } else if (sm.isEndOfTheRow(ch)) {
                        addRowValue(sm);
                        finalizeTheRow(sm);
                        sm.columnIndex = 0;
                        sm.currentCsvNode = null;
                        if (ch == EOF) {
                            state = ROW_END_STATE;
                        }
                    } else if (StateMachine.isWhitespace(ch)) {
                        // ignore
                    } else {
                        sm.append(ch);
                    }
                }
                sm.index = i + 1;
                return state;
            }

            private void initiateNewRowType(StateMachine sm) throws CsvParserException {
                sm.currentCsvNode = createRowType(sm.expectedArrayElementType);
            }

            private void finalizeTheRow(StateMachine sm) {
                int rootArraySize = ((ArrayType)(sm.rootCsvNode.getType())).getSize();
                if (rootArraySize == -1 || sm.rowIndex < rootArraySize) {
                    sm.rootCsvNode.add(sm.rowIndex, sm.currentCsvNode);
                    sm.rowIndex++;
                }
            }

            private Object createRowType(Type expectedType) throws CsvParserException {
                if (expectedType instanceof RecordType || expectedType instanceof MapType) {
                    return CsvCreator.initMapValue(expectedType);
                } else if (expectedType instanceof ArrayType || expectedType instanceof TupleType) {
                    return CsvCreator.initArrayValue(expectedType);
                }
                throw new CsvParserException("Unexpected expected type");
            }

            private void addRowValue(StateMachine sm) throws CsvParserException {
                // TODO: Can convert all at once by storing in a Object[]
                Type type;
                Type exptype = sm.expectedArrayElementType;
                if (exptype instanceof RecordType) {
                    // TODO: These can be make as module level variables
                    RecordType recordType = ((RecordType) exptype);
                    Map<String, Field> fields = recordType.getFields();
                    String header = sm.headers.get(sm.columnIndex);
                    if (fields.containsKey(header)) {
                        //TODO: Optimize
                        type = fields.get(header).getFieldType();
                    } else {
                        Type restType = sm.restType;
                        if (restType != null) {
                            type = restType;
                        } else {
                            sm.charBuffIndex = 0;
                            return;
                        }
                    }
                } else if (exptype instanceof MapType) {
                    MapType mapType = ((MapType) exptype);
                    type = mapType.getConstrainedType();
                } else if (exptype instanceof ArrayType) {
                    ArrayType arrayType = (ArrayType) exptype;
                    // TODO: add to a constant
                    if (arrayType.getSize() != -1 && arrayType.getSize() < sm.columnIndex) {
                        sm.charBuffIndex = 0;
                        return;
                    }
                    type = arrayType.getElementType();
                } else if (exptype instanceof TupleType) {
                    TupleType tupleType = (TupleType) exptype;
                    List<Type> tupleTypes = tupleType.getTupleTypes();
                    if (tupleTypes.size() > sm.columnIndex) {
                        type = tupleTypes.get(sm.columnIndex);
                    } else {
                        Type restType = sm.restType;
                        if (restType != null) {
                            type = restType;
                        } else {
                            sm.charBuffIndex = 0;
                            return;
                        }
                    }
                } else {
                    throw new CsvParserException("Unexpected expected type");
                }
                CsvCreator.convertAndUpdateCurrentJsonNode(sm, StringUtils.fromString(sm.value()), type);
            }
        }



        private static class RowEndState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                return ROW_END_STATE;
            }
        }

        private static class StringColumnStartState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                return null;
            }
        }

        private static class StringColumnEndState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                return null;
            }
        }

        private static class NonStringColumnStartState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                return null;
            }
        }

        private static class NonStringColumnEndState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                return null;
            }
        }

        private static class MapStartState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                return null;
            }
        }

        private static class MapEndState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                return null;
            }
        }

        public static class CsvParserException extends Exception {
            public CsvParserException(String msg) {
                super(msg);
            }
        }
    }
}
