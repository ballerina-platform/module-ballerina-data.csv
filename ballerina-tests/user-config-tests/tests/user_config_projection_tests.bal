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
function testCustomNameAnnotation() returns error? {
    RecordWithCustomAnnotation[]|csv:Error cn1 = csv:parseString(string `b,c
                                                           1,3`, {});
    test:assertEquals(cn1, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|csv:Error cn2 = csv:parseString(string `c,b
                                          3,1`, {});
    test:assertEquals(cn2, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|csv:Error cn3 = csv:parseString(string `f,c,b,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn3, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|csv:Error cn4 = csv:parseString(string `d,c
                                                           1,3`, {});
    test:assertEquals(cn4, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|csv:Error cn5 = csv:parseString(string `c,d
                                          3,1`, {});
    test:assertEquals(cn5, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|csv:Error cn6 = csv:parseString(string `c,f,d,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn6, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|csv:Error cn7 = csv:parseString(string `a,b
                                          3,1`, {});
    test:assertTrue(cn7 is csv:Error);
    test:assertEquals((<error>cn7).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation2[]|csv:Error cn8 = csv:parseString(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn8 is csv:Error);
    test:assertEquals((<error>cn8).message(), "Duplicate field found in record fields: 'a'");
    
    RecordWithCustomAnnotation3[]|csv:Error cn9 = csv:parseString(string `d,c
                                                           1,3`, {});
    test:assertEquals(cn9, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cn10 = csv:parseString(string `c,d
                                          3,1`, {});
    test:assertEquals(cn10, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cn11 = csv:parseString(string `c,f,d,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn11, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cn12 = csv:parseString(string `a,b
                                          3,1`, {});
    test:assertTrue(cn12 is csv:Error);
    test:assertEquals((<error>cn12).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation3[]|csv:Error cn13 = csv:parseString(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn13 is csv:Error);
    test:assertEquals((<error>cn13).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|csv:Error cn14 = csv:parseString(string `d,c,z
                                                           1,3,true`, {});
    test:assertEquals(cn14, [{b: 1, a: 3, z: true}]);

    RecordWithCustomAnnotation4[]|csv:Error cn15 = csv:parseString(string `c,d
                                          3,1`, {});
    test:assertEquals(cn15, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|csv:Error cn16 = csv:parseString(string `c,f,d,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn16, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|csv:Error cn17 = csv:parseString(string `a,b
                                          3,1`, {});
    test:assertTrue(cn17 is csv:Error);
    test:assertEquals((<error>cn17).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|csv:Error cn18 = csv:parseString(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn18 is csv:Error);
    test:assertEquals((<error>cn18).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation5[]|csv:Error cn19 = csv:parseString(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn19 is csv:Error);
    test:assertEquals((<error>cn19).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation5[]|csv:Error cn20 = csv:parseString(string ` c,d,e
                                          3,1,4
                                          3,1,4`, {});
    test:assertEquals(cn20, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation6[]|csv:Error cn21 = csv:parseString(string ` c,d,a
                                          3,1,4
                                          3,1,4`, {});
    test:assertEquals(cn21, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation[]|csv:Error cnrr1 = csv:transform([{"b": 1, "c": 3}], {});
    test:assertEquals(cnrr1, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|csv:Error cnrr2 = csv:transform([{"c": 3, "b": 1}], {});
    test:assertEquals(cnrr2, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|csv:Error cnrr3 = csv:transform(
                                    [{"f": 3, "c": 3, "b": 1, "e": "cde"}, {"f": 3, "c": 3, "b": 1, "e": "cde"}], {});
    test:assertEquals(cnrr3, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|csv:Error cnrr4 = csv:transform([{"d": 1, "c": 3}], {});
    test:assertEquals(cnrr4, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|csv:Error cnrr5 = csv:transform([{"c": 3, "d": 1}], {});
    test:assertEquals(cnrr5, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|csv:Error cnrr6 = csv:transform(
                                    [{"c": 3, "f": 3, "d": 1, "e": "cde"}, {"c": 3, "f": 3, "d": 1, "e": "cde"}], {});
    test:assertEquals(cnrr6, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|csv:Error cnrr7 = csv:transform([{"a":3, "b": 1}], {});
    test:assertTrue(cnrr7 is csv:Error);
    test:assertEquals((<error>cnrr7).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation2[]|csv:Error cnrr8 = csv:transform([{"c": 3, "d": 1, "a": 4, "b": 5}], {});
    test:assertTrue(cnrr8 is csv:Error);
    test:assertEquals((<error>cnrr8).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation3[]|csv:Error cnrr9 = csv:transform([{"d": 1, "c": 3}], {});
    test:assertEquals(cnrr9, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cnrr10 = csv:transform([{"c": 3, "d": 1}], {});
    test:assertEquals(cnrr10, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cnrr11 = csv:transform(
                                                [{"c": 3, "f": 3, "d": 1, "e": "cde"}, {"c": 3, "f": 3, "d": 1, "e": "cde"}], {});
    test:assertEquals(cnrr11, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cnrr12 = csv:transform([{"a": 3, "b": 1}], {});
    test:assertTrue(cnrr12 is csv:Error);
    test:assertEquals((<error>cnrr12).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation3[]|csv:Error cnrr13 = csv:transform([{"c": 3, "d": 1, "a": 4, "b": 5}], {});
    test:assertTrue(cnrr13 is csv:Error);
    test:assertEquals((<error>cnrr13).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|csv:Error cnrr14 = csv:transform([{"d": 1, "c": 3, "z": true}], {});
    test:assertEquals(cnrr14, [{b: 1, a: 3, z: true}]);

    RecordWithCustomAnnotation4[]|csv:Error cnrr15 = csv:transform([{"c": 3, "d": 1}], {});
    test:assertEquals(cnrr15, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|csv:Error cnrr16 = csv:transform(
                                                [{"c": 3, "f": 3, "d": 1, "e": "cde"}, {"c": 3, "f": 3, "d": 1, "e": "cde"}], {});
    test:assertEquals(cnrr16, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation5[]|csv:Error cnrr20 = csv:transform(
                                                [{"c": 3, "d": 1, "e": 4}, {"c": 3, "d": 1, "e": 4}], {});
    test:assertEquals(cnrr20, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation6[]|csv:Error cnrr21 = csv:transform(
                                                [{"c": 3, "d": 1, "a": 4}, {"c": 3, "d": 1, "a": 4}], {});
    test:assertEquals(cnrr21, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);
}

@test:Config
function testCustomNameAnnotation2() returns error? {
    RecordWithCustomAnnotation[]|csv:Error cntr1 = csv:parseLists([["1", "3"]], {customHeaders: ["b", "c"]});
    test:assertEquals(cntr1, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|csv:Error cntr2 = csv:parseLists([["3", "1"]], {customHeaders: ["c", "b"]});
    test:assertEquals(cntr2, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|csv:Error cntr3 = csv:parseLists(
                                    [["3", "3", "1", "cde"], ["3", "3", "1", "cde"]], {customHeaders: ["f", "c", "b", "e"]});
    test:assertEquals(cntr3, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|csv:Error cntr4 = csv:parseLists([["1", "3"]], {customHeaders: ["d", "c"]});
    test:assertEquals(cntr4, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|csv:Error cntr5 = csv:parseLists([["3","1"]], {customHeaders: ["c", "d"]});
    test:assertEquals(cntr5, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|csv:Error cntr6 = csv:parseLists(
                                    [["3", "3", "1", "cde"], ["3", "3", "1", "cde"]], {customHeaders: ["c", "f", "d", "e"]});
    test:assertEquals(cntr6, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|csv:Error cntr7 = csv:parseLists([["3", "1"]], {customHeaders: ["a", "b"]});
    test:assertTrue(cntr7 is csv:Error);
    test:assertEquals((<error>cntr7).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation2[]|csv:Error cntr8 = csv:parseLists([["3", "1", "4", "5"]], {customHeaders: ["c", "d", "a", "b"]});
    test:assertTrue(cntr8 is csv:Error);
    test:assertEquals((<error>cntr8).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation3[]|csv:Error cntr9 = csv:parseLists([["1", "3"]], {customHeaders: ["d", "c"]});
    test:assertEquals(cntr9, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cntr10 = csv:parseLists([["3", "1"]], {customHeaders: ["c", "d"]});
    test:assertEquals(cntr10, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cntr11 = csv:parseLists(
                                                [["3", "3", "1", "cde"], ["3", "3", "1", "cde"]], {customHeaders: ["c", "f", "d", "e"]});
    test:assertEquals(cntr11, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cntr12 = csv:parseLists([["3", "1"]], {customHeaders: ["a", "b"]});
    test:assertTrue(cntr12 is csv:Error);
    test:assertEquals((<error>cntr12).message(), common:generateErrorMessageForInvalidHeaders(string `["3","1"]`, "user_config_tests:RecordWithCustomAnnotation3"));

    RecordWithCustomAnnotation3[]|csv:Error cntr13 = csv:parseLists([["3", "1", "4", "5"]], {customHeaders: ["c", "d", "a", "b"]});
    test:assertTrue(cntr13 is csv:Error);
    test:assertEquals((<error>cntr13).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|csv:Error cntr14 = csv:parseLists([["1", "3", "true"]], {customHeaders: ["d", "c", "z"]});
    test:assertEquals(cntr14, [{b: 1, a: 3, z: true}]);

    RecordWithCustomAnnotation4[]|csv:Error cntr15 = csv:parseLists([["3", "1"]], {customHeaders: ["c", "d"]});
    test:assertEquals(cntr15, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|csv:Error cntr16 = csv:parseLists(
                                                [["3", "3", "1", "cde"], ["3", "3", "1", "cde"]], {customHeaders: ["c", "f", "d", "e"]});
    test:assertEquals(cntr16, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|csv:Error cntr17 = csv:parseLists([["3", "1"]], {customHeaders: ["a", "b"]});
    test:assertTrue(cntr17 is csv:Error);
    test:assertEquals((<error>cntr17).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|csv:Error cntr18 = csv:parseLists([["3", "1", "4", "5"]], {customHeaders: ["c", "d", "a", "b"]});
    test:assertTrue(cntr18 is csv:Error);
    test:assertEquals((<error>cntr18).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation5[]|csv:Error cntr19 = csv:parseLists([["3", "1", "4", "5"]], {customHeaders: ["c", "d", "a", "b"]});
    test:assertTrue(cntr19 is csv:Error);
    test:assertEquals((<error>cntr19).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation5[]|csv:Error cntr20 = csv:parseLists(
                                                [["3", "1", "4"], ["3", "1", "4"]], {customHeaders: ["c", "d", "e"]});
    test:assertEquals(cntr20, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation6[]|csv:Error cntr21 = csv:parseLists(
                                                [["3", "1", "4"], ["3", "1", "4"]], {customHeaders: ["c", "d", "a"]});
    test:assertEquals(cntr21, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);
}

@test:Config
function testAbsentAsNilableConfig() returns error? {
    record {|int a; int? g; int? h;|}[]|csv:Error cn = csv:parseString(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1
    });
    test:assertEquals(cn, [{a: 1, g: (), h: ()}, {a: 2, g: (), h: ()}, {a: 3, g: (), h: ()}, {a: 4, g: (), h: ()}, {a: 5, g: (), h: ()}]);

    record {|int a; int? g?;|}[]|csv:Error cn2 = csv:parseString(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn2, [{a: 1}]);

    record {|int a; int g?;|}[]|csv:Error cn3 = csv:parseString(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn3, [{a: 1}]);

    record {|int a; int g;|}[]|csv:Error cn4 = csv:parseString(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertTrue(cn4 is csv:Error);
    test:assertEquals((<error>cn4).message(), common:generateErrorMessageForMissingRequiredField("g"));

    int?[][]|csv:Error cn5 = csv:parseString(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1
    });
    test:assertEquals(cn5, [[1, 1, 1]]);

    map<int?>[]|csv:Error cn6 = csv:parseString(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1
    });
    test:assertEquals(cn6, [{a: 1, b: 1, c: 1}]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn7 = csv:parseString(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn7, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn8 = csv:parseString(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn8, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn9 = csv:parseString(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn9, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn10 = csv:parseString(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn10, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);
}

@test:Config
function testAbsentAsNilableConfig2() returns error? {
    record {|int a; int? g; int? h;|}[]|csv:Error cn = csv:transform([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn, [{a: 1, g: (), h: ()}, {a: 2, g: (), h: ()}]);

    record {|int a; int? g?;|}[]|csv:Error cn2 = csv:transform([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn2, [{a: 1}, {a: 2}]);

    record {|int a; int g?;|}[]|csv:Error cn3 = csv:transform([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn3, [{a: 1}, {a: 2}]);

    record {|int a; int g;|}[]|csv:Error cn4 = csv:transform([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertTrue(cn4 is csv:Error);
    test:assertEquals((<error>cn4).message(), common:generateErrorMessageForMissingRequiredField("g"));

    record {|string a; int? g; int? h;|}[]|csv:Error cn5 = csv:parseLists([["a"], ["a"], ["a"]], {customHeaders: ["a"],
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn5, [{a: "a", g: (), h: ()}, {a: "a", g: (), h: ()}]);

    record {|string a; int? g?;|}[]|csv:Error cn6 = csv:parseLists([["a"], ["a"], ["a"]], {customHeaders: ["a"],
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn6, [{a: "a"}, {a: "a"}]);

    record {|string a; int g?;|}[]|csv:Error cn7 = csv:parseLists([["a"], ["a"], ["b"]], {customHeaders: ["a"],
        allowDataProjection: {absentAsNilableType: true}, skipLines: [2]
    });
    test:assertEquals(cn7, [{a: "a"}, {a: "b"}]);

    record {|string a; int g;|}[]|csv:Error cn8 = csv:parseLists([["a"], ["a"], ["a"]], {customHeaders: ["a"],
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertTrue(cn8 is csv:Error);
    test:assertEquals((<error>cn8).message(), common:generateErrorMessageForMissingRequiredField("g"));
}

@test:Config
function testNilAsOptionalConfig() returns error? {
    record {|int a; int f?;|}[]|csv:Error cn = csv:parseString(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1
    });
    test:assertEquals(cn, [{a: 1}, {a: 2}, {a: 3}, {a: 4}, {a: 5}]);

    record {|int a; int? f?;|}[]|csv:Error cn2 = csv:parseString(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn2, [{a: 1, f: ()}]);

    record {|int a; int f?;|}[]|csv:Error cn3 = csv:parseString(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn3, [{a: 1}]);

    record {|int a; int f;|}[]|csv:Error cn4 = csv:parseString(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertTrue(cn4 is csv:Error);
    test:assertEquals((<error>cn4).message(), common:generateErrorMessageForInvalidCast("()", "int"));

    int?[][]|csv:Error cn5 = csv:parseString(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1
    });
    test:assertEquals(cn5, [[1, 1, 1]]);

    map<int?>[]|csv:Error cn6 = csv:parseString(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1
    });
    test:assertEquals(cn6, [{a: 1, b: 1, c: 1}]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn7 = csv:parseString(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn7, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn8 = csv:parseString(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn8, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn9 = csv:parseString(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn9, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn10 = csv:parseString(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn10, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);
}

@test:Config
function testNilAsOptionalConfig2() returns error? {
    record {|int a; int? f;|}[]|csv:Error cn = csv:transform([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertEquals(cn, [{a: 1, f: ()}, {a: 2, f: ()}]);

    record {|int a; int? f?;|}[]|csv:Error cn2 = csv:transform([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertEquals(cn2, [{a: 1, f: ()}, {a: 2, f: ()}]);

    record {|int a; int f?;|}[]|csv:Error cn3 = csv:transform([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertEquals(cn3, [{a: 1}, {a: 2}]);

    record {|int a; int f;|}[]|csv:Error cn4 = csv:transform([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertTrue(cn4 is csv:Error);
    test:assertEquals((<error>cn4).message(), common:generateErrorMessageForInvalidFieldType("null", "f"));
}

@test:Config
function testDataProjectionConfig() returns error? {
    string csvValue1 = string `a,b
                             "a",2
                             b,4`;
    record{}[] csvValue2 = [{"a": "a", "b": 2}, {"a": "b", "b": 4}];

    record{}[]|csv:Error cn = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a; int b;|}[]|csv:Error cn_2 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn_2, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a;|}[]|csv:Error cn2 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn2 is csv:Error);
    test:assertEquals((<error>cn2).message(), "No mapping field in the expected type for header 'b'");

    record{|string a; int...;|}[]|csv:Error cn3 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn3, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string...;|}[]|csv:Error cn4 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn4, [{"a": "a", "b": "2"}, {"a": "b", "b": "4"}]);

    record{|string a?;|}[]|csv:Error cn5 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn5 is csv:Error);
    test:assertEquals((<error>cn5).message(), "No mapping field in the expected type for header 'b'");

    record{|string? a;|}[]|csv:Error cn6 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn6 is csv:Error);
    test:assertEquals((<error>cn6).message(), "No mapping field in the expected type for header 'b'");

    anydata[][]|csv:Error c7 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(c7, [["a", 2], ["b", 4]]);

    [string, int][]|csv:Error cn7_2 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn7_2, [["a", 2], ["b", 4]]);

    [string][]|csv:Error cn8 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn8 is csv:Error);
    test:assertEquals((<error>cn8).message(), "invalid array size for expected tuple type, cannot be greater than '1'");

    [string][]|csv:Error cn8_2 = csv:parseString(csvValue1, {
        allowDataProjection: {}
    });
    test:assertEquals(cn8_2, [["a"], ["b"]]);

    [int][]|csv:Error cn8_3 = csv:parseString(csvValue1, {
        allowDataProjection: {}
    });
    test:assertTrue(cn8_3 is csv:Error);
    test:assertEquals((<error>cn8_3).message(), common:generateErrorMessageForInvalidCast("a", "int"));

    [string, int...][]|csv:Error cn9 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn9, [["a", 2], ["b", 4]]);

    [string...][]|csv:Error cn10 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn10, [["a", "2"], ["b", "4"]]);

    [string, ()][]|csv:Error cn11 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn11 is csv:Error);
    test:assertEquals((<error>cn11).message(), common:generateErrorMessageForInvalidCast("2", "()"));

    string[][]|csv:Error cn12 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn12, [["a", "2"], ["b", "4"]]);

    string[][1]|csv:Error cn13 = csv:parseString(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn13 is csv:Error);
    test:assertEquals((<error>cn13).message(), "invalid array size for expected array type, cannot be greater than '1'");

    record{}[]|csv:Error cn14 = csv:transform(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn14, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a; int b;|}[]|csv:Error cn14_2 = csv:transform(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn14_2, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a;|}[]|csv:Error cn15 = csv:transform(csvValue2, {
        allowDataProjection: false
    });
    test:assertTrue(cn15 is csv:Error);
    test:assertEquals((<error>cn15).message(), "No mapping field in the expected type for header 'b'");

    record{|string a; int...;|}[]|csv:Error cn16 = csv:transform(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn16, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string...;|}[]|csv:Error cn17 = csv:transform(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn17, [{"a": "a"}, {"a": "b"}]);

    record{|string a?;|}[]|csv:Error cn18 = csv:transform(csvValue2, {
        allowDataProjection: false
    });
    test:assertTrue(cn18 is csv:Error);
    test:assertEquals((<error>cn18).message(), "No mapping field in the expected type for header 'b'");

    record{|string? a;|}[]|csv:Error cn19 = csv:transform(csvValue2, {
        allowDataProjection: false
    });
    test:assertTrue(cn19 is csv:Error);
    test:assertEquals((<error>cn19).message(), "No mapping field in the expected type for header 'b'");

    anydata[][]|csv:Error c20 = csv:transform(csvValue2, {headersOrder: ["a", "b"],
        allowDataProjection: false
    });
    test:assertEquals(c20, [["a", 2], ["b", 4]]);

    [string, int][]|csv:Error cn20_2 = csv:transform(csvValue2, {headersOrder: ["a", "b"],
        allowDataProjection: false
    });
    test:assertEquals(cn20_2, [["a", 2], ["b", 4]]);

    [string][]|csv:Error cn21 = csv:transform(csvValue2, {headersOrder: ["a", "b"],
        allowDataProjection: false
    });
    test:assertTrue(cn21 is csv:Error);
    test:assertEquals((<error>cn21).message(), "invalid array size for expected tuple type, cannot be greater than '1'");

    [string][]|csv:Error cn21_2 = csv:transform(csvValue2, {headersOrder: ["a", "b"],
        allowDataProjection: {}
    });
    test:assertEquals(cn21_2, [["a"], ["b"]]);

    [int][]|csv:Error cn21_3 = csv:transform(csvValue2, {headersOrder: ["a", "b"],
        allowDataProjection: {}
    });
    test:assertTrue(cn21_3 is csv:Error);
    test:assertEquals((<error>cn21_3).message(), common:generateErrorMessageForInvalidValueForArrayType("a", "0", "int"));

    [string, int...][]|csv:Error cn22 = csv:transform(csvValue2, {headersOrder: ["a", "b"],
        allowDataProjection: false
    });
    test:assertEquals(cn22, [["a", 2], ["b", 4]]);

    [string...][]|csv:Error cn23 = csv:transform(csvValue2, {headersOrder: ["a", "b"],
        allowDataProjection: false 
    });
    test:assertTrue(cn23 is csv:Error);
    test:assertEquals((<error> cn23).message(), common:generateErrorMessageForInvalidValueForArrayType("2", "1", "string"));

    [string, ()][]|csv:Error cn24 = csv:transform(csvValue2, {headersOrder: ["a", "b"],
        allowDataProjection: false
    });
    test:assertTrue(cn24 is csv:Error);
    test:assertEquals((<error>cn24).message(), common:generateErrorMessageForInvalidValueForArrayType("2", "1", "()"));

    string[][]|csv:Error cn25 = csv:transform(csvValue2, {headersOrder: ["a", "b"],
        allowDataProjection: false
    });
    test:assertTrue(cn25 is csv:Error);
    test:assertEquals((<error> cn25).message(), common:generateErrorMessageForInvalidValueForArrayType("2", "1", "string"));

    string[][1]|csv:Error cn26 = csv:transform(csvValue2, {headersOrder: ["a", "b"],
        allowDataProjection: false
    });
    test:assertTrue(cn26 is csv:Error);
    test:assertEquals((<error>cn26).message(), "invalid array size for expected array type, cannot be greater than '1'");
}
