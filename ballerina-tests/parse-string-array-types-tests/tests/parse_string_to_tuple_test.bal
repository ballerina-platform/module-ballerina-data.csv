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
function testFromCsvStringWithTypeForStringAndTupleAsExpectedType() {
    BooleanTuple1Array|csv:Error cbv1bt1 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt1, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple1Array|csv:Error cbv2bt1 = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt1, [
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple1Array|csv:Error cbv3bt1 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3bt1 is csv:Error);
    test:assertEquals((<csv:Error>cbv3bt1).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple1Array|csv:Error cbv5bt1 = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt1 is csv:Error);
    test:assertEquals((<csv:Error>cbv5bt1).message(), common:generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanTuple1Array|csv:Error cbv7bt1 = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cbv7bt1 is csv:Error);
    test:assertEquals((<csv:Error>cbv7bt1).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple2Array|csv:Error cbv1bt2 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt2, [
        [true, false],
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|csv:Error cbv2bt2 = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt2, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|csv:Error cbv3bt2 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt2, [
        [true, false],
        [true, false],
        [true, true]
    ]);

    BooleanTuple2Array|csv:Error cbv4bt2 = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertTrue(cbv4bt2 is csv:Error);
    test:assertEquals((<csv:Error>cbv4bt2).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple3Array|csv:Error cbv1bt3 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt3, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple3Array|csv:Error cbv2bt3 = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt3, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    BooleanTuple3Array|csv:Error cbv3bt3 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3bt3 is csv:Error);
    test:assertEquals((<csv:Error>cbv3bt3).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple3Array|csv:Error cbv5bt3 = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt3 is csv:Error);
    test:assertEquals((<csv:Error>cbv5bt3).message(), common:generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanTuple3Array|csv:Error cbv7bt3 = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cbv7bt3 is csv:Error);
    test:assertEquals((<csv:Error>cbv7bt3).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|csv:Error cbv1bt4 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt4, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple4Array|csv:Error cbv2bt4 = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt4, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    BooleanTuple4Array|csv:Error cbv3bt4 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3bt4 is csv:Error);
    test:assertEquals((<csv:Error>cbv3bt4).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|csv:Error cbv4bt4 = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertTrue(cbv4bt4 is csv:Error);
    test:assertEquals((<csv:Error>cbv4bt4).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|csv:Error cbv5bt4 = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt4 is csv:Error);
    test:assertEquals((<csv:Error>cbv5bt4).message(), common:generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanTuple4Array|csv:Error cbv6bt4 = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertTrue(cbv6bt4 is csv:Error);
    test:assertEquals((<csv:Error>cbv6bt4).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

}

@test:Config
function testFromCsvStringWithTypeForStringAndTupleAsExpectedType2() {
    BooleanTuple4Array|csv:Error cbv7bt4 = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cbv7bt4 is csv:Error);
    test:assertEquals((<csv:Error>cbv7bt4).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    NillableBooleanTuple5Array|csv:Error cbv1bt5 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt5, [
        [true, false, true, false, null],
        [true, false, true, false, null],
        [true, false, true, false, null]
    ]);

    NillableBooleanTuple5Array|csv:Error cbv2bt5 = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt5, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanTuple5Array|csv:Error cbv3bt5 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt5, [
        [true, false, true, null, null],
        [true, false, (), null, null],
        [true, true, false, null, null]
    ]);

    NillableBooleanTuple5Array|csv:Error cbv4bt5 = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt5, [
        [true, (), (), false, null],
        [true, (), (), false, null]
    ]);

    NillableBooleanTuple5Array|csv:Error cbv5bt5 = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt5 is csv:Error);
    test:assertEquals((<csv:Error>cbv5bt5).message(), common:generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanTuple5Array|csv:Error cbv6bt5 = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt5, [
        [(), (), null, null, null]
    ]);

    NillableBooleanTuple5Array|csv:Error cbv7bt5 = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt5, [
        [b1, b2, (), b4, null]
    ]);

    NillableBooleanTuple6Array|csv:Error cbv1bt6 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt6, [
        [true, false],
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|csv:Error cbv2bt6 = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt6, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|csv:Error cbv3bt6 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt6, [
        [true, false],
        [true, false],
        [true, true]
    ]);

    NillableBooleanTuple6Array|csv:Error cbv4bt6 = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt6, [
        [true, ()],
        [true, ()]
    ]);

    NillableBooleanTuple6Array|csv:Error cbv6bt6 = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt6, [
        [(), null]
    ]);

    NillableBooleanTuple6Array|csv:Error cbv7bt6 = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt6, [
        [b1, b2]
    ]);

    NillableBooleanTuple7Array|csv:Error cbv1bt7 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt7, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableBooleanTuple7Array|csv:Error cbv2bt7 = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt7, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanTuple7Array|csv:Error cbv3bt7 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt7, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableBooleanTuple7Array|csv:Error cbv4bt7 = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt7, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

}
@test:Config
function testFromCsvStringWithTypeForStringAndTupleAsExpectedType3() {
    NillableBooleanTuple7Array|csv:Error cbv5bt7 = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt7 is csv:Error);
    test:assertEquals((<csv:Error>cbv5bt7).message(), common:generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanTuple7Array|csv:Error cbv6bt7 = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt7, [
        [(), ()]
    ]);

    NillableBooleanTuple7Array|csv:Error cbv7bt7 = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt7, [
        [b1, b2, (), false]
    ]);

    NillableBooleanTuple8Array|csv:Error cbv1bt8 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt8, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableBooleanTuple8Array|csv:Error cbv2bt8 = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt8, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanTuple8Array|csv:Error cbv3bt8 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt8, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableBooleanTuple8Array|csv:Error cbv4bt8 = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt8, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableBooleanTuple8Array|csv:Error cbv5bt8 = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt8 is csv:Error);
    test:assertEquals((<csv:Error>cbv5bt8).message(), common:generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanTuple8Array|csv:Error cbv6bt8 = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt8, [
        [(), ()]
    ]);

    NillableBooleanTuple8Array|csv:Error cbv7bt8 = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt8, [
        [b1, b2, (), false]
    ]);

    NillableIntBooleanTuple9Array|csv:Error cbv1bt9 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt9, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableIntBooleanTuple9Array|csv:Error cbv2bt9 = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt9, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableIntBooleanTuple9Array|csv:Error cbv3bt9 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt9, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableIntBooleanTuple9Array|csv:Error cbv4bt9 = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt9, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableIntBooleanTuple9Array|csv:Error cbv5bt9 = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cbv5bt9, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    NillableIntBooleanTuple9Array|csv:Error cbv6bt9 = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt9, [
        [(), ()]
    ]);

    NillableIntBooleanTuple9Array|csv:Error cbv7bt9 = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt9, [
        [b1, b2, (), false]
    ]);

    NilTuple3Array|csv:Error cbv1nt3 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertTrue(cbv1nt3 is csv:Error);
    test:assertEquals((<csv:Error>cbv1nt3).message(), common:generateErrorMessageForInvalidCast("true", "()"));

    NilTuple3Array|csv:Error cbv3nt3 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3nt3 is csv:Error);
    test:assertEquals((<csv:Error>cbv3nt3).message(), common:generateErrorMessageForInvalidCast("true", "()"));

    NilTuple3Array|csv:Error cbv6nt3 = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6nt3, [
        [(), ()]
    ]);

    AnydataTuple3Array|csv:Error cbv1anyd3 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1anyd3, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    AnydataTuple3Array|csv:Error cbv2anyd3 = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2anyd3, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    AnydataTuple3Array|csv:Error cbv3anyd3 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3anyd3, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    AnydataTuple3Array|csv:Error cbv4anyd3 = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4anyd3, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    AnydataTuple3Array|csv:Error cbv5anyd3 = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cbv5anyd3, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    AnydataTuple3Array|csv:Error cbv6anyd3 = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6anyd3, [
        [(), ()]
    ]);

    AnydataTuple3Array|csv:Error cbv7anyd3 = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7anyd3, [
        [b1, b2, (), false]
    ]);
}

