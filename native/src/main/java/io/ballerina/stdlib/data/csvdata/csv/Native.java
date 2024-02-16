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
import io.ballerina.runtime.api.types.Type;
import io.ballerina.runtime.api.values.*;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticLog;

import java.io.StringReader;

/**
 * Csv conversion.
 *
 * @since 0.1.0
 */
public class Native {

    public static Object fromCsvWithType(BArray csv, BMap<BString, Object> config, BTypedesc type) {
        try {
            return CsvTraversal.traverse(csv, config, type.getDescribingType());
        } catch (Exception e) {
            return DiagnosticLog.getCsvError(e.getMessage());
        }
    }

    public static Object fromCsvStringWithType(Object csv, BMap<BString, Object> config, BTypedesc type) {
        try {
            Type expType = type.getDescribingType();
            if (csv instanceof BString) {
                Object a =  CsvParser.parse(new StringReader(((BString) csv).getValue()), expType);
                return a;
            }
        } catch (BError e) {
            return e;
        } catch (Exception e) {
            return e;
        }
        return null;
    }

    public static Object toCsv(BArray csv, BMap<BString, Object> config, BTypedesc type) {
        try {
            return CsvTraversal.traverse(csv, config, type.getDescribingType());
        } catch (Exception e) {
            return DiagnosticLog.getCsvError(e.getMessage());
        }
    }
}
