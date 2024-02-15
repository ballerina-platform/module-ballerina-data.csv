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
import io.ballerina.runtime.api.creators.ValueCreator;
import io.ballerina.runtime.api.types.ArrayType;
import io.ballerina.runtime.api.types.MapType;
import io.ballerina.runtime.api.types.RecordType;
import io.ballerina.runtime.api.types.TupleType;
import io.ballerina.runtime.api.types.Type;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.utils.TypeUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;
import io.ballerina.stdlib.data.csvdata.FromString;
import io.ballerina.stdlib.data.csvdata.utils.Constants;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticErrorCode;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticLog;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

/**
 * Create objects for partially parsed json.
 *
 * @since 0.1.0
 */
public class CsvCreator {

    static BMap<BString, Object> initRootMapValue(Type expectedType) {
        switch (expectedType.getTag()) {
            case TypeTags.RECORD_TYPE_TAG:
                return ValueCreator.createRecordValue((RecordType) expectedType);
            case TypeTags.MAP_TAG:
                return ValueCreator.createMapValue((MapType) expectedType);
//            case TypeTags.JSON_TAG:
//                return ValueCreator.createMapValue(Constants.JSON_MAP_TYPE);
//            case TypeTags.ANYDATA_TAG:
//                return ValueCreator.createMapValue(Constants.ANYDATA_MAP_TYPE);
            default:
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, expectedType, "map type");
        }
    }

    static BArray initArrayValue(Type expectedType) {
        switch (expectedType.getTag()) {
            case TypeTags.TUPLE_TAG:
                return ValueCreator.createTupleValue((TupleType) expectedType);
            case TypeTags.ARRAY_TAG:
                return ValueCreator.createArrayValue((ArrayType) expectedType);
//            case TypeTags.JSON_TAG:
//                return ValueCreator.createArrayValue(PredefinedTypes.TYPE_JSON_ARRAY);
//            case TypeTags.ANYDATA_TAG:
//                return ValueCreator.createArrayValue(PredefinedTypes.TYPE_ANYDATA_ARRAY);
            default:
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, expectedType, "list type");
        }
    }

//    static Optional<BMap<BString, Object>> initNewMapValue(CsvParser.StateMachine sm) {
//        sm.parserContexts.push(CsvParser.StateMachine.ParserContexts.MAP);
//        Type expType = sm.expectedTypes.peek();
//        if (expType == null) {
//            return Optional.empty();
//        }
//        Type currentType = TypeUtils.getReferredType(expType);
//
//        if (sm.currentCsvNode != null) {
//            sm.nodesStack.push(sm.currentCsvNode);
//        }
//
//        BMap<BString, Object> nextMapValue;
//        switch (currentType.getTag()) {
//            case TypeTags.RECORD_TYPE_TAG:
//                RecordType recordType = (RecordType) currentType;
//                nextMapValue = ValueCreator.createRecordValue(recordType);
//                sm.fieldHierarchy.push(new HashMap<>(recordType.getFields()));
//                sm.restType.push(recordType.getRestFieldType());
//                break;
//            case TypeTags.MAP_TAG:
//                nextMapValue = ValueCreator.createMapValue((MapType) currentType);
//                sm.fieldHierarchy.push(new HashMap<>());
//                sm.restType.push(((MapType) currentType).getConstrainedType());
//                break;
//            case TypeTags.JSON_TAG:
//                nextMapValue = ValueCreator.createMapValue(Constants.JSON_MAP_TYPE);
//                sm.fieldHierarchy.push(new HashMap<>());
//                sm.restType.push(PredefinedTypes.TYPE_JSON);
//                break;
//            case TypeTags.ANYDATA_TAG:
//                nextMapValue = ValueCreator.createMapValue(Constants.ANYDATA_MAP_TYPE);
//                sm.fieldHierarchy.push(new HashMap<>());
//                sm.restType.push(PredefinedTypes.TYPE_JSON);
//                break;
//            default:
//                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE_FOR_FIELD, getCurrentFieldPath(sm));
//        }
//
//        Object currentJson = sm.currentCsvNode;
//        int valueTypeTag = TypeUtils.getType(currentJson).getTag();
//        if (valueTypeTag == TypeTags.MAP_TAG || valueTypeTag == TypeTags.RECORD_TYPE_TAG) {
//            ((BMap<BString, Object>) currentJson).put(StringUtils.fromString(sm.fieldNames.get(sm.columnIndex)), nextMapValue);
//        }
//        return Optional.of(nextMapValue);
//    }

