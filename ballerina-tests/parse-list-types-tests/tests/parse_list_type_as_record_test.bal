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
function testFromCsvWithTypeForTupleAndRecordAsExpectedType() {
    StringRecord1Array|csv:Error st1sr1 = csv:parseList([st1, st1], {});
    test:assertTrue(st1sr1 is csv:Error);
    test:assertEquals((<csv:Error>st1sr1).message(), common:generateErrorMessageForMissingRequiredField("s3"));

    StringRecord1Array|csv:Error st2sr1 = csv:parseList([st2, st2], {});
    test:assertTrue(st2sr1 is csv:Error);
    test:assertEquals((<csv:Error>st2sr1).message(), common:generateErrorMessageForMissingRequiredField("s3"));

    StringRecord2Array|csv:Error st1sr2 = csv:parseList([st1, st1], {});
    test:assertTrue(st1sr2 is csv:Error);
    test:assertEquals((<csv:Error>st1sr2).message(), common:generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "parse_list_types_tests:StringRecord2"));

    StringRecord2Array|csv:Error st2sr2 = csv:parseList([st2, st2], {});
    test:assertTrue(st2sr2 is csv:Error);
    test:assertEquals((<csv:Error>st2sr2).message(), common:generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","parse_list_types_tests:StringRecord2"));

    StringRecord9Array|csv:Error st1sr9 = csv:parseList([st1, st1], {});
    test:assertTrue(st1sr9 is csv:Error);
    test:assertEquals((<csv:Error>st1sr9).message(), common:generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "parse_list_types_tests:StringRecord9"));

    StringRecord9Array|csv:Error st2sr9 = csv:parseList([st2, st2], {});
    test:assertTrue(st2sr9 is csv:Error);
    test:assertEquals((<csv:Error>st2sr9).message(), common:generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","parse_list_types_tests:StringRecord9"));

    StringRecord10Array|csv:Error st1sr10 = csv:parseList([st1, st1], {});
    test:assertEquals(st1sr10, [
        {'1: "string", '2: ""},
        {'1: "string", '2: ""}
    ]);

    StringRecord10Array|csv:Error st2sr10 = csv:parseList([st2, st2], {});
    test:assertEquals(st2sr10, [
        {'1: "string", '2: "", '3: "a", '4: ""},
        {'1: "string", '2: "", '3: "a", '4: ""}
    ]);

    StringRecord19Array|csv:Error st1sr19 = csv:parseList([st1, st1], {});
    test:assertEquals(st1sr19, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord19Array|csv:Error st2sr19 = csv:parseList([st2, st2], {});
    test:assertEquals(st2sr19, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord20Array|csv:Error st1sr20 = csv:parseList([st1, st1], {});
    test:assertEquals(st1sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType2() {
    StringRecord20Array|csv:Error st2sr20 = csv:parseList([st2, st2], {});
    test:assertEquals(st2sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord21Array|csv:Error st1sr21 = csv:parseList([st1, st1], {});
    test:assertEquals(st1sr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord21Array|csv:Error st2sr21 = csv:parseList([st2, st2], {});
    test:assertEquals(st2sr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord22Array|csv:Error st1sr22 = csv:parseList([st1, st1], {});
    test:assertEquals(st1sr22, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord22Array|csv:Error st2sr22 = csv:parseList([st2, st2], {});
    test:assertEquals(st2sr22, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord23Array|csv:Error st1sr23 = csv:parseList([st1, st1], {});
    test:assertEquals(st1sr23, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord23Array|csv:Error st2sr23 = csv:parseList([st2, st2], {});
    test:assertEquals(st2sr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord15Array|csv:Error st1cr15 = csv:parseList([st1, st1], {});
    test:assertEquals(st1cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord15Array|csv:Error st2cr15 = csv:parseList([st2, st2], {});
    test:assertEquals(st2cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord16Array|csv:Error st1cr16 = csv:parseList([st1, st1], {});
    test:assertTrue(st1cr16 is csv:Error);
    test:assertEquals((<csv:Error>st1cr16).message(), common:generateErrorMessageForMissingRequiredField("3"));

    CustomRecord16Array|csv:Error st2cr16 = csv:parseList([st2, st2], {});
    test:assertEquals(st2cr16, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord17Array|csv:Error st1cr17 = csv:parseList([st1, st1], {});
    test:assertEquals(st1cr17, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType3() {
    CustomRecord17Array|csv:Error st2cr17 = csv:parseList([st2, st2], {});
    test:assertEquals(st2cr17, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord18Array|csv:Error st1cr18 = csv:parseList([st1, st1], {});
    test:assertTrue(st1cr18 is csv:Error);
    test:assertEquals((<csv:Error>st1cr18).message(), common:generateErrorMessageForMissingRequiredField("3"));

    CustomRecord18Array|csv:Error st2cr18 = csv:parseList([st2, st2], {});
    test:assertEquals(st2cr18, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord19Array|csv:Error st1cr19 = csv:parseList([st1, st1], {});
    test:assertEquals(st1cr19, [
        {'1: s1, '2: s2, '3: "", '4: ""},
        {'1: s1, '2: s2, '3: "", '4: ""}
    ]);

    CustomRecord19Array|csv:Error st2cr19 = csv:parseList([st2, st2], {});
    test:assertEquals(st2cr19, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord20Array|csv:Error st1cr20 = csv:parseList([st1, st1], {});
    test:assertEquals(st1cr20, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord20Array|csv:Error st2cr20 = csv:parseList([st2, st2], {});
    test:assertEquals(st2cr20, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord21Array|csv:Error st1cr21 = csv:parseList([st1, st1], {});
    test:assertEquals(st1cr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord21Array|csv:Error st2cr21 = csv:parseList([st2, st2], {});
    test:assertEquals(st2cr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord22Array|csv:Error st1cr22 = csv:parseList([st1, st1], {});
    test:assertEquals(st1cr22, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType4() {
    CustomRecord22Array|csv:Error st2cr22 = csv:parseList([st2, st2], {});
    test:assertEquals(st2cr22, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord23Array|csv:Error st1cr23 = csv:parseList([st1, st1], {});
    test:assertEquals(st1cr23, [
        {"1": s1, "2": s2, a: ""},
        {"1": s1, "2": s2, a: ""}
    ]);

    CustomRecord23Array|csv:Error st2cr23 = csv:parseList([st2, st2], {});
    test:assertEquals(st2cr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""},
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""}
    ]);

    CustomRecord24Array|csv:Error st1cr24 = csv:parseList([st1, st1], {});
    test:assertEquals(st1cr24, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord24Array|csv:Error st2cr24 = csv:parseList([st2, st2], {});
    test:assertEquals(st2cr24, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord25Array|csv:Error st1cr25 = csv:parseList([st1, st1], {});
    test:assertTrue(st1cr25 is csv:Error);
    test:assertEquals((<csv:Error>st1cr25).message(), common:generateErrorMessageForInvalidFieldType("string", "1"));

    CustomRecord25Array|csv:Error st2cr25 = csv:parseList([st2, st2], {});
    test:assertTrue(st2cr25 is csv:Error);
    test:assertEquals((<csv:Error>st2cr25).message(), common:generateErrorMessageForInvalidFieldType("string", "1"));

    CustomRecord25Array|csv:Error st3cr25 = csv:parseList([st3, st3], {});
    test:assertTrue(st3cr25 is csv:Error);
    test:assertEquals((<csv:Error>st3cr25).message(), common:generateErrorMessageForInvalidFieldType("string", "1"));

    CustomRecord25Array|csv:Error st4cr25 = csv:parseList([st4, st4], {});
    test:assertTrue(st4cr25 is csv:Error);
    test:assertEquals((<csv:Error>st4cr25).message(), common:generateErrorMessageForInvalidFieldType("string", "1"));

    CustomRecord26Array|csv:Error st1cr26 = csv:parseList([st1, st1], {});
    test:assertEquals(st1cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|csv:Error st2cr26 = csv:parseList([st2, st2], {});
    test:assertEquals(st2cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|csv:Error st3cr26 = csv:parseList([st3, st3], {});
    test:assertEquals(st3cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|csv:Error st4cr26 = csv:parseList([st4, st4], {});
    test:assertEquals(st4cr26 , [
        {'1: s1},
        {'1: s1}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType5() {
    StringRecord1Array|csv:Error st3sr1 = csv:parseList([st3, st3], {});
    test:assertTrue(st3sr1 is csv:Error);
    test:assertEquals((<csv:Error>st3sr1).message(), common:generateErrorMessageForMissingRequiredField("s3"));

    StringRecord1Array|csv:Error st4sr1 = csv:parseList([st4, st4], {});
    test:assertTrue(st4sr1 is csv:Error);
    test:assertEquals((<csv:Error>st4sr1).message(), common:generateErrorMessageForMissingRequiredField("s3"));

    StringRecord2Array|csv:Error st3sr2 = csv:parseList([st3, st3], {});
    test:assertTrue(st3sr2 is csv:Error);
    test:assertEquals((<csv:Error>st3sr2).message(), common:generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "parse_list_types_tests:StringRecord2"));

    StringRecord2Array|csv:Error st4sr2 = csv:parseList([st4, st4], {});
    test:assertTrue(st4sr2 is csv:Error);
    test:assertEquals((<csv:Error>st4sr2).message(), common:generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","parse_list_types_tests:StringRecord2"));

    StringRecord9Array|csv:Error st3sr9 = csv:parseList([st3, st3], {});
    test:assertTrue(st3sr9 is csv:Error);
    test:assertEquals((<csv:Error>st3sr9).message(), common:generateErrorMessageForMissingRequiredField("s1"));

    StringRecord9Array|csv:Error st4sr9 = csv:parseList([st4, st4], {});
    test:assertTrue(st4sr9 is csv:Error);
    test:assertEquals((<csv:Error>st4sr9).message(), common:generateErrorMessageForMissingRequiredField("s1"));

    StringRecord10Array|csv:Error st3sr10 = csv:parseList([st3, st3], {});
    test:assertEquals(st3sr10, [
        {'1: "string", '2: ""},
        {'1: "string", '2: ""}
    ]);

    StringRecord10Array|csv:Error st4sr10 = csv:parseList([st4, st4], {});
    test:assertEquals(st4sr10, [
        {'1: "string", '2: "", '3: "a", '4: ""},
        {'1: "string", '2: "", '3: "a", '4: ""}
    ]);

    StringRecord19Array|csv:Error st3sr19 = csv:parseList([st3, st3], {});
    test:assertEquals(st3sr19, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord19Array|csv:Error st4sr19 = csv:parseList([st4, st4], {});
    test:assertEquals(st4sr19, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord20Array|csv:Error st3sr20 = csv:parseList([st3, st3], {});
    test:assertEquals(st3sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord20Array|csv:Error st4sr20 = csv:parseList([st4, st4], {});
    test:assertEquals(st4sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord21Array|csv:Error st3sr21 = csv:parseList([st3, st3], {});
    test:assertEquals(st3sr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord21Array|csv:Error st4sr21 = csv:parseList([st4, st4], {});
    test:assertEquals(st4sr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord22Array|csv:Error st3sr22 = csv:parseList([st3, st3], {});
    test:assertEquals(st3sr22, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord22Array|csv:Error st4sr22 = csv:parseList([st4, st4], {});
    test:assertEquals(st4sr22, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord23Array|csv:Error st3sr23 = csv:parseList([st3, st3], {});
    test:assertEquals(st3sr23, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord23Array|csv:Error st4sr23 = csv:parseList([st4, st4], {});
    test:assertEquals(st4sr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord15Array|csv:Error st3cr15 = csv:parseList([st3, st3], {});
    test:assertEquals(st3cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType6() {
    CustomRecord15Array|csv:Error st4cr15 = csv:parseList([st4, st4], {});
    test:assertEquals(st4cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord16Array|csv:Error st3cr16 = csv:parseList([st3, st3], {});
    test:assertTrue(st3cr16 is csv:Error);
    test:assertEquals((<csv:Error>st3cr16).message(), common:generateErrorMessageForMissingRequiredField("3"));

    CustomRecord16Array|csv:Error st4cr16 = csv:parseList([st4, st4], {});
    test:assertEquals(st4cr16, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord17Array|csv:Error st3cr17 = csv:parseList([st3, st3], {});
    test:assertEquals(st3cr17, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord17Array|csv:Error st4cr17 = csv:parseList([st4, st4], {});
    test:assertEquals(st4cr17, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord18Array|csv:Error st3cr18 = csv:parseList([st3, st3], {});
    test:assertTrue(st3cr18 is csv:Error);
    test:assertEquals((<csv:Error>st3cr18).message(), common:generateErrorMessageForMissingRequiredField("3"));

    CustomRecord18Array|csv:Error st4cr18 = csv:parseList([st4, st4], {});
    test:assertEquals(st4cr18, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord19Array|csv:Error st3cr19 = csv:parseList([st3, st3], {});
    test:assertEquals(st3cr19, [
        {'1: s1, '2: s2, '3: "", '4: ""},
        {'1: s1, '2: s2, '3: "", '4: ""}
    ]);

    CustomRecord19Array|csv:Error st4cr19 = csv:parseList([st4, st4], {});
    test:assertEquals(st4cr19, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord20Array|csv:Error st3cr20 = csv:parseList([st3, st3], {});
    test:assertEquals(st3cr20, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord20Array|csv:Error st4cr20 = csv:parseList([st4, st4], {});
    test:assertEquals(st4cr20, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord21Array|csv:Error st3cr21 = csv:parseList([st3, st3], {});
    test:assertEquals(st3cr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord21Array|csv:Error st4cr21 = csv:parseList([st4, st4], {});
    test:assertEquals(st4cr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord22Array|csv:Error st3cr22 = csv:parseList([st3, st3], {});
    test:assertEquals(st3cr22, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord22Array|csv:Error st4cr22 = csv:parseList([st4, st4], {});
    test:assertEquals(st4cr22, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord23Array|csv:Error st3cr23 = csv:parseList([st3, st3], {});
    test:assertEquals(st3cr23, [
        {"1": s1, "2": s2, a: ""},
        {"1": s1, "2": s2, a: ""}
    ]);

    CustomRecord23Array|csv:Error st4cr23 = csv:parseList([st4, st4], {});
    test:assertEquals(st4cr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""},
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""}
    ]);

    CustomRecord24Array|csv:Error st3cr24 = csv:parseList([st3, st3], {});
    test:assertEquals(st3cr24, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord24Array|csv:Error st4cr24 = csv:parseList([st4, st4], {});
    test:assertEquals(st4cr24, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType7() {
    record{string a; boolean b; int c;}[]|csv:Error ct1br4 = csv:parseList([["a", "1", "true"], ["a", "1", "true"]], {customHeaders: ["a", "c", "b"]});
    test:assertEquals(ct1br4, [
        {a: "a", b: true, c: 1},
        {a: "a", b: true, c: 1}
    ]);

    record{() a; float b; decimal c; boolean d; int e; string f;}[]|csv:Error ct1br6 = csv:parseList(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        {customHeaders: ["f", "e", "d", "c", "b", "a"]});
    test:assertEquals(ct1br6, [
        {a: (), b: <float>2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: <float>0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|decimal c; boolean d; int e; string f;|}[]|csv:Error ct1br7 = csv:parseList(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        {customHeaders: ["f", "e", "d", "c", "b", "a"]});
    test:assertEquals(ct1br7, [
        {c: <decimal>0, d: true, e: 1, f: "a"},
        {c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{decimal c; boolean d; int e; string f;}[]|csv:Error ct1br8 = csv:parseList(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        {customHeaders: ["f", "e", "d", "c", "b", "a"]});
    test:assertEquals(ct1br8, [
        {a: (), b: 2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: 0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|int|() a; float b; decimal? c; boolean d; int e; string f; string...;|}[]|csv:Error ct1br9 = csv:parseList(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        {customHeaders: ["f", "e", "d", "c", "b", "a"]});
    test:assertEquals(ct1br9, [
        {a: (), b: <float>2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: <float>0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|int|() a; float b; decimal? c; string|boolean d; int|string e; string f; string...;|}[]|csv:Error ct1br9_2 = csv:parseList(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        {customHeaders: ["f", "e", "d", "c", "b", "a"]});
    test:assertEquals(ct1br9_2, [
        {a: (), b: <float>2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: <float>0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedTypeWithHeaders() {
    record{string a; boolean b; int c;}[]|csv:Error ct1br4 = csv:parseList([["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 0, customHeaders: ["a", "c", "b"], outputWithHeaders: true});
    test:assertEquals(ct1br4, [
        {a: "a", b: true, c: 1},
        {a: "a", b: true, c: 1},
        {a: "a", b: true, c: 1}
    ]);

    record{string a; boolean b; int c;}[]|csv:Error ct1br4_2 = csv:parseList([["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 1, customHeaders: ["a", "c", "b"]});
    test:assertEquals(ct1br4_2, [
        {a: "a", b: true, c: 1},
        {a: "a", b: true, c: 1}
    ]);

    record{string a; boolean b; int c;}[]|csv:Error ct1br4_3 = csv:parseList([["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 1, customHeaders: ["a", "c", "b"], outputWithHeaders: true});
    test:assertEquals(ct1br4_3, [
        {a: "a", b: true, c: 1},
        {a: "a", b: true, c: 1}
    ]);


    record{string a; boolean b; int c;}[]|csv:Error ct1br4_4 = csv:parseList(
        [["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 2, customHeaders: ["a", "c", "b"], outputWithHeaders: true});
    test:assertEquals(ct1br4_4, [
        {a: "a", b: true, c: 1}
    ]);

    record{string a; boolean b; int c;}[]|csv:Error ct1br4_5 = csv:parseList(
        [["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 2, outputWithHeaders: true});
    test:assertTrue(ct1br4_5 is csv:Error);
    test:assertEquals((<error>ct1br4_5).message(), "Custom headers should be provided");

    record{|string a; boolean b; int...;|}[]|csv:Error ct1br4_4_2 = csv:parseList(
        [["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 2, customHeaders: ["a", "c", "b"], outputWithHeaders: true});
    test:assertEquals(ct1br4_4_2, [
        {a: "a", b: true, c: 1}
    ]);

    record{|string a; boolean b; int...;|}[]|csv:Error ct1br4_5_2 = csv:parseList(
        [["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 2, outputWithHeaders: true});
    test:assertTrue(ct1br4_5_2 is csv:Error);
    test:assertEquals((<error>ct1br4_5).message(), "Custom headers should be provided");

    map<int|string|boolean>[]|csv:Error ct2br4_3 = csv:parseList([["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 1, customHeaders: ["a", "c", "b"], outputWithHeaders: true});
    test:assertEquals(ct2br4_3, [
        {a: "a", b: true, c: 1},
        {a: "a", b: true, c: 1}
    ]);

    map<int|string|boolean>[]|csv:Error ct2br4_3_2 = csv:parseList([["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 3, customHeaders: ["a", "c", "b"], outputWithHeaders: true});
    test:assertEquals(ct2br4_3_2, []);

    map<anydata>[]|csv:Error ct2br4_4 = csv:parseList(
        [["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 2, customHeaders: ["a", "c", "b"], outputWithHeaders: true});
    test:assertEquals(ct2br4_4, [
        {a: "a", b: true, c: 1}
    ]);

    map<string>[]|csv:Error ct2br4_5 = csv:parseList(
        [["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 2, customHeaders: ["a", "c", "b"], outputWithHeaders: true});
    test:assertEquals(ct2br4_5, [
        {a: "a", b: "true", c: "1"},
        {a: "a", b: "true", c: "1"}
    ]);

    map<string>[]|csv:Error ct2br4_7 = csv:parseList(
        [["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 4, customHeaders: ["a", "c", "b"], outputWithHeaders: true});
    test:assertEquals(ct2br4_7, []);

    map<string>[]|csv:Error ct2br4_6 = csv:parseList(
        [["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 2, outputWithHeaders: true});
    test:assertTrue(ct2br4_6 is csv:Error);
    test:assertEquals((<error>ct1br4_5).message(), "Custom headers should be provided");

    map<string>[]|csv:Error ct2br4_8 = csv:parseList(
        [["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 1, outputWithHeaders: true});
    test:assertEquals(ct2br4_8, [
        {"a": "a", "1": "1", "true": "true"},
        {"a": "a", "1": "1", "true": "true"},
        {"a": "a", "1": "1", "true": "true"}
    ]);

    map<string>[]|csv:Error ct2br4_8_2 = csv:parseList(
        [["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"], ["a", "1", "true"]], {headersRows: 1, outputWithHeaders: false});
    test:assertEquals(ct2br4_8_2, [
        {"a": "a", "1": "1", "true": "true"},
        {"a": "a", "1": "1", "true": "true"},
        {"a": "a", "1": "1", "true": "true"}
    ]);

    map<string>[]|csv:Error ct2br4_9 = csv:parseList(
        [["a", "c", "b"], ["a", "2", "true"], ["a", "3", "true"], ["a", "4", "true"], ["a", "5", "true"]], {headersRows: 1, outputWithHeaders: true});
    test:assertEquals(ct2br4_9, [
        {a: "a", b: "true", c: "2"},
        {a: "a", b: "true", c: "3"},
        {a: "a", b: "true", c: "4"},
        {a: "a", b: "true", c: "5"}
    ]);

    map<boolean|int|string>[]|csv:Error ct2br4_10 = csv:parseList(
        [["a", "b", "c"], ["a", "2", "true"], ["a", "3", "true"], ["a", "4", "true"], ["a", "5", "true"]], {headersRows: 1, outputWithHeaders: true});
    test:assertEquals(ct2br4_10, [
        {a: "a", c: true, b: 2},
        {a: "a", c: true, b: 3},
        {a: "a", c: true, b: 4},
        {a: "a", c: true, b: 5}
    ]);

     map<boolean|int|string>[]|csv:Error ct2br4_10_2 = csv:parseList(
        [["a", "b", "c"], ["a", "2", "true"], ["a", "3", "true"], ["a", "4", "true"], ["a", "5", "true"]], {headersRows: 1, outputWithHeaders: false});
    test:assertEquals(ct2br4_10_2, [
        {a: "a", c: true, b: 2},
        {a: "a", c: true, b: 3},
        {a: "a", c: true, b: 4},
        {a: "a", c: true, b: 5}
    ]);

    ct2br4_10_2 = csv:parseList(
        [["a", "b", "c"], ["a", "2", "true"], ["a", "3", "true"], ["a", "4", "true"], ["a", "5", "true"]], {headersRows: 1, customHeaders: ["c", "d", "e"], outputWithHeaders: false});
    test:assertEquals(ct2br4_10_2, [
        {c: "a", e: true, d: 2},
        {c: "a", e: true, d: 3},
        {c: "a", e: true, d: 4},
        {c: "a", e: true, d: 5}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType8() {
    record{|decimal c; boolean|string d; int e; string f; string...;|}[]|csv:Error ct1br10 = csv:parseList(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        {customHeaders: ["f", "e", "d", "c", "b", "a"]});
    test:assertEquals(ct1br10, [
        {a: "null", b: "2.23", c: <decimal>0, d: true, e: 1, f: "a"},
        {a: "()", b: "0", c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|decimal? c; boolean d; int? e; string f; ()...;|}[]|csv:Error ct1br11 = csv:parseList(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        {customHeaders: ["f", "e", "d", "c", "b", "a"]});
    test:assertEquals(ct1br11, [
        {a: (), c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|()...;|}[]|csv:Error ct1br12 = csv:parseList(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        {customHeaders: ["f", "e", "d", "c", "b", "a"]});
    test:assertEquals(ct1br12, [
        {a: ()},
        {a: ()}
    ]);

    record{|string?...;|}[]|csv:Error ct1br13 = csv:parseList(
        [["a", "1"], ["a", "1"]], 
        {customHeaders: ["f", "e"]});
    test:assertEquals(ct1br13, [
        {e: "1", f: "a"},
        {e: "1", f: "a"}
    ]);

    record{|boolean...;|}[]|csv:Error ct1br14 = csv:parseList(
        [["2.23", "null"], ["7", "()"]], 
        {customHeaders: ["b", "a"]});
    test:assertEquals(ct1br14, [
        {},
        {}
    ]);

    map<int?>[]|csv:Error ct1br15 = csv:parseList(
        [["2", "()"], ["2", "1"], ["()", "2"]], 
        {customHeaders: ["f", "e"]});
    test:assertEquals(ct1br15, [
        {e: (), f: 2},
        {e: 1, f: 2},
        {e: 2, f: ()}
    ]);

    record{|boolean...;|}[]|csv:Error ct1br16 = csv:parseList(
        [["2.23", "null"], ["7", "()"]], 
        {customHeaders: ["b", "a"]});
    test:assertEquals(ct1br16, [
        {},
        {}
    ]);
}

@test:Config
function testArrayIndexesWithRecordAsExpectedType() {
    string[][] csv = [["1", "2", "3"], ["3", "4", "5"], ["5", "6", "7"], ["7", "8", "9"]];

    map<int>[2]|csv:Error rec_2 = csv:parseList(csv, {customHeaders: ["a", "b", "c"]});
    test:assertEquals(rec_2, [
                {a: 1, b: 2, c: 3},
                {a: 3, b: 4, c: 5}
            ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndMapAsExpectedType() {
    StringMapArray|csv:Error st1sma = csv:parseList([st1, st1], {});
    test:assertEquals(st1sma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    StringMapArray|csv:Error st2sma = csv:parseList([st2, st2], {});
    test:assertEquals(st2sma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringMapArray|csv:Error st3sma = csv:parseList([st3, st3], {});
    test:assertEquals(st3sma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    StringMapArray|csv:Error st4sma = csv:parseList([st4, st4], {});
    test:assertEquals(st4sma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NillableIntUnionStringMapArray|csv:Error st1niusma = csv:parseList([st1, st1], {});
    test:assertEquals(st1niusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    NillableIntUnionStringMapArray|csv:Error st2niusma = csv:parseList([st2, st2], {});
    test:assertEquals(st2niusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NillableIntUnionStringMapArray|csv:Error st3niusma = csv:parseList([st3, st3], {});
    test:assertEquals(st3niusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    NillableIntUnionStringMapArray|csv:Error st4niusma = csv:parseList([st4, st4], {});
    test:assertEquals(st4niusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    IntUnionStringMapArray|csv:Error st1iusma = csv:parseList([st1, st1], {});
    test:assertEquals(st1iusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    IntUnionStringMapArray|csv:Error st2iusma = csv:parseList([st2, st2], {});
    test:assertEquals(st2iusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    IntUnionStringMapArray|csv:Error st3iusma = csv:parseList([st3, st3], {});
    test:assertEquals(st3iusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    IntUnionStringMapArray|csv:Error st4iusma = csv:parseList([st4, st4], {});
    test:assertEquals(st4iusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    JsonMapArray|csv:Error st1jma = csv:parseList([st1, st1], {});
    test:assertEquals(st1jma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndMapAsExpectedType2() {
    JsonMapArray|csv:Error st2jma = csv:parseList([st2, st2], {});
    test:assertEquals(st2jma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    JsonMapArray|csv:Error st3jma = csv:parseList([st3, st3], {});
    test:assertEquals(st3jma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    JsonMapArray|csv:Error st4jma = csv:parseList([st4, st4], {});
    test:assertEquals(st4jma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    AnydataMapArray|csv:Error st1anydma = csv:parseList([st1, st1], {});
    test:assertEquals(st1anydma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    AnydataMapArray|csv:Error st2anydma = csv:parseList([st2, st2], {});
    test:assertEquals(st2anydma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    AnydataMapArray|csv:Error st3anydma = csv:parseList([st3, st3], {});
    test:assertEquals(st3anydma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    AnydataMapArray|csv:Error st4anydma = csv:parseList([st4, st4], {});
    test:assertEquals(st4anydma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomMapArray|csv:Error st1cma = csv:parseList([st1, st1], {});
    test:assertEquals(st1cma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    CustomMapArray|csv:Error st2cma = csv:parseList([st2, st2], {});
    test:assertEquals(st2cma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomMapArray|csv:Error st3cma = csv:parseList([st3, st3], {});
    test:assertEquals(st3cma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    CustomMapArray|csv:Error st4cma = csv:parseList([st4, st4], {});
    test:assertEquals(st4cma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NilMapArray|csv:Error st1nma = csv:parseList([st1, st1], {});
    test:assertEquals(st1nma, ([
        {},
        {}
    ]));

    IntegerMapArray|csv:Error st2ima = csv:parseList([st2, st2], {});
    test:assertEquals(st2ima, ([
        {},
        {}
    ]));

    DecimalMapArray|csv:Error st3dma = csv:parseList([st3, st3], {});
    test:assertEquals(st3dma, ([
        {},
        {}
    ]));

    BooleanMapArray|csv:Error st4bma = csv:parseList([st4, st4], {});
    test:assertEquals(st4bma, ([
        {},
        {}
    ]));
}
