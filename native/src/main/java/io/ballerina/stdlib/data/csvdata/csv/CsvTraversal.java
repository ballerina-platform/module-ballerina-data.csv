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
import io.ballerina.runtime.api.flags.SymbolFlags;
import io.ballerina.runtime.api.types.*;
import io.ballerina.runtime.api.utils.JsonUtils;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.*;
import io.ballerina.runtime.api.utils.TypeUtils;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticLog;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticErrorCode;

import java.util.*;

/**
 * Convert Csv value to a ballerina record.
 *
 * @since 0.1.0
 */
public class CsvTraversal {
    private static final ThreadLocal<CsvTree> tlCsvTree = ThreadLocal.withInitial(CsvTree::new);
    public static Object traverse(BArray csv, BMap<BString, Object> config, Type type) {
        CsvTree csvTree = tlCsvTree.get();
        try {
            return csvTree.traverseCsv(csv, config, type);
        } catch (BError e) {
            return e;
        } finally {
            csvTree.reset();
        }
    }

    static class CsvTree {
        Object currentCsvNode;
        Field currentField;
        Stack<Map<String, Field>> fieldHierarchy = new Stack<>();
        Stack<Type> restType = new Stack<>();
        Deque<String> fieldNames = new ArrayDeque<>();
        BArray rootCsvNode;
        Type expectedArrayElementType;
        Type sourceArrayElementType;
        BMap<BString, Object> config;

        void reset() {
            currentCsvNode = null;
            currentField = null;
            fieldHierarchy.clear();
            restType.clear();
            fieldNames.clear();
            expectedArrayElementType = null;
            sourceArrayElementType = null;
        }

