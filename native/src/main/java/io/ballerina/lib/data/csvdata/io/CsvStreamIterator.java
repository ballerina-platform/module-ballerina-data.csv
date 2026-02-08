/*
 *  Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
 *
 *  WSO2 LLC. licenses this file to you under the Apache License,
 *  Version 2.0 (the "License"); you may not use this file except
 *  in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */

package io.ballerina.lib.data.csvdata.io;

import io.ballerina.lib.data.csvdata.csv.CsvParser;
import io.ballerina.lib.data.csvdata.utils.CsvConfig;
import io.ballerina.lib.data.csvdata.utils.DiagnosticLog;
import io.ballerina.lib.data.csvdata.utils.ModuleUtils;
import io.ballerina.runtime.api.Environment;
import io.ballerina.runtime.api.creators.ValueCreator;
import io.ballerina.runtime.api.types.MethodType;
import io.ballerina.runtime.api.types.Type;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BObject;
import io.ballerina.runtime.api.values.BString;
import io.ballerina.runtime.api.values.BTypedesc;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.Charset;

/**
 * Iterator utility for streaming CSV records one at a time.
 * This class implements memory-efficient CSV parsing by yielding one record per next() call.
 *
 * @since 0.1.0
 */
public final class CsvStreamIterator {

    private static final String ITERATOR_NATIVE_DATA = "csvIteratorData";
    private static final BString FIELD_VALUE = StringUtils.fromString("value");

    private CsvStreamIterator() {
    }

    /**
     * Returns the next CSV record from the stream.
     *
     * @param env      The Ballerina runtime environment
     * @param iterator The CsvRecordStream object
     * @return The next record wrapped in a stream entry, null if done, or an error
     */
    public static Object next(Environment env, BObject iterator) {
        IteratorData data = (IteratorData) iterator.getNativeData(ITERATOR_NATIVE_DATA);

        if (data == null) {
            return DiagnosticLog.getCsvError("CSV stream iterator not initialized");
        }

        if (data.isDone()) {
            return null;
        }

        // Check if there was an error from the underlying stream
        Object streamError = data.getStreamError();
        if (streamError != null) {
            data.setDone(true);
            try {
                data.close();
            } catch (IOException e) {
                // Ignore close errors and return the original stream error
            }
            return streamError;
        }

        try {
            Object row = data.parseNextRow(env);

            if (row instanceof BError) {
                data.setDone(true);
                try {
                    data.close();
                } catch (IOException e) {
                    // Ignore close errors and return the original error
                }
                return row;
            }

            if (row == null) {
                // EOF reached - close resources automatically
                data.setDone(true);
                try {
                    data.close();
                } catch (IOException e) {
                    return DiagnosticLog.getCsvError("Error closing CSV stream on EOF: " + e.getMessage());
                }
                return null;
            }

            BMap<BString, Object> streamEntry = ValueCreator.createRecordValue(
                    ModuleUtils.getModule(), "CsvStreamEntry");
            streamEntry.put(FIELD_VALUE, row);
            return streamEntry;
        } catch (Exception e) {
            data.setDone(true);
            // Try to close on error
            try {
                data.close();
            } catch (IOException ioException) {
                // Ignore close error, return original error
            }
            return DiagnosticLog.getCsvError("Error reading CSV record: " + e.getMessage());
        }
    }

    /**
     * Closes the CSV stream and releases resources.
     *
     * @param iterator The CsvRecordStream object
     * @return null on success, or an error
     */
    public static Object close(BObject iterator) {
        IteratorData data = (IteratorData) iterator.getNativeData(ITERATOR_NATIVE_DATA);

        if (data != null) {
            try {
                data.close();
            } catch (IOException e) {
                return DiagnosticLog.getCsvError("Error closing CSV stream: " + e.getMessage());
            }
        }

        return null;
    }

    /**
     * Initializes the iterator with the necessary data for streaming.
     * This is called from Native.parseAsStream.
     */
    public static void initializeIterator(Environment env, BObject csvStreamObject,
                                          BObject inputIterator, CsvConfig config,
                                          Type elementType, BTypedesc bTypedesc, String encoding) {
        MethodType nextMethod = DataReaderTask.resolveNextMethod(inputIterator);
        MethodType closeMethod = DataReaderTask.resolveCloseMethod(inputIterator);

        // Create IteratorData first so we can capture errors in it
        IteratorData data = new IteratorData(env, null, config, elementType, bTypedesc, null);
        csvStreamObject.addNativeData(ITERATOR_NATIVE_DATA, data);

        BallerinaByteBlockInputStream byteStream = new BallerinaByteBlockInputStream(
                env, inputIterator, nextMethod, closeMethod, obj -> {
            // Propagate errors from the underlying byte stream
            if (obj != null) {
                data.setStreamError(obj);
            }
        });

        Reader reader = new InputStreamReader(byteStream, Charset.forName(encoding));

        // Update the data with the actual reader and byteStream
        data.setReaderAndStream(reader, byteStream);
    }

    /**
     * Internal class to hold the iterator state between next() calls.
     */
    static class IteratorData {
        private final Environment env;
        private Reader reader;
        private final CsvConfig config;
        private final Type elementType;
        private final BTypedesc bTypedesc;
        private BallerinaByteBlockInputStream byteStream;
        private CsvParser.StateMachine stateMachine;
        private boolean headersParsed = false;
        private boolean done = false;
        private Object streamError = null;

        IteratorData(Environment env, Reader reader, CsvConfig config,
                     Type elementType, BTypedesc bTypedesc,
                     BallerinaByteBlockInputStream byteStream) {
            this.env = env;
            this.reader = reader;
            this.config = config;
            this.elementType = elementType;
            this.bTypedesc = bTypedesc;
            this.byteStream = byteStream;
        }

        void setReaderAndStream(Reader reader, BallerinaByteBlockInputStream byteStream) {
            this.reader = reader;
            this.byteStream = byteStream;
        }

        boolean isDone() {
            return done;
        }

        void setDone(boolean done) {
            this.done = done;
        }

        void setStreamError(Object error) {
            this.streamError = error;
        }

        Object getStreamError() {
            return streamError;
        }

        Object parseNextRow(Environment env) throws IOException {
            if (!headersParsed) {
                stateMachine = CsvParser.initializeStateMachine(env, reader, elementType, config, bTypedesc);
                CsvParser.parseHeaders(stateMachine, reader, config);
                headersParsed = true;
            }

            return CsvParser.parseNextRow(env, stateMachine, reader, config);
        }

        void close() throws IOException {
            if (reader != null) {
                reader.close();
            }
            if (byteStream != null) {
                byteStream.close();
            }
            if (stateMachine != null) {
                stateMachine.reset();
            }
        }
    }
}
