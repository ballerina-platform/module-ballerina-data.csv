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

import io.ballerina.lib.data.csvdata.utils.DiagnosticLog;
import io.ballerina.runtime.api.Environment;
import io.ballerina.runtime.api.types.MethodType;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BObject;
import io.ballerina.runtime.api.values.BString;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Consumer;

/**
 * Java Input Stream based on Ballerina byte block stream. <code>stream<byte[], error?></code>
 *
 * @since 0.1.0
 */
public class BallerinaByteBlockInputStream extends InputStream {

    private final BObject iterator;
    private final Environment env;
    private final String nextMethodName;
    private final AtomicBoolean done = new AtomicBoolean(false);
    private final MethodType closeMethod;
    private final Consumer<Object> futureResultConsumer;

    private byte[] currentChunk = new byte[0];
    private int nextChunkIndex = 0;

    public BallerinaByteBlockInputStream(Environment env, BObject iterator, MethodType nextMethod,
                                         MethodType closeMethod, Consumer<Object> futureResultConsumer) {
        this.env = env;
        this.iterator = iterator;
        this.nextMethodName = nextMethod.getName();
        this.closeMethod = closeMethod;
        this.futureResultConsumer = futureResultConsumer;
    }

    @Override
    public int read() {
        if (done.get()) {
            return -1;
        }
        if (hasBytesInCurrentChunk()) {
            return currentChunk[nextChunkIndex++];
        }
        // Need to get a new block from the stream, before reading again.
        nextChunkIndex = 0;
        try {
            if (readNextChunk()) {
                return read();
            }
        } catch (InterruptedException e) {
            BError error = DiagnosticLog.getCsvError("Cannot read the stream, interrupted error");
            futureResultConsumer.accept(error);
            return -1;
        }
        return -1;
    }

    @Override
    public void close() throws IOException {
        super.close();
        if (closeMethod != null) {
            env.getRuntime().callMethod(iterator, closeMethod.getName(), null);
        }
    }

    private boolean hasBytesInCurrentChunk() {
        return currentChunk.length != 0 && nextChunkIndex < currentChunk.length;
    }

    private boolean readNextChunk() throws InterruptedException {
        try {
            Object result = env.getRuntime().callMethod(iterator, nextMethodName, null);
            if (result == null) {
                done.set(true);
                currentChunk = new byte[0];
                return !done.get();
            }
            if (result instanceof BMap<?, ?>) {
                BMap<BString, Object> valueRecord = (BMap<BString, Object>) result;
                final BString value = Arrays.stream(valueRecord.getKeys()).findFirst().get();
                final BArray arrayValue = valueRecord.getArrayValue(value);
                currentChunk = arrayValue.getByteArray();
            } else {
                // Case where Completes with an error
                done.set(true);
            }
        } catch (BError bError) {
            // Panic with an error
            done.set(true);
            futureResultConsumer.accept(bError);
            currentChunk = new byte[0];
        }
        return !done.get();
    }
}
