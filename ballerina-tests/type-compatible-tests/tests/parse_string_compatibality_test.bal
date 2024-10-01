// Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
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

import ballerina/csv_commons as common;
import ballerina/data.csv;
import ballerina/io;
import ballerina/test;

const string filepath = "tests/csv_content.txt";
const string filepath2 = "tests/csv_content_2.txt";
const string errorFilepath = "tests/csv_error_content.txt";

@test:Config
function testFromCsvStringWithTypeCompatibility() {
    string value = string `i1,i2,s1,s2,  b1,b2,n1,n2,f1,f2, d1,d2,j1,a1,j2,a2
        ${i1},${i2},${s1},${s2},${b1},${b2},(),(),${f1}, ${f2},${d1},${d2},${b1},${d1},${b2},${d2}
        ${i1},${i2},${s1},${s2},${b1},${b2},(),(),  ${f1},${f2},${d1},${d2},${b1},${d1},${b2},${d2}
    `;
    string value2 = string `i1, s1, b1, n1, f1, d1, j1, a1, s2, s3, j2, a2
        ${i1}, ${s1},${b1}, null,${f1}, ${d1},${b1}, ${d1},${s2}, ${s3},${b2}, ${d2}
    `;
    string value3 = string `i1, s1, b1, n1, f1, d1, j1, a1, s2, s3
        ${i1}, ${s1},${b1}, null,${f1}, ${d1},${b1}, ${d1},${s2}, ${s3}
    `;

    AnydataArray1Array|csv:Error v3anyd1a = csv:parseString(value);
    test:assertEquals(v3anyd1a, [
        [i1, i2, s1, s2, b1, b2, n1, n2, 2.234, -3.21, 2.234, -3.21, b1, 2.234, b2, -3.21],
        [i1, i2, s1, s2, b1, b2, n1, n2, 2.234, -3.21, 2.234, -3.21, b1, 2.234, b2, -3.21]
    ]);

    CustomRecord27Array|csv:Error vcr27a = csv:parseString(value, {}, CustomRecord27Array);
    test:assertEquals(vcr27a, [
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"},
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"}
    ]);

    CustomRecord27Array|csv:Error v2cr27a = csv:parseString(value2, {}, CustomRecord27Array);
    test:assertEquals(v2cr27a, [
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, s2, j2: "false", a2: "-3.21", s3}
    ]);

    CustomRecord27Array|csv:Error v3cr27a = csv:parseString(value3, {});
    test:assertEquals(v3cr27a, [
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, s2, s3}
    ]);

    AnydataMapArray|csv:Error vanydma = csv:parseString(value);
    test:assertEquals(vanydma, [
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21},
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21}
    ]);

    JsonMapArray|csv:Error vjma = csv:parseString(value);
    test:assertEquals(vjma, <JsonMapArray>[
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21},
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21}
    ]);

    StringMapArray|csv:Error vsma = csv:parseString(value);
    test:assertEquals(vsma, <JsonMapArray>[
        {i1: "1", s1: "string", b1: "true", n1: "()", f1: "2.234", d1: "2.234", a1: "2.234", j1: "true", i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"},
        {i1: "1", s1: "string", b1: "true", n1: "()", f1: "2.234", d1: "2.234", a1: "2.234", j1: "true", i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"}
    ]);

    CustomTuple7Array|csv:Error v2ct7a = csv:parseString(value2);
    test:assertEquals(v2ct7a, <CustomTuple7[]>[
        [i1, s1, b1, n1, 2.234, 2.234, b1, 2.234, s2, s3, "false", "-3.21"]
    ]);

    CustomTuple7Array|csv:Error v3ct7a = csv:parseString(value3);
    test:assertEquals(v3ct7a, <CustomTuple7[]>[
        [i1, s1, b1, n1, 2.234, 2.234, b1, 2.234, s2, s3]
    ]);

    [float, decimal, string][]|csv:Error mrrta = csv:parseString(string `a, b,c
                                                                            1.23, 1.23, 1.23
                                                                            0,0,0
                                                                            0.0,0.0,0.0
                                                                            -1.2,-1.2,-1.2`);
    test:assertEquals(mrrta, [
        [<float>1.23, <decimal>1.23, "1.23"],
        [<float>0, <decimal>0, "0"],
        [<float>0, <decimal>0, "0.0"],
        [<float>-1.2, <decimal>-1.2, "-1.2"]
    ]);

    [float, decimal, string, int][]|csv:Error m2rrta = csv:parseString(string `a, b,c,d
                                                                            1, 1, 1,1
                                                                            0,0,0,0
                                                                            -1,-1,-1,-1`);
    test:assertEquals(m2rrta, [
        [<float>1, <decimal>1, "1", 1],
        [<float>0, <decimal>0, "0", 0],
        [<float>-1, <decimal>-1, "-1", -1]
    ]);

    [int...][]|csv:Error m3rrta = csv:parseString(string `a, b,c,d
                                                                            1.2, abc, true,1.0`);
    test:assertTrue(m3rrta is csv:Error);
    test:assertEquals((<csv:Error>m3rrta).message(), common:generateErrorMessageForInvalidCast("1.2", "int"));

    [boolean|int, int|boolean][]|csv:Error m4rrta = csv:parseString(string `a, b
                                                                            1, 1
                                                                            0,0`);
    test:assertEquals(m4rrta, [
        [1, 1],
        [0, 0]
    ]);

    record {|int...;|}[]|csv:Error irrma = csv:parseString(string `
                                                                            a, b, c
                                                                            1, a, 2.3
                                                                            1, -2, true
                                                                            hello, -2, hello`, {header: 1});
    test:assertEquals(irrma, [
        {a: 1},
        {a: i1, b: i2},
        {b: i2}
    ]);

    record {|()...;|}[]|csv:Error nrrma = csv:parseString(string `
                                                                            a, b, c
                                                                            1, a, ()
                                                                            1, null, ()
                                                                            hello, -2, hello`, {header: 1});
    test:assertEquals(nrrma, [
        {c: ()},
        {b: (), c: ()},
        {}
    ]);

    record {|decimal...;|}[]|csv:Error drra = csv:parseString(string `a, b,     c
                                                                            2.234, invalid , 1
                                                                            ${f2}, 0, 2.3d
                                                                            invalid, ${d2}, ${f3}`);
    test:assertTrue(drra is record {|decimal...;|}[]);
    test:assertEquals(drra, [
        {a: d1, c: <decimal>1.0},
        {a: <decimal>f2, b: d3},
        {b: -3.21d, c: <decimal>f3}
    ]);

    record {|string...;|}[]|csv:Error srra = csv:parseString(string `a, b, c
                                                                            1, a, 2.3
                                                                            1, -2, true
                                                                            hello, -2, hello`);
    test:assertTrue(srra is record {|string...;|}[]);
    test:assertEquals(srra, [
        {a: "1", b: "a", c: "2.3"},
        {a: "1", b: "-2", c: "true"},
        {a: "hello", b: "-2", c: "hello"}
    ]);

    record {|float...;|}[]|csv:Error frra = csv:parseString(string `a, b,     c
                                                                            1.2, invalid , 1
                                                                            ${d2}, ${d3}, true
                                                                            ${d4}, ${f2}, 0.0`);
    test:assertEquals(frra, [
        {a: 1.2, c: 1.0},
        {a: <float>d2, b: <float>d3},
        {a: <float>d4, b: f2, c: 0.0}
    ]);

    record {float a; decimal b; string c;}[]|csv:Error mrra = csv:parseString(string `a, b,c
                                                                            1.23, 1.23, 1.23
                                                                            0,0,0
                                                                            0.0,0.0,0.0
                                                                            -1.2,-1.2,-1.2`);
    test:assertEquals(mrra, [
        {a: <float>1.23, b: <decimal>1.23, c: "1.23"},
        {a: <float>0, b: <decimal>0, c: "0"},
        {a: <float>0, b: <decimal>0, c: "0.0"},
        {a: <float>-1.2, b: <decimal>-1.2, c: "-1.2"}
    ]);

    record {|float a; decimal b; string c; int d;|}[]|csv:Error m2rra = csv:parseString(string `a, b,c,d
                                                                            1, 1, 1,1
                                                                            0,0,0,0
                                                                            -1,-1,-1,-1`);
    test:assertEquals(m2rra, [
        {a: <float>1, b: <decimal>1, c: "1", d: 1},
        {a: <float>0, b: <decimal>0, c: "0", d: 0},
        {a: <float>-1, b: <decimal>-1, c: "-1", d: -1}
    ]);

    record {int d;}[]|csv:Error m3rra = csv:parseString(string `a, b,c,d
                                                                            1.2, abc, true,1.0`);
    test:assertTrue(m3rra is csv:Error);
    test:assertEquals((<csv:Error>m3rra).message(), common:generateErrorMessageForInvalidCast("1.0", "int"));
}

@test:Config
function testSpaceBetweendData() {
    string csv = string `a b, b  d  e, f
                         "Hello world", "  Hi I am ", \"  Hi I am \"`;

    record {|string...;|}[]|csv:Error rec = csv:parseString(csv);
    test:assertEquals(rec, [
        {"a b":"Hello world","b  d  e":"  Hi I am ","f":"\"Hi I am \""}]);
}

@test:Config
function testParseBytes() returns error? {
    byte[] csvBytes = check io:fileReadBytes(filepath);
    byte[] csvBytes2 = check io:fileReadBytes(filepath2);

    record {}[]|csv:Error rec = csv:parseBytes(csvBytes, {});
    test:assertEquals(rec, [
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2},
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2},
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2}]
    );

    rec = csv:parseBytes(csvBytes);
    test:assertEquals(rec, [
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2},
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2},
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2}]
    );

    string[][]|csv:Error rec2 = csv:parseBytes(csvBytes, {});
    test:assertEquals(rec2, [
        ["Hello World", "\"Hello World\"", "Hello World", "2"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"]
    ]);

    rec2 = csv:parseBytes(csvBytes, {outputWithHeaders: true});
    test:assertEquals(rec2, [
        ["a", "b", "c d", "e"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"]
    ]);

    rec2 = csv:parseBytes(csvBytes2, {outputWithHeaders: true, header: 1});
    test:assertEquals(rec2, [
        ["Hello World1", "\"Hello World2\"", "Hello World3", "21"],
        ["Hello World1", "\"Hello World2\"", "Hello World3", "22"],
        ["Hello World1", "\"Hello World2\"", "Hello World3", "23"]
    ]);

    rec2 = csv:parseBytes(csvBytes2, { header: 1});
    test:assertEquals(rec2, [
        ["Hello World1", "\"Hello World2\"", "Hello World3", "22"],
        ["Hello World1", "\"Hello World2\"", "Hello World3", "23"]
    ]);

    int[][]|csv:Error rec3 = csv:parseBytes(csvBytes, {});
    test:assertTrue(rec3 is csv:Error);
    test:assertEquals((<error> rec3).message(), common:generateErrorMessageForInvalidCast("Hello World", "int"));

    record {int a;}[]|csv:Error rec4 = csv:parseBytes(csvBytes, {});
    test:assertTrue(rec4 is csv:Error);
    test:assertEquals((<error> rec4).message(), common:generateErrorMessageForInvalidCast("Hello World", "int"));
}

@test:Config
function testParseStream() returns error? {
    stream<byte[], io:Error?> csvByteStream = check io:fileReadBlocksAsStream(filepath);
    stream<byte[], io:Error?> csvByteStream2 = check io:fileReadBlocksAsStream(filepath2);

    record {}[]|csv:Error rec = csv:parseStream(csvByteStream, {});
    test:assertEquals(rec, [
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2},
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2},
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2}]
    );

    csvByteStream = check io:fileReadBlocksAsStream(filepath);
    rec = csv:parseStream(csvByteStream);
    test:assertEquals(rec, [
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2},
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2},
        {"a":"Hello World","b":"\"Hello World\"","c d":"Hello World","e":2}]
    );

    csvByteStream = check io:fileReadBlocksAsStream(filepath);
    string[][]|csv:Error rec2 = csv:parseStream(csvByteStream, {});
    test:assertEquals(rec2, [
        ["Hello World", "\"Hello World\"", "Hello World", "2"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"]
    ]);

    rec2 = csv:parseStream(csvByteStream2, {header: 1, outputWithHeaders: true});
    test:assertEquals(rec2, [
        ["Hello World1", "\"Hello World2\"", "Hello World3", "21"],
        ["Hello World1", "\"Hello World2\"", "Hello World3", "22"],
        ["Hello World1", "\"Hello World2\"", "Hello World3", "23"]
    ]);

    csvByteStream = check io:fileReadBlocksAsStream(filepath);
    rec2 = csv:parseStream(csvByteStream, {outputWithHeaders: true});
    test:assertEquals(rec2, [
        ["a", "b", "c d", "e"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"],
        ["Hello World", "\"Hello World\"", "Hello World", "2"]
    ]);

    csvByteStream = check io:fileReadBlocksAsStream(filepath2);
    rec2 = csv:parseStream(csvByteStream, {header: 1});
    test:assertEquals(rec2, [
        ["Hello World1", "\"Hello World2\"", "Hello World3", "22"],
        ["Hello World1", "\"Hello World2\"", "Hello World3", "23"]
    ]);

    csvByteStream = check io:fileReadBlocksAsStream(filepath);
    record {int a;}[]|csv:Error rec3 = csv:parseStream(csvByteStream, {});
    test:assertTrue(rec3 is csv:Error);
    test:assertEquals((<error> rec3).message(), "Error occurred while reading the stream: " 
                    + common:generateErrorMessageForInvalidCast("Hello World", "int"));

    csvByteStream = check io:fileReadBlocksAsStream(filepath);
    int[][]|csv:Error rec4 = csv:parseStream(csvByteStream, {});
    test:assertTrue(rec4 is csv:Error);
    test:assertEquals((<error> rec4).message(), "Error occurred while reading the stream: " 
                    + common:generateErrorMessageForInvalidCast("Hello World", "int"));
}

@test:Config
function testErrorParseBytes() returns error? {
    byte[] csvBytes = check io:fileReadBytes(errorFilepath);

    int[][]|csv:Error rec3 = csv:parseBytes(csvBytes, {});
    test:assertTrue(rec3 is csv:Error);
    test:assertTrue((<error> rec3).message().includes("cannot be cast into"));

    record {int a;}[]|csv:Error rec4 = csv:parseBytes(csvBytes, {});
    test:assertTrue(rec4 is csv:Error);
    test:assertTrue((<error> rec3).message().includes("cannot be cast into"));
}

@test:Config
function testErrorParseStream() returns error? {
    stream<byte[], io:Error?> csvByteStream = check io:fileReadBlocksAsStream(errorFilepath);

    record {int a;}[]|csv:Error rec3 = csv:parseStream(csvByteStream, {});
    test:assertTrue(rec3 is csv:Error);
    test:assertTrue((<error> rec3).message().includes("cannot be cast into"));

    csvByteStream = check io:fileReadBlocksAsStream(errorFilepath);
    int[][]|csv:Error rec4 = csv:parseStream(csvByteStream, {});
    test:assertTrue(rec4 is csv:Error);
    test:assertTrue((<error> rec4).message().includes("cannot be cast into"));
}
