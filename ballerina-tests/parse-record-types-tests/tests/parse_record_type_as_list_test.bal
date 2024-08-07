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
function testFromCsvWithTypeForMapAndArrayAsExpectedType() {
    BooleanArrayArray|csv:Error bm1ba = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, BooleanArrayArray);
    test:assertEquals(bm1ba, [
        [true, false],
        [true, false]
    ]);

    bm1ba = csv:transform([bm1, bm1], {headersOrder: ["b2", "b1"]}, BooleanArrayArray);
    test:assertEquals(bm1ba, [
        [false, true],
        [false, true]
    ]);

    BooleanArrayArray|csv:Error bm2ba = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, BooleanArrayArray);
    test:assertTrue(bm2ba is csv:Error);
    test:assertEquals((<csv:Error>bm2ba).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanArrayArray|csv:Error bm3ba = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, BooleanArrayArray);
    test:assertTrue(bm3ba is csv:Error);
    test:assertEquals((<csv:Error>bm3ba).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanArrayArray|csv:Error bm4ba = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, BooleanArrayArray);
    test:assertTrue(bm4ba is csv:Error);
    test:assertEquals((<csv:Error>bm4ba).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanArrayArray|csv:Error bm5ba = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, BooleanArrayArray);
    test:assertTrue(bm5ba is csv:Error);
    test:assertEquals((<csv:Error>bm5ba).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    NillableBooleanArrayArray|csv:Error bm1nba = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, NillableBooleanArrayArray);
    test:assertEquals(bm1nba, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanArrayArray|csv:Error bm2nba = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, NillableBooleanArrayArray);
    test:assertEquals(bm2nba, [
        [true, false, null, null, null],
        [true, false, null, null, null]
    ]);

    NillableBooleanArrayArray|csv:Error bm3nba = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, NillableBooleanArrayArray);
    test:assertTrue(bm3nba is csv:Error);
    test:assertEquals((<csv:Error>bm3nba).message(), common:generateErrorMessageForInvalidValueForArrayType("1", "4", "boolean?"));

    NillableBooleanArrayArray|csv:Error bm4nba = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, NillableBooleanArrayArray);
    test:assertEquals(bm4nba, [
        [(), ()],
        [(), ()]
    ]);

    NillableBooleanArrayArray|csv:Error bm5nba = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, NillableBooleanArrayArray);
    test:assertEquals(bm5nba, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    bm5nba = csv:transform([bm5, bm5], {headersOrder: ["b1", "b3", "b2", "b4"]}, NillableBooleanArrayArray);
    test:assertEquals(bm5nba, [
        [true, (), false, true],
        [true, (), false, true]
    ]);

    bm5nba = csv:transform([bm5, bm5], {headersOrder: ["b4", "b3", "b2", "b1"]}, NillableBooleanArrayArray);
    test:assertEquals(bm5nba, [
        [true, (), false, true],
        [true, (), false, true]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error bm1niouba = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm1niouba, [
        [true, false],
        [true, false]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error bm2niouba = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm2niouba, [
        [true, false, null, null, null],
        [true, false, null, null, null]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error bm3niouba = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm3niouba, [
        [true, false, null, false, 1],
        [true, false, null, false, 1]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error bm4niouba = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm4niouba, [
        [(), ()],
        [(), ()]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error bm5niouba = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm5niouba, [
        [true, false, (), true],
        [true, false, (), true]
    ]);
    
    JsonArray1Array|csv:Error bm1ja = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, JsonArray1Array);
    test:assertEquals(bm1ja, [
        [true, false],
        [true, false]
    ]);
}

@test:Config
function testFromCsvWithTypeForMapAndArrayAsExpectedType2() {
    JsonArray1Array|csv:Error bm2ja = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, JsonArray1Array);
    test:assertEquals(bm2ja, [
        [true, false, null, null, null],
        [true, false, null, null, null]
    ]);

    JsonArray1Array|csv:Error bm3ja = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, JsonArray1Array);
    test:assertEquals(bm3ja, [
        [true, false, null, false, 1],
        [true, false, null, false, 1]
    ]);

    JsonArray1Array|csv:Error bm4ja = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, JsonArray1Array);
    test:assertEquals(bm4ja, [
        [(), ()],
        [(), ()]
    ]);

    JsonArray1Array|csv:Error bm5ja = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, JsonArray1Array);
    test:assertEquals(bm5ja, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    AnydataArray1Array|csv:Error bm1anyda = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, AnydataArray1Array);
    test:assertEquals(bm1anyda, [
        [true, false],
        [true, false]
    ]);

    AnydataArray1Array|csv:Error bm2anyda = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, AnydataArray1Array);
    test:assertEquals(bm2anyda, [
        [true, false, null, null, null],
        [true, false, null, null, null]
    ]);

    AnydataArray1Array|csv:Error bm3anyda = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, AnydataArray1Array);
    test:assertEquals(bm3anyda, [
        [true, false, null, false, 1],
        [true, false, null, false, 1]
    ]);

    AnydataArray1Array|csv:Error bm4anyda = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, AnydataArray1Array);
    test:assertEquals(bm4anyda, [
        [(), ()],
        [(), ()]
    ]);

    AnydataArray1Array|csv:Error bm5anyda = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, AnydataArray1Array);
    test:assertEquals(bm5anyda, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    StringArray1Array|csv:Error bm1sa = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, StringArray1Array);
    test:assertTrue(bm1sa is csv:Error);
    test:assertEquals((<csv:Error>bm1sa).message(), common:generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringArray1Array|csv:Error bm2sa = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, StringArray1Array);
    test:assertTrue(bm2sa is csv:Error);
    test:assertEquals((<csv:Error>bm2sa).message(), common:generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringArray1Array|csv:Error bm3sa = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, StringArray1Array);
    test:assertTrue(bm3sa is csv:Error);
    test:assertEquals((<csv:Error>bm3sa).message(), common:generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringArray1Array|csv:Error bm4sa = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, StringArray1Array);
    test:assertTrue(bm4sa is csv:Error);
    test:assertEquals((<csv:Error>bm4sa).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "0", "string"));

    StringArray1Array|csv:Error bm5sa = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, StringArray1Array);
    test:assertTrue(bm5sa is csv:Error);
    test:assertEquals((<csv:Error>bm5sa).message(), common:generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));
}

