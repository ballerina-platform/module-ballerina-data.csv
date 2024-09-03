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

type RecA record {int a; string b; boolean c; decimal d; float e; () f;};
type RecB record {|string...;|};
type RecC record {int a; int b; int c;};
type TupA [int, string, boolean, decimal, float, ()];
type TupB [int...];
type TupC [int, int, int];

@test:Config
function testParseToStringWithUnionExpectedTypes() returns error? {
    (RecA|RecC)[]|csv:Error csv1op1 = csv:parseString(csvStringData1, {header: 1});
    test:assertEquals(csv1op1, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecA|RecC)[]|csv:Error csv1op2 = csv:parseString(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertTrue(csv1op2 is (RecA|RecC)[]);
    test:assertEquals(csv1op2, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecC|RecA)[]|csv:Error csv1op3 = csv:parseString(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecB|RecA)[]|csv:Error csv1op4 = csv:parseString(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3", f: "()"}
    ]);

    (RecA|RecB)[]|csv:Error csv1op5 = csv:parseString(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (record {|int a;|}|record {|string b;|})[]|csv:Error csv1op6 = csv:parseString(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        {a: 1},
        {a: 3},
        {a: 5}
    ]);

    (record {|string b;|}|record {|int a;|})[]|csv:Error csv1op7 = csv:parseString(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    (record {|string...;|}|record {|int...;|})[]|csv:Error csv1op8 = csv:parseString(csvStringData1, {header: 1});
    test:assertEquals(csv1op8, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "2", b: "string2", c: "false", d: "0", e: "0", f: "null"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "4", b: "string4", c: "true", d: "-6.51", e: "-6.51", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3", f: "()"}
    ]);

    (record {|int...;|}|record {|string...;|})[]|csv:Error csv1op9 = csv:parseString(csvStringData1, {header: 1});
    test:assertEquals(csv1op9, [
        {a: 1},
        {a: 2, d: 0, e: 0},
        {a: 3},
        {a: 4},
        {a: 5, d: 3, e: 3}
    ]);

    (record {|int a; string...;|}|record {|string a; int...;|})[]|csv:Error csv1op10 = csv:parseString(csvStringData1, {header: 1});
    test:assertEquals(csv1op10, [
        {a: 1, b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: 2, b: "string2", c: "false", d: "0", e: "0", f: "null"},
        {a: 3, b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: 4, b: "string4", c: "true", d: "-6.51", e: "-6.51", f: "()"},
        {a: 5, b: "string5", c: "true", d: "3", e: "3", f: "()"}
    ]);

    (record {|string a; int...;|}|record {|int a; string...;|})[]|csv:Error csv1op11 = csv:parseString(csvStringData1, {header: 1});
    test:assertEquals(csv1op11, [
        {a: "1"},
        {a: "2", d: 0, e: 0},
        {a: "3"},
        {a: "4"},
        {a: "5", d: 3, e: 3}
    ]);

    (record {|int a; int b;|}|record {|string a; string...;|})[]|csv:Error csv1op12 = csv:parseString(string `
                                                                                                                        a,b
                                                                                                                        1, 2
                                                                                                                        a, b`, {header: 1});
    test:assertEquals(csv1op12, [
        {a: "1", b: "2"},
        {a: "a", b: "b"}
    ]);

    ([int, int]|[string|int, string|int])[]|csv:Error csv1op13 = csv:parseString(string `
                                                                                                                        a,b
                                                                                                                        1, 2
                                                                                                                        a, b`, {header: 1});
    test:assertEquals(csv1op13, [
        ["1", "2"],
        ["a", "b"]
    ]);
}

