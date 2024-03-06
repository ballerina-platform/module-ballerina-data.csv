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
import io.ballerina.runtime.api.types.*;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.utils.TypeUtils;
import io.ballerina.runtime.api.values.*;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticLog;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticErrorCode;

import java.util.*;

import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.*;

/**
 * Convert Csv value to a ballerina record.
 *
 * @since 0.1.0
 */
public class CsvTraversal {
    private static final ThreadLocal<CsvTree> tlCsvTree = ThreadLocal.withInitial(CsvTree::new);
    public static Object traverse(BArray csv, CsvConfig config, Type type) {
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
        Map<String, Field> fieldHierarchy = new HashMap<>();
        Type restType;
        Deque<String> fieldNames = new ArrayDeque<>();
        BArray rootCsvNode;
        Type expectedArrayElementType;
        Type sourceArrayElementType;
        CsvConfig config;

        void reset() {
            currentCsvNode = null;
            currentField = null;
            fieldHierarchy.clear();
            restType = null;
            fieldNames.clear();
            expectedArrayElementType = null;
            sourceArrayElementType = null;
        }

        @SuppressWarnings("unchecked")
        public Object traverseCsv(BArray csv, CsvConfig config, Type type) {
            this.config = config;
            sourceArrayElementType = TypeUtils.getReferredType(csv.getElementType());
            Type referredType = TypeUtils.getReferredType(type);
            int expectedArraySize = ((ArrayType) referredType).getSize();
            int sourceArraySize = (int) csv.getLength();

            setRootCsvNode(referredType, type);
            validateExpectedArraySize(expectedArraySize, sourceArraySize);

            traverseCsvWithExpectedType(expectedArraySize, sourceArraySize, csv);
            sortCsvData(rootCsvNode, config);
            return rootCsvNode;
        }

        private void traverseCsvWithExpectedType(int expectedArraySize, int sourceArraySize, BArray csv) {
            switch (expectedArrayElementType.getTag()) {
                case TypeTags.RECORD_TYPE_TAG:
                case TypeTags.MAP_TAG:
                case TypeTags.TABLE_TAG:
                    traverseCsvArrayMembersWithMapAsCsvElementType(expectedArraySize == -1 ?
                            sourceArraySize : expectedArraySize, csv, expectedArrayElementType);
                    break;
                case TypeTags.ARRAY_TAG:
                case TypeTags.TUPLE_TAG:
                    traverseCsvArrayMembersWithArrayAsCsvElementType(expectedArraySize == -1 ?
                            sourceArraySize : expectedArraySize, csv, expectedArrayElementType);
                    break;
                default:
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, expectedArrayElementType);
            }
        }

        public void traverseCsvArrayMembersWithMapAsCsvElementType(long length, BArray csv, Type expectedArrayType) {
            Object rowValue;
            for (int i = 0; i < length; i++) {
                rowValue = traverseCsvElementWithMapOrRecord(csv.get(i), expectedArrayType);
                if (!constructRootCsvNode(rowValue, i, config.dataRowCount)) {
                    break;
                }
            }
        }

        public void traverseCsvArrayMembersWithArrayAsCsvElementType(long length, BArray csv, Type expectedArrayType) {
            Object rowValue;
            for (int i = 0; i < length; i++) {
                rowValue = traverseCsvElementWithArray(csv.get(i), expectedArrayType);
                if (!constructRootCsvNode(rowValue, i, config.dataRowCount)) {
                    break;
                }
            }
        }

        private boolean constructRootCsvNode(Object value, int i, long dataRowCount) {
            long skipDataRows = config.skipDataRows;
            if (i < skipDataRows) {
                return true;
            }
            rootCsvNode.append(value);
            if (calculateNumberOfRows(dataRowCount, i, skipDataRows)) {
                return false;
            }
            return true;
        }