@test:Config
function testFromCsvWithTypeForMapAndTupleAsExpectedType() {
    BooleanTuple1Array|csv:Error bm1bt = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, BooleanTuple1Array);
    test:assertEquals(bm1bt, [
        [true, false, false, false],
        [true, false, false, false]
    ]);

    BooleanTuple1Array|csv:Error bm2bt = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, BooleanTuple1Array);
    test:assertTrue(bm2bt is csv:Error);
    test:assertEquals((<csv:Error>bm2bt).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple1Array|csv:Error bm3bt = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, BooleanTuple1Array);
    test:assertTrue(bm3bt is csv:Error);
    test:assertEquals((<csv:Error>bm3bt).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple1Array|csv:Error bm4bt = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, BooleanTuple1Array);
    test:assertTrue(bm4bt is csv:Error);
    test:assertEquals((<csv:Error>bm4bt).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanTuple1Array|csv:Error bm5bt = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, BooleanTuple1Array);
    test:assertTrue(bm5bt is csv:Error);
    test:assertEquals((<csv:Error>bm5bt).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple2Array|csv:Error bm1b2t = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, BooleanTuple2Array);
    test:assertEquals(bm1b2t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|csv:Error bm2b2t = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, BooleanTuple2Array);
    test:assertEquals(bm2b2t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|csv:Error bm3b2t = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, BooleanTuple2Array);
    test:assertEquals(bm3b2t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|csv:Error bm4b2t = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, BooleanTuple2Array);
    test:assertTrue(bm4b2t is csv:Error);
    test:assertEquals((<csv:Error>bm4b2t).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanTuple2Array|csv:Error bm5b2t = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, BooleanTuple2Array);
    test:assertEquals(bm5b2t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple3Array|csv:Error bm1b3t = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, BooleanTuple3Array);
    test:assertEquals(bm1b3t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple3Array|csv:Error bm2b3t = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, BooleanTuple3Array);
    test:assertTrue(bm2b3t is csv:Error);
    test:assertEquals((<csv:Error>bm2b3t).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple3Array|csv:Error bm3b3t = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, BooleanTuple3Array);
    test:assertTrue(bm3b3t is csv:Error);
    test:assertEquals((<csv:Error>bm3b3t).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple3Array|csv:Error bm4b3t = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, BooleanTuple3Array);
    test:assertTrue(bm4b3t is csv:Error);
    test:assertEquals((<csv:Error>bm4b3t).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanTuple3Array|csv:Error bm5b3t = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, BooleanTuple3Array);
    test:assertTrue(bm5b3t is csv:Error);
    test:assertEquals((<csv:Error>bm5b3t).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple4Array|csv:Error bm1b4t = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, BooleanTuple4Array);
    test:assertEquals(bm1b4t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple4Array|csv:Error bm2b4t = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, BooleanTuple4Array);
    test:assertTrue(bm2b4t is csv:Error);
    test:assertEquals((<csv:Error>bm2b4t).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));
}

