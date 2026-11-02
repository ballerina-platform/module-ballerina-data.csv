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
function testCrLfOnlyPreservesBareLineFeed() returns error? {
    string[][] actual = check csv:parseString("first,second\r\na,b\nc", {lineTerminator: csv:CRLF});
    test:assertEquals(actual, [["a", "b\nc"]]);
}

@test:Config {groups: ["line-terminator"]}
function testCrLfOnlyPreservesBareLineFeedWithoutHeaders() returns error? {
    string[][] actual = check csv:parseString("a,b\nc", {header: (), lineTerminator: csv:CRLF});
    test:assertEquals(actual, [["a", "b\nc"]]);
}

@test:Config {groups: ["line-terminator"]}
function testCrLfOnlyPreservesBareLineFeedInHeaders() returns error? {
    string[][] actual = check csv:parseString("first,second\ncontinued\r\na,b", {
                                                                                    lineTerminator: csv:CRLF,
                                                                                    outputWithHeaders: true
                                                                                });
    test:assertEquals(actual, [["first", "second\ncontinued"], ["a", "b"]]);
}

@test:Config {groups: ["line-terminator"]}
function testCrLfOnlyArrayPreservesBareLineFeed() returns error? {
    string[][] actual = check csv:parseString("a,b\nc", {header: (), lineTerminator: [csv:CRLF]});
    test:assertEquals(actual, [["a", "b\nc"]]);
}

@test:Config {groups: ["line-terminator"]}
function testCrLfOnlySeparatesCrLfRecords() returns error? {
    string[][] actual = check csv:parseString("first,second\r\na,b\r\nc,d", {lineTerminator: csv:CRLF});
    test:assertEquals(actual, [["a", "b"], ["c", "d"]]);
}

@test:Config {groups: ["line-terminator"]}
function testLfOnlySeparatesLfRecords() returns error? {
    string[][] actual = check csv:parseString("first,second\na,b\nc,d", {lineTerminator: csv:LF});
    test:assertEquals(actual, [["a", "b"], ["c", "d"]]);
}

@test:Config {groups: ["line-terminator"]}
function testLineTerminatorArrayOrder() returns error? {
    string input = "a,b\nc,d\r\ne,f";
    string[][] expected = [["a", "b"], ["c", "d"], ["e", "f"]];
    string[][] crLfFirst = check csv:parseString(input, {header: (), lineTerminator: [csv:CRLF, csv:LF]});
    string[][] lfFirst = check csv:parseString(input, {header: (), lineTerminator: [csv:LF, csv:CRLF]});
    test:assertEquals(crLfFirst, expected);
    test:assertEquals(lfFirst, expected);
}

@test:Config {groups: ["line-terminator"]}
function testCrLfOnlyPreservesQuotedLineFeed() returns error? {
    string[][] actual = check csv:parseString("first,second\r\na,\"b\nc\"", {lineTerminator: csv:CRLF});
    test:assertEquals(actual, [["a", "b\nc"]]);
}

@test:Config {groups: ["line-terminator"]}
function testCrLfOnlyPreservesBareLineFeedInBytes() returns error? {
    byte[] input = string:toBytes("first,second\r\na,b\nc");
    string[][] actual = check csv:parseBytes(input, {lineTerminator: csv:CRLF});
    test:assertEquals(actual, [["a", "b\nc"]]);
}
