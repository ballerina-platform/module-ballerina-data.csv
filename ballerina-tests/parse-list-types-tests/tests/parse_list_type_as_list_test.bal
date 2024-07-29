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
function testFromCsvWithTypeForTupleAndTupleAsExpectedType() {
    StringTuple1Array|csv:Error st1st1 = csv:parseListAsListType([st1, st1], {}, StringTuple1Array);
    test:assertEquals(st1st1, [
                [s1, s2, "", ""],
                [s1, s2, "", ""]
            ]);

    StringTuple1Array|csv:Error st2st1 = csv:parseListAsListType([st2, st2], {}, StringTuple1Array);
    test:assertEquals(st2st1, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    StringTuple1Array|csv:Error st3st1 = csv:parseListAsListType([st3, st3], {}, StringTuple1Array);
    test:assertEquals(st3st1, [
                [s1, s2, "", ""],
                [s1, s2, "", ""]
            ]);

    StringTuple1Array|csv:Error st4st1 = csv:parseListAsListType([st4, st4], {}, StringTuple1Array);
    test:assertEquals(st4st1, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    StringTuple2Array|csv:Error st1st2 = csv:parseListAsListType([st1, st1], {}, StringTuple2Array);
    test:assertEquals(st1st2, [
                [s1, s2],
                [s1, s2]
            ]);

    StringTuple2Array|csv:Error st2st2 = csv:parseListAsListType([st2, st2], {}, StringTuple2Array);
    test:assertEquals(st2st2, [
                [s1, s2],
                [s1, s2]
            ]);

    StringTuple2Array|csv:Error st3st2 = csv:parseListAsListType([st3, st3], {}, StringTuple2Array);
    test:assertEquals(st3st2, [
                [s1, s2],
                [s1, s2]
            ]);

    StringTuple2Array|csv:Error st4st2 = csv:parseListAsListType([st4, st4], {}, StringTuple2Array);
    test:assertEquals(st4st2, [
                [s1, s2],
                [s1, s2]
            ]);

    StringTuple3Array|csv:Error st1st3 = csv:parseListAsListType([st1, st1], {}, StringTuple3Array);
    test:assertEquals(st1st3, [
                [s1, s2],
                [s1, s2]
            ]);

    StringTuple3Array|csv:Error st2st3 = csv:parseListAsListType([st2, st2], {}, StringTuple3Array);
    test:assertEquals(st2st3, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    StringTuple3Array|csv:Error st3st3 = csv:parseListAsListType([st3, st3], {}, StringTuple3Array);
    test:assertEquals(st3st3, [
                [s1, s2],
                [s1, s2]
            ]);

    StringTuple3Array|csv:Error st4st3 = csv:parseListAsListType([st4, st4], {}, StringTuple3Array);
    test:assertEquals(st4st3, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndTupleAsExpectedType2() {
    StringTuple4Array|csv:Error st1st4 = csv:parseListAsListType([st1, st1], {}, StringTuple4Array);
    test:assertEquals(st1st4, [
                [s1, s2],
                [s1, s2]
            ]);

    StringTuple4Array|csv:Error st2st4 = csv:parseListAsListType([st2, st2], {}, StringTuple4Array);
    test:assertEquals(st2st4, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    StringTuple4Array|csv:Error st3st4 = csv:parseListAsListType([st3, st3], {}, StringTuple4Array);
    test:assertEquals(st3st4, [
                [s1, s2],
                [s1, s2]
            ]);

    StringTuple4Array|csv:Error st4st4 = csv:parseListAsListType([st4, st4], {}, StringTuple4Array);
    test:assertEquals(st4st4, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    AnydataTuple3Array|csv:Error st1anydt3 = csv:parseListAsListType([st1, st1], {}, AnydataTuple3Array);
    test:assertEquals(st1anydt3, [
                [s1, s2],
                [s1, s2]
            ]);

    AnydataTuple3Array|csv:Error st2anydt3 = csv:parseListAsListType([st2, st2], {}, AnydataTuple3Array);
    test:assertEquals(st2anydt3, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    AnydataTuple3Array|csv:Error st3anydt3 = csv:parseListAsListType([st3, st3], {}, AnydataTuple3Array);
    test:assertEquals(st3anydt3, [
                [s1, s2],
                [s1, s2]
            ]);

    AnydataTuple3Array|csv:Error st4anydt3 = csv:parseListAsListType([st4, st4], {}, AnydataTuple3Array);
    test:assertEquals(st4anydt3, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    JsonTuple3Array|csv:Error st1jt3 = csv:parseListAsListType([st1, st1], {}, JsonTuple3Array);
    test:assertEquals(st1jt3, [
                [s1, s2],
                [s1, s2]
            ]);

    JsonTuple3Array|csv:Error st2jt3 = csv:parseListAsListType([st2, st2], {}, JsonTuple3Array);
    test:assertEquals(st2jt3, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    JsonTuple3Array|csv:Error st3jt3 = csv:parseListAsListType([st3, st3], {}, JsonTuple3Array);
    test:assertEquals(st3jt3, [
                [s1, s2],
                [s1, s2]
            ]);

    JsonTuple3Array|csv:Error st4jt3 = csv:parseListAsListType([st4, st4], {}, JsonTuple3Array);
    test:assertEquals(st4jt3, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    DecimalTuple4Array|csv:Error st1dta = csv:parseListAsListType([st1, st1], {}, DecimalTuple4Array);
    test:assertTrue(st1dta is csv:Error);
    test:assertEquals((<error>st1dta).message(), common:generateErrorMessageForInvalidValueForArrayType("string", "0", "decimal"));

    IntegerTuple3Array|csv:Error st2bta = csv:parseListAsListType([st2, st2], {}, IntegerTuple3Array);
    test:assertTrue(st2bta is csv:Error);
    test:assertEquals((<error>st2bta).message(), common:generateErrorMessageForInvalidValueForArrayType("string", "0", "int"));

    NilTuple3Array|csv:Error st3nta = csv:parseListAsListType([st3, st3], {}, NilTuple3Array);
    test:assertTrue(st3nta is csv:Error);
    test:assertEquals((<error>st3nta).message(), common:generateErrorMessageForInvalidValueForArrayType("string", "0", "()"));

    BooleanTuple4Array|csv:Error st4bta = csv:parseListAsListType([st4, st4], {}, BooleanTuple4Array);
    test:assertTrue(st4bta is csv:Error);
    test:assertEquals((<error>st4bta).message(), common:generateErrorMessageForInvalidValueForArrayType("string", "0", "boolean"));
}

@test:Config
function testFromCsvWithTypeForTupleAndTupleAsExpectedType3() {
    [string, boolean, int][]|csv:Error ct1bt4 = csv:parseListAsListType([["a", "true", "1"], ["a", "true", "1"]], {});
    test:assertEquals(ct1bt4, [
                ["a", true, 1],
                ["a", true, 1]
            ]);

    [(), float, decimal, boolean, int, string][]|csv:Error ct1bt6 = csv:parseListAsListType(
            [["null", "2.23", "0", "true", "1", "a"], ["null", "0", "2.23", "true", "1", "a"]]);
    test:assertEquals(ct1bt6, [
                [(), <float>2.23, <decimal>0, true, 1, "a"],
                [(), <float>0, <decimal>2.23, true, 1, "a"]
            ]);

    [decimal, boolean, int, string][]|csv:Error ct1bt7 = csv:parseListAsListType(
            [["0", "true", "1", "a"], ["2.23", "true", "1", "a"]]);
    test:assertEquals(ct1bt7, [
                [<decimal>0, true, 1, "a"],
                [<decimal>2.23, true, 1, "a"]
            ]);

    [decimal, boolean, int, string, anydata...][]|csv:Error ct1bt8 = csv:parseListAsListType(
            [["0", "true", "1", "a", "null", "2.23"], ["2.23", "true", "1", "a", "null", "0"]]);
    test:assertEquals(ct1bt8, [
                [<decimal>0, true, 1, "a", (), 2.23],
                [<decimal>2.23, true, 1, "a", (), 0]
            ]);

    [(), float, decimal, boolean, int, string, string...][]|csv:Error ct1bt9 = csv:parseListAsListType(
            [["null", "2.23", "0", "true", "1", "a"], ["null", "0", "2.23", "true", "1", "a"]]);
    test:assertEquals(ct1bt9, [
                [(), <float>2.23, <decimal>0, true, 1, "a"],
                [(), <float>0, <decimal>2.23, true, 1, "a"]
            ]);

    [decimal, boolean, int, string, string...][]|csv:Error ct1bt10 = csv:parseListAsListType(
            [["0", "true", "1", "a", "null", "2.23"], ["2.23", "true", "1", "a", "null", "0"]]);
    test:assertEquals(ct1bt10, [
                [<decimal>0, true, 1, "a", "null", "2.23"],
                [<decimal>2.23, true, 1, "a", "null", "0"]
            ]);

    [decimal, boolean, int, string, ()...][]|csv:Error ct1bt11 = csv:parseListAsListType(
            [["null", "2.23", "0", "true", "1", "a"], ["null", "0", "2.23", "true", "1", "a"]]);
    test:assertTrue(ct1bt11 is csv:Error);
    //TODO: Fix the message
    test:assertEquals((<error>ct1bt11).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "0", "decimal"));

    [(), decimal, float, boolean, ()...][]|csv:Error ct1bt11_2 = csv:parseListAsListType(
            [["null", "2.23", "0", "true", "1", "a"], ["null", "0", "2.23", "true", "1", "a"]]);
    test:assertTrue(ct1bt11_2 is csv:Error);
    test:assertEquals((<error>ct1bt11_2).message(), common:generateErrorMessageForInvalidValueForArrayType("1", "4", "()"));

    [()...][]|csv:Error ct1bt12 = csv:parseListAsListType(
            [["null", "2.23", "0", "true", "1", "a"], ["null", "0", "2.23", "true", "1", "a"]]);
    test:assertTrue(ct1bt12 is csv:Error);
    test:assertEquals((<error>ct1bt12).message(), common:generateErrorMessageForInvalidValueForArrayType("2.23", "1", "()"));

    [string...][]|csv:Error ct1bt13 = csv:parseListAsListType(
            [["1", "a"], ["1", "a"]]);
    test:assertEquals(ct1bt13, [
                ["1", "a"],
                ["1", "a"]
            ]);

    [boolean...][]|csv:Error ct1bt14 = csv:parseListAsListType(
            [["2.23", "null"], ["7", "()"]]);
    test:assertTrue(ct1bt14 is csv:Error);
    test:assertEquals((<error>ct1bt14).message(), common:generateErrorMessageForInvalidValueForArrayType("2.23", "0", "boolean"));

    int?[][]|csv:Error ct1bt15 = csv:parseListAsListType(
            [["1", "()"], ["1", "2"]]);
    test:assertEquals(ct1bt15, [
                [1, ()],
                [1, 2]
            ]);

    int[][]|csv:Error ct1bt16 = csv:parseListAsListType(
            [["1", "2"], ["1", "()"]]);
    test:assertTrue(ct1bt16 is csv:Error);
    test:assertEquals((<error>ct1bt16).message(), common:generateErrorMessageForInvalidValueForArrayType("()", "1", "int"));

    int[][]|csv:Error ct1bt17 = csv:parseListAsListType(
            [["a", "b"], ["a", "b"]]);
    test:assertTrue(ct1bt17 is csv:Error);
    test:assertEquals((<error>ct1bt17).message(), common:generateErrorMessageForInvalidValueForArrayType("a", "0", "int"));
}

@test:Config
function testFromCsvWithTypeForTupleAndArrayAsExpectedType() {
    StringArrayArray|csv:Error st1saa = csv:parseListAsListType([st1, st1], {}, StringArrayArray);
    test:assertEquals(st1saa, [
                [s1, s2],
                [s1, s2]
            ]);

    StringArrayArray|csv:Error st2saa = csv:parseListAsListType([st2, st2], {}, StringArrayArray);
    test:assertEquals(st2saa, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    StringArrayArray|csv:Error st3saa = csv:parseListAsListType([st3, st3], {}, StringArrayArray);
    test:assertEquals(st3saa, [
                [s1, s2],
                [s1, s2]
            ]);

    StringArrayArray|csv:Error st4saa = csv:parseListAsListType([st4, st4], {}, StringArrayArray);
    test:assertEquals(st4saa, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    NillableStringArrayArray|csv:Error st1nsaa = csv:parseListAsListType([st1, st1], {}, NillableStringArrayArray);
    test:assertEquals(st1nsaa, [
                [s1, s2],
                [s1, s2]
            ]);

    NillableStringArrayArray|csv:Error st2nsaa = csv:parseListAsListType([st2, st2], {}, NillableStringArrayArray);
    test:assertEquals(st2nsaa, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    NillableStringArrayArray|csv:Error st3nsaa = csv:parseListAsListType([st3, st3], {}, NillableStringArrayArray);
    test:assertEquals(st3nsaa, [
                [s1, s2],
                [s1, s2]
            ]);

    NillableStringArrayArray|csv:Error st4nsaa = csv:parseListAsListType([st4, st4], {}, NillableStringArrayArray);
    test:assertEquals(st4nsaa, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    NillableIntOrUnionStringArrayArray|csv:Error st1nsuiaa = csv:parseListAsListType([st1, st1], {}, NillableIntOrUnionStringArrayArray);
    test:assertEquals(st1nsuiaa, [
                [s1, s2],
                [s1, s2]
            ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndTupleAsExpectedType4() {
    NillableIntOrUnionStringArrayArray|csv:Error st2nsuiaa = csv:parseListAsListType([st2, st2], {}, NillableIntOrUnionStringArrayArray);
    test:assertEquals(st2nsuiaa, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    NillableIntOrUnionStringArrayArray|csv:Error st3nsuiaa = csv:parseListAsListType([st3, st3], {}, NillableIntOrUnionStringArrayArray);
    test:assertEquals(st3nsuiaa, [
                [s1, s2],
                [s1, s2]
            ]);

    NillableIntOrUnionStringArrayArray|csv:Error st4nsuiaa = csv:parseListAsListType([st4, st4], {}, NillableIntOrUnionStringArrayArray);
    test:assertEquals(st4nsuiaa, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    StringArray2Array|csv:Error st1saa2 = csv:parseListAsListType([st1, st1], {}, StringArray2Array);
    test:assertEquals(st1saa2, [
                [s1, s2],
                [s1, s2]
            ]);

    StringArray2Array|csv:Error st2saa2 = csv:parseListAsListType([st2, st2], {}, StringArray2Array);
    test:assertEquals(st2saa2, [
                [s1, s2],
                [s1, s2]
            ]);

    StringArray2Array|csv:Error st3saa2 = csv:parseListAsListType([st3, st3], {}, StringArray2Array);
    test:assertEquals(st3saa2, [
                [s1, s2],
                [s1, s2]
            ]);

    StringArray2Array|csv:Error st4saa2 = csv:parseListAsListType([st4, st4], {}, StringArray2Array);
    test:assertEquals(st4saa2, [
                [s1, s2],
                [s1, s2]
            ]);

    JsonArray1Array|csv:Error st1jaa = csv:parseListAsListType([st1, st1], {}, JsonArray1Array);
    test:assertEquals(st1jaa, [
                [s1, s2],
                [s1, s2]
            ]);

    JsonArray1Array|csv:Error st2jaa = csv:parseListAsListType([st2, st2], {}, JsonArray1Array);
    test:assertEquals(st2jaa, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    JsonArray1Array|csv:Error st3jaa = csv:parseListAsListType([st3, st3], {}, JsonArray1Array);
    test:assertEquals(st3jaa, [
                [s1, s2],
                [s1, s2]
            ]);

    JsonArray1Array|csv:Error st4jaa = csv:parseListAsListType([st4, st4], {}, JsonArray1Array);
    test:assertEquals(st4jaa, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    AnydataArray1Array|csv:Error st1anyda = csv:parseListAsListType([st1, st1], {}, AnydataArray1Array);
    test:assertEquals(st1anyda, [
                [s1, s2],
                [s1, s2]
            ]);

    AnydataArray1Array|csv:Error st2anyda = csv:parseListAsListType([st2, st2], {}, AnydataArray1Array);
    test:assertEquals(st2anyda, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    AnydataArray1Array|csv:Error st3anyda = csv:parseListAsListType([st3, st3], {}, AnydataArray1Array);
    test:assertEquals(st3anyda, [
                [s1, s2],
                [s1, s2]
            ]);

    AnydataArray1Array|csv:Error st4anyda = csv:parseListAsListType([st4, st4], {}, AnydataArray1Array);
    test:assertEquals(st4anyda, [
                [s1, s2, s3, s2],
                [s1, s2, s3, s2]
            ]);

    DecimalArray1Array|csv:Error st1dda = csv:parseListAsListType([st1, st1], {}, DecimalArray1Array);
    test:assertTrue(st1dda is csv:Error);
    test:assertEquals((<error>st1dda).message(), common:generateErrorMessageForInvalidValueForArrayType("string", "0", "decimal"));

    DecimalArray1Array|csv:Error st3dda = csv:parseListAsListType([st3, st3], {}, DecimalArray1Array);
    test:assertTrue(st3dda is csv:Error);
    test:assertEquals((<error>st3dda).message(), common:generateErrorMessageForInvalidValueForArrayType("string", "0", "decimal"));
}
