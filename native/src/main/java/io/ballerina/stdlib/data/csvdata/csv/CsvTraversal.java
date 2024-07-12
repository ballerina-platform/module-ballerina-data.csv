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
import io.ballerina.runtime.api.types.UnionType;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.utils.TypeUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;
import io.ballerina.runtime.api.values.BTypedesc;
import io.ballerina.stdlib.data.csvdata.utils.CsvConfig;
import io.ballerina.stdlib.data.csvdata.utils.CsvUtils;
import io.ballerina.stdlib.data.csvdata.utils.DataUtils;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticErrorCode;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticLog;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.SkipMappedValue;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.UnMappedValue;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.checkRequiredFieldsAndLogError;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.checkTypeCompatibility;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.convertToBasicType;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.createHeaders;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.getMutableType;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.getSkipDataRows;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.getTheActualExpectedType;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.isBasicType;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.isHeaderFieldsEmpty;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.processNameAnnotationsAndBuildCustomFieldMap;
import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.validateExpectedArraySize;

/**
 * Convert Csv value to a ballerina record.
 *
 * @since 0.1.0
 */
public class CsvTraversal {
    private static final ThreadLocal<CsvTree> tlCsvTree = ThreadLocal.withInitial(CsvTree::new);
    public static Object traverse(BArray csv, CsvConfig config, BTypedesc type) {
        CsvTree csvTree = tlCsvTree.get();
        try {
            Object convertedValue = csvTree.traverseCsv(csv, config, type.getDescribingType());
            return DataUtils.validateConstraints(convertedValue, type, config.enableConstraintValidation);
        } catch (BError e) {
            return e;
        } finally {
            csvTree.reset();
        }
    }

