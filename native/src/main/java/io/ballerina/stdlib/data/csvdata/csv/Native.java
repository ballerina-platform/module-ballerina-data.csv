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
import io.ballerina.runtime.api.Future;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BObject;
import io.ballerina.runtime.api.values.BStream;
import io.ballerina.runtime.api.values.BString;
import io.ballerina.runtime.api.values.BTypedesc;
import io.ballerina.stdlib.data.csvdata.io.DataReaderTask;
import io.ballerina.stdlib.data.csvdata.io.DataReaderThreadPool;
import io.ballerina.stdlib.data.csvdata.utils.Constants;
import io.ballerina.stdlib.data.csvdata.utils.CsvConfig;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticErrorCode;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticLog;

import java.io.ByteArrayInputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.nio.charset.Charset;

/**
 * Csv conversion.
 *
 * @since 0.1.0
 */
public class Native {

    public static Object parseStringToRecord(BString csv, BMap<BString, Object> options, BTypedesc type) {
        try {
            return CsvParser.parse(new StringReader(csv.getValue()),
                    type, CsvConfig.createParserToRecordOptions(options));
        } catch (BError e) {
            return e;
        } catch (Exception e) {
            return DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csv, type);
        }
    }

    public static Object parseBytesToRecord(BArray csv, BMap<BString, Object> options, BTypedesc type) {
        try {
            byte[] bytes = csv.getBytes();
            return CsvParser.parse(new InputStreamReader(new ByteArrayInputStream(bytes),
                            Charset.forName(options.getStringValue(Constants.ConfigConstants.ENCODING).toString())),
                    type, CsvConfig.createParserToRecordOptions(options));
        } catch (BError e) {
            return e;
        } catch (Exception e) {
            return DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csv, type);
        }
    }

    public static Object parseStreamToRecord(Environment env, BStream csv,
                                             BMap<BString, Object> options, BTypedesc type) {
        try {
            final BObject iteratorObj = csv.getIteratorObj();
            final Future future = env.markAsync();
            DataReaderTask task = new DataReaderTask(env, iteratorObj, future, type,
                    CsvConfig.createParserToRecordOptions(options),
                    options.getStringValue(Constants.ConfigConstants.ENCODING));
            DataReaderThreadPool.EXECUTOR_SERVICE.submit(task);
            return null;
        } catch (BError e) {
            return e;
        } catch (Exception e) {
            return DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csv, type);
        }
    }

    public static Object parseStringToList(BString csv, BMap<BString, Object> options, BTypedesc type) {
        try {
            return CsvParser.parse(new StringReader(csv.getValue()),
                    type, CsvConfig.createParseOptions(options));
        } catch (BError e) {
            return e;
        } catch (Exception e) {
            return DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csv, type);
        }
    }

    public static Object parseBytesToList(BArray csv, BMap<BString, Object> options, BTypedesc type) {
        try {
            byte[] bytes = csv.getBytes();
            return CsvParser.parse(new InputStreamReader(new ByteArrayInputStream(bytes),
                            Charset.forName(options.getStringValue(Constants.ConfigConstants.ENCODING).toString())),
                    type, CsvConfig.createParseOptions(options));
        } catch (BError e) {
            return e;
        } catch (Exception e) {
            return DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csv, type);
        }
    }

    public static Object parseStreamToList(Environment env, BStream csv,
                                           BMap<BString, Object> options, BTypedesc type) {
        try {
            final BObject iteratorObj = csv.getIteratorObj();
            final Future future = env.markAsync();
            DataReaderTask task = new DataReaderTask(env, iteratorObj, future, type,
                    CsvConfig.createParseOptions(options),
                    options.getStringValue(Constants.ConfigConstants.ENCODING));
            DataReaderThreadPool.EXECUTOR_SERVICE.submit(task);
            return null;
        } catch (BError e) {
            return e;
        } catch (Exception e) {
            return DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csv, type);
        }
    }

    public static Object parseRecordAsRecordType(BArray csv, BMap<BString, Object> options, BTypedesc type) {
        try {
            return CsvTraversal.traverse(csv, CsvConfig.createRecordAsRecordOption(options), type);
        } catch (Exception e) {
            return DiagnosticLog.getCsvError(e.getMessage());
        }
    }

    public static Object parseRecordAsListType(BArray csv, BArray headers,
                                               BMap<BString, Object> options, BTypedesc type) {
        try {
            CsvConfig toRecordOptions = CsvConfig.createToRecordOptions(options);
            toRecordOptions.headersOrder = headers;
            return CsvTraversal.traverse(csv, toRecordOptions, type);
        } catch (Exception e) {
            return DiagnosticLog.getCsvError(e.getMessage());
        }
    }

    public static Object parseListAsRecordType(BArray csv, Object customHeaders,
                                               BMap<BString, Object> options, BTypedesc type) {
        try {
            options.put(Constants.ConfigConstants.CUSTOM_HEADERS, customHeaders);
            return CsvTraversal.traverse(csv, CsvConfig.createListAsRecordTypeOptions(options), type);
        } catch (Exception e) {
            return DiagnosticLog.getCsvError(e.getMessage());
        }
    }

    public static Object parseListAsListType(BArray csv, BMap<BString, Object> options, BTypedesc type) {
        try {
            return CsvTraversal.traverse(csv, CsvConfig.createListTypeOptions(options), type);
        } catch (Exception e) {
            return DiagnosticLog.getCsvError(e.getMessage());
        }
    }
}
