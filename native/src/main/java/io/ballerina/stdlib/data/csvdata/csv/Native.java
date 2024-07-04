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

import io.ballerina.runtime.api.Environment;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BStream;
import io.ballerina.runtime.api.values.BString;
import io.ballerina.runtime.api.values.BTypedesc;

/**
 * Csv conversion.
 *
 * @since 0.1.0
 */
public class Native {

    public static Object parseStringToRecord(BString csv, BMap<BString, Object> options, BTypedesc type) {
        return null;
    }

    public static Object parseBytesToRecord(BArray csv, BMap<BString, Object> options, BTypedesc type) {
        return null;
    }

    public static Object parseStreamToRecord(Environment env, BStream csv,
                                             BMap<BString, Object> options, BTypedesc type) {
        return null;
    }

    public static Object parseStringToList(BString csv, BMap<BString, Object> options, BTypedesc type) {
        return null;
    }

    public static Object parseBytesToList(BArray csv, BMap<BString, Object> options, BTypedesc type) {
        return null;
    }

    public static Object parseStreamToList(Environment env, BStream csv,
                                           BMap<BString, Object> options, BTypedesc type) {
        return null;
    }

    public static Object parseRecordAsRecordType(BArray csv, BMap<BString, Object> options, BTypedesc type) {
        return null;
    }

    public static Object parseRecordAsListType(BArray csv, BArray headers,
                                               BMap<BString, Object> options, BTypedesc type) {
        return null;
    }

    public static Object parseListAsRecordType(BArray csv, Object customHeaders,
                                               BMap<BString, Object> options, BTypedesc type) {
        return null;
    }

    public static Object parseListAsListType(BArray csv, BMap<BString, Object> options, BTypedesc type) {
        return null;
    }
}