        @SuppressWarnings("unchecked")
        public Object traverseCsv(BArray csv, BMap<BString, Object> config, Type type) {
            Type referredType = TypeUtils.getReferredType(type);
            // TODO: add root level node configurations
            if (referredType.getTag() != TypeTags.ARRAY_TAG) {
                return DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, type, PredefinedTypes.TYPE_ANYDATA_ARRAY);
            } else {
                rootCsvNode = ValueCreator.createArrayValue((ArrayType) referredType);
                expectedArrayElementType = ((ArrayType) TypeUtils.getReferredType(referredType)).getElementType();
            }
            // TODO: Handle the array size count
            sourceArrayElementType = csv.getElementType();
            int expectedArraySize = ((ArrayType) referredType).getSize();
            long sourceArraySize = csv.getLength();
            if (expectedArraySize > sourceArraySize) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_ARRAY_SIZE, sourceArraySize);
            }
            if (TypeUtils.getReferredType(expectedArrayElementType).getTag() == TypeTags.UNION_TAG) {
                return DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, expectedArrayElementType);
            }
            this.config = config;
            if (TypeUtils.getReferredType(expectedArrayElementType).getTag() == TypeTags.RECORD_TYPE_TAG
                    || TypeUtils.getReferredType(expectedArrayElementType).getTag() == TypeTags.TABLE_TAG
                    || TypeUtils.getReferredType(expectedArrayElementType).getTag() == TypeTags.MAP_TAG) {
                traverseCsvArrayMembersWithMapAsCsvElementType(expectedArraySize == -1 ? sourceArraySize : expectedArraySize, csv, expectedArrayElementType);
            } else if (TypeUtils.getReferredType(expectedArrayElementType).getTag() == TypeTags.ARRAY_TAG
                    || TypeUtils.getReferredType(expectedArrayElementType).getTag() == TypeTags.TUPLE_TAG) {
                //TODO:Handle tuples
                traverseCsvArrayMembersWithArrayAsCsvElementType(expectedArraySize == -1 ? sourceArraySize : expectedArraySize, csv, expectedArrayElementType);
            }
            return rootCsvNode;
        }

        public void traverseCsvArrayMembersWithMapAsCsvElementType(long length, BArray csv, Type expectedArrayType) {
            // todo once checked, way to find a optimize a way to save and reuse
            for (int i = 0; i < length; i++) {
                rootCsvNode.append(traverseCsvElementWithMapOrRecord(csv.get(i), expectedArrayType));
            }
        }

        public void traverseCsvArrayMembersWithArrayAsCsvElementType(long length, BArray csv, Type expectedArrayType) {
            for (int i = 0; i < length; i++) {
                rootCsvNode.append(traverseCsvElementWithArray(csv.get(i), expectedArrayType));
            }
        }

        public Object traverseCsvElementWithArray(Object csvElement, Type expectedType) {
            BArray csvMember;
            switch (expectedType.getTag()) {
                case TypeTags.ARRAY_TAG:
                    // TODO: Do the array Check on the top since this is calling again and again
                    csvMember = ValueCreator.createArrayValue((ArrayType) TypeUtils.getReferredType(expectedType));
                    traverseArrayValue(csvElement, csvMember, false);
                    return csvMember;
                case TypeTags.TUPLE_TAG:
                    // TODO: Do the array Check on the top since this is calling again and again
                    csvMember = ValueCreator.createTupleValue((TupleType) TypeUtils.getReferredType(expectedType));
                    traverseArrayValue(csvElement, csvMember, true);
                    return csvMember;
            }
            return DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, expectedType);
        }

        private void traverseArrayValue(Object csvElement, BArray csvMember, boolean tuple) {
            Type arrayMemberType = csvMember.getType();
            if (csvElement instanceof BMap) {
                constructArrayValuesFromMap(csvMember, (BMap) csvElement, arrayMemberType);
            } else if (csvElement instanceof BArray) {
                constructArrayValuesFromArray(csvMember, (BArray) csvElement, arrayMemberType);
            }
        }

        private void constructArrayValuesFromArray(BArray csvMember, BArray csvElement, Type arrayType) {
            int index = 0;
            int expectedTypeSize = getTheActualExpectedType(csvMember);
            int expectedSize = expectedTypeSize == -1 ? csvElement.size() : expectedTypeSize;
            for (int i = 0; i < csvElement.getLength(); i++) {
                if (index >= expectedSize) {
                    break;
                }
                addValuesToArrayType(csvElement.get(i), csvMember, getArrayOrTupleMemberType(arrayType, index), index);
                index++;
            }
        }

        private void constructArrayValuesFromMap(BArray csvMember, BMap<BString, Object> map, Type arrayType) {
            // TODO: This and above method can be merge
            int index = 0;
            int expectedTypeSize = getTheActualExpectedType(csvMember);
            int expectedSize = expectedTypeSize == -1 ? map.size() : expectedTypeSize;
            for (Object v: map.values()) {
                if (index >= expectedSize) {
                    break;
                }
                addValuesToArrayType(v, csvMember, getArrayOrTupleMemberType(arrayType, index), index);
                index++;
            }
        }

        private int getTheActualExpectedType(BArray csvMember) {
            Type type = csvMember.getType();
            if (type instanceof TupleType) {
                return ((TupleType) csvMember.getType()).getTupleTypes().size();
            } else {
                return ((ArrayType) csvMember.getType()).getSize();
            }
        }

        private Type getArrayOrTupleMemberType(Type type, int index) {
            if (type instanceof TupleType) {
                TupleType tupleType = (TupleType) type;
                List<Type> tupleTypes = tupleType.getTupleTypes();
                if (tupleTypes.size() >= index + 1) {
                    return tupleTypes.get(index);
                }
                Type tupleRestType = tupleType.getRestType();
                if (tupleRestType != null) {
                    return tupleRestType;
                }
                return null;
            }
            return ((ArrayType) type).getElementType();
        }

        private void addValuesToArrayType(Object csvElement, BArray csvMember, Type arrayElementType, int index) {
            switch (arrayElementType.getTag()) {
                case TypeTags.NULL_TAG:
                case TypeTags.BOOLEAN_TAG:
                case TypeTags.INT_TAG:
                case TypeTags.FLOAT_TAG:
                case TypeTags.DECIMAL_TAG:
                case TypeTags.STRING_TAG:
                case TypeTags.XML_TAG:
                    csvMember.add(index, convertToBasicType(csvElement, arrayElementType));
                    break;
                default:
                    DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, arrayElementType);
            }
        }

        public Object traverseCsvElementWithMapOrRecord(Object csvElement, Type expectedType) {
            switch (expectedType.getTag()) {
                case TypeTags.RECORD_TYPE_TAG:
                    traverseCsvElementWithRecordAsExpectedType(csvElement, expectedType);
                    break;
                case TypeTags.MAP_TAG:
                    traverseCsvElementWithMapAsExpectedType(csvElement, expectedType);
                    break;
                case TypeTags.TABLE_TAG:
                    //TODO: Check
                    traverseCsvElementWithMapAsExpectedType(csvElement, expectedType);
                    break;
                case TypeTags.ARRAY_TAG:
                    ArrayType arrayType = (ArrayType) expectedType;
                    int arrayElementTypeTag = arrayType.getElementType().getTag();
                    // TODO: Only allow string[]
                    if (arrayElementTypeTag != TypeTags.STRING_TAG) {
                        DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, expectedType);
                    }
                    traverseCsvElementWithArrayAsExpectedType(csvElement,expectedType, arrayType);
                    break;
                default:
                    return DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, expectedType);
            }
            return currentCsvNode;
        }

        public void traverseCsvElementWithRecordAsExpectedType(Object csvElement, Type expectedType) {
            RecordType recordType = (RecordType) expectedType;
            this.fieldHierarchy.push(new HashMap<>(recordType.getFields()));
            this.restType.push(recordType.getRestFieldType());
            currentCsvNode = ValueCreator.createRecordValue(recordType);
            traverseCsvMap(csvElement, expectedType, false);
        }

        public void traverseCsvElementWithMapAsExpectedType(Object csvElement, Type expectedType) {
            MapType mapType = (MapType) expectedType;
            this.fieldHierarchy.push(new HashMap<>());
            currentCsvNode = ValueCreator.createMapValue(mapType);
            traverseCsvMap(csvElement, expectedType, true);
        }

        public void traverseCsvElementWithArrayAsExpectedType(Object csvElement, Type expectedType, ArrayType arrayType) {
            // todo Check sizes abnd log errors
            currentCsvNode = ValueCreator.createArrayValue(arrayType);
            traverseCsvElementWithArray(csvElement, expectedType);
        }

        private void traverseCsvMap(Object csvElement, Type expectedType, boolean mappingType) {
            if (csvElement instanceof BMap map) {
                traverseMapValueWithMapAsExpectedType(map, mappingType, expectedType);
            } else if (csvElement instanceof BArray) {
                traverseArrayValueWithMapAsExpectedType((BArray) csvElement, mappingType, expectedType);
            } else {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CSV_DATA_FORMAT);
            }
        }

        private boolean checkExpectedTypeMatchWithHeaders(Type expectedType, String[] headers, BArray csvElement, int arraySize) {
            if (arraySize < headers.length) {
                return false;
            }
            if (expectedType instanceof MapType) {
                return true;
            }
            Type type = csvElement.getType();
            if (type instanceof TupleType) {
                return checkExpectedTypeMatchWithHeadersForTuple(expectedType, headers, (TupleType) type, arraySize);
            } else {
                return checkExpectedTypeMatchWithHeadersForArray(expectedType, headers, csvElement.getElementType(), arraySize);
            }
        }

        private boolean checkExpectedTypeMatchWithHeadersForTuple(Type expectedType, String[] headers, TupleType tupleType, int arraySize) {
            List<Type> tupleTypes = tupleType.getTupleTypes();
            Type restType = tupleType.getRestType();

            if (expectedType instanceof RecordType) {
                RecordType recordType = (RecordType) expectedType;
                Type restFieldType = recordType.getRestFieldType();
                if (restFieldType != null && restFieldType.getTag() == TypeTags.ANYDATA_TAG) {
                    return true;
                }
                Map<String, Field> fields = recordType.getFields();
                boolean isCompatible = true;
                for (Type type: tupleTypes) {
                    //TODO: optimize
                    for (Field field: fields.values()) {
                        if (field.getFieldType().getTag() == type.getTag()) {
                            fields.values().remove(field.getFieldType());
                            continue;
                        }
                        if (type == restFieldType) {
                            continue;
                        }
                        break;
                    }
                }
                if (restType != null && restType != restFieldType) {
                    return false;
                }
            }
            return false;
        }

        private boolean checkExpectedTypeMatchWithHeadersForArray(Type expectedType, String[] headers, Type arrayType, int arraySize) {
            arrayType = TypeUtils.getReferredType(arrayType);
            if (expectedType instanceof RecordType) {
                RecordType recordType = (RecordType) expectedType;
                Type restFieldType = recordType.getRestFieldType();
                if (restFieldType != null && (restFieldType == arrayType
                        || restFieldType.getTag() == TypeTags.ANYDATA_TAG)) {
                    return true;
                }
                Set<String> fields = recordType.getFields().keySet();
                for (int i = 0; i < headers.length; i++) {
                    if (!fields.contains(headers[i])) {
                        return false;
                    }
                }
            }
            return false;
        }

        private void traverseArrayValueWithMapAsExpectedType(BArray csvElement, boolean mappingType, Type expectedType) {
            Type fieldType;
            BString key;
            int arraySize = csvElement.size();
            String[] headers = new String[arraySize];
            //TODO: Update this, set Default headers to field Hierachy
            boolean defaultHeaders = true;
            for (int i = 0; i < arraySize; i++) {
                headers[i] = String.valueOf( i + 1);
            }
            boolean conversion = checkExpectedTypeMatchWithHeaders(expectedType, headers, csvElement, arraySize);
            if (!conversion) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csvElement, expectedType);
            }
            // TODO: Add headers from config
            for(int i = 1; i <= arraySize; i++) {
                key = StringUtils.fromString(String.valueOf(i));
                if (!mappingType) {
                    if (!isKeyBelongsToNonRestType(csvElement.get(i-1), key)) {
                        continue;
                    }
                    fieldType = TypeUtils.getReferredType(currentField.getFieldType());
                } else {
                    addFieldInMapType(key);
                    fieldType = ((MapType) expectedType).getConstrainedType();;
                }
                addCurrentFieldValue(fieldType, csvElement.get(i - 1), key);
            }
            Map<String, Field> currentField = fieldHierarchy.pop();
            checkOptionalFieldsAndLogError(currentField);
            if (!mappingType) {
                restType.pop();
            }
        }

        private void traverseMapValueWithMapAsExpectedType(BMap<BString, Object> map, boolean mappingType, Type expType) {
            Type currentFieldType;
            for (BString key : map.getKeys()) {
                if (!mappingType) {
                    if (!isKeyBelongsToNonRestType(map.get(key), key)) {
                        continue;
                    }
                    currentFieldType = TypeUtils.getReferredType(currentField.getFieldType());
                } else {
                    addFieldInMapType(key);
                    currentFieldType = TypeUtils.getReferredType(
                        ((MapType) expType).getConstrainedType()
                    );
                }
                addCurrentFieldValue(currentFieldType, map.get(key), key);
            }
            Map<String, Field> currentField = fieldHierarchy.pop();
            checkOptionalFieldsAndLogError(currentField);
            if (!mappingType) {
                restType.pop();
            }
        }

        private boolean isKeyBelongsToNonRestType(Object value, BString key) {
            currentField = fieldHierarchy.peek().remove(key.toString());
            if (currentField == null) {
                // Add to the rest field
                if (restType.peek() != null) {
                    Type restFieldType = TypeUtils.getReferredType(restType.peek());
                    addRestField(restFieldType, key, value);
                }
                return false;
            }
            fieldNames.push(currentField.getFieldName());
            return true;
        }

        private void addFieldInMapType(BString key) {
            fieldNames.push(key.toString());
        }

        private void addCurrentFieldValue(Type currentFieldType, Object mapValue, BString key) {
            int currentFieldTypeTag = currentFieldType.getTag();

            switch (currentFieldTypeTag) {
                case TypeTags.NULL_TAG:
                case TypeTags.BOOLEAN_TAG:
                case TypeTags.INT_TAG:
                case TypeTags.FLOAT_TAG:
                case TypeTags.DECIMAL_TAG:
                case TypeTags.STRING_TAG:
                    Object value = convertToBasicType(mapValue, currentFieldType);
                    ((BMap<BString, Object>) currentCsvNode).put(StringUtils.fromString(fieldNames.pop()), value);
                    break;
                default:
                    // TODO: handle maps and structure values in future
                    DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, currentFieldType);
            }
        }

        private void addRestField(Type restFieldType, BString key, Object csvMember) {
            switch (restFieldType.getTag()) {
                case TypeTags.ANYDATA_TAG:
                case TypeTags.JSON_TAG:
                    ((BMap<BString, Object>) currentCsvNode).put(key, csvMember);
                    break;
                case TypeTags.BOOLEAN_TAG:
                case TypeTags.INT_TAG:
                case TypeTags.FLOAT_TAG:
                case TypeTags.DECIMAL_TAG:
                case TypeTags.STRING_TAG:
                    if (checkTypeCompatibility(restFieldType, csvMember)) {
                        ((BMap<BString, Object>) currentCsvNode).put(key, csvMember);
                    }
                    break;
            }
        }

        private boolean checkTypeCompatibility(Type constraintType, Object csv) {
            if (csv instanceof BMap) {
                BMap<BString, Object> map = (BMap<BString, Object>) csv;
                for (BString key : map.getKeys()) {
                    if (!checkTypeCompatibility(constraintType, map.get(key))) {
                        return false;
                    }
                }
                return true;
            } else if ((csv instanceof BString && constraintType.getTag() == TypeTags.STRING_TAG)
                    || (csv instanceof Long && constraintType.getTag() == TypeTags.INT_TAG)
                    || (csv instanceof Double && (constraintType.getTag() == TypeTags.FLOAT_TAG
                    || constraintType.getTag() == TypeTags.DECIMAL_TAG))
                    || (Boolean.class.isInstance(csv) && constraintType.getTag() == TypeTags.BOOLEAN_TAG)
                    || (csv == null && constraintType.getTag() == TypeTags.NULL_TAG)) {
                return true;
            } else {
                return false;
            }
        }

        private void checkOptionalFieldsAndLogError(Map<String, Field> currentField) {
            currentField.values().forEach(field -> {
                if (SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.REQUIRED)) {
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_FIELD_IN_CSV, field.getFieldName());
                }
                // TODO: Handle this properly
                if (!(SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.REQUIRED) &&
                        SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.OPTIONAL))) {
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_FIELD_IN_CSV, field.getFieldName());
                }
            });
        }

        private Object convertToBasicType(Object csv, Type targetType) {
            if (targetType.getTag() == TypeTags.READONLY_TAG) {
                return csv;
            }
            try {
                Object value = JsonUtils.convertJSON(csv, targetType);
                if (value instanceof String) {
                    return StringUtils.fromString(value.toString());
                }
                return value;
            } catch (Exception e) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csv, targetType);
            }
        }
    }
}