record {int a; string b; boolean c; decimal d; float e; () f;}[] value = [
    {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
    {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
    {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
    {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
    {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
];

@test:Config
function testParseToStringWithUnionExpectedTypes2() returns error? {
    (RecA|RecC)[]|csv:Error csv1op1 = csv:transform(value, {});
    test:assertEquals(csv1op1, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecA|RecC)[]|csv:Error csv1op2 = csv:transform(value, {skipLines: [2, 4]});
    test:assertTrue(csv1op2 is (RecA|RecC)[]);
    test:assertEquals(csv1op2, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecC|RecA)[]|csv:Error csv1op3 = csv:transform(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecB|RecA)[]|csv:Error csv1op4 = csv:transform(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    (RecA|RecB)[]|csv:Error csv1op5 = csv:transform(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (record {|int a;|}|record {|string b;|})[]|csv:Error csv1op6 = csv:transform(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        {a: 1},
        {a: 3},
        {a: 5}
    ]);

    (record {|string b;|}|record {|int a;|})[]|csv:Error csv1op7 = csv:transform(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    (record {|string...;|}|record {|int...;|})[]|csv:Error csv1op8 = csv:transform(value, {});
    test:assertEquals(csv1op8, [
        {b: "string1"},
        {b: "string2"},
        {b: "string3"},
        {b: "string4"},
        {b: "string5"}
    ]);

    (record {|int...;|}|record {|string...;|})[]|csv:Error csv1op9 = csv:transform(value, {});
    test:assertEquals(csv1op9, [
        {a: 1, d: 2, e: 2},
        {a: 2, d: 0, e: 0},
        {a: 3, d: 1, e: 1},
        {a: 4, d: -7, e: -7},
        {a: 5, d: 3, e: 3}
    ]);

    (record {|int a; string...;|}|record {|string a; int...;|})[]|csv:Error csv1op10 = csv:transform(value, {});
    test:assertEquals(csv1op10, [
        {a: 1, b: "string1"},
        {a: 2, b: "string2"},
        {a: 3, b: "string3"},
        {a: 4, b: "string4"},
        {a: 5, b: "string5"}
    ]);

    (record {|string a; int...;|}|record {|int a; string...;|})[]|csv:Error csv1op11 = csv:transform(value, {});
    test:assertEquals(csv1op11, [
        {a: 1, b: "string1"},
        {a: 2, b: "string2"},
        {a: 3, b: "string3"},
        {a: 4, b: "string4"},
        {a: 5, b: "string5"}
    ]);

    (record {|string a; int...;|}|record {|string a; string...;|})[]|csv:Error csv1op12 = csv:transform(value, {});
    test:assertTrue(csv1op12 is csv:Error);
    test:assertEquals((<csv:Error>csv1op12).message(), "source value cannot converted in to the '(union_type_tests:record {| string a; int...; |}|union_type_tests:record {| string a; string...; |})[]'");

    (record {|int a; int...;|}|record {|int|string a; int|string...;|})[]|csv:Error csv1op13 = csv:transform([{"a": 1, "b": 2}, {"a": "a", "b": "b"}], {});
    test:assertEquals(csv1op13, [
        {a: 1, b: 2},
        {a: "a", b: "b"}
    ]);

    (record {|int a; int...;|}|record {|string a; string...;|})[]|csv:Error csv1op14 = csv:transform([{"a": 1, "b": 2}, {"a": "a", "b": "b"}], {});
    test:assertTrue(csv1op14 is csv:Error);
    test:assertEquals((<csv:Error>csv1op14).message(), "source value cannot converted in to the '(union_type_tests:record {| int a; int...; |}|union_type_tests:record {| string a; string...; |})[]'");
}

@test:Config
function testParseToStringWithUnionExpectedTypes3() returns error? {
    string[][] value = [
        ["1", "string1", "true", "2.234", "2.234", "()"],
        ["2", "string2", "false", "0", "0", "()"],
        ["3", "string3", "false", "1.23", "1.23", "()"],
        ["4", "string4", "true", "-6.51", "-6.51", "()"],
        ["5", "string5", "true", "3", "3.0", "()"]
    ];

    (RecA|RecC)[]|csv:Error csv1op1 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"]});
    test:assertEquals(csv1op1, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecA|RecC)[]|csv:Error csv1op2 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertTrue(csv1op2 is (RecA|RecC)[]);
    test:assertEquals(csv1op2, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecC|RecA)[]|csv:Error csv1op3 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecB|RecA)[]|csv:Error csv1op4 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3.0", f: "()"}
    ]);

    (RecA|RecB)[]|csv:Error csv1op5 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (record {|int a;|}|record {|string b;|})[]|csv:Error csv1op6 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        {a: 1},
        {a: 3},
        {a: 5}
    ]);

    (record {|string b;|}|record {|int a;|})[]|csv:Error csv1op7 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    (record {|string...;|}|record {|int...;|})[]|csv:Error csv1op8 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [4, 2]});
    test:assertEquals(csv1op8, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3.0", f: "()"}
    ]);

    (record {|int...;|}|record {|string...;|})[]|csv:Error csv1op9 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"]});
    test:assertEquals(csv1op9, [
        {a: 1},
        {a: 2, d: 0, e: 0},
        {a: 3},
        {a: 4},
        {a: 5, d: 3}
    ]);

    (record {|int a; string...;|}|record {|string a; int...;|})[]|csv:Error csv1op10 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, -1, 4]});
    test:assertEquals(csv1op10, [
        {a: 1, b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: 3, b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: 5, b: "string5", c: "true", d: "3", e: "3.0", f: "()"}
    ]);

    (record {|string a; int...;|}|record {|int a; string...;|})[]|csv:Error csv1op11 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"]});
    test:assertEquals(csv1op11, [
        {a: "1"},
        {a: "2", d: 0, e: 0},
        {a: "3"},
        {a: "4"},
        {a: "5", d: 3}
    ]);

    (record {|int a; int...;|}|record {|string a; string...;|})[]|csv:Error csv1op13 = csv:parseList([["1", "2"], ["a", "b"]], {customHeaders: ["a", "b"]});
    test:assertEquals(csv1op13, [
        {a: "1", b: "2"},
        {a: "a", b: "b"}
    ]);
}


