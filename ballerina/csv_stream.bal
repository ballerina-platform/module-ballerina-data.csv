// Copyright (c) 2026, WSO2 LLC. (https://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/jballerina.java;

# Stream iterator class for parsing CSV records incrementally.
# This class is used internally by the `parseAsStream` function.
class CsvRecordStream {

    private boolean isClosed = false;

    # Initializes the CSV record stream.
    public isolated function init() {
    }

    # Reads and returns the next CSV record.
    #
    # + return - A record containing the parsed value when the stream is available,
    #            `()` if the stream has reached the end, or else an `error`
    public isolated function next() returns record {|record {}|anydata[] value;|}|Error? {
        if self.isClosed {
            return ();
        }
        var result = externNextCsvRecord(self);
        // If EOF is reached (result is ()), the native code auto-closes
        if result is () {
            self.isClosed = true;
        }
        return result;
    }

    # Closes the stream. The primary usage of this function is to close the stream
    # without reaching the end. If the stream reaches the end, the stream will be
    # automatically closed.
    #
    # + return - Returns `()` when the closing was successful or an `error`
    public isolated function close() returns Error? {
        if !self.isClosed {
            var closeResult = externCloseCsvStream(self);
            if closeResult is () {
                self.isClosed = true;
            }
            return closeResult;
        }
        return ();
    }
}

isolated function externNextCsvRecord(CsvRecordStream iterator)
        returns record {|record {}|anydata[] value;|}|Error? = @java:Method {
    'class: "io.ballerina.lib.data.csvdata.io.CsvStreamIterator",
    name: "next"
} external;

isolated function externCloseCsvStream(CsvRecordStream iterator) returns Error? = @java:Method {
    'class: "io.ballerina.lib.data.csvdata.io.CsvStreamIterator",
    name: "close"
} external;