@test:Config
function testFromCsvStringWithTypeForStringAndTupleAsExpectedType4() {
    JsonTuple3Array|csv:Error cbv1j3 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1j3, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    JsonTuple3Array|csv:Error cbv2j3 = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2j3, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    JsonTuple3Array|csv:Error cbv3j3 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3j3, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    JsonTuple3Array|csv:Error cbv4j3 = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4j3, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    JsonTuple3Array|csv:Error cbv5j3 = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cbv5j3, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    JsonTuple3Array|csv:Error cbv6j3 = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6j3, [
        [(), ()]
    ]);

    JsonTuple3Array|csv:Error cbv7j3 = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7j3, [
        [b1, b2, (), false]
    ]);

    StringTuple3Array|csv:Error cbv1s3 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1s3, [
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"]
    ]);

    StringTuple3Array|csv:Error cbv2s3 = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2s3, [
        ["true", "false", "true", "false", "true"],
        ["true", "false", "true", "false", "true"]
    ]);

    StringTuple3Array|csv:Error cbv3s3 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3s3, [
        ["true", "false", "true"],
        ["TRUE", "FALSE", "()"],
        ["true", "true", "FALSE"]
    ]);

    StringTuple3Array|csv:Error cbv4s3 = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4s3, [
        ["true", "()", "()", "false"],
        ["true", "()", "null", "false"]
    ]);

    StringTuple3Array|csv:Error cbv5s3 = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cbv5s3, [
        ["true", "false", "true", "2"],
        ["true", "false", "true", "3"]
    ]);

    StringTuple3Array|csv:Error cbv6s3 = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6s3, [
        ["()", "()"]
    ]);

    StringTuple3Array|csv:Error cbv7s3 = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7s3, [
        ["true", "false", "()", "false"]
    ]);

    DecimalTuple3Array|csv:Error cbv1dt3 = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertTrue(cbv1dt3 is csv:Error);
    test:assertEquals((<csv:Error>cbv1dt3).message(), common:generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalTuple3Array|csv:Error cbv3dt3 = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3dt3 is csv:Error);
    test:assertEquals((<csv:Error>cbv3dt3).message(), common:generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalTuple3Array|csv:Error cbv6dt3 = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertTrue(cbv6dt3 is csv:Error);
    test:assertEquals((<csv:Error>cbv6dt3).message(), common:generateErrorMessageForInvalidCast("()", "decimal"));
}
