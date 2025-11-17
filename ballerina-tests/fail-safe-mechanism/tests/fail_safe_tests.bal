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
import ballerina/io;
import ballerina/test;

@test:Config {
    groups: ["fail_safe"]
}
function testFailSafeMechanismWithBasicErrors() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("fail_test_with_simple_data.csv");
    UserStatusRecord[] data = check csv:parseStream(csvStream);
    test:assertEquals(data.length(), 3);
}

@test:Config {
    groups: ["fail_safe"]
}
function testFailSafeMechanismWithMultipleHeaders() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("fail_test_with_multiple_headers.csv");
    UserDetailsRecord[] data = check csv:parseStream(csvStream);
    test:assertEquals(data.length(), 8);
}

@test:Config {
    groups: ["fail_safe"]
}
function testFailSafeMechanismWithErrorsInLastRow() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("fail_test_with_single_error.csv");
    UserProfileRecord[] data = check csv:parseStream(csvStream);
    test:assertEquals(data.length(), 1);
}

@test:Config {
    groups: ["fail_safe"]
}
function testFailSafeMechanismWithMultipleErrorRows() returns error? {
    stream<byte[], io:Error?> csvStream = check io:fileReadBlocksAsStream("fail_test_with_multiple_errors.csv");
    UserStatusRecord[] data = check csv:parseStream(csvStream);
    test:assertEquals(data.length(), 5);
}
