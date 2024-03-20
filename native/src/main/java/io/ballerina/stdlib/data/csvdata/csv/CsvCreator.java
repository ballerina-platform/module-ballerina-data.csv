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
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;
import io.ballerina.stdlib.data.csvdata.FromString;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticErrorCode;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticLog;

import java.util.Map;

/**
 * Create objects for partially parsed csv.
 *
 * @since 0.1.0
 */
public class CsvCreator {

    static Object initRowValue(Type expectedType) {
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
                                                  BString value, Type type, CsvConfig config, Type exptype) {
        Object currentCsv = sm.currentCsvNode;
        Object convertedValue = convertToExpectedType(value, type, config);
        if (convertedValue instanceof BError) {
            if (ignoreIncompatibilityErrorsForMaps(sm, type, exptype)) {
                return null;
            }
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, value, type);
        }

        Type currentCsvNodeType = TypeUtils.getType(currentCsv);
        switch (currentCsvNodeType.getTag()) {
            case TypeTags.MAP_TAG:
            case TypeTags.RECORD_TYPE_TAG:
                ((BMap<BString, Object>) currentCsv).put(StringUtils.fromString(sm.headers.get(sm.columnIndex)),
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

    private static boolean ignoreIncompatibilityErrorsForMaps(CsvParser.StateMachine sm, Type type, Type exptype) {
        if (exptype.getTag() == TypeTags.RECORD_TYPE_TAG) {
            String header = sm.headers.get(sm.columnIndex);
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

    private static Object convertToExpectedType(BString value, Type type, CsvConfig config) {
        if (type.getTag() == TypeTags.ANYDATA_TAG) {
            return FromString.fromStringWithType(value, PredefinedTypes.TYPE_JSON, config);
        }
        return FromString.fromStringWithType(value, type, config);
    }
}
