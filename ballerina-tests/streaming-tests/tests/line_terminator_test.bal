// Copyright (c) 2026, WSO2 LLC. (https://www.wso2.com).
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
import ballerina/test;

@test:Config {groups: ["line-terminator"]}
function testCrLfOnlyWithStreamInput() returns error? {
    byte[][] chunks = ["first,second\r".toBytes(), "\na,b\nc\r".toBytes(), "\nd,e".toBytes()];
    stream<byte[], error?> input = new (new TestByteStreamIterator(chunks));
    string[][] actual = check csv:parseStream(input, {lineTerminator: csv:CRLF});
    test:assertEquals(actual, [["a", "b\nc"], ["d", "e"]]);
}

@test:Config {groups: ["line-terminator"]}
function testCrLfOnlyWithStreamOutput() returns error? {
    byte[][] chunks = ["first,second\r".toBytes(), "\na,b\nc\r".toBytes(), "\nd,e".toBytes()];
    stream<byte[], error?> input = new (new TestByteStreamIterator(chunks));
    stream<string[], csv:Error?> rows = check csv:parseToStream(input, {lineTerminator: csv:CRLF});
    string[][] actual = check from string[] row in rows
        select row;
    test:assertEquals(actual, [["a", "b\nc"], ["d", "e"]]);
}
