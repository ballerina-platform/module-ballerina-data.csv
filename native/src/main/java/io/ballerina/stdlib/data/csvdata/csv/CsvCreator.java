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
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticErrorCode;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticLog;

/**
 * Create objects for partially parsed csv.
 *
 * @since 0.1.0
 */
public class CsvCreator {

    static Object initRowValue(Type expectedType) {
        switch (expectedType.getTag()) {
            case TypeTags.RECORD_TYPE_TAG:
                return ValueCreator.createRecordValue((RecordType) expectedType);
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
                                                  BString value, Type type, CsvConfig config) {
        Object currentJson = sm.currentCsvNode;
        Object convertedValue = convertToExpectedType(value, type, config);
        if (convertedValue instanceof BError) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, type, value);
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

    private static Object convertToExpectedType(BString value, Type type, CsvConfig config) {
        if (type.getTag() == TypeTags.ANYDATA_TAG) {
            return FromString.fromStringWithType(value, PredefinedTypes.TYPE_JSON, config);
        }
        return FromString.fromStringWithType(value, type, config);
    }
}