        public Object traverseCsvElementWithMapOrRecord(Object csvElement, Type expectedType) {
            switch (expectedType.getTag()) {
                case TypeTags.RECORD_TYPE_TAG:
                    RecordType recordType = (RecordType) expectedType;
                    this.fieldHierarchy = new HashMap<>(recordType.getFields());
                    this.restType = recordType.getRestFieldType();
                    // TODO: check for package ID
                    currentCsvNode = ValueCreator.createRecordValue(recordType.getPackage(), recordType.getName());
                    traverseCsvMap(csvElement, expectedType, false);
                    break;
                case TypeTags.MAP_TAG:
                    MapType mapType = (MapType) expectedType;
                    currentCsvNode = ValueCreator.createMapValue(mapType);
                    traverseCsvMap(csvElement, expectedType, true);
                    break;
//                case TypeTags.TABLE_TAG:
//                    //TODO: Check
//                    TableType tableType = (TableType) expectedType;
//                    this.fieldHierarchy = new HashMap<>();
//                    currentCsvNode = ValueCreator.createT(tableType);
//                    traverseCsvMap(csvElement, expectedType, true);
//                    break;
                default:
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, expectedType);
            }
            return currentCsvNode;
        }

        public Object traverseCsvElementWithArray(Object csvElement, Type expectedType) {
            switch (expectedType.getTag()) {
                case TypeTags.ARRAY_TAG:
                    ArrayType arrayType = (ArrayType) expectedType;
                    currentCsvNode = ValueCreator.createArrayValue(arrayType);
                    traverseArrayValue(csvElement, arrayType);
                    break;
                case TypeTags.TUPLE_TAG:
                    TupleType tupleType = (TupleType) expectedType;
                    this.restType = tupleType.getRestType();
                    currentCsvNode = ValueCreator.createTupleValue(tupleType);
                    traverseArrayValue(csvElement, tupleType);
                    break;
                default:
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, expectedType);
            }
            return currentCsvNode;
        }

        private void traverseArrayValue(Object csvElement, Type type) {
            int expectedTypeSize = getTheActualExpectedType(type);
            if (csvElement instanceof BMap) {
                BMap<BString, Object> map = (BMap) csvElement;
                constructArrayValuesFromMap(map, type, expectedTypeSize == -1 ? map.size() : expectedTypeSize);
            } else if (csvElement instanceof BArray) {
                BArray array = (BArray) csvElement;
                constructArrayValuesFromArray(array, type, expectedTypeSize == -1 ? array.size() : expectedTypeSize);
            }
        }

        private void constructArrayValuesFromArray(BArray csvElement, Type type, int expectedSize) {
            int index = 0;
            for (int i = 0; i < csvElement.getLength(); i++) {
                if (index >= expectedSize) {
                    break;
                }
                addValuesToArrayType(csvElement.get(i),
                        getArrayOrTupleMemberType(type, index), index, currentCsvNode, config);
                index++;
            }
        }

        private void constructArrayValuesFromMap(BMap<BString, Object> map, Type type, int expectedSize) {
            int index = 0;
            for (Object v: map.values()) {
                if (index >= expectedSize) {
                    break;
                }
                addValuesToArrayType(v, getArrayOrTupleMemberType(type, index), index, currentCsvNode, config);
                index++;
            }
        }

        private Type getArrayOrTupleMemberType(Type type, int index) {
            if (type instanceof TupleType) {
                TupleType tupleType = (TupleType) type;
                List<Type> tupleTypes = tupleType.getTupleTypes();
                if (tupleTypes.size() >= index + 1) {
                    return tupleTypes.get(index);
                }
                if (restType != null) {
                    return restType;
                }
                return null;
            }
            return ((ArrayType) type).getElementType();
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
                return checkExpectedTypeMatchWithHeadersForArray(expectedType,
                        headers, csvElement.getElementType(), arraySize);
            }
        }

        private boolean checkExpectedTypeMatchWithHeadersForTuple(Type expectedType, String[] headers, TupleType tupleType, int arraySize) {
            List<Type> tupleTypes = tupleType.getTupleTypes();
            Type tupleRestType = tupleType.getRestType();

            if (expectedType instanceof RecordType) {
                if (this.restType != null && this.restType.getTag() == TypeTags.ANYDATA_TAG) {
                    return true;
                }

                for (int i = 0; i < tupleTypes.size(); i++) {
                    Type type = tupleTypes.get(i);
                    String header = headers[i];
                    Field field = this.fieldHierarchy.get(header);

                    if (field != null) {
                        if (type.getTag() != field.getFieldType().getTag()) {
                            return false;
                        }
                        continue;
                    }

                    if (tupleRestType != null && this.restType == tupleRestType) {
                        continue;
                    }
                    return false;
                }
                return true;
            }
            return false;
        }

        private boolean checkExpectedTypeMatchWithHeadersForArray(Type expectedType, String[] headers, Type arrayType, int arraySize) {
            arrayType = TypeUtils.getReferredType(arrayType);
            if (expectedType instanceof RecordType) {
                if (this.restType != null && (this.restType == arrayType
                        || this.restType.getTag() == TypeTags.ANYDATA_TAG)) {
                    return true;
                }

                for (int i = 0; i < headers.length; i++) {
                    if (!this.fieldHierarchy.containsKey(headers[i])) {
                        return false;
                    }
                }
                return true;
            }
            return false;
        }

        private void traverseArrayValueWithMapAsExpectedType(BArray csvElement, boolean mappingType, Type expectedType) {
            int arraySize = csvElement.size();
            String[] headers = new String[arraySize];
            headers = createHeaders(headers, config);
            boolean headersMatchWithExpType = checkExpectedTypeMatchWithHeaders(
                    expectedType, headers, csvElement, arraySize);
            if (!headersMatchWithExpType) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csvElement, expectedType);
            }
            // TODO: Add headers from config
            addValuesToMapType(csvElement, arraySize, mappingType, expectedType);
        }

        private void addValuesToMapType(BArray csvElement, int arraySize, boolean mappingType, Type expectedType) {
            Type fieldType;
            BString key;
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
                addCurrentFieldValue(fieldType, csvElement.get(i - 1), key, mappingType);
            }
            checkOptionalFieldsAndLogError(fieldHierarchy);
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
                addCurrentFieldValue(currentFieldType, map.get(key), key, mappingType);
            }
            checkOptionalFieldsAndLogError(fieldHierarchy);
        }

        private boolean isKeyBelongsToNonRestType(Object value, BString key) {
            currentField = fieldHierarchy.remove(key.toString());
            if (currentField == null) {
                // Add to the rest field
                if (restType != null) {
                    Type restFieldType = TypeUtils.getReferredType(restType);
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

        private void addCurrentFieldValue(Type currentFieldType, Object mapValue, BString key, boolean isMapType) {
            int currentFieldTypeTag = currentFieldType.getTag();

            switch (currentFieldTypeTag) {
                case TypeTags.NULL_TAG:
                case TypeTags.BOOLEAN_TAG:
                case TypeTags.INT_TAG:
                case TypeTags.FLOAT_TAG:
                case TypeTags.DECIMAL_TAG:
                case TypeTags.STRING_TAG:
                    if (checkTypeCompatibility(currentFieldType, mapValue)) {
                        ((BMap<BString, Object>) currentCsvNode).put(StringUtils.fromString(fieldNames.pop()),
                                convertToBasicType(mapValue, currentFieldType, config));
                        return;
                    }
                    if (!isMapType) {
                        throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE_FOR_FIELD, mapValue, key);
                    }
                    return;
                case TypeTags.UNION_TAG:
                    boolean isCompatible = false;
                    for (Type memberType: ((UnionType) currentFieldType).getMemberTypes()) {
                        if (!isBasicType(memberType)) {
                            isCompatible = false;
                            break;
                        }
                        if (checkTypeCompatibility(memberType, mapValue)) {
                            isCompatible = true;
                        }
                    }
                    if (!isCompatible) {
                        throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE_FOR_FIELD, mapValue, key);
                    }
                    ((BMap<BString, Object>) currentCsvNode).put(StringUtils.fromString(fieldNames.pop()),
                            convertToBasicType(mapValue, currentFieldType, config));
                    break;
                default:
                    // TODO: handle maps and structure values in future
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE_FOR_FIELD, mapValue, key);
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
                case TypeTags.UNION_TAG:
                    boolean isCompatible = false;
                    for (Type memberType: ((UnionType) restFieldType).getMemberTypes()) {
                        if (!isBasicType(memberType)) {
                            isCompatible = false;
                            break;
                        }
                        if (checkTypeCompatibility(memberType, csvMember)) {
                            isCompatible = true;
                        }
                    }
                    if (isCompatible) {
                        ((BMap<BString, Object>) currentCsvNode)
                                .put(key, convertToBasicType(csvMember, restFieldType, config));
                    }
                    break;
                default:
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE_FOR_FIELD, csvMember, key);
            }
        }

        private void setRootCsvNode(Type referredType, Type type) {
            if (referredType.getTag() != TypeTags.ARRAY_TAG) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, type, PredefinedTypes.TYPE_ANYDATA_ARRAY);
            } else {
                rootCsvNode = ValueCreator.createArrayValue((ArrayType) referredType);
                expectedArrayElementType = TypeUtils.getReferredType(((ArrayType) referredType).getElementType());
            }
        }
    }
}
