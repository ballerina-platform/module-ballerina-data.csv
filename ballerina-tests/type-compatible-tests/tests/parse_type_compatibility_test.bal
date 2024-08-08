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
function testFromCsvWithTypeFunctionWithTypeCompatibility() {
    var value = {i1, i2, s1, s2, b1, b2, n1, n2, f1, f2, d1, d2, j1: b1, a1: d1, j2: b2, a2: d2};

    CustomRecord27Array|csv:Error vcr27a = csv:transform([value, value, value], {}, CustomRecord27Array);
    test:assertEquals(vcr27a , [
        {i1, s1, s2, b1, n1, f1, d1, j1: b1, a1: d1, defaultableField: "", nillableField: ()},
        {i1, s1, s2, b1, n1, f1, d1, j1: b1, a1: d1, defaultableField: "", nillableField: ()},
        {i1, s1, s2, b1, n1, f1, d1, j1: b1, a1: d1, defaultableField: "", nillableField: ()}
    ]);

    AnydataMapArray|csv:Error vanydma = csv:transform([value, value, value], {}, AnydataMapArray);
    test:assertEquals(vanydma , [
        value,
        value,
        value
    ]);

    JsonMapArray|csv:Error vjma = csv:transform([value, value, value], {}, JsonMapArray);
    test:assertEquals(vjma , [
        value,
        value,
        value
    ]);

    record{|int...;|}[]|csv:Error irrma = csv:transform([{"a": 1}, {"a": i1, "b": i2}, {"a": i1, "b": i2, "c": s1}]);
    test:assertEquals(irrma , [
        {a:1},
        {a: i1, b: i2},
        {a: i1, b: i2}
    ]);

    record{|decimal...;|}[]|csv:Error drra = csv:transform([{"a": d1}, {"a": d2, "b": d3}, {"a": d4, "b": f2, "c": s1, "d": f3}]);
    test:assertTrue(drra is record{|decimal...;|}[]);
    test:assertEquals(drra , [
        {a: d1},
        {a: d2, b: d3},
        {a: d4, b: -3.21d, d: <decimal>f3}
    ]);

    record{|string...;|}[]|csv:Error srra = csv:transform([{"a": "string"}, {"c": 1, "a": s1, "b": s2}, {"a": b1, "b": s3, "c": d1}]);
    test:assertEquals(srra , [
        {a: "string"},
        {a: s1, b: s2},
        {b: s3}
    ]);

    record{|float...;|}[]|csv:Error frra = csv:transform([{"a": 1.2, "b": 1.2f}, {"a": d2, "b": d3}, {"a": d4, "b": f2, "c": s1}]);
    test:assertEquals(frra , [
        {a: 1.2, b: 1.2},
        {a: <float>d2, b: <float>d3},
        {a: <float>d4, b: f2}
    ]);

    record{|float a; decimal b;|}[]|csv:Error fdc1a = csv:transform([{"a": d1, "b": d2}, {"a": f1, "b": f2}, {"a": d2, "b": f2}, {"a": f2, "b": d2}]);
    test:assertEquals(fdc1a , [
        {a: <float>d1, b: d2}, 
        {a: f1, b: <decimal>f2}, 
        {a: <float>d2, b: <decimal>f2}, 
        {a: f2, b: d2}
    ]);

    record{|float a; decimal ...;|}[]|csv:Error fdc2a = csv:transform([{"a": d1, "b": d2}, {"a": f1, "b": f2}, {"a": d2, "b": f2}, {"a": f2, "b": d2}]);
    test:assertEquals(fdc2a , [
        {a: <float>d1, b: d2}, 
        {a: f1, b: <decimal>f2}, 
        {a: <float>d2, b: <decimal>f2}, 
        {a: f2, b: d2}
    ]);

    record{|decimal b; float...;|}[]|csv:Error fdc3a = csv:transform([{"a": d1, "b": d2}, {"a": f1, "b": f2}, {"a": d2, "b": f2}, {"a": f2, "b": d2}]);
    test:assertEquals(fdc3a , [
        {a: <float>d1, b: d2}, 
        {a: f1, b: <decimal>f2}, 
        {a: <float>d2, b: <decimal>f2}, 
        {a: f2, b: d2}
    ]);
}

type A decimal|int;
type A2 int|decimal;
type B readonly & A | C;
type B2 readonly & C | readonly & A2;
type C string|boolean;
type C2 boolean|string;