@test:Config
function testFromCsvWithTypeForMapAndTupleAsExpectedType2() {
    BooleanTuple4Array|csv:Error bm3b4t = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, BooleanTuple4Array);
    test:assertTrue(bm3b4t is csv:Error);
    test:assertEquals((<csv:Error>bm3b4t).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple4Array|csv:Error bm4b4t = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, BooleanTuple4Array);
    test:assertTrue(bm4b4t is csv:Error);
    test:assertEquals((<csv:Error>bm4b4t).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanTuple4Array|csv:Error bm5b4t = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, BooleanTuple4Array);
    test:assertTrue(bm5b4t is csv:Error);
    test:assertEquals((<csv:Error>bm5b4t).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    NillableBooleanTuple5Array|csv:Error bm1nbt = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, NillableBooleanTuple5Array);
    test:assertEquals(bm1nbt, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableBooleanTuple5Array|csv:Error bm2nbt = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, NillableBooleanTuple5Array);
    test:assertEquals(bm2nbt, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableBooleanTuple5Array|csv:Error bm3nbt = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, NillableBooleanTuple5Array);
    test:assertTrue(bm3nbt is csv:Error);
    test:assertEquals((<csv:Error>bm3nbt).message(), common:generateErrorMessageForInvalidValueForArrayType("1", "4", "boolean?"));

    NillableBooleanTuple5Array|csv:Error bm4nbt = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, NillableBooleanTuple5Array);
    test:assertEquals(bm4nbt, [
        [(), (), (), (), ()],
        [(), (), (), (), ()]
    ]);

    NillableBooleanTuple5Array|csv:Error bm5nbt = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, NillableBooleanTuple5Array);
    test:assertEquals(bm5nbt, [
        [true, false, (), true, ()],
        [true, false, (), true, ()]
    ]);

    NillableBooleanTuple6Array|csv:Error bm1nb6t = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, NillableBooleanTuple6Array);
    test:assertEquals(bm1nb6t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|csv:Error bm2nb6t = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, NillableBooleanTuple6Array);
    test:assertEquals(bm2nb6t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|csv:Error bm3nb6t = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, NillableBooleanTuple6Array);
    test:assertEquals(bm3nb6t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|csv:Error bm4nb6t = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, NillableBooleanTuple6Array);
    test:assertEquals(bm4nb6t, [
        [(), ()],
        [(), ()]
    ]);

    NillableBooleanTuple6Array|csv:Error bm5nb6t = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, NillableBooleanTuple6Array);
    test:assertEquals(bm5nb6t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple7Array|csv:Error bm1nb7t = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, NillableBooleanTuple7Array);
    test:assertEquals(bm1nb7t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple7Array|csv:Error bm2nb7t = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, NillableBooleanTuple7Array);
    test:assertEquals(bm2nb7t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableBooleanTuple7Array|csv:Error bm3nb7t = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, NillableBooleanTuple7Array);
    test:assertTrue(bm3nb7t is csv:Error);
    test:assertEquals((<csv:Error>bm3nb7t).message(), common:generateErrorMessageForInvalidValueForArrayType("1", "4", "boolean?"));

    NillableBooleanTuple7Array|csv:Error bm4nb7t = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, NillableBooleanTuple7Array);
    test:assertEquals(bm4nb7t, [
        [(), ()],
        [(), ()]
    ]);

    NillableBooleanTuple7Array|csv:Error bm5nb7t = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, NillableBooleanTuple7Array);
    test:assertEquals(bm5nb7t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);
}

