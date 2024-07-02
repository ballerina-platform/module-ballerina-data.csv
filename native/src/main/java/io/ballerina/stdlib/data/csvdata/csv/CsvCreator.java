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
import io.ballerina.runtime.api.types.ArrayType;
import io.ballerina.runtime.api.types.Field;
import io.ballerina.runtime.api.types.IntersectionType;
import io.ballerina.runtime.api.types.MapType;
import io.ballerina.runtime.api.types.TupleType;
import io.ballerina.runtime.api.types.Type;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.utils.TypeUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;
import io.ballerina.stdlib.data.csvdata.FromString;
import io.ballerina.stdlib.data.csvdata.utils.CsvConfig;
import io.ballerina.stdlib.data.csvdata.utils.CsvUtils;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticErrorCode;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticLog;
import org.ballerinalang.langlib.value.CloneReadOnly;

import java.util.Map;
import java.util.Optional;

import static io.ballerina.stdlib.data.csvdata.utils.CsvUtils.getUpdatedHeaders;
/**
 * Create objects for partially parsed csv.
 *
 * @since 0.1.0
 */
public class CsvCreator {

    static Object initRowValue(Type expectedType) {
        expectedType = TypeUtils.getReferredType(expectedType);
        if (expectedType.getTag() == TypeTags.INTERSECTION_TAG) {
            Optional<Type> mutableType = CsvUtils.getMutableType((IntersectionType) expectedType);
            if (!mutableType.isEmpty()) {
                expectedType = mutableType.get();
            }
        }

        switch (expectedType.getTag()) {
            case TypeTags.RECORD_TYPE_TAG:
                return ValueCreator.createRecordValue(expectedType.getPackage(), expectedType.getName());
            case TypeTags.MAP_TAG:
                return ValueCreator.createMapValue((MapType) expectedType);
            case TypeTags.TUPLE_TAG:
                return ValueCreator.createTupleValue((TupleType) expectedType);
            case TypeTags.ARRAY_TAG:
                return ValueCreator.createArrayValue((ArrayType) expectedType);
            default:
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, expectedType);
        }
    }

    static Object convertAndUpdateCurrentJsonNode(CsvParser.StateMachine sm,
                                                  String value, Type type, CsvConfig config, Type exptype,
                                                  Field currentField) {
        Object currentCsv = sm.currentCsvNode;
        Object nilValue = config.nilValue;
        if (sm.config.nilAsOptionalField && !type.isNilable()
                && CsvUtils.isNullValue(nilValue, value)
                && currentField != null && SymbolFlags.isFlagOn(currentField.getFlags(), SymbolFlags.OPTIONAL)) {
            return null;
        }
        Object convertedValue = convertToExpectedType(StringUtils.fromString(value), type, config);
        sm.isCurrentCsvNodeEmpty = false;
        if (convertedValue instanceof BError || convertedValue instanceof CsvUtils.UnMappedValue) {
            if (ignoreIncompatibilityErrorsForMaps(sm, exptype)) {
                return null;
            }
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, value, type);
        }

        Type currentCsvNodeType = TypeUtils.getType(currentCsv);
        switch (currentCsvNodeType.getTag()) {
            case TypeTags.MAP_TAG:
            case TypeTags.RECORD_TYPE_TAG:
                ((BMap<BString, Object>) currentCsv).put(StringUtils.fromString(getHeaderValueForColumnIndex(sm)),
                        convertedValue);
                return currentCsv;
            case TypeTags.ARRAY_TAG:
                // Handle projection in array.
                ArrayType arrayType = (ArrayType) currentCsvNodeType;
                if (arrayType.getState() == ArrayType.ArrayState.CLOSED &&
                        arrayType.getSize() - 1 < sm.columnIndex) {
                    return currentCsv;
                }
                ((BArray) currentCsv).add(sm.columnIndex, convertedValue);
                return currentCsv;
            case TypeTags.TUPLE_TAG:
                ((BArray) currentCsv).add(sm.columnIndex, convertedValue);
                return currentCsv;
            default:
                return convertedValue;
        }
    }

    public static String getHeaderValueForColumnIndex(CsvParser.StateMachine sm) {
        if (sm.config.customHeader == null &&  (sm.config.header == Boolean.FALSE)) {
            String header = String.valueOf(sm.columnIndex + 1);
            Map<String, Field> fieldHierarchy = sm.fieldHierarchy;
            if (fieldHierarchy.containsKey(header)) {
                fieldHierarchy.remove(header);
            }
            return header;
        }
        if (sm.columnIndex >= sm.headers.size()) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CUSTOM_HEADER_LENGTH);
        }
        String header = sm.headers.get(sm.columnIndex);
        return getUpdatedHeaders(sm.updatedRecordFieldNames, header,
                sm.fields.contains(header));
    }

    public static void checkAndAddCustomHeaders(CsvParser.StateMachine sm, Object customHeader) {
        if (customHeader == null) {
            return;
        }

        BArray customHeaders = (BArray) customHeader;
        for (int i = 0; i < customHeaders.size(); i++) {
            String header = StringUtils.getStringValue(customHeaders.get(i));
            Map<String, Field> fieldHierarchy = sm.fieldHierarchy;
            sm.headers.add(header);
            if (fieldHierarchy.containsKey(header)) {
                Field field = fieldHierarchy.get(header);
                sm.fieldNames.put(header, field);
                fieldHierarchy.remove(header);
            }
        }
    }

    private static boolean ignoreIncompatibilityErrorsForMaps(CsvParser.StateMachine sm, Type exptype) {
        if (exptype.getTag() == TypeTags.RECORD_TYPE_TAG) {
            String header = getHeaderValueForColumnIndex(sm);
            Map<String, Field> fields = sm.fieldNames;
            if (fields.containsKey(header)) {
                return false;
            }
            return true;
        } else if (exptype.getTag() == TypeTags.MAP_TAG) {
            return true;
        }
        return false;
    }

    public static Object convertToExpectedType(BString value, Type type, CsvConfig config) {
        if (type.getTag() == TypeTags.ANYDATA_TAG) {
            return FromString.fromStringWithType(value, PredefinedTypes.TYPE_JSON, config);
        }
        return FromString.fromStringWithType(value, type, config);
    }

    public static Object constructReadOnlyValue(Object value) {
        return CloneReadOnly.cloneReadOnly(value);
    }
}
