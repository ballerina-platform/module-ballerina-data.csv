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

import io.ballerina.lib.data.csvdata.io.CsvStreamIterator;
import io.ballerina.lib.data.csvdata.io.DataReaderTask;
import io.ballerina.lib.data.csvdata.utils.Constants;
import io.ballerina.lib.data.csvdata.utils.CsvConfig;
import io.ballerina.lib.data.csvdata.utils.DiagnosticErrorCode;
import io.ballerina.lib.data.csvdata.utils.DiagnosticLog;
import io.ballerina.lib.data.csvdata.utils.ModuleUtils;
import io.ballerina.runtime.api.Environment;
import io.ballerina.runtime.api.creators.ErrorCreator;
import io.ballerina.runtime.api.creators.TypeCreator;
import io.ballerina.runtime.api.creators.ValueCreator;
import io.ballerina.runtime.api.types.PredefinedTypes;
import io.ballerina.runtime.api.types.StreamType;
import io.ballerina.runtime.api.types.Type;
import io.ballerina.runtime.api.utils.TypeUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BObject;
import io.ballerina.runtime.api.values.BStream;
import io.ballerina.runtime.api.values.BString;
import io.ballerina.runtime.api.values.BTypedesc;

import java.io.ByteArrayInputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

/**
 * Csv conversion.
 *
 * @since 0.1.0
 */
public final class Native {
    private Native() {
    }

    public static Object parseString(Environment environment, BString csv,
                                     BMap<BString, Object> options, BTypedesc type) {
        try {
            return CsvParser.parse(environment, new StringReader(csv.getValue()),
                    type, CsvConfig.createParseOptions(options));
        } catch (BError e) {
            return e;
        } catch (Exception e) {
            return DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csv, type);
        }
    }

    public static Object parseBytes(Environment environment, BArray csv,
                                    BMap<BString, Object> options, BTypedesc type) {
        try {
            byte[] bytes = csv.getBytes();
            return CsvParser.parse(environment, new InputStreamReader(new ByteArrayInputStream(bytes),
                            Charset.forName(options.getStringValue(Constants.ConfigConstants.ENCODING).toString())),
                    type, CsvConfig.createParseOptions(options));
        } catch (BError e) {
            return e;
        } catch (Exception e) {
            return DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csv, type);
        }
    }

    public static Object parseStream(Environment env, BStream csv,
                                     BMap<BString, Object> options, BTypedesc type) {
        try {
            final BObject iteratorObj = csv.getIteratorObj();
            return env.yieldAndRun(() -> {
                CompletableFuture<Object> future = new CompletableFuture<>();
                DataReaderTask task = new DataReaderTask(env, iteratorObj, future, type,
                        CsvConfig.createParseOptions(options),
                        options.getStringValue(Constants.ConfigConstants.ENCODING));
                Thread.startVirtualThread(task);
                try {
                    return future.get();
                } catch (BError | InterruptedException | ExecutionException bError) {
                    return ErrorCreator.createError(bError);
                }
            });
        } catch (BError e) {
            return e;
        } catch (Exception e) {
            return DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csv, type);
        }
    }

    public static Object transform(BArray csv, BMap<BString, Object> options, BTypedesc type) {
        try {
            return CsvTraversal.traverse(csv, CsvConfig.createTransformOptions(options), type);
        } catch (Exception e) {
            return DiagnosticLog.getCsvError(e.getMessage());
        }
    }
    public static Object parseList(BArray csv, BMap<BString, Object> options, BTypedesc type) {
        try {
            CsvConfig config = CsvConfig.createParseListOptions(options);
            config.stringConversion = true;
            return CsvTraversal.traverse(csv, config, type);
        } catch (Exception e) {
            return DiagnosticLog.getCsvError(e.getMessage());
        }
    }

    /**
     * Parses a CSV byte stream and returns a stream of records.
     * This method processes the CSV data incrementally, yielding one record at a time.
     *
     * @param env     The Ballerina runtime environment
     * @param csv     The input byte stream
     * @param options The parsing options
     * @param type    The expected element type descriptor
     * @return A stream of records or an error
     */
    public static Object parseAsStream(Environment env, BStream csv,
                                       BMap<BString, Object> options, BTypedesc type) {
        try {
            final BObject inputIterator = csv.getIteratorObj();
            CsvConfig config = CsvConfig.createParseOptions(options);
            Type elementType = TypeUtils.getReferredType(type.getDescribingType());
            String encoding = options.getStringValue(Constants.ConfigConstants.ENCODING).toString();

            BObject csvStreamObject = ValueCreator.createObjectValue(
                    ModuleUtils.getModule(), "CsvRecordStream");

            CsvStreamIterator.initializeIterator(env, csvStreamObject, inputIterator,
                    config, elementType, type, encoding);

            StreamType streamType = TypeCreator.createStreamType(
                    elementType,
                    TypeCreator.createUnionType(PredefinedTypes.TYPE_ERROR, PredefinedTypes.TYPE_NULL));

            return ValueCreator.createStreamValue(streamType, csvStreamObject);
        } catch (BError e) {
            return e;
        } catch (Exception e) {
            return DiagnosticLog.getCsvError("Error initializing CSV stream: " + e.getMessage());
        }
    }
}