    public static Object traverse(BArray csv, CsvConfig config, BTypedesc typed, Type type) {
        CsvTree csvTree = tlCsvTree.get();
        try {
            Object convertedValue = csvTree.traverseCsv(csv, config, type);
            return DataUtils.validateConstraints(convertedValue, typed, config.enableConstraintValidation);
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
        String[] headers = null;
        int arraySize = 0;

        void reset() {
            currentCsvNode = null;
            currentField = null;
            fieldHierarchy.clear();
            updatedRecordFieldNames.clear();
            headerFieldHierarchy.clear();
            fields.clear();;
            restType = null;
            fieldNames.clear();
            rootCsvNode = null;
            expectedArrayElementType = null;
            sourceArrayElementType = null;
            config = null;
            headers = null;
            arraySize = 0;
        }


        void resetForUnionTypes() {
            currentCsvNode = null;
            currentField = null;
            fieldHierarchy.clear();
            updatedRecordFieldNames.clear();
            headerFieldHierarchy.clear();
            fields.clear();;
            restType = null;
            fieldNames.clear();
            rootCsvNode = null;
            expectedArrayElementType = null;
            headers = null;
            arraySize = 0;
        }

        CsvTree() {
            reset();
        }

        @SuppressWarnings("unchecked")
        public Object traverseCsv(BArray csv, CsvConfig config, Type type) {
            this.config = config;
            sourceArrayElementType = TypeUtils.getReferredType(getSourceElementTypeForTupleAndArrays(csv));
            Type referredType = TypeUtils.getReferredType(type);
            int sourceArraySize = (int) csv.getLength();
            if (referredType.getTag() == TypeTags.INTERSECTION_TAG) {
                Optional<Type> mutableType = getMutableType((IntersectionType) referredType);
                if (mutableType.isPresent()) {
                    return CsvCreator.constructReadOnlyValue(traverseCsv(csv, config, mutableType.get()));
                }
            }

            if (referredType.getTag() != TypeTags.UNION_TAG) {
                if (referredType.getTag() == TypeTags.ARRAY_TAG) {
                    Type arrayElementType = TypeUtils.getReferredType(((ArrayType) referredType).getElementType());
                    if (arrayElementType.getTag() == TypeTags.INTERSECTION_TAG) {
                        Optional<Type> mutableType = getMutableType((IntersectionType) arrayElementType);
                        if (mutableType.isPresent()) {
                            return CsvCreator.constructReadOnlyValue(
                                    traverseCsv(csv, config, TypeCreator.createArrayType(
                                            mutableType.get()
                                    ))
                            );
                        }
                    }
                }
                int expectedArraySize = ((ArrayType) referredType).getSize();
                setRootCsvNodeForNonUnionArrays(referredType, type);
                validateExpectedArraySize(expectedArraySize, sourceArraySize);
                traverseCsvWithExpectedType(sourceArraySize, csv, type);
            } else {
                traverseCsvWithUnionExpectedType(referredType, type, sourceArraySize, csv);
            }
            return rootCsvNode;
        }

        private void traverseCsvWithUnionExpectedType(Type referredType, Type type, int sourceArraySize,
                                                      BArray csv) {
            for (Type memberType: ((UnionType) referredType).getMemberTypes()) {
                Type mType = TypeUtils.getReferredType(memberType);
                if (mType.getTag() == TypeTags.ARRAY_TAG) {
                    int expectedArraySize = ((ArrayType) mType).getSize();
                    resetForUnionTypes();
                    try {
                        setRootCsvNodeForNonUnionArrays(mType, mType);
                        validateExpectedArraySize(expectedArraySize, sourceArraySize);
                        traverseCsvWithExpectedType(sourceArraySize, csv, type);
                        return;
                    } catch (Exception ex) {
                        // ignore
                    }
                }
            }
            throw DiagnosticLog.error(DiagnosticErrorCode.SOURCE_CANNOT_CONVERT_INTO_EXP_TYPE, type);
        }

        private void traverseCsvWithExpectedType(int sourceArraySize,
                                                 BArray csv, Type type) {
            boolean isIntersection = false;
            if (expectedArrayElementType.getTag() == TypeTags.INTERSECTION_TAG) {
                Optional<Type> mutableType = getMutableType((IntersectionType) expectedArrayElementType);
                if (mutableType.isPresent()) {
                    isIntersection = true;
                    expectedArrayElementType = mutableType.get();
                }
            }

            switch (expectedArrayElementType.getTag()) {
                case TypeTags.RECORD_TYPE_TAG:
                case TypeTags.MAP_TAG:
                    traverseCsvArrayMembersWithMapAsCsvElementType(sourceArraySize, csv,
                            expectedArrayElementType, isIntersection);
                    break;
                case TypeTags.ARRAY_TAG:
                case TypeTags.TUPLE_TAG:
                    traverseCsvArrayMembersWithArrayAsCsvElementType(sourceArraySize, csv,
                            expectedArrayElementType, isIntersection);
                    break;
                case TypeTags.UNION_TAG:
                    traverseCsvArrayMembersWithUnionAsCsvElementType(sourceArraySize, csv,
                            (UnionType) expectedArrayElementType, type);
                    break;
                case TypeTags.INTERSECTION_TAG:
                    for (Type constituentType : ((IntersectionType) expectedArrayElementType).getConstituentTypes()) {
                        if (constituentType.getTag() == TypeTags.READONLY_TAG) {
                            continue;
                        }
                        config.stringConversion = true;
                        CsvCreator.constructReadOnlyValue(this.traverseCsv(
                                csv, config, TypeCreator.createArrayType(constituentType)));
                    }
                    break;
                default:
                    throw DiagnosticLog.error(DiagnosticErrorCode.SOURCE_CANNOT_CONVERT_INTO_EXP_TYPE, type);
            }
        }

        public void traverseCsvArrayMembersWithMapAsCsvElementType(long length, BArray csv, Type expectedArrayType,
                                                                   boolean isIntersection) {
            Object rowValue;
            ArrayType arrayType = (ArrayType) rootCsvNode.getType();
            for (int i = 0; i < length; i++) {
                if (ignoreRow(i + 1, config.skipLines)) {
                    continue;
                }
                if (arrayType.getState() == ArrayType.ArrayState.CLOSED &&
                        arrayType.getSize() - 1 < this.arraySize) {
                    break;
                }

                rowValue = traverseCsvElementWithMapOrRecord(csv.get(i), expectedArrayType);
                if (isIntersection) {
                    rowValue = CsvCreator.constructReadOnlyValue(rowValue);
                }
                rootCsvNode.add(this.arraySize, rowValue);
                this.arraySize++;
            }
        }

        public void traverseCsvArrayMembersWithArrayAsCsvElementType(long length, BArray csv, Type expectedArrayType,
                                                                     boolean isIntersection) {
            Object rowValue;
            ArrayType arrayType = (ArrayType) rootCsvNode.getType();
            for (int i = 0; i < length; i++) {
                if (ignoreRow(i + 1, config.skipLines)) {
                    continue;
                }
                if (arrayType.getState() == ArrayType.ArrayState.CLOSED &&
                        arrayType.getSize() - 1 < this.arraySize) {
                    break;
                }

                rowValue = traverseCsvElementWithArray(csv.get(i), expectedArrayType);
                if (isIntersection) {
                    rowValue = CsvCreator.constructReadOnlyValue(rowValue);
                }
                rootCsvNode.add(this.arraySize, rowValue);
                this.arraySize++;
            }
        }

        public void traverseCsvArrayMembersWithUnionAsCsvElementType(long length, BArray csv,
                                                                     UnionType expectedArrayType, Type type) {
            Object rowValue;
            ArrayType arrayType = (ArrayType) rootCsvNode.getType();
            for (int i = 0; i < length; i++) {
                boolean isCompatible = false;
                if (ignoreRow(i + 1, config.skipLines)) {
                    continue;
                }
                if (arrayType.getState() == ArrayType.ArrayState.CLOSED &&
                        arrayType.getSize() - 1 < this.arraySize) {
                    break;
                }

                Object csvData = csv.get(i);
                for (Type memberType: expectedArrayType.getMemberTypes()) {
                    boolean isIntersection = false;
                    try {
                        memberType = TypeUtils.getReferredType(memberType);
                        if (memberType.getTag() == TypeTags.INTERSECTION_TAG) {
                            Optional<Type> mutableType = getMutableType((IntersectionType) memberType);
                            if (mutableType.isPresent()) {
                                isIntersection = true;
                                memberType = mutableType.get();
                            }
                        }

                        if (memberType.getTag() == TypeTags.MAP_TAG
                                || memberType.getTag() == TypeTags.RECORD_TYPE_TAG) {
                            rowValue = traverseCsvElementWithMapOrRecord(csvData, memberType);
                        } else if (memberType.getTag() == TypeTags.TUPLE_TAG
                                || memberType.getTag() == TypeTags.ARRAY_TAG) {
                            rowValue = traverseCsvElementWithArray(csvData, memberType);
                        } else {
                            continue;
                        }
                        if (isIntersection) {
                            rowValue = CsvCreator.constructReadOnlyValue(rowValue);
                        }
                        rootCsvNode.add(this.arraySize, rowValue);
                        this.arraySize++;
                        isCompatible = true;
                        break;
                    } catch (Exception e) {
                        int a = 1;
                    }
                }
                if (!isCompatible) {
                    throw DiagnosticLog.error(DiagnosticErrorCode.SOURCE_CANNOT_CONVERT_INTO_EXP_TYPE, type);
                }
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
            expectedType = TypeUtils.getReferredType(expectedType);
            switch (expectedType.getTag()) {
                case TypeTags.RECORD_TYPE_TAG:
                    RecordType recordType = (RecordType) expectedType;
                    this.fieldHierarchy = new HashMap<>(recordType.getFields());
                    fields = new HashSet<>(recordType.getFields().keySet());
                    this.updatedRecordFieldNames = processNameAnnotationsAndBuildCustomFieldMap(
                            recordType, fieldHierarchy);
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
            expectedType = TypeUtils.getReferredType(expectedType);
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
                Type memberType = getArrayOrTupleMemberType(type, index);
                if (memberType != null) {
                    addValuesToArrayType(csvElement.get(i), memberType, index,
                            currentCsvNode, config);
                }
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
                Type memberType = getArrayOrTupleMemberType(type, index);
                if (memberType != null) {
                    addValuesToArrayType(v, memberType, index,
                            currentCsvNode, config);
                }
                index++;
            }
        }

        private boolean isArrayOrTupleRestTypeMember(Type type, int index) {
            if (type instanceof ArrayType) {
                return false;
            }
            return ((TupleType) type).getTupleTypes().size() < index + 1;
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
                return checkExpectedTypeMatchWithHeadersForArray(expectedType);
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
                        if (!config.stringConversion && type.getTag() != field.getFieldType().getTag()) {
                            return false;
                        }
                        continue;
                    }

                    if ((tupleRestType != null && (type == this.restType || this.restType == tupleRestType))) {
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

        private boolean checkExpectedTypeMatchWithHeadersForArray(Type expectedType) {
            if (expectedType instanceof RecordType) {
                if (this.restType != null) {
                    return true;
                }

                for (String key: this.fieldHierarchy.keySet()) {
                    for (String header: this.headers) {
                        if (key.equals(this.updatedRecordFieldNames.get(header))) {
                            return true;
                        }
                    }
                }
            }
            return false;
        }

        private void traverseArrayValueWithMapAsExpectedType(BArray csvElement,
                                                             boolean mappingType, Type expectedType) {
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
            addValuesToMapType(csvElement, arraySize, mappingType, expectedType);
        }

        private void addValuesToMapType(BArray csvElement, int arraySize, boolean mappingType, Type expectedType) {
            Type fieldType;
            BString key;
            for (int i = 1; i <= arraySize; i++) {
                key = StringUtils.fromString(this.headers[i - 1]);
                if (!mappingType) {
                    if (!isKeyBelongsToNonRestType(csvElement.get(i - 1), key)) {
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

        private Object getFieldValue(Type type, Object csvMember, boolean isRecursive) {
            Type fieldType = TypeUtils.getReferredType(type);
            Object nilValue = config.nilValue;
            if (!isRecursive && config.nilAsOptionalField && !fieldType.isNilable()
                    && CsvUtils.isNullValue(nilValue, csvMember)
                    && currentField != null && SymbolFlags.isFlagOn(currentField.getFlags(), SymbolFlags.OPTIONAL)) {
                return SkipMappedValue.createSkippedValue();
            }
            if (config.stringConversion && csvMember instanceof BString str) {
                Object convertedValue =  CsvCreator.convertToExpectedType(str, type, config);
                if (!(convertedValue instanceof BError)) {
                    return convertedValue;
                }
            } else {
                switch (fieldType.getTag()) {
                    case TypeTags.NULL_TAG:
                    case TypeTags.BOOLEAN_TAG:
                    case TypeTags.INT_TAG:
                    case TypeTags.FLOAT_TAG:
                    case TypeTags.DECIMAL_TAG:
                    case TypeTags.STRING_TAG:
                    case TypeTags.JSON_TAG:
                    case TypeTags.ANYDATA_TAG:
                    case TypeTags.CHAR_STRING_TAG:
                    case TypeTags.BYTE_TAG:
                    case TypeTags.SIGNED8_INT_TAG:
                    case TypeTags.SIGNED16_INT_TAG:
                    case TypeTags.SIGNED32_INT_TAG:
                    case TypeTags.UNSIGNED8_INT_TAG:
                    case TypeTags.UNSIGNED16_INT_TAG:
                    case TypeTags.UNSIGNED32_INT_TAG:
                    case TypeTags.FINITE_TYPE_TAG:
                        if (checkTypeCompatibility(fieldType, csvMember, config.stringConversion)) {
                            Object value = convertToBasicType(csvMember, fieldType, config);
                            if (!(value instanceof BError)) {
                                return value;
                            }
                        }
                        break;
                    case TypeTags.UNION_TAG:
                        for (Type memberType : ((UnionType) fieldType).getMemberTypes()) {
                            memberType = TypeUtils.getReferredType(memberType);
                            if (!isBasicType(memberType)) {
                                throw DiagnosticLog.error(DiagnosticErrorCode
                                        .EXPECTED_TYPE_CAN_ONLY_CONTAIN_BASIC_TYPES, memberType);
                            }
                            Object value = getFieldValue(memberType, csvMember, true);
                            if (!(value instanceof BError || value instanceof UnMappedValue)) {
                                return value;
                            }
                        }
                        break;
                    case TypeTags.INTERSECTION_TAG:
                        Type effectiveType = ((IntersectionType) fieldType).getEffectiveType();
                        effectiveType = TypeUtils.getReferredType(effectiveType);
                        if (!SymbolFlags.isFlagOn(SymbolFlags.READONLY, effectiveType.getFlags())) {
                            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, type);
                        }
                        for (Type constituentType : ((IntersectionType) fieldType).getConstituentTypes()) {
                            constituentType = TypeUtils.getReferredType(constituentType);
                            if (constituentType.getTag() == TypeTags.READONLY_TAG) {
                                continue;
                            }
                            return CsvCreator.constructReadOnlyValue(getFieldValue(constituentType,
                                    csvMember, true));
                        }
                        break;
                    default:
                        throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_TYPE, type);
                }
            }
            return UnMappedValue.createUnMappedValue();
        }

        private void addRestField(Type type, BString key, Object csvMember) {
            Object value = getFieldValue(type, csvMember, false);
            if (!(value instanceof UnMappedValue)) {
                ((BMap<BString, Object>) currentCsvNode).put(key, value);
            }
        }

        private void addCurrentFieldValue(Type type, Object recValue, BString key, boolean isMapType) {
            Object value = getFieldValue(type, recValue, false);
            if (!(value instanceof UnMappedValue || value instanceof SkipMappedValue)) {
                ((BMap<BString, Object>) currentCsvNode).put(StringUtils.fromString(fieldNames.pop()), value);
                return;
            }

            if (isMapType || value instanceof SkipMappedValue) {
                return;
            }
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE_FOR_FIELD, recValue, key);
        }

        public void addValuesToArrayType(Object arrayValue, Type type, int index,
                                                 Object currentCsvNode, CsvConfig config) {
            Object value = getFieldValue(type, arrayValue, false);
            boolean isArrayType = type instanceof ArrayType;
            if (!(value instanceof UnMappedValue)) {
                if (isArrayType) {
                    ArrayType arrayType = (ArrayType) TypeUtils.getType(type);
                    if (arrayType.getState() == ArrayType.ArrayState.CLOSED &&
                            arrayType.getSize() - 1 < index) {
                        return;
                    }
                }
                ((BArray) currentCsvNode).add(index, value);
                return;
            }
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE_FOR_ARRAY, arrayValue, index, type);
        }

        private void setRootCsvNodeForNonUnionArrays(Type referredType, Type type) {
            referredType = TypeUtils.getReferredType(referredType);
            if (referredType.getTag() == TypeTags.ARRAY_TAG) {
                ArrayType arrayType = (ArrayType) referredType;
                rootCsvNode = ValueCreator.createArrayValue(arrayType);
                expectedArrayElementType = TypeUtils.getReferredType((arrayType).getElementType());
                return;
            }
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, type, PredefinedTypes.TYPE_ANYDATA_ARRAY);
        }

        private Type getSourceElementTypeForTupleAndArrays(BArray csv) {
            List<Type> memberTypes = new ArrayList<>();
            if (csv.getType() instanceof TupleType tupleType) {
                for (Type memberType: tupleType.getTupleTypes()) {
                    memberTypes.add(memberType);
                }
                return TypeCreator.createUnionType(memberTypes);
            }
            return csv.getElementType();
        }
    }
}