@test:Config
function testFromCsvWithTypeForMapAndTupleAsExpectedType3() {
    NillableBooleanTuple8Array|csv:Error bm1nb8t = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, NillableBooleanTuple8Array);
    test:assertEquals(bm1nb8t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple8Array|csv:Error bm2nb8t = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, NillableBooleanTuple8Array);
    test:assertEquals(bm2nb8t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableBooleanTuple8Array|csv:Error bm3nb8t = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, NillableBooleanTuple8Array);
    test:assertTrue(bm3nb8t is csv:Error);
    test:assertEquals((<csv:Error>bm3nb8t).message(), common:generateErrorMessageForInvalidValueForArrayType("1", "4", "boolean?"));

    NillableBooleanTuple8Array|csv:Error bm4nb8t = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, NillableBooleanTuple8Array);
    test:assertEquals(bm4nb8t, [
        [(), ()],
        [(), ()]
    ]);

    NillableBooleanTuple8Array|csv:Error bm5nb8t = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, NillableBooleanTuple8Array);
    test:assertEquals(bm5nb8t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    NillableIntBooleanTuple9Array|csv:Error bm1nb9t = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm1nb9t, [
        [true, false],
        [true, false]
    ]);

    NillableIntBooleanTuple9Array|csv:Error bm2nb9t = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm2nb9t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableIntBooleanTuple9Array|csv:Error bm3nb9t = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm3nb9t, [
        [true, false, (), false, 1],
        [true, false, (), false, 1]
    ]);

    NillableIntBooleanTuple9Array|csv:Error bm4nb9t = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm4nb9t, [
        [(), ()],
        [(), ()]
    ]);

    NillableIntBooleanTuple9Array|csv:Error bm5nb9t = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm5nb9t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    NilTuple3Array|csv:Error bm1n3t = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, NilTuple3Array);
    test:assertTrue(bm1n3t is csv:Error);
    test:assertEquals((<csv:Error>bm1n3t).message(), common:generateErrorMessageForInvalidValueForArrayType("true", "0", "()"));

    NilTuple3Array|csv:Error bm2n3t = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, NilTuple3Array);
    test:assertTrue(bm2n3t is csv:Error);
    test:assertEquals((<csv:Error>bm2n3t).message(), common:generateErrorMessageForInvalidValueForArrayType("true", "0", "()"));

    NilTuple3Array|csv:Error bm3n3t = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, NilTuple3Array);
    test:assertTrue(bm3n3t is csv:Error);
    test:assertEquals((<csv:Error>bm3n3t).message(), common:generateErrorMessageForInvalidValueForArrayType("true", "0", "()"));

    NilTuple3Array|csv:Error bm4n3t = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, NilTuple3Array);
    test:assertEquals(bm4n3t, [
        [(), ()],
        [(), ()]
    ]);

    NilTuple3Array|csv:Error bm5n3t = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, NilTuple3Array);
    test:assertTrue(bm5n3t is csv:Error);
    test:assertEquals((<csv:Error>bm5n3t).message(), common:generateErrorMessageForInvalidValueForArrayType("true", "0", "()"));
}