@test:Config
function testParseToStringWithUnionExpectedTypes4() returns error? {
    record {int a; string b; boolean c; decimal d; float e; () f;}[] value = [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ];

    (TupA|TupC)[]|csv:Error csv1op1 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"]});
    test:assertEquals(csv1op1, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [2, "string2", false, <decimal>0, <float>0, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupA|TupC)[]|csv:Error csv1op2 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertTrue(csv1op2 is (TupA|TupC)[]);
    test:assertEquals(csv1op2, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupC|TupA)[]|csv:Error csv1op3 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupB|TupA)[]|csv:Error csv1op4 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupB|[boolean])[]|csv:Error csv1op4_2 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertTrue(csv1op4_2 is csv:Error);
    test:assertEquals((<csv:Error>csv1op4_2).message(), "source value cannot converted in to the '(union_type_tests:TupB|[boolean])[]'");

    (TupA|TupB)[]|csv:Error csv1op5 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    ([int]|[string])[]|csv:Error csv1op6 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        [1],
        [3],
        [5]
    ]);

    ([string]|[int])[]|csv:Error csv1op7 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        [1],
        [3],
        [5]
    ]);

    ([string...]|[int...])[]|csv:Error csv1op8 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"]});
    test:assertTrue(csv1op8 is csv:Error);
    test:assertEquals((<csv:Error>csv1op8).message(), "source value cannot converted in to the '([string...]|[int...])[]'");

    ([int...]|[string...])[]|csv:Error csv1op9 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"]});
    test:assertTrue(csv1op9 is csv:Error);
    test:assertEquals((<csv:Error>csv1op9).message(), "source value cannot converted in to the '([int...]|[string...])[]'");

    ([int, string...]|[string, int...])[]|csv:Error csv1op10 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"]});
    test:assertTrue(csv1op10 is csv:Error);
    test:assertEquals((<csv:Error>csv1op10).message(), "source value cannot converted in to the '([int,string...]|[string,int...])[]'");

    ([string, int...]|[int, string...])[]|csv:Error csv1op11 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"]});
    test:assertTrue(csv1op11 is csv:Error);
    test:assertEquals((<csv:Error>csv1op11).message(), "source value cannot converted in to the '([string,int...]|[int,string...])[]'");

    ([string, int...]|[string, string...])[]|csv:Error csv1op12 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"]});
    test:assertTrue(csv1op12 is csv:Error);
    test:assertEquals((<csv:Error>csv1op12).message(), "source value cannot converted in to the '([string,int...]|[string,string...])[]'");

    ([string, string...]|[int|string, int|string...])[]|csv:Error csv1op13 = csv:transform([{"a": 1, "b": 2}, {"a": "a", "b": "b"}], {headerOrder: ["a", "b"]});
    test:assertEquals(csv1op13, [
        [1, 2],
        ["a", "b"]
    ]);

    ([int, int...]|[string, string...])[]|csv:Error csv1op14 = csv:transform([{"a": 1, "b": 2}, {"a": "a", "b": "b"}], {headerOrder: ["a", "b"]});
    test:assertTrue(csv1op14 is csv:Error);
    test:assertEquals((<csv:Error>csv1op14).message(), "source value cannot converted in to the '([int,int...]|[string,string...])[]'");
}

@test:Config
function testParseToStringWithUnionExpectedTypes5() returns error? {
    string[][] value = [
        ["1", "string1", "true", "2.234", "2.234", "()"],
        ["2", "string2", "false", "0", "0", "()"],
        ["3", "string3", "false", "1.23", "1.23", "()"],
        ["4", "string4", "true", "-6.51", "-6.51", "()"],
        ["5", "string5", "true", "3", "3.0", "()"]
    ];

    (TupA|TupC)[]|csv:Error csv1op1 = csv:parseList(value, {});
    test:assertEquals(csv1op1, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [2, "string2", false, <decimal>0, <float>0, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupA|TupC)[]|csv:Error csv1op2 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertTrue(csv1op2 is (TupA|TupC)[]);
    test:assertEquals(csv1op2, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupC|TupA)[]|csv:Error csv1op3 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupB|TupA)[]|csv:Error csv1op4 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupB|[boolean])[]|csv:Error csv1op4_2 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertTrue(csv1op4_2 is csv:Error);
    test:assertEquals((<csv:Error>csv1op4_2).message(), "source value cannot converted in to the '(union_type_tests:TupB|[boolean])[]'");

    (TupA|TupB)[]|csv:Error csv1op5 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    ([int]|[string])[]|csv:Error csv1op6 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        [1],
        [3],
        [5]
    ]);

    ([string]|[int])[]|csv:Error csv1op7 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        ["1"],
        ["3"],
        ["5"]
    ]);

    ([string...]|[int...])[]|csv:Error csv1op8_2 = csv:parseList(value, {});
    test:assertEquals(csv1op8_2, value);

    ([int...]|[string...])[]|csv:Error csv1op9 = csv:parseList(value, {});
    test:assertEquals(csv1op9, value);

    ([int, string...]|[string, int...])[]|csv:Error csv1op10 = csv:parseList(value, {});
    test:assertEquals(csv1op10, [
        [1, "string1", "true", "2.234", "2.234", "()"],
        [2, "string2", "false", "0", "0", "()"],
        [3, "string3", "false", "1.23", "1.23", "()"],
        [4, "string4", "true", "-6.51", "-6.51", "()"],
        [5, "string5", "true", "3", "3.0", "()"]
    ]);

    ([string, int...]|[int, string...])[]|csv:Error csv1op11 = csv:parseList(value, {});
    test:assertEquals(csv1op11, [
        [1, "string1", "true", "2.234", "2.234", "()"],
        [2, "string2", "false", "0", "0", "()"],
        [3, "string3", "false", "1.23", "1.23", "()"],
        [4, "string4", "true", "-6.51", "-6.51", "()"],
        [5, "string5", "true", "3", "3.0", "()"]
    ]);

    ([string, int...]|[string, string...])[]|csv:Error csv1op12 = csv:parseList(value, {});
    test:assertEquals(csv1op12, value);

    ([int, int...]|[string, string...])[]|csv:Error csv1op13 = csv:parseList([["1", "2"], ["a", "b"]], {});
    test:assertEquals(csv1op13, [
        ["1", "2"],
        ["a", "b"]
    ]);
}

