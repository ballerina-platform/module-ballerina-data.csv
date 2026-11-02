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
import ballerina/file;
import ballerina/io;
import ballerina/test;

const string OVERWRITE_INPUT = "a,b\n1,x\n2,y,9\nx,y\n3,z";
const string PREVIOUS_LOG = "previous-operation\n";

type OverwriteRow record {|
    int a;
    string b;
|};

type OverwriteOther record {|
    string a;
    int b;
|};

type OverwriteRows (OverwriteRow|OverwriteOther)[];

type OverwriteFixture record {|
    string logPath;
    string inputPath;
    csv:ParseOptions options;
|};

@test:Config {groups: ["overwrite-lifecycle"]}
function testUnionOverwriteWithStringInput() returns error? {
    OverwriteFixture fixture = check createOverwriteFixture();
    OverwriteRows actual = check csv:parseString(OVERWRITE_INPUT, fixture.options);
    string content = check readAndRemoveOverwriteFixture(fixture);
    assertOverwriteRows(actual);
    assertBothStagesLogged(content);
    test:assertFalse(content.includes(PREVIOUS_LOG.trim()));
}

@test:Config {groups: ["overwrite-lifecycle"]}
function testUnionOverwriteWithByteInput() returns error? {
    OverwriteFixture fixture = check createOverwriteFixture();
    OverwriteRows actual = check csv:parseBytes(OVERWRITE_INPUT.toBytes(), fixture.options);
    string content = check readAndRemoveOverwriteFixture(fixture);
    assertOverwriteRows(actual);
    assertBothStagesLogged(content);
    test:assertFalse(content.includes(PREVIOUS_LOG.trim()));
}

@test:Config {groups: ["overwrite-lifecycle"]}
function testUnionOverwriteWithStreamInput() returns error? {
    OverwriteFixture fixture = check createOverwriteFixture();
    stream<byte[], io:Error?> input = check io:fileReadBlocksAsStream(fixture.inputPath);
    OverwriteRows actual = check csv:parseStream(input, fixture.options);
    string content = check readAndRemoveOverwriteFixture(fixture);
    assertOverwriteRows(actual);
    assertBothStagesLogged(content);
    test:assertFalse(content.includes(PREVIOUS_LOG.trim()));
}

@test:Config {groups: ["overwrite-lifecycle"]}
function testUnionAppendKeepsPreviousLogs() returns error? {
    OverwriteFixture fixture = check createOverwriteFixture(csv:APPEND);
    OverwriteRows actual = check csv:parseString(OVERWRITE_INPUT, fixture.options);
    string content = check readAndRemoveOverwriteFixture(fixture);
    assertOverwriteRows(actual);
    test:assertTrue(content.startsWith(PREVIOUS_LOG));
    test:assertTrue(content.includes("invalid number of headers"));
    test:assertTrue(content.includes("no mapping type found"));
    test:assertEquals(countLogEntries(content), 3);
}

@test:Config {groups: ["overwrite-lifecycle"]}
function testUnionOverwriteWithParseErrorsOnly() returns error? {
    OverwriteFixture fixture = check createOverwriteFixture();
    OverwriteRows actual = check csv:parseString("a,b\n1,x\n2,y,9\n3,z", fixture.options);
    string content = check readAndRemoveOverwriteFixture(fixture);
    assertOverwriteRows(actual);
    test:assertTrue(content.includes("invalid number of headers"));
    test:assertFalse(content.includes(PREVIOUS_LOG.trim()));
    test:assertEquals(countLogEntries(content), 1);
}

@test:Config {groups: ["overwrite-lifecycle"]}
function testUnionOverwriteWithConversionErrorsOnly() returns error? {
    OverwriteFixture fixture = check createOverwriteFixture();
    OverwriteRows actual = check csv:parseString("a,b\n1,x\nx,y\n3,z", fixture.options);
    string content = check readAndRemoveOverwriteFixture(fixture);
    assertOverwriteRows(actual);
    test:assertTrue(content.includes("no mapping type found"));
    test:assertFalse(content.includes(PREVIOUS_LOG.trim()));
    test:assertEquals(countLogEntries(content), 1);
}