//    static Optional<BArray> initNewArrayValue(CsvParser.StateMachine sm) {
//        sm.parserContexts.push(CsvParser.StateMachine.ParserContexts.ARRAY);
//        Type expType = sm.expectedTypes.peek();
//        if (expType == null) {
//            return Optional.empty();
//        }
//
//        Object currentCsvNode = sm.currentCsvNode;
//        BArray nextArrValue = initArrayValue(sm.expectedTypes.peek());
//        if (currentCsvNode == null) {
//            return Optional.ofNullable(nextArrValue);
//        }
//
//        sm.nodesStack.push(sm.currentCsvNode);
//        return Optional.ofNullable(nextArrValue);
//    }

    private static String getCurrentFieldPath(CsvParser.StateMachine sm) {
//        Iterator<String> itr = sm.fieldNames.descendingIterator();
//
//        StringBuilder result = new StringBuilder(itr.hasNext() ? itr.next() : "");
//        while (itr.hasNext()) {
//            result.append(".").append(itr.next());
//        }
//        return result.toString();
        return "Test";
    }

    static Object convertAndUpdateCurrentJsonNode(CsvParser.StateMachine sm, BString value, Type type) {
        Object currentJson = sm.currentCsvNode;
        Object convertedValue = convertToExpectedType(value, type);
        if (convertedValue instanceof BError) {
            if (sm.currentField != null) {
                throw DiagnosticLog.error(DiagnosticErrorCode.CSV_PARSER_EXCEPTION, value, type,
                        getCurrentFieldPath(sm));
            }
            throw DiagnosticLog.error(DiagnosticErrorCode.INCOMPATIBLE_TYPE, type, value);
        }

        Type currentCsvNodeType = TypeUtils.getType(currentJson);
        switch (currentCsvNodeType.getTag()) {
            case TypeTags.MAP_TAG:
            case TypeTags.RECORD_TYPE_TAG:
                ((BMap<BString, Object>) currentJson).put(StringUtils.fromString(sm.headers.get(sm.columnIndex)),
                        convertedValue);
                return currentJson;
            case TypeTags.ARRAY_TAG:
                // Handle projection in array.
                ArrayType arrayType = (ArrayType) currentCsvNodeType;
                if (arrayType.getState() == ArrayType.ArrayState.CLOSED &&
                        arrayType.getSize() - 1 < sm.columnIndex) {
                    return currentJson;
                }
                ((BArray) currentJson).add(sm.columnIndex, convertedValue);
                return currentJson;
            case TypeTags.TUPLE_TAG:
                ((BArray) currentJson).add(sm.columnIndex, convertedValue);
                return currentJson;
            default:
                return convertedValue;
        }
    }

    private static Object convertToExpectedType(BString value, Type type) {
        if (type.getTag() == TypeTags.ANYDATA_TAG) {
            return FromString.fromStringWithType(value, PredefinedTypes.TYPE_JSON);
        }
        return FromString.fromStringWithType(value, type);
    }

    static void updateRecordFieldValue(BString fieldName, Object parent, Object currentJson) {
        switch (TypeUtils.getType(parent).getTag()) {
            case TypeTags.MAP_TAG:
            case TypeTags.RECORD_TYPE_TAG:
                ((BMap<BString, Object>) parent).put(fieldName, currentJson);
                break;
        }
    }

    static Type getMemberType(Type expectedType, int index) {
        if (expectedType == null) {
            return null;
        }

        if (expectedType.getTag() == TypeTags.ARRAY_TAG) {
            return ((ArrayType) expectedType).getElementType();
        } else if (expectedType.getTag() == TypeTags.TUPLE_TAG) {
            TupleType tupleType = (TupleType) expectedType;
            List<Type> tupleTypes = tupleType.getTupleTypes();
            if (tupleTypes.size() < index + 1) {
                return tupleType.getRestType();
            }
            return tupleTypes.get(index);
        } else {
            return expectedType;
        }
    }

    static void validateListSize(int currentIndex, Type expType) {
        int expLength = 0;
        if (expType == null) {
            return;
        }

        if (expType.getTag() == TypeTags.ARRAY_TAG) {
            expLength = ((ArrayType) expType).getSize();
        } else if (expType.getTag() == TypeTags.TUPLE_TAG) {
            TupleType tupleType = (TupleType) expType;
            expLength = tupleType.getTupleTypes().size();
        }

        if (expLength >= 0 && expLength > currentIndex + 1) {
            throw DiagnosticLog.error(DiagnosticErrorCode.ARRAY_SIZE_MISMATCH);
        }
    }
}