@test:Config
function testParseToStringWithUnionExpectedTypes6() returns error? {
    RecA[]|RecC[]|csv:Error csv1op1 = csv:parseString(csvStringData1, {header: 1});
    test:assertEquals(csv1op1, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecA[]|RecC[]|csv:Error csv1op2 = csv:parseString(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertTrue(csv1op2 is RecA[]|RecC[]);
    test:assertEquals(csv1op2, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecC[]|RecA[]|csv:Error csv1op3 = csv:parseString(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecB[]|RecA[]|csv:Error csv1op4 = csv:parseString(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3", f: "()"}
    ]);

    RecA[]|RecB[]|csv:Error csv1op5 = csv:parseString(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    record {|int a;|}[]|record {|string b;|}[]|csv:Error csv1op6 = csv:parseString(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        {a: 1},
        {a: 3},
        {a: 5}
    ]);

    record {|string b;|}[]|record {|int a;|}[]|csv:Error csv1op7 = csv:parseString(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    record {|string...;|}[]|record {|int...;|}[]|csv:Error csv1op8 = csv:parseString(csvStringData1, {header: 1});
    test:assertEquals(csv1op8, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "2", b: "string2", c: "false", d: "0", e: "0", f: "null"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "4", b: "string4", c: "true", d: "-6.51", e: "-6.51", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3", f: "()"}
    ]);

    record {|int...;|}[]|record {|string...;|}[]|csv:Error csv1op9 = csv:parseString(csvStringData1, {header: 1});
    test:assertEquals(csv1op9, [
        {a: 1},
        {a: 2, d: 0, e: 0},
        {a: 3},
        {a: 4},
        {a: 5, d: 3, e: 3}
    ]);

    record {|int a; string...;|}[]|record {|string a; int...;|}[]|csv:Error csv1op10 = csv:parseString(csvStringData1, {header: 1});
    test:assertEquals(csv1op10, [
        {a: 1, b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: 2, b: "string2", c: "false", d: "0", e: "0", f: "null"},
        {a: 3, b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: 4, b: "string4", c: "true", d: "-6.51", e: "-6.51", f: "()"},
        {a: 5, b: "string5", c: "true", d: "3", e: "3", f: "()"}
    ]);

    record {|string a; int...;|}[]|record {|int a; string...;|}[]|csv:Error csv1op11 = csv:parseString(csvStringData1, {header: 1});
    test:assertEquals(csv1op11, [
        {a: "1"},
        {a: "2", d: 0, e: 0},
        {a: "3"},
        {a: "4"},
        {a: "5", d: 3, e: 3}
    ]);

    record {|int a; int b;|}[]|record {|string a; string...;|}[]|csv:Error csv1op12 = csv:parseString(string `
                                                                                                                        a,b
                                                                                                                        1, 2
                                                                                                                        a, b`, {header: 1});
    test:assertEquals(csv1op12, [
        {a: "1", b: "2"},
        {a: "a", b: "b"}
    ]);
}

@test:Config
function testParseToStringWithUnionExpectedTypes7() returns error? {
    record {int a; string b; boolean c; decimal d; float e; () f;}[] value = [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ];

    RecA[]|RecC[]|csv:Error csv1op1 = csv:transform(value, {});
    test:assertEquals(csv1op1, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecA[]|RecC[]|csv:Error csv1op2 = csv:transform(value, {skipLines: [2, 4]});
    test:assertTrue(csv1op2 is RecA[]|RecC[]);
    test:assertEquals(csv1op2, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecC[]|RecA[]|csv:Error csv1op3 = csv:transform(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecB[]|RecA[]|csv:Error csv1op4 = csv:transform(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    RecA[]|RecB[]|csv:Error csv1op5 = csv:transform(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    record {|int a;|}[]|record {|string b;|}[]|csv:Error csv1op6 = csv:transform(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        {a: 1},
        {a: 3},
        {a: 5}
    ]);

    record {|string b;|}[]|record {|int a;|}[]|csv:Error csv1op7 = csv:transform(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    record {|string...;|}[]|record {|int...;|}[]|csv:Error csv1op8 = csv:transform(value, {});
    test:assertEquals(csv1op8, [
        {b: "string1"},
        {b: "string2"},
        {b: "string3"},
        {b: "string4"},
        {b: "string5"}
    ]);

    record {|int...;|}[]|record {|string...;|}[]|csv:Error csv1op9 = csv:transform(value, {});
    test:assertEquals(csv1op9, [
        {a: 1, d: 2, e: 2},
        {a: 2, d: 0, e: 0},
        {a: 3, d: 1, e: 1},
        {a: 4, d: -7, e: -7},
        {a: 5, d: 3, e: 3}
    ]);

    record {|int a; string...;|}[]|record {|string a; int...;|}[]|csv:Error csv1op10 = csv:transform(value, {});
    test:assertEquals(csv1op10, [
        {a: 1, b: "string1"},
        {a: 2, b: "string2"},
        {a: 3, b: "string3"},
        {a: 4, b: "string4"},
        {a: 5, b: "string5"}
    ]);

    record {|string a; int...;|}[]|record {|int a; string...;|}[]|csv:Error csv1op11 = csv:transform(value, {});
    test:assertEquals(csv1op11, [
        {a: 1, b: "string1"},
        {a: 2, b: "string2"},
        {a: 3, b: "string3"},
        {a: 4, b: "string4"},
        {a: 5, b: "string5"}
    ]);

    record {|string a; int...;|}[]|record {|string a; string...;|}[]|csv:Error csv1op12 = csv:transform(value, {});
    test:assertTrue(csv1op12 is csv:Error);
    test:assertEquals((<csv:Error>csv1op12).message(), "source value cannot converted in to the '(union_type_tests:record {| string a; int...; |}[]|union_type_tests:record {| string a; string...; |}[])'");
}

@test:Config
function testParseToStringWithUnionExpectedTypes8() returns error? {
    string[][] value = [
        ["1", "string1", "true", "2.234", "2.234", "()"],
        ["2", "string2", "false", "0", "0", "()"],
        ["3", "string3", "false", "1.23", "1.23", "()"],
        ["4", "string4", "true", "-6.51", "-6.51", "()"],
        ["5", "string5", "true", "3", "3.0", "()"]
    ];

    RecA[]|RecC[]|csv:Error csv1op1 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"]});
    test:assertEquals(csv1op1, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecA[]|RecC[]|csv:Error csv1op2 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertTrue(csv1op2 is RecA[]|RecC[]);
    test:assertEquals(csv1op2, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecC[]|RecA[]|csv:Error csv1op3 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecB[]|RecA[]|csv:Error csv1op4 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3.0", f: "()"}
    ]);

    RecA[]|RecB[]|csv:Error csv1op5 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    record {|int a;|}[]|record {|string b;|}[]|csv:Error csv1op6 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        {a: 1},
        {a: 3},
        {a: 5}
    ]);

    record {|string b;|}[]|record {|int a;|}[]|csv:Error csv1op7 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    record {|string...;|}[]|record {|int...;|}[]|csv:Error csv1op8 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [4, 2]});
    test:assertEquals(csv1op8, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3.0", f: "()"}
    ]);

    record {|int...;|}[]|record {|string...;|}[]|csv:Error csv1op9 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"]});
    test:assertEquals(csv1op9, [
        {a: 1},
        {a: 2, d: 0, e: 0},
        {a: 3},
        {a: 4},
        {a: 5, d: 3}
    ]);

    record {|int a; string...;|}[]|record {|string a; int...;|}[]|csv:Error csv1op10 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"], skipLines: [2, -1, 4]});
    test:assertEquals(csv1op10, [
        {a: 1, b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: 3, b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: 5, b: "string5", c: "true", d: "3", e: "3.0", f: "()"}
    ]);

    record {|string a; int...;|}[]|record {|int a; string...;|}[]|csv:Error csv1op11 = csv:parseList(value, {customHeaders: ["a", "b", "c", "d", "e", "f"]});
    test:assertEquals(csv1op11, [
        {a: "1"},
        {a: "2", d: 0, e: 0},
        {a: "3"},
        {a: "4"},
        {a: "5", d: 3}
    ]);

    record {|int a; int...;|}[]|record {|string a; string...;|}[]|csv:Error csv1op13 = csv:parseList([["1", "2"], ["a", "b"]], {customHeaders: ["a", "b"]});
    test:assertEquals(csv1op13, [
        {a: "1", b: "2"},
        {a: "a", b: "b"}
    ]);
}


@test:Config
function testParseToStringWithUnionExpectedTypes9() returns error? {
    record {int a; string b; boolean c; decimal d; float e; () f;}[] value = [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ];

    TupA[]|TupC[]|csv:Error csv1op1 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"]});
    test:assertEquals(csv1op1, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [2, "string2", false, <decimal>0, <float>0, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupA[]|TupC[]|csv:Error csv1op2 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertTrue(csv1op2 is TupA[]|TupC[]);
    test:assertEquals(csv1op2, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupC[]|TupA[]|csv:Error csv1op3 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupB[]|TupA[]|csv:Error csv1op4 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupB[]|[boolean][]|csv:Error csv1op4_2 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertTrue(csv1op4_2 is csv:Error);
    test:assertEquals((<csv:Error>csv1op4_2).message(), "source value cannot converted in to the '(union_type_tests:TupB[]|[boolean][])'");

    TupA[]|TupB[]|csv:Error csv1op5 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    [int][]|[string][]|csv:Error csv1op6 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        [1],
        [3],
        [5]
    ]);

    [string][]|[int][]|csv:Error csv1op7 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"], skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        [1],
        [3],
        [5]
    ]);

    [string...][]|[int...][]|csv:Error csv1op8 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"]});
    test:assertTrue(csv1op8 is csv:Error);
    test:assertEquals((<csv:Error>csv1op8).message(), "source value cannot converted in to the '([string...][]|[int...][])'");

    [int...][]|[string...][]|csv:Error csv1op9 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"]});
    test:assertTrue(csv1op9 is csv:Error);
    test:assertEquals((<csv:Error>csv1op9).message(), "source value cannot converted in to the '([int...][]|[string...][])'");

    [int, string...][]|[string, int...][]|csv:Error csv1op10 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"]});
    test:assertTrue(csv1op10 is csv:Error);
    test:assertEquals((<csv:Error>csv1op10).message(), "source value cannot converted in to the '([int,string...][]|[string,int...][])'");

    [string, int...][]|[int, string...][]|csv:Error csv1op11 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"]});
    test:assertTrue(csv1op11 is csv:Error);
    test:assertEquals((<csv:Error>csv1op11).message(), "source value cannot converted in to the '([string,int...][]|[int,string...][])'");

    [string, int...][]|[string, string...][]|csv:Error csv1op12 = csv:transform(value, {headerOrder: ["a", "b", "c", "d", "e", "f"]});
    test:assertTrue(csv1op12 is csv:Error);
    test:assertEquals((<csv:Error>csv1op12).message(), "source value cannot converted in to the '([string,int...][]|[string,string...][])'");
}

@test:Config
function testParseToStringWithUnionExpectedTypes10() returns error? {
    string[][] value = [
        ["1", "string1", "true", "2.234", "2.234", "()"],
        ["2", "string2", "false", "0", "0", "()"],
        ["3", "string3", "false", "1.23", "1.23", "()"],
        ["4", "string4", "true", "-6.51", "-6.51", "()"],
        ["5", "string5", "true", "3", "3.0", "()"]
    ];

    TupA[]|TupC[]|csv:Error csv1op1 = csv:parseList(value, {});
    test:assertEquals(csv1op1, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [2, "string2", false, <decimal>0, <float>0, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupA[]|TupC[]|csv:Error csv1op2 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertTrue(csv1op2 is TupA[]|TupC[]);
    test:assertEquals(csv1op2, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupC[]|TupA[]|csv:Error csv1op3 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupB[]|TupA[]|csv:Error csv1op4 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupB[]|[boolean][]|csv:Error csv1op4_2 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertTrue(csv1op4_2 is csv:Error);
    test:assertEquals((<csv:Error>csv1op4_2).message(), "source value cannot converted in to the '(union_type_tests:TupB[]|[boolean][])'");

    TupA[]|TupB[]|csv:Error csv1op5 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    [int][]|[string][]|csv:Error csv1op6 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        [1],
        [3],
        [5]
    ]);

    [string][]|[int][]|csv:Error csv1op7 = csv:parseList(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        ["1"],
        ["3"],
        ["5"]
    ]);

    [string...][]|[int...][]|csv:Error csv1op8_2 = csv:parseList(value, {});
    test:assertEquals(csv1op8_2, value);

    [int...][]|[string...][]|csv:Error csv1op9 = csv:parseList(value, {});
    test:assertEquals(csv1op9, value);

    [int, string...][]|[string, int...][]|csv:Error csv1op10 = csv:parseList(value, {});
    test:assertEquals(csv1op10, [
        [1, "string1", "true", "2.234", "2.234", "()"],
        [2, "string2", "false", "0", "0", "()"],
        [3, "string3", "false", "1.23", "1.23", "()"],
        [4, "string4", "true", "-6.51", "-6.51", "()"],
        [5, "string5", "true", "3", "3.0", "()"]
    ]);

    [string, int...][]|[int, string...][]|csv:Error csv1op11 = csv:parseList(value, {});
    test:assertEquals(csv1op11, [
        [1, "string1", "true", "2.234", "2.234", "()"],
        [2, "string2", "false", "0", "0", "()"],
        [3, "string3", "false", "1.23", "1.23", "()"],
        [4, "string4", "true", "-6.51", "-6.51", "()"],
        [5, "string5", "true", "3", "3.0", "()"]
    ]);

    [string, int...][]|[string, string...][]|csv:Error csv1op12 = csv:parseList(value, {});
    test:assertEquals(csv1op12, value);
}

@test:Config
function testUnionTypeWithOrdering() returns error? {
    string[][] value1 = [["1", "1.0", "true", "a"], ["2", "2.0", "false", "b"]];
    string value2 = string `a,b, c, d
                            1, 1.0, true, a
                            2, 2.0, false, b`;
    record {}[] value3 = [{"a": 1, "b": 1.0, "c": true, "d": "a"}, {"a": 2, "b": 2.0, "c": false, "d":"b"}];

    string[][]|anydata[][]|error csv1op1 = csv:parseList(value1);
    test:assertEquals(csv1op1, [
        ["1", "1.0", "true", "a"],
        ["2", "2.0", "false", "b"]
    ]);

    anydata[][]|string[][]|error csv1op2 = csv:parseList(value1);
    test:assertEquals(csv1op2, [
        [1, 1.0, true, "a"],
        [2, 2.0, false, "b"]
    ]);

    string[][2]|float[][2]|error csv1op1_2 = csv:parseList(value1);
    test:assertEquals(csv1op1_2, [
        ["1", "1.0"],
        ["2", "2.0"]
    ]);

    float[][2]|string[][2]|error csv1op2_2 = csv:parseList(value1);
    test:assertEquals(csv1op2_2, [
        [1f, 1.0],
        [2f, 2.0]
    ]);

    (string|anydata)[][]|error csv1op1_3 = csv:parseList(value1);
    test:assertEquals(csv1op1_3, [
        ["1", "1.0", "true", "a"],
        ["2", "2.0", "false", "b"]
    ]);

    (anydata|string)[][]|error csv1op2_3 = csv:parseList(value1);
    test:assertEquals(csv1op2_3, [
        [1, 1.0, true, "a"],
        [2, 2.0, false, "b"]
    ]);

    (string|float)[][2]|error csv1op1_4 = csv:parseList(value1);
    test:assertEquals(csv1op1_4, [
        ["1", "1.0"],
        ["2", "2.0"]
    ]);

    (float|string)[][2]|error csv1op2_4 = csv:parseList(value1);
    test:assertEquals(csv1op2_4, [
        [1f, 1.0],
        [2f, 2.0]
    ]);

    string[][]|anydata[][]|error recCsv1op1 = csv:transform(value3);
    test:assertEquals(recCsv1op1, [
        [1, 1.0, true, "a"],
        [2, 2.0, false, "b"]
    ]);

    anydata[][]|string[][]|error recCsv1op2 = csv:transform(value3);
    test:assertEquals(recCsv1op2, [
        [1, 1.0, true, "a"],
        [2, 2.0, false, "b"]
    ]);

    string[][2]|float[][2]|error recCsv1op1_2 = csv:transform(value3);
    test:assertEquals(recCsv1op1_2, [
        [1f, 1.0],
        [2f, 2.0]
    ]);

    float[][2]|string[][2]|error recCsv1op2_2 = csv:transform(value3);
    test:assertEquals(recCsv1op2_2, [
        [1f, 1.0],
        [2f, 2.0]
    ]);

    (string|anydata)[][]|error recCsv1op1_3 = csv:transform(value3);
    test:assertEquals(recCsv1op1_3, [
        [1, 1.0, true, "a"],
        [2, 2.0, false, "b"]
    ]);

    (anydata|string)[][]|error recCsv1op2_3 = csv:transform(value3);
    test:assertEquals(recCsv1op2_3, [
        [1, 1.0, true, "a"],
        [2, 2.0, false, "b"]
    ]);

    (string|float)[][2]|error recCsv1op1_4 = csv:transform(value3);
    test:assertEquals(recCsv1op1_4, [
        [1f, 1.0],
        [2f, 2.0]
    ]);

    (float|string)[][2]|error recCsv1op2_4 = csv:transform(value3);
    test:assertEquals(recCsv1op2_4, [
        [1f, 1.0],
        [2f, 2.0]
    ]);
    
    string[][]|anydata[][]|error parseStrCsv1op1 = csv:parseString(value2);
    test:assertEquals(parseStrCsv1op1, [
        ["1", "1.0", "true", "a"],
        ["2", "2.0", "false", "b"]
    ]);

    anydata[][]|string[][]|error parseStrCsv1op2 = csv:parseString(value2);
    test:assertEquals(parseStrCsv1op2, [
        [1, 1.0, true, "a"],
        [2, 2.0, false, "b"]
    ]);

    string[][2]|float[][2]|error parseStrCsv1op1_2 = csv:parseString(value2);
    test:assertEquals(parseStrCsv1op1_2, [
        ["1", "1.0"],
        ["2", "2.0"]
    ]);

    float[][2]|string[][2]|error parseStrCsv1op2_2 = csv:parseString(value2);
    test:assertEquals(parseStrCsv1op2_2, [
        [1f, 1.0],
        [2f, 2.0]
    ]);

    (string|anydata)[][]|error parseStrCsv1op1_3 = csv:parseString(value2);
    test:assertEquals(parseStrCsv1op1_3, [
        ["1", "1.0", "true", "a"],
        ["2", "2.0", "false", "b"]
    ]);

    (anydata|string)[][]|error parseStrCsv1op2_3 = csv:parseString(value2);
    test:assertEquals(parseStrCsv1op2_3, [
        [1, 1.0, true, "a"],
        [2, 2.0, false, "b"]
    ]);

    (string|float)[][2]|error parseStrCsv1op1_4 = csv:parseString(value2);
    test:assertEquals(parseStrCsv1op1_4, [
        ["1", "1.0"],
        ["2", "2.0"]
    ]);

    (float|string)[][2]|error parseStrCsv1op2_4 = csv:parseString(value2);
    test:assertEquals(parseStrCsv1op2_4, [
        [1f, 1.0],
        [2f, 2.0]
    ]);
}

@test:Config
function testUnionTypeWithNull() returns error? {
    string[][] value1 = [["1", "()", "true", "a"], ["2", "()", "false", "b"]];
    string value2 = string `a,b, c, d
                            1, (), true, a
                            2, (), false, b`;
    record {}[] value3 = [{"a": 1, "b": (), "c": true, "d": "a"}, {"a": 2, "b": (), "c": false, "d":"b"}];
    string value4 = string `a,b, c, d
                            1, , true, a
                            2, , false, b`;
    string value5 = string `a,b, c, d
                            1, null, true, a
                            2, null, false, b`;
    string value6 = string `a,b, c, d
                            1, N/A, true, a
                            2, N/A, false, b`;
    string[][] value7 = [["1", "null", "true", "a"], ["2", "null", "false", "b"]];

    string?[][2]|float[][2]|error csv1op1_2 = csv:parseList(value1);
    test:assertEquals(csv1op1_2, [
        ["1", ()],
        ["2", ()]
    ]);

    csv1op1_2 = csv:parseList(value7);
    test:assertEquals(csv1op1_2, [
        ["1", ()],
        ["2", ()]
    ]);

    float[][2]|string?[][2]|error csv1op2_2 = csv:parseList(value1);
    test:assertEquals(csv1op2_2, [
        ["1", ()],
        ["2", ()]
    ]);

    csv1op2_2 = csv:parseList(value7);
    test:assertEquals(csv1op2_2, [
        ["1", ()],
        ["2", ()]
    ]);

    (string|float?)[][2]|error csv1op1_4 = csv:parseList(value1);
    test:assertEquals(csv1op1_4, [
        ["1", ()],
        ["2", ()]
    ]);

    csv1op1_4 = csv:parseList(value7);
    test:assertEquals(csv1op1_4, [
        ["1", ()],
        ["2", ()]
    ]);

    (float|string?)[][2]|error csv1op2_4 = csv:parseList(value1);
    test:assertEquals(csv1op2_4, [
        [1f, ()],
        [2f, ()]
    ]);

    csv1op2_4 = csv:parseList(value7);
    test:assertEquals(csv1op2_4, [
        [1f, ()],
        [2f, ()]
    ]);

    int?[][2]|float[][2]|error recCsv1op1_2 = csv:transform(value3);
    test:assertEquals(recCsv1op1_2, [
        [1, ()],
        [2, ()]
    ]);

    float?[][2]|int?[][2]|error recCsv1op2_2 = csv:transform(value3);
    test:assertEquals(recCsv1op2_2, [
        [1f, ()],
        [2f, ()]
    ]);

    (float|string?)[][2]|error recCsv1op2_4 = csv:transform(value3);
    test:assertEquals(recCsv1op2_4, [
        [1f, ()],
        [2f, ()]
    ]);

    string?[][2]|float[][2]|error parseStrCsv1op1_2 = csv:parseString(value2);
    test:assertEquals(parseStrCsv1op1_2, [
        ["1", ()],
        ["2", ()]
    ]);

    float[][2]|string?[][2]|error parseStrCsv1op2_2 = csv:parseString(value4, {nilValue: ""});
    test:assertEquals(parseStrCsv1op2_2, [
        ["1", ()],
        ["2", ()]
    ]);

    (string|float?)[][2]|error parseStrCsv1op1_4 = csv:parseString(value5, {nilValue: "null"});
    test:assertEquals(parseStrCsv1op1_4, [
        ["1", ()],
        ["2", ()]
    ]);

    (float|string)?[][2]|error parseStrCsv1op2_4 = csv:parseString(value6, {nilValue: "N/A"});
    test:assertEquals(parseStrCsv1op2_4, [
        [1f, ()],
        [2f, ()]
    ]);
}
