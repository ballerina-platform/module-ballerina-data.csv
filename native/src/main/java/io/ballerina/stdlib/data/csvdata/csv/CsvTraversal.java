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
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.utils.TypeUtils;
import io.ballerina.runtime.api.values.*;
import io.ballerina.stdlib.data.csvdata.utils.CsvConfig;
import io.ballerina.stdlib.data.csvdata.utils.CsvUtils;
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
        Map<String, String> updatedRecordFieldNames = new HashMap<>();
        Map<String, Field> headerFieldHierarchy = new HashMap<>();
        HashSet<String> fields = new HashSet<>();
        Type restType;
        Deque<String> fieldNames = new ArrayDeque<>();
        BArray rootCsvNode;
        Type expectedArrayElementType;
        Type sourceArrayElementType;
        CsvConfig config;
        String[] headers= null;

        void reset() {
            currentCsvNode = null;
            currentField = null;
            fieldHierarchy.clear();
            headerFieldHierarchy.clear();
            fields.clear();;
            restType = null;
            fieldNames.clear();
            expectedArrayElementType = null;
            sourceArrayElementType = null;
            headers = null;
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
                if (ignoreRow(i + 1, config.skipLines)) {
                    continue;
                }
                rowValue = traverseCsvElementWithMapOrRecord(csv.get(i), expectedArrayType);
                rootCsvNode.append(rowValue);
            }
        }

        public void traverseCsvArrayMembersWithArrayAsCsvElementType(long length, BArray csv, Type expectedArrayType) {
            Object rowValue;
            for (int i = 0; i < length; i++) {
                if (ignoreRow(i + 1, config.skipLines)) {
                    continue;
                }
                rowValue = traverseCsvElementWithArray(csv.get(i), expectedArrayType);
                rootCsvNode.append(rowValue);
            }
        }

        private static boolean ignoreRow(int index, Object skipLinesConfig) {
            long[] skipLines = getSkipDataRows(skipLinesConfig);
            for (long skipLine: skipLines) {
                if (skipLine == index) {
                    return true;
                }
            }
            return false;
        }

        public Object traverseCsvElementWithMapOrRecord(Object csvElement, Type expectedType) {
            switch (expectedType.getTag()) {
                case TypeTags.RECORD_TYPE_TAG:
                    RecordType recordType = (RecordType) expectedType;
                    this.fieldHierarchy = new HashMap<>(recordType.getFields());
                    fields = new HashSet<>(recordType.getFields().keySet());
                    this.updatedRecordFieldNames =
                            processNameAnnotationsAndBuildCustomFieldMap(recordType, fieldHierarchy);
                    this.headerFieldHierarchy = new HashMap<>(recordType.getFields());
                    this.restType = recordType.getRestFieldType();
                    currentCsvNode = ValueCreator.createRecordValue(recordType.getPackage(), recordType.getName());
                    traverseCsvMap(csvElement, expectedType, false);
                    break;
                case TypeTags.MAP_TAG:
                    MapType mapType = (MapType) expectedType;
                    currentCsvNode = ValueCreator.createMapValue(mapType);
                    traverseCsvMap(csvElement, expectedType, true);
                    break;
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
                if (config.allowDataProjection && index >= expectedSize) {
                    break;
                }
                addValuesToArrayType(csvElement.get(i),
                        getArrayOrTupleMemberType(type, index), index, currentCsvNode, config);
                index++;
            }
        }

        private void constructArrayValuesFromMap(BMap<BString, Object> map, Type type, int expectedSize) {
            int size = map.size();
            BString[] keys = new BString[size];
            int index = 0;
            if (config.headersOrder != null) {
                String[] headerOrder = config.headersOrder.getStringArray();
                if (headerOrder.length != size) {
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_HEADER_NAMES_LENGTH);
                }
                for (int i = 0; i < size; i++) {
                    keys[i] = StringUtils.fromString(headerOrder[i]);
                }
            } else if (config.customHeader == null) {
                keys = map.getKeys();
            } else {
                if (this.headers == null) {
                    this.headers = createHeaders(new String[size], config);
                }
                if (this.headers.length != size) {
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CUSTOM_HEADER_LENGTH);
                }
                for (int i = 0; i < size; i++) {
                    keys[i] = StringUtils.fromString(this.headers[i]);
                }
            }
            for (BString key: keys) {
                if (!map.containsKey(key)) {
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CUSTOM_HEADER, key);
                }
                Object v = map.get(key);
                if (config.allowDataProjection && index >= expectedSize) {
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
                } else {
                    if (config.allowDataProjection) {
                        return null;
                    }
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_TUPLE_SIZE, tupleTypes.size());
                }
            }
            ArrayType  arrayType = (ArrayType) type;
            if (arrayType.getSize() != -1 && arrayType.getSize() <= index) {
                if (config.allowDataProjection) {
                    return null;
                }
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_ARRAY_SIZE, arrayType.getSize());
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

        private boolean checkExpectedTypeMatchWithHeaders(Type expectedType, BArray csvElement, int arraySize) {
            if (arraySize < this.headers.length) {
                return false;
            }
            if (expectedType instanceof MapType) {
                return true;
            }
            Type type = csvElement.getType();
            if (type instanceof TupleType) {
                return checkExpectedTypeMatchWithHeadersForTuple(expectedType, (TupleType) type);
            } else {
                return checkExpectedTypeMatchWithHeadersForArray(expectedType, csvElement.getElementType(), arraySize);
            }
        }

        private boolean checkExpectedTypeMatchWithHeadersForTuple(Type expectedType, TupleType tupleType) {
            Type type;
            List<Type> tupleTypes = tupleType.getTupleTypes();
            Type tupleRestType = tupleType.getRestType();

            if (expectedType instanceof RecordType) {
                if (this.restType != null
                        && (this.restType.getTag() == TypeTags.ANYDATA_TAG
                        || this.restType.getTag() == TypeTags.JSON_TAG)) {
                    return true;
                }

                for (int i = 0; i < this.headers.length; i++) {
                    if (i >= tupleTypes.size()) {
                        type = tupleRestType;
                    } else {
                        type = tupleTypes.get(i);
                    }
                    String header = this.headers[i];
                    Field field = this.headerFieldHierarchy.remove(header);

                    if (field != null) {
                        if (type.getTag() != field.getFieldType().getTag()) {
                            return false;
                        }
                        continue;
                    }

                    if ((tupleRestType != null && (type == this.restType ||this.restType == tupleRestType))) {
                        continue;
                    }

                    if (isHeaderFieldsEmpty(this.headerFieldHierarchy)) {
                        continue;
                    }


                    return false;
                }
                return true;
            }
            return false;
        }

        private boolean checkExpectedTypeMatchWithHeadersForArray(Type expectedType, Type arrayType, int arraySize) {
            arrayType = TypeUtils.getReferredType(arrayType);
            if (expectedType instanceof RecordType) {
                if (this.restType != null && (this.restType == arrayType
                        || this.restType.getTag() == TypeTags.ANYDATA_TAG)) {
                    return true;
                }

                for (String key: this.fieldHierarchy.keySet()) {
                    for(String header: this.headers) {
                        if (key.equals(header)) {
                            return true;
                        }
                    }
                }
            }
            return false;
        }

        private void traverseArrayValueWithMapAsExpectedType(BArray csvElement, boolean mappingType, Type expectedType) {
            int arraySize = csvElement.size();
            String[] headers = new String[arraySize];
            if (this.headers == null) {
                this.headers = createHeaders(headers, config);
            }
            boolean headersMatchWithExpType = checkExpectedTypeMatchWithHeaders(expectedType, csvElement, arraySize);
            if (!headersMatchWithExpType) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CONVERSION_FOR_ARRAY_TO_MAP,
                        csvElement, expectedType);
            }
            // TODO: Add headers from config
            addValuesToMapType(csvElement, arraySize, mappingType, expectedType);
        }

        private void addValuesToMapType(BArray csvElement, int arraySize, boolean mappingType, Type expectedType) {
            Type fieldType;
            BString key;

            // TODO: Canges the logic with headers parameter
            for(int i = 1; i <= arraySize; i++) {
                key = StringUtils.fromString(this.headers[i - 1]);
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
            checkRequiredFieldsAndLogError(fieldHierarchy, config.absentAsNilableType);
        }

        private void traverseMapValueWithMapAsExpectedType(
                BMap<BString, Object> map, boolean mappingType, Type expType) {
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
            checkRequiredFieldsAndLogError(fieldHierarchy, config.absentAsNilableType);
        }

        private boolean isKeyBelongsToNonRestType(Object value, BString key) {
            String keyStr = StringUtils.getStringValue(key);
            String fieldName = CsvUtils.getUpdatedHeaders(this.updatedRecordFieldNames,
                    keyStr, this.fields.contains(keyStr));
            currentField = fieldHierarchy.remove(fieldName);
            if (currentField == null) {
                // Add to the rest field
                if (restType != null) {
                    Type restFieldType = TypeUtils.getReferredType(restType);
                    addRestField(restFieldType, key, value);
                    return false;
                }
                if (config.allowDataProjection) {
                    return false;
                }
                throw DiagnosticLog.error(DiagnosticErrorCode.NO_FIELD_FOR_HEADER, key);
            }
            fieldNames.push(currentField.getFieldName());
            return true;
        }

        private void addFieldInMapType(BString key) {
            fieldNames.push(key.toString());
        }

        private void addCurrentFieldValue(Type currentFieldType, Object mapValue, BString key, boolean isMapType) {
            int currentFieldTypeTag = currentFieldType.getTag();
            Object nilValue = config.nilValue;
            if (config.nilAsOptionalField && !currentFieldType.isNilable()
                    && CsvUtils.isNullValue(nilValue, mapValue)
                    && currentField != null && SymbolFlags.isFlagOn(currentField.getFlags(), SymbolFlags.OPTIONAL)) {
                return;
            }
            switch (currentFieldTypeTag) {
                case TypeTags.NULL_TAG:
                case TypeTags.BOOLEAN_TAG:
                case TypeTags.INT_TAG:
                case TypeTags.FLOAT_TAG:
                case TypeTags.DECIMAL_TAG:
                case TypeTags.STRING_TAG:
                case TypeTags.JSON_TAG:
                case TypeTags.ANYDATA_TAG:
                case TypeTags.ANY_TAG:
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
                    for (Type memberType: ((UnionType) currentFieldType).getMemberTypes()) {
                        if (!isBasicType(memberType)) {
                            throw DiagnosticLog.error(DiagnosticErrorCode
                                    .EXPECTED_TYPE_CAN_ONLY_CONTAIN_BASIC_TYPES, memberType);
                        }
                        if (checkTypeCompatibility(memberType, mapValue)) {
                            ((BMap<BString, Object>) currentCsvNode).put(StringUtils.fromString(fieldNames.pop()),
                                    convertToBasicType(mapValue, memberType, config));
                            return;
                        }
                    }
                    if (isMapType) {
                        return;
                    }
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE_FOR_FIELD, mapValue, key);
                default:
                    // TODO: handle maps and structure values in future
                    throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE_FOR_FIELD, mapValue, key);
            }
        }

        private void addRestField(Type restFieldType, BString key, Object csvMember) {
            Object nilValue = config.nilValue;
            if (config.nilAsOptionalField && !restFieldType.isNilable()
                    && CsvUtils.isNullValue(nilValue, csvMember)
                    && currentField != null && SymbolFlags.isFlagOn(currentField.getFlags(), SymbolFlags.OPTIONAL)) {
                return;
            }
            switch (restFieldType.getTag()) {
                case TypeTags.ANYDATA_TAG:
                case TypeTags.JSON_TAG:
                case TypeTags.BOOLEAN_TAG:
                case TypeTags.INT_TAG:
                case TypeTags.FLOAT_TAG:
                case TypeTags.DECIMAL_TAG:
                case TypeTags.STRING_TAG:
                    if (checkTypeCompatibility(restFieldType, csvMember)) {
                        ((BMap<BString, Object>) currentCsvNode)
                                .put(key, convertToBasicType(csvMember, restFieldType, config));
                    }
                    break;
                case TypeTags.UNION_TAG:
                    for (Type memberType: ((UnionType) restFieldType).getMemberTypes()) {
                        if (!isBasicType(memberType)) {
                            throw DiagnosticLog.error(DiagnosticErrorCode
                                    .EXPECTED_TYPE_CAN_ONLY_CONTAIN_BASIC_TYPES, memberType);
                        }
                        if (checkTypeCompatibility(memberType, csvMember)) {
                            ((BMap<BString, Object>) currentCsvNode)
                                    .put(key, convertToBasicType(csvMember, memberType, config));
                            break;
                        }
                    }
                    break;
                case TypeTags.INTERSECTION_TAG:
                    for (Type memberType: ((IntersectionType) restFieldType).getConstituentTypes()) {
                        //
                    }
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
