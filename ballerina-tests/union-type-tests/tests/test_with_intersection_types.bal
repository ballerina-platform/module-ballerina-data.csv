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
import ballerina/data.csv;
import ballerina/test;

@test:Config
function testIntersectionExpectedTypes() returns error? {
    (int[] & readonly)[]|csv:Error a = csv:parseString(string `a,b
                                                                            1,2
                                                                            4,5`);
    test:assertTrue(a is (int[] & readonly)[]);
    test:assertEquals(a, [[1, 2], [4, 5]]);

    ([string, string])[] & readonly|csv:Error a2 = csv:parseString(string `a,b
                                                                            a,a
                                                                            c,c`);
    test:assertTrue(a2 is [string, string][] & readonly);
    test:assertEquals(a2, [["a", "a"], ["c", "c"]]);

    (record {int a; string b;} & readonly)[]|csv:Error a3 = csv:parseString(string `a,b
                                                                            1,2
                                                                            4,5`);
    test:assertTrue(a3 is (record {int a; string b;} & readonly)[]);
    test:assertEquals(a3, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    record {|string...;|}[] & readonly|csv:Error a4 = csv:parseString(string `a,b
                                                                            a,a
                                                                            c,c`);
    test:assertTrue(a4 is record {|string...;|}[] & readonly);
    test:assertEquals(a4, [{a: "a", b: "a"}, {a: "c", b: "c"}]);

    ([int] & readonly)[]|csv:Error a5 = csv:parseString(string `a,b
                                                                            1,2
                                                                            4,5`);
    test:assertTrue(a5 is ([int] & readonly)[]);
    test:assertEquals(a5, [[1], [4]]);

    ([string, string])[] & readonly|csv:Error a6 = csv:parseString(string `a,b
                                                                            a,a
                                                                            c,c`);
    test:assertTrue(a6 is [string, string][] & readonly);
    test:assertEquals(a6, [["a", "a"], ["c", "c"]]);

    (record {int a; string b;} & readonly)[]|csv:Error a7 = csv:parseString(string `a,b
                                                                            1,2
                                                                            4,5`);
    test:assertTrue(a7 is record {int a; string b;}[] & readonly);
    test:assertEquals(a7, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    map<string>[] & readonly|csv:Error a8 = csv:parseString(string `a,b
                                                                            a,a
                                                                            c,c`);
    test:assertTrue(a8 is map<string>[] & readonly);
    test:assertEquals(a8, [{a: "a", b: "a"}, {a: "c", b: "c"}]);

    (((int[] & readonly)|([string, string] & readonly)) & readonly)[]|csv:Error a9 = csv:parseString(string `a,b
                                                                            1,2
                                                                            a,a`);
    test:assertTrue(a9 is (((int[] & readonly)|([string, string] & readonly)) & readonly)[]);
    test:assertEquals(a9, [[1, 2], ["a", "a"]]);

    ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[]
                                    & readonly|csv:Error a10 = csv:parseString(string `a,b
                                                                            a,a
                                                                            1,2`);
    test:assertTrue(a10 is ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[] & readonly);
    test:assertEquals(a10, [{a: "a", b: "a"}, {a: "1", b: "2"}]);
}

@test:Config
function testIntersectionExpectedTypes2() returns error? {
    (int[] & readonly)[]|csv:Error a = csv:transform([{"a": 1, "b": 2}, {"a": 4, "b": 5}], ["a", "b"], {});
    test:assertTrue(a is (int[] & readonly)[]);
    test:assertEquals(a, [[1, 2], [4, 5]]);

    ([string, string])[] & readonly|csv:Error a2 = csv:transform([{"a": "a", "b": "a"}, {"a": "c", "b": "c"}], ["a", "b"], {});
    test:assertTrue(a2 is [string, string][] & readonly);
    test:assertEquals(a2, [["a", "a"], ["c", "c"]]);

    (record {int a; string b;} & readonly)[]|csv:Error a3 = csv:transform([{"a": 1, "b": "2"}, {"a": 4, "b": "5"}], {});
    test:assertTrue(a3 is (record {int a; string b;} & readonly)[]);
    test:assertEquals(a3, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    record {|string...;|}[] & readonly|csv:Error a4 = csv:transform([{"a": "a", "b": "a"}, {"a": "c", "b": "c"}], {});
    test:assertTrue(a4 is record {|string...;|}[] & readonly);
    test:assertEquals(a4, [{a: "a", b: "a"}, {a: "c", b: "c"}]);

    ([int] & readonly)[]|csv:Error a5 = csv:transform([{"a": 1, "b": 2}, {"a": 4, "b": 5}], ["a", "b"], {});
    test:assertTrue(a5 is ([int] & readonly)[]);
    test:assertEquals(a5, [[1], [4]]);

    ([string, string])[] & readonly|csv:Error a6 = csv:transform([{"a": "a", "b": "a"}, {"a": "c", "b": "c"}], ["a", "b"], {});
    test:assertTrue(a6 is [string, string][] & readonly);
    test:assertEquals(a6, [["a", "a"], ["c", "c"]]);

    (record {int a; string b;} & readonly)[]|csv:Error a7 = csv:transform([{"a": 1, "b": "2"}, {"a": 4, "b": "5"}], {});
    test:assertTrue(a7 is record {int a; string b;}[] & readonly);
    test:assertEquals(a7, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    map<string>[] & readonly|csv:Error a8 = csv:transform([{"a": "a", "b": "a"}, {"a": "c", "b": "c"}], {});
    test:assertTrue(a8 is map<string>[] & readonly);
    test:assertEquals(a8, [{a: "a", b: "a"}, {a: "c", b: "c"}]);

    (((int[] & readonly)|([string, string] & readonly)) & readonly)[]|csv:Error a9 = csv:transform([{"a": 1, "b": 2}, {"a": "a", "b": "b"}], ["a", "b"], {});
    test:assertTrue(a9 is (((int[] & readonly)|([string, string] & readonly)) & readonly)[]);
    test:assertEquals(a9, [[1, 2], ["a", "b"]]);

    ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[]
                                    & readonly|csv:Error a10 = csv:transform([{"a": "a", "b": "a"}, {"a": 1, "b": 2}], {});
    test:assertTrue(a10 is ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[] & readonly);
    test:assertEquals(a10, [{a: "a", b: "a"}, {a: 1, b: 2}]);
}

@test:Config
function testIntersectionExpectedTypes3() returns error? {
    (int[] & readonly)[]|csv:Error a = csv:parseLists([["1", "2"], ["4", "5"]], {});
    test:assertTrue(a is (int[] & readonly)[]);
    test:assertEquals(a, [[1, 2], [4, 5]]);

    ([string, string])[] & readonly|csv:Error a2 = csv:parseLists([["a", "a"], ["c", "c"]], {});
    test:assertTrue(a2 is [string, string][] & readonly);
    test:assertEquals(a2, [["a", "a"], ["c", "c"]]);

    (record {int a; string b;} & readonly)[]|csv:Error a3 = csv:parseLists([["1", "2"], ["4", "5"]], ["a", "b"], {});
    test:assertTrue(a3 is (record {int a; string b;} & readonly)[]);
    test:assertEquals(a3, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    record {|string...;|}[] & readonly|csv:Error a4 = csv:parseLists([["a", "a"], ["c", "c"]], ["a", "b"], {});
    test:assertTrue(a4 is record {|string...;|}[] & readonly);
    test:assertEquals(a4, [{a: "a", b: "a"}, {a: "c", b: "c"}]);

    ([int] & readonly)[]|csv:Error a5 = csv:parseLists([["1", "2"], ["4", "5"]], {});
    test:assertTrue(a5 is ([int] & readonly)[]);
    test:assertEquals(a5, [[1], [4]]);

    ([string, string])[] & readonly|csv:Error a6 = csv:parseLists([["a", "a"], ["c", "c"]], {});
    test:assertTrue(a6 is [string, string][] & readonly);
    test:assertEquals(a6, [["a", "a"], ["c", "c"]]);

    (record {int a; string b;} & readonly)[]|csv:Error a7 = csv:parseLists([["1", "2"], ["4", "5"]], ["a", "b"], {});
    test:assertTrue(a7 is record {int a; string b;}[] & readonly);
    test:assertEquals(a7, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    map<string>[] & readonly|csv:Error a8 = csv:parseLists([["a", "a"], ["c", "c"]], ["a", "b"], {});
    test:assertTrue(a8 is map<string>[] & readonly);
    test:assertEquals(a8, [{a: "a", b: "a"}, {a: "c", b: "c"}]);

    (((int[] & readonly)|([string, string] & readonly)) & readonly)[]|csv:Error a9 = csv:parseLists([["1", "2"], ["a", "b"]], {});
    test:assertTrue(a9 is (((int[] & readonly)|([string, string] & readonly)) & readonly)[]);
    test:assertEquals(a9, [[1, 2], ["a", "b"]]);

    ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[]
                                    & readonly|csv:Error a10 = csv:parseLists([["a", "a"], ["1", "2"]], ["a", "b"], {});
    test:assertTrue(a10 is ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[] & readonly);
    test:assertEquals(a10, [{a: "a", b: "a"}, {a: "1", b: "2"}]);

    ((record {int a; int b;} & readonly)|(record {string a; string b;} & readonly))[]
                                    & readonly|csv:Error a11 = csv:parseLists([["a", "a"], ["1", "2"]], ["a", "b"], {});
    test:assertTrue(a11 is ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[] & readonly);
    test:assertEquals(a11, [{a: "a", b: "a"}, {a: 1, b: 2}]);
}
