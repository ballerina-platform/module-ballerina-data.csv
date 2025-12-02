// Copyright (c) 2025, WSO2 LLC. (https://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/data.csv;
import ballerina/file;
import ballerina/io;
import ballerina/test;

@test:Config {
    groups: ["fail_safe"]
}
function testFailSafeMechanismWithHeaderErrors() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("resources/fail_test_with_header_error.csv");
    UserStatusRecord[] data = check csv:parseStream(csvStream, {
        failSafe: {}
    });
    test:assertEquals(data.length(), 0);
}

@test:Config {
    groups: ["fail_safe"]
}
function testFailSafeMechanismWithBasicErrors() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("resources/fail_test_with_simple_data.csv");
    UserStatusRecord[] data = check csv:parseStream(csvStream, {
        failSafe: {}
    });
    test:assertEquals(data.length(), 3);
}

@test:Config {
    groups: ["fail_safe"]
}
function testFailSafeMechanismWithListInput() returns error? {
    string[][] csvList = [["id","active"], ["5","true"], ["8","true"], ["4","invalid"]];
    UserStatusRecord[] data = check csv:parseList(csvList, {
        failSafe: {},
        headerRows: 1
    });
    test:assertEquals(data.length(), 2);
}

@test:Config {
    groups: ["fail_safe"]
}
function testFailSafeMechanismWithBytesInput() returns error? {
    byte[] csvBytes = check io:fileReadBytes("resources/fail_test_with_simple_data.csv");
    UserStatusRecord[] data = check csv:parseBytes(csvBytes, {
        failSafe: {}
    });
    test:assertEquals(data.length(), 3);
}

@test:Config {
    groups: ["fail_safe"]
}
function testFailSafeMechanismWithStringInput() returns error? {
    string csvString = check io:fileReadString("resources/fail_test_with_simple_data.csv");
    UserStatusRecord[] data = check csv:parseString(csvString, {
        failSafe: {}
    });
    test:assertEquals(data.length(), 3);
}

@test:Config {
    groups: ["fail_safe"]
}
function testFailSafeMechanismWithMultipleHeaders() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("resources/fail_test_with_multiple_headers.csv");
    UserDetailsRecord[] data = check csv:parseStream(csvStream, {
        failSafe: {}
    });
    test:assertEquals(data.length(), 8);
}

@test:Config {
    groups: ["fail_safe"]
}
function testFailSafeMechanismWithErrorsInLastRow() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("resources/fail_test_with_single_error.csv");
    UserProfileRecord[] data = check csv:parseStream(csvStream, {
        failSafe: {}
    });
    test:assertEquals(data.length(), 1);
}

@test:Config {
    groups: ["fail_safe"]
}
function testFailSafeMechanismWithMultipleErrorRows() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("resources/fail_test_with_multiple_errors.csv");
    UserStatusRecord[] data = check csv:parseStream(csvStream, {
        failSafe: {
           excludeSourceDataInConsole: false
        }
    });
    test:assertEquals(data.length(), 5);
}

@test:Config {
    groups: ["fail_safe"]
}
function testErrorsWithEmptyFiles() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("resources/empty_file.csv");
    UserStatusRecord[]|csv:Error data = csv:parseStream(csvStream, {
        failSafe: {}
    });
    test:assertTrue(data is csv:Error);
}

@test:Config {
    groups: ["fail_safe"]
}
function testErrorsWithWritingLogsToFile() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("resources/fail_test_with_header_error.csv");
    UserStatusRecord[] data = check csv:parseStream(csvStream, {
        failSafe: {
            fileOutputMode: {
                filePath: "logs.txt",
                fileWriteOption: "OVERWRITE"
            }
        }
    });
    test:assertEquals(data.length(), 0);
    check file:remove("logs.txt");
}

@test:Config {
    groups: ["fail_safe"]
}
function testIOErrorsWithWritingLogsToFile() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("resources/fail_test_with_header_error.csv");
    UserStatusRecord[]|error data = csv:parseStream(csvStream, {
        failSafe: {
            enableConsoleLogs: false,
            fileOutputMode: {
                filePath: "resources",
                contentType: csv:METADATA
            }
        }
    });
    test:assertTrue(data is csv:Error);
}

@test:Config {
    groups: ["fail_safe"]
}
function testWritingLogsToFileWithEmptyFilePath() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("resources/fail_test_with_header_error.csv");
    UserStatusRecord[]|error data = csv:parseStream(csvStream, {
        failSafe: {
            fileOutputMode: {
                filePath: "",
                contentType: csv:RAW
            }
        }
    });
    test:assertTrue(data is csv:Error);
}

@test:Config {
    groups: ["fail_safe"]
}
function testOverwritingErrorLogFiles() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("resources/fail_test_with_multiple_errors.csv");
    UserStatusRecord[] data = check csv:parseStream(csvStream, {
        failSafe: {
            fileOutputMode: {
                filePath: "logs.txt",
                fileWriteOption: csv:OVERWRITE,
                contentType: csv:RAW_AND_METADATA
            }
        }
    });
    test:assertEquals(data.length(), 5);
    check file:remove("logs.txt");
}

@test:Config {
    groups: ["fail_safe"]
}
function testWritingMetadataLogsIntoFiles() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("resources/fail_test_with_multiple_errors.csv");
    UserStatusRecord[] data = check csv:parseStream(csvStream, {
        failSafe: {
            fileOutputMode: {
                filePath: "logs.txt",
                fileWriteOption: csv:OVERWRITE,
                contentType: csv:METADATA
            }
        }
    });
    test:assertEquals(data.length(), 5);
    check file:remove("logs.txt");
}

@test:Config {
    groups: ["fail_safe"]
}
function testHandleLogFileGenerationWithNestedDirectories() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("resources/fail_test_with_multiple_errors.csv");
    UserStatusRecord[] data = check csv:parseStream(csvStream, {
        failSafe: {
            fileOutputMode: {
                filePath: "nested/logs/directory/error.log",
                fileWriteOption: csv:APPEND,
                contentType: csv:RAW_AND_METADATA
            }
        }
    });
    test:assertEquals(data.length(), 5);
    check file:remove("nested", file:RECURSIVE);
}

@test:Config {
    groups: ["fail_safe"]
}
function testOverwriteLogFileWithIOException() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("resources/fail_test_with_multiple_errors.csv");
    UserStatusRecord[]|error data = csv:parseStream(csvStream, {
        failSafe: {
            fileOutputMode: {
                filePath: "resources",
                fileWriteOption: csv:OVERWRITE,
                contentType: csv:RAW
            }
        }
    });
    test:assertTrue(data is csv:Error);
}
