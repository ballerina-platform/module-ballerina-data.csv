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

@test:Config {groups: ["quoted-carriage-return"]}
function testQuotedCarriageReturnsInData() returns error? {
    string input = "id,value\n1,\"x\ry\"\n2,\"x\r\ny\"\n";
    string[][] actual = check csv:parseString(input);
    test:assertEquals(actual, [["1", "x\ry"], ["2", "x\r\ny"]]);
}

@test:Config {groups: ["quoted-carriage-return"]}
function testQuotedCarriageReturnsInHeaders() returns error? {
    string input = "\"first\rname\",\"second\r\nname\"\r\na,b\r\n";
    string[][] actual = check csv:parseString(input, {outputWithHeaders: true});
    test:assertEquals(actual, [["first\rname", "second\r\nname"], ["a", "b"]]);
}

@test:Config {groups: ["quoted-carriage-return"]}
function testQuotedCarriageReturnsWithoutHeaders() returns error? {
    string input = "\"\rx\r\",\"x\r\ny\"";
    string[][] actual = check csv:parseString(input, {header: ()});
    test:assertEquals(actual, [["\rx\r", "x\r\ny"]]);
}

@test:Config {groups: ["quoted-carriage-return"]}
function testQuotedCarriageReturnOnlyValue() returns error? {
    string[][] actual = check csv:parseString("value\r\n\"\r\"");
    test:assertEquals(actual, [["\r"]]);
}

@test:Config {groups: ["quoted-carriage-return"]}
function testQuotedBlankValuesAndEmptyLines() returns error? {
    string input = "value\n\n\"\"\n\n\" \"\n\"\n\"\n\n";
    string[][] actual = check csv:parseString(input);
    test:assertEquals(actual, [[""], [" "], ["\n"]]);
}

@test:Config {groups: ["quoted-carriage-return"]}
function testQuotedCarriageReturnsInBytes() returns error? {
    string input = "\"id\",\"val\rue\"\r\n1,\"x\r\ny\"\r\n";
    string[][] actual = check csv:parseBytes(input.toBytes(), {outputWithHeaders: true});
    test:assertEquals(actual, [["id", "val\rue"], ["1", "x\r\ny"]]);
}

@test:Config {groups: ["quoted-carriage-return"]}
function testQuotedLineFeedsAndRecordBoundaries() returns error? {
    string input = "\"id\",\"value\"\n1,\"x\ny\"\n2,\"\"";
    string[][] actual = check csv:parseString(input);
    test:assertEquals(actual, [["1", "x\ny"], ["2", ""]]);
}

@test:Config {groups: ["quoted-carriage-return"]}
function testQuotedCarriageReturnsAfterEscapedQuotes() returns error? {
    string input = "\"na\\\"me\r\",value\r\n\"x\\\"\ry\",z";
    string[][] actual = check csv:parseString(input, {outputWithHeaders: true});
    test:assertEquals(actual, [["na\"me\r", "value"], ["x\"\ry", "z"]]);
}

@test:Config {groups: ["quoted-carriage-return"]}
function testEscapedCarriageReturnsInQuotedFields() returns error? {
    string input = "\"na\\rme\",value\r\n\"x\\ry\",z";
    string[][] actual = check csv:parseString(input, {outputWithHeaders: true});
    test:assertEquals(actual, [["na\rme", "value"], ["x\ry", "z"]]);
}

@test:Config {groups: ["quoted-carriage-return"]}
function testCustomEnclosureCarriageReturns() returns error? {
    string input = "'na\rme',value\r\n'x\r\ny',z";
    csv:ParseOptions options = {textEnclosure: "'", outputWithHeaders: true};
    string[][] actual = check csv:parseString(input, options);
    test:assertEquals(actual, [["na\rme", "value"], ["x\r\ny", "z"]]);
}