@test:Config {groups: ["overwrite-lifecycle"]}
function testOverwriteResetsForReusedOptions() returns error? {
    OverwriteFixture fixture = check createOverwriteFixture();
    OverwriteRows first = check csv:parseString("a,b\n1,x\n2,y,9\n3,z", fixture.options);
    string firstContent = check io:fileReadString(fixture.logPath);
    OverwriteRows second = check csv:parseString(OVERWRITE_INPUT, fixture.options);
    string secondContent = check readAndRemoveOverwriteFixture(fixture);
    assertOverwriteRows(first);
    assertOverwriteRows(second);
    test:assertEquals(countLogEntries(firstContent), 1);
    assertBothStagesLogged(secondContent);
    test:assertFalse(secondContent.includes(PREVIOUS_LOG.trim()));
}

@test:Config {groups: ["overwrite-lifecycle"]}
function testOverwriteKeepsErrorsAcrossStreamRows() returns error? {
    OverwriteFixture fixture = check createOverwriteFixture();
    check io:fileWriteString(fixture.inputPath, "a,b\n1,x\n2,y,9\n3,z\n4,w,9\n5,t");
    stream<byte[], io:Error?> input = check io:fileReadBlocksAsStream(fixture.inputPath);
    stream<OverwriteRow, csv:Error?> rows = check csv:parseToStream(input, fixture.options);
    OverwriteRow[] actual = check from OverwriteRow row in rows
        select row;
    string content = check readAndRemoveOverwriteFixture(fixture);
    test:assertEquals(actual, [{a: 1, b: "x"}, {a: 3, b: "z"}, {a: 5, b: "t"}]);
    test:assertTrue(content.includes("invalid number of headers"));
    test:assertFalse(content.includes(PREVIOUS_LOG.trim()));
    test:assertEquals(countLogEntries(content), 2);
}

@test:Config {groups: ["overwrite-lifecycle"]}
function testOverwriteResetsForListAndTransform() returns error? {
    OverwriteFixture fixture = check createOverwriteFixture();
    csv:ParseListOptions listOptions = {headerRows: 1, failSafe: fixture.options.failSafe};
    OverwriteRow[] listRows = check csv:parseList([["a", "b"], ["1", "x"], ["bad", "y"]], listOptions);
    string listContent = check io:fileReadString(fixture.logPath);
    csv:TransformOptions transformOptions = {failSafe: fixture.options.failSafe};
    OverwriteRow[] transformed = check csv:transform([{"a": 1, "b": "x"}, {"a": "bad", "b": "y"}], transformOptions);
    string transformContent = check readAndRemoveOverwriteFixture(fixture);
    test:assertEquals(listRows, [{a: 1, b: "x"}]);
    test:assertEquals(transformed, [{a: 1, b: "x"}]);
    test:assertFalse(listContent.includes(PREVIOUS_LOG.trim()));
    test:assertFalse(transformContent.includes(PREVIOUS_LOG.trim()));
    test:assertEquals(countLogEntries(listContent), 1);
    test:assertEquals(countLogEntries(transformContent), 1);
}

function createOverwriteFixture(csv:FileWriteOption mode = csv:OVERWRITE) returns OverwriteFixture|error {
    string directory = check file:createTempDir(prefix = "csv-overwrite-", dir = "target");
    string logPath = check file:joinPath(directory, "errors.log");
    string inputPath = check file:joinPath(directory, "input.csv");
    check io:fileWriteString(logPath, PREVIOUS_LOG);
    check io:fileWriteString(inputPath, OVERWRITE_INPUT);
    csv:ParseOptions options = {
        failSafe: {
            enableConsoleLogs: false,
            fileOutputMode: {filePath: logPath, fileWriteOption: mode, contentType: csv:METADATA}
        }
    };
    return {logPath, inputPath, options};
}

function readAndRemoveOverwriteFixture(OverwriteFixture fixture) returns string|error {
    string content = check io:fileReadString(fixture.logPath);
    check file:remove(fixture.inputPath);
    check file:remove(fixture.logPath);
    return content;
}

function assertOverwriteRows(OverwriteRows actual) {
    test:assertEquals(actual, [{a: 1, b: "x"}, {a: 3, b: "z"}]);
}

function assertBothStagesLogged(string content) {
    test:assertTrue(content.includes("invalid number of headers"), "Missing parse-stage error: " + content);
    test:assertTrue(content.includes("no mapping type found"), "Missing conversion-stage error: " + content);
    test:assertEquals(countLogEntries(content), 2);
}

function countLogEntries(string content) returns int {
    string[] entries = from string line in test:split(content, "\n")
        where line.trim().length() > 0
        select line;
    return entries.length();
}
