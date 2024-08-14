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

package io.ballerina.lib.data.csvdata.csv;

import io.ballerina.lib.data.csvdata.FromString;
import io.ballerina.lib.data.csvdata.utils.CsvConfig;
import io.ballerina.lib.data.csvdata.utils.CsvUtils;
import io.ballerina.lib.data.csvdata.utils.DiagnosticErrorCode;
import io.ballerina.lib.data.csvdata.utils.DiagnosticLog;
import io.ballerina.runtime.api.PredefinedTypes;
import io.ballerina.runtime.api.TypeTags;
import io.ballerina.runtime.api.creators.ValueCreator;
import io.ballerina.runtime.api.flags.SymbolFlags;
import io.ballerina.runtime.api.types.ArrayType;
import io.ballerina.runtime.api.types.Field;
import io.ballerina.runtime.api.types.MapType;
import io.ballerina.runtime.api.types.TupleType;
import io.ballerina.runtime.api.types.Type;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.utils.TypeUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;
import org.ballerinalang.langlib.value.CloneReadOnly;

import java.util.Map;

import static io.ballerina.lib.data.csvdata.utils.CsvUtils.getUpdatedHeaders;

/**
 * Create objects for partially parsed csv.
 *
 * @since 0.1.0
 */
public final class CsvCreator {
    private CsvCreator() {
    }

    static Object initRowValue(Type expectedType) {
        expectedType = TypeUtils.getReferredType(expectedType);

        return switch (expectedType.getTag()) {
            case TypeTags.RECORD_TYPE_TAG ->
                    ValueCreator.createRecordValue(expectedType.getPackage(), expectedType.getName());
            case TypeTags.MAP_TAG -> ValueCreator.createMapValue((MapType) expectedType);
            case TypeTags.TUPLE_TAG -> ValueCreator.createTupleValue((TupleType) expectedType);
            case TypeTags.ARRAY_TAG -> ValueCreator.createArrayValue((ArrayType) expectedType);
            default -> throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE, expectedType);
        };
    }

    static void convertAndUpdateCurrentCsvNode(CsvParser.StateMachine sm,
                                               String value, Type type, CsvConfig config, Type exptype,
                                               Field currentField) {
        Object currentCsv = sm.currentCsvNode;
        Object nilValue = config.nilValue;
        if (sm.config.nilAsOptionalField && !type.isNilable()
                && CsvUtils.isNullValue(nilValue, value)
                && currentField != null && SymbolFlags.isFlagOn(currentField.getFlags(), SymbolFlags.OPTIONAL)) {
            return;
        }
        Object convertedValue = convertToExpectedType(StringUtils.fromString(value), type, config);
        sm.isCurrentCsvNodeEmpty = false;
        if (convertedValue instanceof BError || convertedValue instanceof CsvUtils.UnMappedValue) {
            if (ignoreIncompatibilityErrorsForMaps(sm, exptype)) {
                return;
            }
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, value, type);
        }

        Type currentCsvNodeType = TypeUtils.getType(currentCsv);
        switch (currentCsvNodeType.getTag()) {
            case TypeTags.MAP_TAG:
            case TypeTags.RECORD_TYPE_TAG:
                ((BMap<BString, Object>) currentCsv).put(StringUtils.fromString(getHeaderValueForColumnIndex(sm)),
                        convertedValue);
                sm.currentCsvNodeLength++;
                return;
            case TypeTags.ARRAY_TAG:
                ArrayType arrayType = (ArrayType) currentCsvNodeType;
                if (arrayType.getState() == ArrayType.ArrayState.CLOSED &&
                        arrayType.getSize() - 1 < sm.columnIndex) {
                    sm.earlyReturn = true;
                    return;
                }
                ((BArray) currentCsv).add(sm.columnIndex, convertedValue);
                sm.currentCsvNodeLength++;
                return;
            case TypeTags.TUPLE_TAG:
                ((BArray) currentCsv).add(sm.columnIndex, convertedValue);
                sm.currentCsvNodeLength++;
                return;
            default:
        }
    }

    public static String getHeaderValueForColumnIndex(CsvParser.StateMachine sm) {
        if (sm.config.customHeadersIfHeadersAbsent == null &&  (sm.config.header == Boolean.FALSE)) {
            String header = String.valueOf(sm.columnIndex + 1);
            Map<String, Field> fieldHierarchy = sm.fieldHierarchy;
            fieldHierarchy.remove(header);
            return header;
        }
        if (sm.columnIndex >= sm.headers.size()) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CUSTOM_HEADER_LENGTH);
        }
        String header = sm.headers.get(sm.columnIndex);
        return getUpdatedHeaders(sm.updatedRecordFieldNames, header,
                sm.fields.contains(header));
    }

    public static void addCustomHeadersIfNotNull(CsvParser.StateMachine sm, Object customHeader) {
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
            return !fields.containsKey(header);
        }
        return exptype.getTag() == TypeTags.MAP_TAG;
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