@test:Config
function testFromCsvWithTypeForMapAndArrayAsExpectedType3() {

    AnydataTuple3Array|csv:Error bm1anyd3t = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"], outputWithHeaders: false}, AnydataTuple3Array);
    test:assertEquals(bm1anyd3t, [
        [true, false],
        [true, false]
    ]);

    AnydataTuple3Array|csv:Error bm2anyd3t = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, AnydataTuple3Array);
    test:assertEquals(bm2anyd3t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    AnydataTuple3Array|csv:Error bm3anyd3t = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, AnydataTuple3Array);
    test:assertEquals(bm3anyd3t, [
        [true, false, (), false, 1],
        [true, false, (), false, 1]
    ]);

    AnydataTuple3Array|csv:Error bm4anyd3t = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"], outputWithHeaders: false}, AnydataTuple3Array);
    test:assertEquals(bm4anyd3t, [
        [(), ()],
        [(), ()]
    ]);

    AnydataTuple3Array|csv:Error bm5anyd3t = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, AnydataTuple3Array);
    test:assertEquals(bm5anyd3t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    JsonTuple3Array|csv:Error bm1j3t = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, JsonTuple3Array);
    test:assertEquals(bm1j3t, [
        [true, false],
        [true, false]
    ]);

    JsonTuple3Array|csv:Error bm2j3t = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, JsonTuple3Array);
    test:assertEquals(bm2j3t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    JsonTuple3Array|csv:Error bm3j3t = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, JsonTuple3Array);
    test:assertEquals(bm3j3t, [
        [true, false, (), false, 1],
        [true, false, (), false, 1]
    ]);

    JsonTuple3Array|csv:Error bm4j3t = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, JsonTuple3Array);
    test:assertEquals(bm4j3t, [
        [(), ()],
        [(), ()]
    ]);

    JsonTuple3Array|csv:Error bm5j3t = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, JsonTuple3Array);
    test:assertEquals(bm5j3t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    StringTuple3Array|csv:Error bm1s3t = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"]}, StringTuple3Array);
    test:assertTrue(bm1s3t is csv:Error);
    test:assertEquals((<csv:Error>bm1s3t).message(), common:generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringTuple3Array|csv:Error bm2s3t = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"]}, StringTuple3Array);
    test:assertTrue(bm2s3t is csv:Error);
    test:assertEquals((<csv:Error>bm2s3t).message(), common:generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringTuple3Array|csv:Error bm3s3t = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"]}, StringTuple3Array);
    test:assertTrue(bm3s3t is csv:Error);
    test:assertEquals((<csv:Error>bm3s3t).message(), common:generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringTuple3Array|csv:Error bm4s3t = csv:transform([bm4, bm4], {headersOrder: ["n1", "n3"]}, StringTuple3Array);
    test:assertTrue(bm4s3t is csv:Error);
    test:assertEquals((<csv:Error>bm4s3t).message(), common:generateErrorMessageForInvalidValueForArrayType("null", "0", "string"));

    StringTuple3Array|csv:Error bm5s3t = csv:transform([bm5, bm5], {headersOrder: ["b1", "b2", "b3", "b4"]}, StringTuple3Array);
    test:assertTrue(bm5s3t is csv:Error);
    test:assertEquals((<csv:Error>bm5s3t).message(), common:generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));
}

@test:Config
function testArrayIndexes() {
    map<int>[] csv = [{a: 1, b: 2}, {a: 3, b: 4}, {a: 5, b: 6}, {a: 7, b: 8}];
    
    int[][2]|csv:Error rec3 = csv:transform(csv, {headersOrder: ["a", "b"]});
    test:assertEquals(rec3, [
                [1, 2],
                [3, 4],
                [5, 6],
                [7, 8]
            ]);

    [int...][2]|csv:Error rec3_3 = csv:transform(csv, {headersOrder: ["a", "b"], skipLines: [1]});
    test:assertEquals(rec3_3, [
                [3, 4],
                [5, 6]
            ]);

    int[1][2]|csv:Error rec4 = csv:transform(csv, {headersOrder: ["a", "b"], skipLines: [2]});
    test:assertEquals(rec4, [
                [1, 2]
            ]);
}

@test:Config
function testParseRecordsAsListsWithHeaderOutput() {
    AnydataTuple3Array|csv:Error bm1anyd3t = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"], outputWithHeaders: true});
    test:assertEquals(bm1anyd3t, [
        ["b1", "b2"],
        [true, false],
        [true, false]
    ]);

    AnydataTuple3Array|csv:Error bm2anyd3t = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"], outputWithHeaders: true});
    test:assertEquals(bm2anyd3t, [
        ["b1", "b2", "b3", "n1", "n3"],
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    AnydataTuple3Array|csv:Error bm3anyd3t = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"], outputWithHeaders: true});
    test:assertEquals(bm3anyd3t, [
        ["b1", "b2", "b3", "b4", "i1"],
        [true, false, (), false, 1],
        [true, false, (), false, 1]
    ]);

    anydata[][]|csv:Error bm1anyd3t_2 = csv:transform([bm1, bm1], {headersOrder: ["b1", "b2"], outputWithHeaders: true});
    test:assertEquals(bm1anyd3t_2, [
        ["b1", "b2"],
        [true, false],
        [true, false]
    ]);

    anydata[][]|csv:Error bm2anyd3t_2 = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"], outputWithHeaders: true});
    test:assertEquals(bm2anyd3t_2, [
        ["b1", "b2", "b3", "n1", "n3"],
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    anydata[2][3]|csv:Error bm3anyd3t_2 = csv:transform([bm3, bm3], {headersOrder: ["b1", "b2", "b3", "b4", "i1"], outputWithHeaders: true});
    test:assertEquals(bm3anyd3t_2, [
        ["b1", "b2", "b3"],
        [true, false, ()]
    ]);

    anydata[][]|csv:Error bm2anyd3t_3 = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n1", "n3"], outputWithHeaders: false});
    test:assertEquals(bm2anyd3t_3, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    anydata[][]|csv:Error bm2anyd3t_4 = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n2", "n3"], outputWithHeaders: false});
    test:assertTrue(bm2anyd3t_4 is csv:Error);
    test:assertEquals((<error> bm2anyd3t_4).message(), "Header 'n2' cannot be find in data rows");

    bm2anyd3t_4 = csv:transform([bm2, bm2], {headersOrder: ["b1", "b2", "b3", "n2", "n3"], outputWithHeaders: true});
    test:assertTrue(bm2anyd3t_4 is csv:Error);
    test:assertEquals((<error> bm2anyd3t_4).message(), "Header 'n2' cannot be find in data rows");
}