@test:Config
function testFromCsvWithIntersectionTypeCompatibility2() {
    record{
        readonly & int a; 
        readonly & string b; 
        (readonly & boolean) | (readonly & decimal) c;
    }[]|csv:Error r1a = csv:parseString( string `a,b,c
                                        1,string,true
                                        2,string2,false
                                        3,string3,true`);

    test:assertEquals(r1a , [
        {a: 1, b: "string", c: true},
        {a: 2, b: "string2", c: false},
        {a: 3, b: "string3", c: true}
    ]);

    record{A a; B b; C c;}[]|csv:Error r2a = csv:parseString( string `a,b,c
                                        1,string,true
                                        2,string2,false
                                        3,string3,true`);

    test:assertEquals(r2a , [
        {a: 1, b: "string", c: true},
        {a: 2, b: "string2", c: false},
        {a: 3, b: "string3", c: true}
    ]);

    record{A2 a; B2 b; C2 c;}[]|csv:Error r3a = csv:parseString( string `a,b,c
                                        1,string,true
                                        2,string2,false
                                        3,string3,true`);

    test:assertEquals(r3a , [
        {a: 1, b: "string", c: true},
        {a: 2, b: "string2", c: false},
        {a: 3, b: "string3", c: true}
    ]);

    record{|A2 a; B2 b; C2...;|}[]|csv:Error r4a = csv:parseString( string `
                                        a,b,c,d
                                        1,string,true,string
                                        2,string2,false,string2
                                        3,string3,true,string3`, {header: 1});

    test:assertEquals(r4a , [
        {a: 1, b: "string", c: true, d: "string"},
        {a: 2, b: "string2", c: false, d: "string2"},
        {a: 3, b: "string3", c: true, d: "string3"}
    ]);

    record{|C2...;|}[]|csv:Error r5a = csv:parseString( string `a,b,c,d
                                        1,string,true,string
                                        2,string2,false,string2
                                        3,string3,true,string3`);

    test:assertEquals(r5a , [
        {a: "1", b: "string", c: true, d: "string"},
        {a: "2", b: "string2", c: false, d: "string2"},
        {a: "3", b: "string3", c: true, d: "string3"}
    ]);

    [readonly & int, readonly & string, (readonly & boolean) | (readonly & decimal)][]|csv:Error r16a = 
    csv:parseString( string `a,b,c
                                        1,string,true
                                        2,string2,false
                                        3,string3,true`);

    test:assertEquals(r16a , [
        [1, "string", true],
        [2, "string2", false],
        [3, "string3", true]
    ]);

    [A, B, C][]|csv:Error r17a = csv:parseString(
        string `a,b,c
                                        1,string,true
                                        2,string2,false
                                        3,string3,true`);

    test:assertEquals(r17a , [
        [1, "string", true],
        [2, "string2", false],
        [3, "string3", true]
    ]);

    [A2, B2, C2][]|csv:Error r18a = csv:parseString(
        string `a,b,c
                                        1,string,true
                                        2,string2,false
                                        3,string3,true`);

    test:assertEquals(r18a , [
        [1, "string", true],
        [2, "string2", false],
        [3, "string3", true]
    ]);

    [A2, B2, C2...][]|csv:Error r19a = csv:parseString(
        string `a,b,c,d
                                        1,string,true,string
                                        2,string2,false,string2
                                        3,string3,true,string3`);

    test:assertEquals(r19a , [
        [1, "string", true, "string"],
        [2, "string2", false, "string2"],
        [3, "string3", true, "string3"]
    ]);

    [C2...][]|csv:Error r20a = csv:parseString(
        string `a,b,c,d
                                        1,string,true,string
                                        2,string2,false,string2
                                        3,string3,true,string3`);

    test:assertEquals(r20a, [["1", "string",true, "string"], 
        ["2", "string2", false, "string2"], ["3", "string3",true, "string3"]]);


    record{A a; B b; C c;}[]|csv:Error rt2a = csv:transform(
        [{"a": 1, "b": "string", "c": true}, {"a": 2, "b": "string2", "c": false}, {"a": 3, "b": "string3", "c": true}]);

    test:assertEquals(rt2a , [
        {a: <decimal>1, b: "string", c: true},
        {a: <decimal>2, b: "string2", c: false},
        {a: <decimal>3, b: "string3", c: true}
    ]);

    record{
        readonly & int a; 
        readonly & string b; 
        (readonly & boolean) | (readonly & decimal) c;
    }[]|csv:Error rt1a = csv:transform(
        [{"a": 1, "b": "string", "c": true}, {"a": 2, "b": "string2", "c": false}, {"a": 3, "b": "string3", "c": true}]);

    test:assertEquals(rt1a , [
        {a: 1, b: "string", c: true},
        {a: 2, b: "string2", c: false},
        {a: 3, b: "string3", c: true}
    ]);

    record{A2 a; B2 b; C2 c;}[]|csv:Error rt3a = csv:transform(
        [{"a": 1, "b": "string", "c": true}, {"a": 2, "b": "string2", "c": false}, {"a": 3, "b": "string3", "c": true}]);

    test:assertEquals(rt3a , [
        {a: <int>1, b: "string", c: true},
        {a: <int>2, b: "string2", c: false},
        {a: <int>3, b: "string3", c: true}
    ]);

    record{|A2 a; B2 b; C2...;|}[]|csv:Error rt4a = csv:transform(
        [{"a": 1, "b": "string", "c": true, "d": "string"}, {"a": 2, "b": "string2", "c": false, "d": "string2"}, {"a": 3, "b": "string3", "c": true, "d": "string3"}]);

    test:assertEquals(rt4a , [
        {a: <int>1, b: "string", c: true, d: "string"},
        {a: <int>2, b: "string2", c: false, d: "string2"},
        {a: <int>3, b: "string3", c: true, d: "string3"}
    ]);

    record{|C2...;|}[]|csv:Error rt5a = csv:transform(
        [{"a": 1, "b": "string", "c": true, "d": "string"}, {"a": 2, "b": "string2", "c": false, "d": "string2"}, {"a": 3, "b": "string3", "c": true, "d": "string3"}]);

    test:assertEquals(rt5a , [
        {b: "string", c: true, d: "string"},
        {b: "string2", c: false, d: "string2"},
        {b: "string3", c: true, d: "string3"}
    ]);

    [readonly & int, readonly & string, (readonly & boolean) | (readonly & decimal)][]|csv:Error rt6a = 
    csv:transform(
        [{"a": 1, "b": "string", "c": true}, 
        {"a": 2, "b": "string2", "c": false}, 
        {"a": 3, "b": "string3", "c": true}
    ], {headersOrder: ["a", "b", "c"]});

    test:assertEquals(rt6a , [
        [1, "string", true],
        [2, "string2", false],
        [3, "string3", true]
    ]);

    [A, B, C][]|csv:Error rt7a = csv:transform(
        [{"a": 1, "b": "string", "c": true}, {"a": 2, "b": "string2", "c": false}, {"a": 3, "b": "string3", "c": true}]
        , {headersOrder: ["a", "b", "c"]});

    test:assertEquals(rt7a , [
        [<decimal>1, "string", true],
        [<decimal>2, "string2", false],
        [<decimal>3, "string3", true]
    ]);

    [A2, B2, C2][]|csv:Error rt8a = csv:transform(
        [{"a": 1, "b": "string", "c": true}, {"a": 2, "b": "string2", "c": false}, {"a": 3, "b": "string3", "c": true}]
        , {headersOrder: ["a", "b", "c"]});

    test:assertEquals(rt8a , [
        [<int>1, "string", true],
        [<int>2, "string2", false],
        [<int>3, "string3", true]
    ]);

    [A2, B2, C2...][]|csv:Error rt9a = csv:transform(
        [{"a": 1, "b": "string", "c": true, "d": "string"}, {"a": 2, "b": "string2", "c": false, "d": "string2"}, {"a": 3, "b": "string3", "c": true, "d": "string3"}]
        , {headersOrder: ["a", "b", "c", "d"]});

    test:assertEquals(rt9a , [
        [<int>1, "string", true, "string"],
        [<int>2, "string2", false, "string2"],
        [<int>3, "string3", true, "string3"]
    ]);

    [C2...][]|csv:Error rt10a = csv:transform(
        [{"a": 1, "b": "string", "c": true, "d": "string"}, {"a": 2, "b": "string2", "c": false, "d": "string2"}, {"a": 3, "b": "string3", "c": true, "d": "string3"}]
        , {headersOrder: ["a", "b", "c", "d"]});

    test:assertTrue(rt10a is csv:Error);
    test:assertEquals((<csv:Error>rt10a).message(), common:generateErrorMessageForInvalidValueForArrayType("1", "0", "type_compatible_tests:C2"));

        record{
        readonly & int a; 
        readonly & string b; 
        (readonly & boolean) | (readonly & decimal) c;
    }[]|csv:Error rt11a = csv:parseList(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]], {customHeaders: ["a", "b", "c"]});

    test:assertEquals(rt11a , [
        {a: 1, b: "string", c: true},
        {a: 2, b: "string2", c: false},
        {a: 3, b: "string3", c: true}
    ]);

    record{A a; B b; C c;}[]|csv:Error rt12a = csv:parseList(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]], {customHeaders: ["a", "b", "c"]});

    test:assertEquals(rt12a , [
        {a: 1, b: "string", c: true},
        {a: 2, b: "string2", c: false},
        {a: 3, b: "string3", c: true}
    ]);

    record{A a; B b; C c;}[]|csv:Error rt12a_2 = csv:parseList(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]], {customHeaders: ["a", "b", "c"], stringConversion: false});

    test:assertTrue(rt12a_2 is csv:Error);
    test:assertEquals((<csv:Error>rt12a_2).message(), 
        common:generateErrorMessageForInvalidFieldType("1", "a"));

    record{string|decimal a; B b; C c;}[]|csv:Error rt12a_3 = csv:parseList(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]], {customHeaders: ["a", "b", "c"]});

    test:assertEquals(rt12a_3 , [
        {a: <decimal>1, b: "string", c: true},
        {a: <decimal>2, b: "string2", c: false},
        {a: <decimal>3, b: "string3", c: true}
    ]);

    record{A2 a; B2 b; C2 c;}[]|csv:Error rt13a = csv:parseList(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]], {customHeaders: ["a", "b", "c"]});

    test:assertEquals(rt13a , [
        {a: <int>1, b: "string", c: true},
        {a: <int>2, b: "string2", c: false},
        {a: <int>3, b: "string3", c: true}
    ]);

    record{|A2 a; B2 b; C2...;|}[]|csv:Error rt14a = csv:parseList(
        [["1", "string", "true", "string"], ["2", "string2", "false", "string2"], ["3", "string3", "true", "string3"]]
        , {customHeaders: ["a", "b", "c", "d"]});

    test:assertEquals(rt14a , [
        {a: <int>1, b: "string", c: true, d: "string"},
        {a: <int>2, b: "string2", c: false, d: "string2"},
        {a: <int>3, b: "string3", c: true, d: "string3"}
    ]);

    record{|C2...;|}[]|csv:Error rt15a = csv:parseList(
        [["1", "string", "true", "string"], ["2", "string2", "false", "string2"], ["3", "string3", "true", "string3"]]
        , {customHeaders: ["a", "b", "c", "d"]});

    test:assertEquals(rt15a , [
        {a: "1", b: "string", c: true, d: "string"},
        {a: "2", b: "string2", c: false, d: "string2"},
        {a: "3", b: "string3", c: true, d: "string3"}
    ]);

    record{|C2...;|}[]|csv:Error rt15a_2 = csv:parseList(
        [["1", "string", "true", "string"], ["2", "string2", "false", "string2"], ["3", "string3", "true", "string3"]], 
        {stringConversion: false, customHeaders: ["a", "b", "c", "d"]});

    test:assertEquals(rt15a_2 , [
        {a: "1", b: "string", c: "true", d: "string"},
        {a: "2", b: "string2", c: "false", d: "string2"},
        {a: "3",b: "string3", c: "true", d: "string3"}
    ]);

    [readonly & int, readonly & string, (readonly & boolean) | (readonly & decimal)][]|csv:Error rt16a = 
    csv:parseList(
        [["1", "string", "true"], 
        ["2", "string2", "false"], 
        ["3", "string3", "true"]]);

    test:assertEquals(rt16a , [
        [1, "string", true],
        [2, "string2", false],
        [3, "string3", true]
    ]);

    [A, B, C][]|csv:Error rt17a = csv:parseList(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]]);

    test:assertEquals(rt17a , [
        [1, "string", true],
        [2, "string2", false],
        [3, "string3", true]
    ]);

    [A, B, C][]|csv:Error rt17a_2 = csv:parseList(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]], {stringConversion: false});

    test:assertTrue(rt17a_2 is csv:Error);
    test:assertEquals((<error>rt17a_2).message(), common:generateErrorMessageForInvalidValueForArrayType("1", "0", "type_compatible_tests:A"));

    [A2, B2, C2][]|csv:Error rt18a = csv:parseList(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]]);

    test:assertEquals(rt18a , [
        [<int>1, "string", true],
        [<int>2, "string2", false],
        [<int>3, "string3", true]
    ]);

    [A2, B2, C2...][]|csv:Error rt19a = csv:parseList(
        [["1", "string", "true", "string"], ["2", "string2", "false", "string2"], ["3", "string3", "true", "string3"]]);

    test:assertEquals(rt19a , [
        [<int>1, "string", true, "string"],
        [<int>2, "string2", false, "string2"],
        [<int>3, "string3", true, "string3"]
    ]);

    [C2...][]|csv:Error rt20a = csv:parseList(
        [["1", "string", "true", "string"], ["2", "string2", "false", "string2"], ["3", "string3", "true", "string3"]]);

    test:assertEquals(rt20a, [["1", "string",true, "string"], 
        ["2", "string2", false, "string2"], ["3", "string3",true, "string3"]]);
}