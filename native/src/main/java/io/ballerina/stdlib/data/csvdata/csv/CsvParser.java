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
        private static State HEADER_ELEMENT_START_STATE = new HeaderElementStartState();
        private static State HEADER_ELEMENT_END_STATE = new HeaderElementEndState();
        private static State HEADER_END_STATE = new HeaderEndState();
        private static State ROW_START_STATE = new RowStartState();
        private static State ROW_END_STATE = new RowEndState();
        private static State STRING_COLUMN_START_STATE = new StringColumnStartState();
        private static State STRING_COLUMN_END_STATE = new StringColumnEndState();
        private static State NON_STRING_COLUMN_START_STATE = new NonStringColumnStartState();
        private static State NON_STRING_COLUMN_END_STATE = new NonStringColumnEndState();
        private static State MAP_START_STATE = new MapStartState();
        private static State MAP_END_STATE = new MapEndState();

        private static String lineBreak = "\n";

        Object currentCsvNode;
        Object currentRow;
        ArrayList<String> headers = new ArrayList<>();
        BArray rootCsvNode;
        Deque<Object> nodesStack;
        // TODO: Need group same level field and keep the hierarchy.
        ArrayList<String> fieldNames;

        private StringBuilder hexBuilder = new StringBuilder(4);
        private char[] charBuff = new char[1024];
        private int charBuffIndex;

        private int index;
        private int line;
        private int column;
        private char currentQuoteChar;
        Field currentField;
        Map<String, Field> fieldHierarchy = new HashMap<>();
        Stack<Type> restType = new Stack<>();
        Stack<Type> expectedTypes = new Stack<>();
        int csvFieldDepth = 0;
        Stack<Integer> arrayIndexes = new Stack<>();
        Stack<ParserContexts> parserContexts = new Stack<>();
        Type expectedArrayElementType;
        int columnIndex = 0;
        int rowIndex = 0;

        StateMachine() {
            reset();
        }

        public enum ParserContexts {
            MAP,
            ARRAY
        }

        public void reset() {
            index = 0;
            currentCsvNode = null;
            line = 1;
            column = 0;
            nodesStack = new ArrayDeque<>();
            fieldNames = new ArrayList<>();
            fieldHierarchy.clear();
            currentField = null;
            restType.clear();
            expectedTypes.clear();
            csvFieldDepth = 0;
            rootCsvNode = null;
            columnIndex = 0;
            rowIndex = 0;
        }

        private static boolean isWhitespace(char ch) {
            return ch == SPACE || ch == HZ_TAB || ch == CR;
        }

        private static void throwExpected(String... chars) throws CsvParserException {
            throw new CsvParserException("expected '" + String.join("' or '", chars) + "'");
        }

        private void processLocation(char ch) {
            if (ch == '\n') {
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
                    expectedTypes.push(recordType);
                    restType.push(recordType.getRestFieldType());
                    fieldHierarchy = recordType.getFields();
                    break;
                case TypeTags.MAP_TAG:
                    expectedTypes.push(expectedArrayElementType);
                    break;
                case TypeTags.ARRAY_TAG:
                case TypeTags.TUPLE_TAG:
                    expectedTypes.push(expectedArrayElementType);
                    arrayIndexes.push(0);
                    break;
                // TODO: Check to add Union types as well
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
                return rootCsvNode;
            } catch (IOException e) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TOKEN, e.getMessage(), line, column);
            } catch (CsvParserException e) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TOKEN, e.getMessage(), line, column);
            }
        }

        private boolean isSupportedUnionType(UnionType type) {
            boolean isContainUnsupportedMember = false;
            for (Type memberType : type.getMemberTypes()) {
                switch (memberType.getTag()) {
                    case TypeTags.RECORD_TYPE_TAG:
                    case TypeTags.OBJECT_TYPE_TAG:
                    case TypeTags.MAP_TAG:
                    case TypeTags.JSON_TAG:
                    case TypeTags.ANYDATA_TAG:
                        isContainUnsupportedMember = true;
                        break;
                    case TypeTags.UNION_TAG:
                        isContainUnsupportedMember = isSupportedUnionType(type);
                        break;
                }
            }
            return !isContainUnsupportedMember;
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

        private boolean isEndOftheRow(char ch) {
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
                        addHeader(sm.headers, sm.value(), sm.expectedTypes.peek());
                        sm.columnIndex++;
                    } else if (sm.isEndOftheRow(ch)) {
                        addHeader(sm.headers, sm.value(), sm.expectedTypes.peek());
                        finalizeHeaders(sm);
//                        state = HEADER_END_STATE;
                        sm.columnIndex = 0;
                        state = ROW_START_STATE;
                    } else if (StateMachine.isWhitespace(ch)) {
                        state = this;
                        continue;
//                    } else if (ch == EOF) {
//                        throw new CsvParserException("Unexpected Header");
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
                    RecordType recordType = ((RecordType) expType);
                    if (recordType.getRestFieldType() == null) {
                        for (Field field : recordType.getFields().values()) {
                            if (!sm.headers.contains(field.getFieldName())) {
                                if (SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.REQUIRED)) {
                                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_FIELD_IN_CSV, field.getFieldName());
                                }
                            }
                        }
                    }
                } else if (expType instanceof ArrayType) {
                    // TODO: Get the other validation into here
                    ArrayType arrayType = (ArrayType) expType;
                    int size = arrayType.getSize();
                    //TODO: Replace arraysize -1 with
                    if (size != -1 && size > sm.headers.size()) {
                        // TODO: Can remove using fillers
                        throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_ARRAY_SIZE, sm.headers.size());
                    }
                } else if (expType instanceof MapType) {
                    //ignore
                } else if (expType instanceof TupleType) {
                    TupleType tupleType = (TupleType) expType;
                    if (tupleType.getRestType() != null && tupleType.getTupleTypes().size() > sm.headers.size()) {
                        // TODO: Can remove using fillers
                        throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_TUPLE_SIZE, sm.headers.size());
                    }
                } else {
                    throw new CsvParserException("Invalid expected type");
                }
            }

            private void addHeader(ArrayList<String> headers, String value, Type expectedType) throws CsvParserException {
                if (expectedType instanceof RecordType) {
                    RecordType recordType = (RecordType) expectedType;
                    Type restType = recordType.getRestFieldType();
                    if (restType != null && restType.getTag() != TypeTags.ANYDATA_TAG && !recordType.getFields().containsKey(StringUtils.fromString(value))) {
                        throw new CsvParserException("Invalid header name");
                    }
                }
                headers.add(value);
            }
        }

        private static class HeaderElementStartState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                return null;
            }
        }

        private static class HeaderElementEndState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                return null;
            }
        }

        private static class HeaderEndState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                return null;
            }
        }

        private static class RowStartState implements State {
            @Override
            public State transition(StateMachine sm, char[] buff, int i, int count) throws CsvParserException {
                char ch;
                State state;
                //TODO: Add separator here
                char separator = ',';

                // TODO: Ignore this in future
                sm.columnIndex = 0;
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
                    } else if (sm.isEndOftheRow(ch)) {
                        addRowValue(sm);
                        finalizeTheRow(sm);
                        sm.columnIndex = 0;
                        sm.currentCsvNode = null;
                    } else if (StateMachine.isWhitespace(ch)) {
                        // ignore
                    } else if (ch == EOF) {
                        throw new CsvParserException("Unexpected Header");
                    } else {
                        sm.append(ch);
                    }
                }
                if (!isWhitespace(buff[i]) || buff[i] != separator) {
                    addRowValue(sm);
                    finalizeTheRow(sm);
                    sm.currentCsvNode = null;
                }
                sm.index = i + 1;
                state = ROW_END_STATE;
                return state;
            }

            private void initiateNewRowType(StateMachine sm) throws CsvParserException {
                sm.currentCsvNode = createRowType(sm.expectedTypes.peek());
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
                    return CsvCreator.initRootMapValue(expectedType);
                } else if (expectedType instanceof ArrayType || expectedType instanceof TupleType) {
                    return CsvCreator.initArrayValue(expectedType);
                }
                throw new CsvParserException("Unexpected expected type");
            }

            private void addRowValue(StateMachine sm) throws CsvParserException {
                // TODO: Can convert all at once by storing in a Object[]
                Type type;
                Type exptype = sm.expectedTypes.peek();
                if (exptype instanceof RecordType) {
                    // TODO: These can be make as module level variables
                    RecordType recordType = ((RecordType) exptype);
                    Map<String, Field> fields = recordType.getFields();
                    Type restType = recordType.getRestFieldType();
                    String header = sm.headers.get(sm.columnIndex);
                    if (fields.containsKey(header)) {
                        //TODO: Optimize
                        type = fields.get(header).getFieldType();
                    } else {
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
//                        throw new CsvParserException("Unexpected Row count");
                        return;
                    }
                    type = arrayType.getElementType();
                } else if (exptype instanceof TupleType) {
                    TupleType tupleType = (TupleType) exptype;
                    List<Type> tupleTypes = tupleType.getTupleTypes();
                    Type restType = tupleType.getRestType();
                    if (tupleTypes.size() > sm.columnIndex) {
                        type = tupleTypes.get(sm.columnIndex);
                    } else {
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
                char ch;
                State state = ROW_END_STATE;
                for (; i < count; i++) {

                }
                sm.index = i + 1;
                return state;
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
