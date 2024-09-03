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
import ballerina/test;

@test:Config
function testFromCsvStringWithTypeForStringAndArrayAsExpectedType() {
    BooleanArrayArray|csv:Error cv1baa = csv:parseString(csvStringWithBooleanValues1);
    test:assertEquals(cv1baa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanArrayArray|csv:Error cv2baa = csv:parseString(csvStringWithBooleanValues2);
    test:assertEquals(cv2baa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    BooleanArrayArray|csv:Error cv3baa = csv:parseString(csvStringWithBooleanValues3);
    test:assertTrue(cv3baa is csv:Error);
    test:assertEquals((<csv:Error>cv3baa).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|csv:Error cv4baa = csv:parseString(csvStringWithBooleanValues4);
    test:assertTrue(cv4baa is csv:Error);
    test:assertEquals((<csv:Error>cv4baa).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|csv:Error cv5baa = csv:parseString(csvStringWithBooleanValues5);
    test:assertTrue(cv5baa is csv:Error);
    test:assertEquals((<csv:Error>cv5baa).message(), common:generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanArrayArray|csv:Error cv6baa = csv:parseString(csvStringWithBooleanValues6);
    test:assertTrue(cv6baa is csv:Error);
    test:assertEquals((<csv:Error>cv6baa).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|csv:Error cv7baa = csv:parseString(csvStringWithBooleanValues7);
    test:assertTrue(cv7baa is csv:Error);
    test:assertEquals((<csv:Error>cv7baa).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    NillableBooleanArrayArray|csv:Error cv1nbaa = csv:parseString(csvStringWithBooleanValues1);
    test:assertEquals(cv1nbaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableBooleanArrayArray|csv:Error cv2nbaa = csv:parseString(csvStringWithBooleanValues2);
    test:assertEquals(cv2nbaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanArrayArray|csv:Error cv3nbaa = csv:parseString(csvStringWithBooleanValues3);
    test:assertEquals(cv3nbaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableBooleanArrayArray|csv:Error cv4nbaa = csv:parseString(csvStringWithBooleanValues4);
    test:assertEquals(cv4nbaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableBooleanArrayArray|csv:Error cv5nbaa = csv:parseString(csvStringWithBooleanValues5);
    test:assertTrue(cv5nbaa is csv:Error);
    test:assertEquals((<csv:Error>cv5nbaa).message(), common:generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanArrayArray|csv:Error cv6nbaa = csv:parseString(csvStringWithBooleanValues6);
    test:assertEquals(cv6nbaa, [
        [(), ()]
    ]);

    NillableBooleanArrayArray|csv:Error cv7nbaa = csv:parseString(csvStringWithBooleanValues7);
    test:assertEquals(cv7nbaa, [
        [b1, b2, (), b4]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error cv1niubaa = csv:parseString(csvStringWithBooleanValues1);
    test:assertEquals(cv1niubaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error cv2niubaa = csv:parseString(csvStringWithBooleanValues2);
    test:assertEquals(cv2niubaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error cv3niubaa = csv:parseString(csvStringWithBooleanValues3);
    test:assertEquals(cv3niubaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error cv4niubaa = csv:parseString(csvStringWithBooleanValues4);
    test:assertEquals(cv4niubaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error cv5niubaa = csv:parseString(csvStringWithBooleanValues5);
    test:assertEquals(cv5niubaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);
}

@test:Config
function testFromCsvStringWithTypeForStringAndArrayAsExpectedType2() {
    NillableIntOrUnionBooleanArrayArray|csv:Error cv6niubaa = csv:parseString(csvStringWithBooleanValues6);
    test:assertEquals(cv6niubaa, [
        [(), ()]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error cv7niubaa = csv:parseString(csvStringWithBooleanValues7);
    test:assertEquals(cv7niubaa, [
        [b1, b2, (), b4]
    ]);

    StringArray1Array|csv:Error cv1saa = csv:parseString(csvStringWithBooleanValues1);
    test:assertEquals(cv1saa, [
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"]
    ]);

    StringArray1Array|csv:Error cv2saa = csv:parseString(csvStringWithBooleanValues2);
    test:assertEquals(cv2saa, [
        ["true", "false", "true", "false", "true"],
        ["true", "false", "true", "false", "true"]
    ]);

    StringArray1Array|csv:Error cv3saa = csv:parseString(csvStringWithBooleanValues3);
    test:assertEquals(cv3saa, [
        ["true", "false", "true"],
        ["TRUE", "FALSE", "()"],
        ["true", "true", "FALSE"]
    ]);

    StringArray1Array|csv:Error cv4saa = csv:parseString(csvStringWithBooleanValues4);
    test:assertEquals(cv4saa, [
        ["true", "()", "()", "false"],
        ["true", "()", "null", "false"]
    ]);

    StringArray1Array|csv:Error cv5saa = csv:parseString(csvStringWithBooleanValues5);
    test:assertEquals(cv5saa, [
        ["true", "false", "true", "2"],
        ["true", "false", "true", "3"]
    ]);

    StringArray1Array|csv:Error cv6saa = csv:parseString(csvStringWithBooleanValues6);
    test:assertEquals(cv6saa, [
        ["()", "()"]
    ]);

    StringArray1Array|csv:Error cv7saa = csv:parseString(csvStringWithBooleanValues7);
    test:assertEquals(cv7saa, [
        ["true", "false", "()", "false"]
    ]);

    StringArray2Array|csv:Error cv1s2aa = csv:parseString(csvStringWithBooleanValues1);
    test:assertEquals(cv1s2aa, [
        ["true", "false"],
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|csv:Error cv2s2aa = csv:parseString(csvStringWithBooleanValues2);
    test:assertEquals(cv2s2aa, [
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|csv:Error cv3s2aa = csv:parseString(csvStringWithBooleanValues3);
    test:assertEquals(cv3s2aa, [
        ["true", "false"],
        ["TRUE", "FALSE"],
        ["true", "true"]
    ]);

    StringArray2Array|csv:Error cv4s2aa = csv:parseString(csvStringWithBooleanValues4);
    test:assertEquals(cv4s2aa, [
        ["true", "()"],
        ["true", "()"]
    ]);

    StringArray2Array|csv:Error cv5s2aa = csv:parseString(csvStringWithBooleanValues5);
    test:assertEquals(cv5s2aa, [
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|csv:Error cv6s2aa = csv:parseString(csvStringWithBooleanValues6);
    test:assertEquals(cv6s2aa, [
        ["()", "()"]
    ]);

    StringArray2Array|csv:Error cv7s2aa = csv:parseString(csvStringWithBooleanValues7);
    test:assertEquals(cv7s2aa, [
        ["true", "false"]
    ]);

    JsonArray1Array|csv:Error cv1jaa = csv:parseString(csvStringWithBooleanValues1);
    test:assertEquals(cv1jaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);
}

@test:Config
function testFromCsvStringWithTypeForStringAndArrayAsExpectedType3() {
    JsonArray1Array|csv:Error cv2jaa = csv:parseString(csvStringWithBooleanValues2);
    test:assertEquals(cv2jaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    JsonArray1Array|csv:Error cv3jaa = csv:parseString(csvStringWithBooleanValues3);
    test:assertEquals(cv3jaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    JsonArray1Array|csv:Error cv4jaa = csv:parseString(csvStringWithBooleanValues4);
    test:assertEquals(cv4jaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    JsonArray1Array|csv:Error cv5jaa = csv:parseString(csvStringWithBooleanValues5);
    test:assertEquals(cv5jaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    JsonArray1Array|csv:Error cv6jaa = csv:parseString(csvStringWithBooleanValues6);
    test:assertEquals(cv6jaa, [
        [(), ()]
    ]);

    JsonArray1Array|csv:Error cv7jaa = csv:parseString(csvStringWithBooleanValues7);
    test:assertEquals(cv7jaa, [
        [b1, b2, (), b4]
    ]);

    AnydataArray1Array|csv:Error cv1anydaa = csv:parseString(csvStringWithBooleanValues1);
    test:assertEquals(cv1anydaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    AnydataArray1Array|csv:Error cv2anydaa = csv:parseString(csvStringWithBooleanValues2);
    test:assertEquals(cv2anydaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    AnydataArray1Array|csv:Error cv3anydaa = csv:parseString(csvStringWithBooleanValues3);
    test:assertEquals(cv3anydaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    AnydataArray1Array|csv:Error cv4anydaa = csv:parseString(csvStringWithBooleanValues4);
    test:assertEquals(cv4anydaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    AnydataArray1Array|csv:Error cv5anydaa = csv:parseString(csvStringWithBooleanValues5);
    test:assertEquals(cv5anydaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    AnydataArray1Array|csv:Error cv6anydaa = csv:parseString(csvStringWithBooleanValues6);
    test:assertEquals(cv6anydaa, [
        [(), ()]
    ]);

    AnydataArray1Array|csv:Error cv7anydaa = csv:parseString(csvStringWithBooleanValues7);
    test:assertEquals(cv7anydaa, [
        [b1, b2, (), b4]
    ]);

    DecimalArray1Array|csv:Error cv1daa = csv:parseString(csvStringWithBooleanValues1);
    test:assertTrue(cv1daa is csv:Error);
    test:assertEquals((<csv:Error>cv1daa).message(), common:generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalArray1Array|csv:Error cv3daa = csv:parseString(csvStringWithBooleanValues3);
    test:assertTrue(cv3daa is csv:Error);
    test:assertEquals((<csv:Error>cv3daa).message(), common:generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalArray1Array|csv:Error cv6daa = csv:parseString(csvStringWithBooleanValues6);
    test:assertTrue(cv6daa is csv:Error);
    test:assertEquals((<csv:Error>cv6daa).message(), common:generateErrorMessageForInvalidCast("()", "decimal"));

    DecimalArray1Array|csv:Error cv7daa = csv:parseString(csvStringWithBooleanValues7);
    test:assertTrue(cv7daa is csv:Error);
    test:assertEquals((<csv:Error>cv7daa).message(), common:generateErrorMessageForInvalidCast("true", "decimal"));
}

@test:Config
function testArrayIndexes() {
    string csv = string `a, b
                            1, 2
                            3, 4
                            5, 6
                            7, 8`;

    string csv2 = string `a, b
                            1, 2, 3
                            3, 4, 5
                            5, 6, 7
                            7, 8, 9`;

    record {}[2]|csv:Error rec = csv:parseString(csv);
    test:assertEquals(rec, [
                {a: 1, b: 2},
                {a: 3, b: 4}
            ]);

    map<int>[2]|csv:Error rec_2 = csv:parseString(csv);
    test:assertEquals(rec_2, [
                {a: 1, b: 2},
                {a: 3, b: 4}
            ]);

    record {|int a;|}[2]|csv:Error rec2 = csv:parseString(csv, {skipLines: [2]});
    test:assertEquals(rec2, [
                {a: 1},
                {a: 5}
            ]);

    record {|int a;|}[5]|csv:Error rec2_2 = csv:parseString(csv, {skipLines: [2]});
    test:assertTrue(rec2_2 is csv:Error);

    int[][2]|csv:Error rec3 = csv:parseString(csv2);
    test:assertEquals(rec3, [
                [1, 2],
                [3, 4],
                [5, 6],
                [7, 8]
            ]);

    [int, int][2]|csv:Error rec3_2 = csv:parseString(csv2);
    test:assertEquals(rec3_2, [
                [1, 2],
                [3, 4]
            ]);

    [int...][2]|csv:Error rec3_3 = csv:parseString(csv2);
    test:assertEquals(rec3_3, [
                [1, 2, 3],
                [3, 4, 5]
            ]);

    int[1][2]|csv:Error rec4 = csv:parseString(csv2, {skipLines: [2]});
    test:assertEquals(rec4, [
                [1, 2]
            ]);

    int[2][]|csv:Error rec5 = csv:parseString(csv2);
    test:assertEquals(rec5, [
                [1, 2, 3],
                [3, 4, 5]
            ]);
}

@test:Config
function testParseStringArrayAsExpectedTypeWithOutputHeaders() {
    BooleanArrayArray|csv:Error cv1baa = csv:parseString(csvStringWithBooleanValues1, {outputWithHeaders: true});
    test:assertTrue(cv1baa is csv:Error);
    test:assertEquals((<csv:Error>cv1baa).message(), common:generateErrorMessageForInvalidCast("b1", "boolean"));

    string[][]|csv:Error cv1baa_2 = csv:parseString(csvStringWithBooleanValues1, {outputWithHeaders: true});
    test:assertEquals(cv1baa_2, [
        ["b1", "b2", "b3", "b4"],
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"]
    ]);

    (boolean|string)[][]|csv:Error cv2baa = csv:parseString(csvStringWithBooleanValues2, {outputWithHeaders: true});
    test:assertEquals(cv2baa, [
        ["b1", "b2", "b3", "b4", "b5"],
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    (string|boolean)[][]|csv:Error cv2baa_2 = csv:parseString(csvStringWithBooleanValues2, {outputWithHeaders: true});
    test:assertEquals(cv2baa_2, [
        ["b1", "b2", "b3", "b4", "b5"],
        ["true", "false", "true", "false", "true"],
        ["true", "false", "true", "false", "true"]
    ]);

    [string...][]|csv:Error cv2baa_2_2 = csv:parseString(csvStringWithBooleanValues2, {outputWithHeaders: true});
    test:assertEquals(cv2baa_2_2, [
        ["b1", "b2", "b3", "b4", "b5"],
        ["true", "false", "true", "false", "true"],
        ["true", "false", "true", "false", "true"]
    ]);

    [boolean|string...][]|csv:Error cv2baa_3 = csv:parseString(csvStringWithBooleanValues2, {outputWithHeaders: true});
    test:assertEquals(cv2baa_3, [
        ["b1", "b2", "b3", "b4", "b5"],
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    string[][]|csv:Error cv1baa_4 = csv:parseString(csvStringWithBooleanValues1, {outputWithHeaders: true, header: false});
    test:assertEquals(cv1baa_4, [
        ["b1", "b2", "b3", "b4"],
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"]
    ]);

    string[][]|csv:Error cv1baa_5 = csv:parseString(csvStringWithBooleanValues1, {outputWithHeaders: true, header: 2});
    test:assertTrue(cv1baa_5 is csv:Error);
    test:assertEquals((<csv:Error>cv1baa_5).message(), "duplicate header found: 'true'");

    string[][]|csv:Error cv1baa_6 = csv:parseString(csvStringWithBooleanValues8, {outputWithHeaders: false, header: 2});
    test:assertEquals(cv1baa_6, [
        ["true", "false", "true1", "false1"]
    ]);

    [string, string, string, string, string][]|csv:Error cv2baa_7 = csv:parseString(csvStringWithBooleanValues2, {outputWithHeaders: true});
    test:assertEquals(cv2baa_7, [
        ["b1", "b2", "b3", "b4", "b5"],
        ["true", "false", "true", "false", "true"],
        ["true", "false", "true", "false", "true"]
    ]);

    [boolean|string, boolean|string...][]|csv:Error cv2baa_8 = csv:parseString(csvStringWithBooleanValues2, {outputWithHeaders: true});
    test:assertEquals(cv2baa_8, [
        ["b1", "b2", "b3", "b4", "b5"],
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);
    
    string[2][2]|csv:Error cv1baa_9 = csv:parseString(csvStringWithBooleanValues1, {outputWithHeaders: true, header: false});
    test:assertEquals(cv1baa_9, [
        ["b1", "b2"],
        ["true", "false"]
    ]);
}
