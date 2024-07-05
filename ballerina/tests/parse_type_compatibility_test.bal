import ballerina/test;

@test:Config
function testFromCsvWithTypeFunctionWithTypeCompatibility() {
    var value = {i1, i2, s1, s2, b1, b2, n1, n2, f1, f2, d1, d2, j1: b1, a1: d1, j2: b2, a2: d2};
    var value2 = {i1, s1, b1, n1, f1, d1, j1: b1, a1: d1, s2, s3, j2: b2, a2: d2};
    var value3 = {i1, s1, b1, n1, f1, d1, j1: b1, a1: d1, s2, s3};

    CustomRecord27Array|Error vcr27a = parseRecordAsRecordType([value, value, value], {}, CustomRecord27Array);
    test:assertEquals(vcr27a , [
        {i1, s1, s2, b1, n1, f1, d1, j1: b1, a1: d1, defaultableField: "", nillableField: ()},
        {i1, s1, s2, b1, n1, f1, d1, j1: b1, a1: d1, defaultableField: "", nillableField: ()},
        {i1, s1, s2, b1, n1, f1, d1, j1: b1, a1: d1, defaultableField: "", nillableField: ()}
    ]);

    AnydataMapArray|Error vanydma = parseRecordAsRecordType([value, value, value], {}, AnydataMapArray);
    test:assertEquals(vanydma , [
        value,
        value,
        value
    ]);

    JsonMapArray|Error vjma = parseRecordAsRecordType([value, value, value], {}, JsonMapArray);
    test:assertEquals(vjma , [
        value,
        value,
        value
    ]);

    record{|int...;|}[]|Error irrma = parseRecordAsRecordType([{"a": 1}, {"a": i1, "b": i2}, {"a": i1, "b": i2, "c": s1}]);
    test:assertEquals(irrma , [
        {a:1},
        {a: i1, b: i2},
        {a: i1, b: i2}
    ]);

    record{|decimal...;|}[]|Error drra = parseRecordAsRecordType([{"a": d1}, {"a": d2, "b": d3}, {"a": d4, "b": f2, "c": s1, "d": f3}]);
    test:assertTrue(drra is record{|decimal...;|}[]);
    test:assertEquals(drra , [
        {a: d1},
        {a: d2, b: d3},
        {a: d4, b: -3.21d, d: <decimal>f3}
    ]);

    record{|string...;|}[]|Error srra = parseRecordAsRecordType([{"a": "string"}, {"c": 1, "a": s1, "b": s2}, {"a": b1, "b": s3, "c": d1}]);
    test:assertEquals(srra , [
        {a: "string"},
        {a: s1, b: s2},
        {b: s3}
    ]);

    record{|float...;|}[]|Error frra = parseRecordAsRecordType([{"a": 1.2, "b": 1.2f}, {"a": d2, "b": d3}, {"a": d4, "b": f2, "c": s1}]);
    test:assertEquals(frra , [
        {a: 1.2, b: 1.2},
        {a: <float>d2, b: <float>d3},
        {a: <float>d4, b: f2}
    ]);

    record{|float a; decimal b;|}[]|Error fdc1a = parseRecordAsRecordType([{"a": d1, "b": d2}, {"a": f1, "b": f2}, {"a": d2, "b": f2}, {"a": f2, "b": d2}]);
    test:assertEquals(fdc1a , [
        {a: <float>d1, b: d2}, 
        {a: f1, b: <decimal>f2}, 
        {a: <float>d2, b: <decimal>f2}, 
        {a: f2, b: d2}
    ]);

    record{|float a; decimal ...;|}[]|Error fdc2a = parseRecordAsRecordType([{"a": d1, "b": d2}, {"a": f1, "b": f2}, {"a": d2, "b": f2}, {"a": f2, "b": d2}]);
    test:assertEquals(fdc2a , [
        {a: <float>d1, b: d2}, 
        {a: f1, b: <decimal>f2}, 
        {a: <float>d2, b: <decimal>f2}, 
        {a: f2, b: d2}
    ]);

    record{|decimal b; float...;|}[]|Error fdc3a = parseRecordAsRecordType([{"a": d1, "b": d2}, {"a": f1, "b": f2}, {"a": d2, "b": f2}, {"a": f2, "b": d2}]);
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
    }[]|Error r1a = parseStringToRecord( string `a,b,c
                                        1,string,true
                                        2,string2,false
                                        3,string3,true`);

    test:assertEquals(r1a , [
        {a: 1, b: "string", c: true},
        {a: 2, b: "string2", c: false},
        {a: 3, b: "string3", c: true}
    ]);

    record{A a; B b; C c;}[]|Error r2a = parseStringToRecord( string `a,b,c
                                        1,string,true
                                        2,string2,false
                                        3,string3,true`);

    test:assertEquals(r2a , [
        {a: 1, b: "string", c: true},
        {a: 2, b: "string2", c: false},
        {a: 3, b: "string3", c: true}
    ]);

    record{A2 a; B2 b; C2 c;}[]|Error r3a = parseStringToRecord( string `a,b,c
                                        1,string,true
                                        2,string2,false
                                        3,string3,true`);

    test:assertEquals(r3a , [
        {a: 1, b: "string", c: true},
        {a: 2, b: "string2", c: false},
        {a: 3, b: "string3", c: true}
    ]);

    record{|A2 a; B2 b; C2...;|}[]|Error r4a = parseStringToRecord( string `
                                        a,b,c,d
                                        1,string,true,string
                                        2,string2,false,string2
                                        3,string3,true,string3`, {header: 1});

    test:assertEquals(r4a , [
        {a: 1, b: "string", c: true, d: "string"},
        {a: 2, b: "string2", c: false, d: "string2"},
        {a: 3, b: "string3", c: true, d: "string3"}
    ]);

    record{|C2...;|}[]|Error r5a = parseStringToRecord( string `a,b,c,d
                                        1,string,true,string
                                        2,string2,false,string2
                                        3,string3,true,string3`);

    test:assertEquals(r5a , [
        {a: "1", b: "string", c: true, d: "string"},
        {a: "2", b: "string2", c: false, d: "string2"},
        {a: "3", b: "string3", c: true, d: "string3"}
    ]);

    [readonly & int, readonly & string, (readonly & boolean) | (readonly & decimal)][]|Error r16a = 
    parseStringToList( string `a,b,c
                                        1,string,true
                                        2,string2,false
                                        3,string3,true`);

    test:assertEquals(r16a , [
        [1, "string", true],
        [2, "string2", false],
        [3, "string3", true]
    ]);

    [A, B, C][]|Error r17a = parseStringToList(
        string `a,b,c
                                        1,string,true
                                        2,string2,false
                                        3,string3,true`);

    test:assertEquals(r17a , [
        [1, "string", true],
        [2, "string2", false],
        [3, "string3", true]
    ]);

    [A2, B2, C2][]|Error r18a = parseStringToList(
        string `a,b,c
                                        1,string,true
                                        2,string2,false
                                        3,string3,true`);

    test:assertEquals(r18a , [
        [1, "string", true],
        [2, "string2", false],
        [3, "string3", true]
    ]);

    [A2, B2, C2...][]|Error r19a = parseStringToList(
        string `a,b,c,d
                                        1,string,true,string
                                        2,string2,false,string2
                                        3,string3,true,string3`);

    test:assertEquals(r19a , [
        [1, "string", true, "string"],
        [2, "string2", false, "string2"],
        [3, "string3", true, "string3"]
    ]);

    [C2...][]|Error r20a = parseStringToList(
        string `a,b,c,d
                                        1,string,true,string
                                        2,string2,false,string2
                                        3,string3,true,string3`);

    test:assertEquals(r20a, [["1", "string",true, "string"], 
        ["2", "string2", false, "string2"], ["3", "string3",true, "string3"]]);


    record{A a; B b; C c;}[]|Error rt2a = parseRecordAsRecordType(
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
    }[]|Error rt1a = parseRecordAsRecordType(
        [{"a": 1, "b": "string", "c": true}, {"a": 2, "b": "string2", "c": false}, {"a": 3, "b": "string3", "c": true}]);

    test:assertEquals(rt1a , [
        {a: 1, b: "string", c: true},
        {a: 2, b: "string2", c: false},
        {a: 3, b: "string3", c: true}
    ]);

    record{A2 a; B2 b; C2 c;}[]|Error rt3a = parseRecordAsRecordType(
        [{"a": 1, "b": "string", "c": true}, {"a": 2, "b": "string2", "c": false}, {"a": 3, "b": "string3", "c": true}]);

    test:assertEquals(rt3a , [
        {a: <int>1, b: "string", c: true},
        {a: <int>2, b: "string2", c: false},
        {a: <int>3, b: "string3", c: true}
    ]);

    record{|A2 a; B2 b; C2...;|}[]|Error rt4a = parseRecordAsRecordType(
        [{"a": 1, "b": "string", "c": true, "d": "string"}, {"a": 2, "b": "string2", "c": false, "d": "string2"}, {"a": 3, "b": "string3", "c": true, "d": "string3"}]);

    test:assertEquals(rt4a , [
        {a: <int>1, b: "string", c: true, d: "string"},
        {a: <int>2, b: "string2", c: false, d: "string2"},
        {a: <int>3, b: "string3", c: true, d: "string3"}
    ]);

    record{|C2...;|}[]|Error rt5a = parseRecordAsRecordType(
        [{"a": 1, "b": "string", "c": true, "d": "string"}, {"a": 2, "b": "string2", "c": false, "d": "string2"}, {"a": 3, "b": "string3", "c": true, "d": "string3"}]);

    test:assertEquals(rt5a , [
        {b: "string", c: true, d: "string"},
        {b: "string2", c: false, d: "string2"},
        {b: "string3", c: true, d: "string3"}
    ]);

    [readonly & int, readonly & string, (readonly & boolean) | (readonly & decimal)][]|Error rt6a = 
    parseRecordAsListType(
        [{"a": 1, "b": "string", "c": true}, 
        {"a": 2, "b": "string2", "c": false}, 
        {"a": 3, "b": "string3", "c": true}
    ], ["a", "b", "c"]);

    test:assertEquals(rt6a , [
        [1, "string", true],
        [2, "string2", false],
        [3, "string3", true]
    ]);

    [A, B, C][]|Error rt7a = parseRecordAsListType(
        [{"a": 1, "b": "string", "c": true}, {"a": 2, "b": "string2", "c": false}, {"a": 3, "b": "string3", "c": true}]
        , ["a", "b", "c"]);

    test:assertEquals(rt7a , [
        [<decimal>1, "string", true],
        [<decimal>2, "string2", false],
        [<decimal>3, "string3", true]
    ]);

    [A2, B2, C2][]|Error rt8a = parseRecordAsListType(
        [{"a": 1, "b": "string", "c": true}, {"a": 2, "b": "string2", "c": false}, {"a": 3, "b": "string3", "c": true}]
        , ["a", "b", "c"]);

    test:assertEquals(rt8a , [
        [<int>1, "string", true],
        [<int>2, "string2", false],
        [<int>3, "string3", true]
    ]);

    [A2, B2, C2...][]|Error rt9a = parseRecordAsListType(
        [{"a": 1, "b": "string", "c": true, "d": "string"}, {"a": 2, "b": "string2", "c": false, "d": "string2"}, {"a": 3, "b": "string3", "c": true, "d": "string3"}]
        , ["a", "b", "c", "d"]);

    test:assertEquals(rt9a , [
        [<int>1, "string", true, "string"],
        [<int>2, "string2", false, "string2"],
        [<int>3, "string3", true, "string3"]
    ]);

    [C2...][]|Error rt10a = parseRecordAsListType(
        [{"a": 1, "b": "string", "c": true, "d": "string"}, {"a": 2, "b": "string2", "c": false, "d": "string2"}, {"a": 3, "b": "string3", "c": true, "d": "string3"}]
        , ["a", "b", "c", "d"]);

    test:assertTrue(rt10a is Error);
    test:assertEquals((<Error>rt10a).message(), generateErrorMessageForInvalidValueForArrayType("1", "0", "data.csv:C2"));

        record{
        readonly & int a; 
        readonly & string b; 
        (readonly & boolean) | (readonly & decimal) c;
    }[]|Error rt11a = parseListAsRecordType(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]], ["a", "b", "c"]);

    test:assertEquals(rt11a , [
        {a: 1, b: "string", c: true},
        {a: 2, b: "string2", c: false},
        {a: 3, b: "string3", c: true}
    ]);

    record{A a; B b; C c;}[]|Error rt12a = parseListAsRecordType(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]], ["a", "b", "c"]);

    test:assertEquals(rt12a , [
        {a: 1, b: "string", c: true},
        {a: 2, b: "string2", c: false},
        {a: 3, b: "string3", c: true}
    ]);

    record{A a; B b; C c;}[]|Error rt12a_2 = parseListAsRecordType(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]], ["a", "b", "c"], {stringConversion: false});

    test:assertTrue(rt12a_2 is Error);
    test:assertEquals((<Error>rt12a_2).message(), 
        generateErrorMessageForInvalidFieldType("1", "a"));

    record{string|decimal a; B b; C c;}[]|Error rt12a_3 = parseListAsRecordType(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]], ["a", "b", "c"]);

    test:assertEquals(rt12a_3 , [
        {a: <decimal>1, b: "string", c: true},
        {a: <decimal>2, b: "string2", c: false},
        {a: <decimal>3, b: "string3", c: true}
    ]);

    record{A2 a; B2 b; C2 c;}[]|Error rt13a = parseListAsRecordType(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]], ["a", "b", "c"]);

    test:assertEquals(rt13a , [
        {a: <int>1, b: "string", c: true},
        {a: <int>2, b: "string2", c: false},
        {a: <int>3, b: "string3", c: true}
    ]);

    record{|A2 a; B2 b; C2...;|}[]|Error rt14a = parseListAsRecordType(
        [["1", "string", "true", "string"], ["2", "string2", "false", "string2"], ["3", "string3", "true", "string3"]]
        , ["a", "b", "c", "d"]);

    test:assertEquals(rt14a , [
        {a: <int>1, b: "string", c: true, d: "string"},
        {a: <int>2, b: "string2", c: false, d: "string2"},
        {a: <int>3, b: "string3", c: true, d: "string3"}
    ]);

    record{|C2...;|}[]|Error rt15a = parseListAsRecordType(
        [["1", "string", "true", "string"], ["2", "string2", "false", "string2"], ["3", "string3", "true", "string3"]]
        , ["a", "b", "c", "d"]);

    test:assertEquals(rt15a , [
        {a: "1", b: "string", c: true, d: "string"},
        {a: "2", b: "string2", c: false, d: "string2"},
        {a: "3", b: "string3", c: true, d: "string3"}
    ]);

    record{|C2...;|}[]|Error rt15a_2 = parseListAsRecordType(
        [["1", "string", "true", "string"], ["2", "string2", "false", "string2"], ["3", "string3", "true", "string3"]]
        , ["a", "b", "c", "d"], {stringConversion: false});

    test:assertEquals(rt15a_2 , [
        {a: "1", b: "string", c: "true", d: "string"},
        {a: "2", b: "string2", c: "false", d: "string2"},
        {a: "3",b: "string3", c: "true", d: "string3"}
    ]);

    [readonly & int, readonly & string, (readonly & boolean) | (readonly & decimal)][]|Error rt16a = 
    parseListAsListType(
        [["1", "string", "true"], 
        ["2", "string2", "false"], 
        ["3", "string3", "true"]]);

    test:assertEquals(rt16a , [
        [1, "string", true],
        [2, "string2", false],
        [3, "string3", true]
    ]);

    [A, B, C][]|Error rt17a = parseListAsListType(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]]);

    test:assertEquals(rt17a , [
        [1, "string", true],
        [2, "string2", false],
        [3, "string3", true]
    ]);

    [A, B, C][]|Error rt17a_2 = parseListAsListType(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]], {stringConversion: false});

    test:assertTrue(rt17a_2 is Error);
    test:assertEquals((<error>rt17a_2).message(), generateErrorMessageForInvalidValueForArrayType("1", "0", "data.csv:A"));

    [A2, B2, C2][]|Error rt18a = parseListAsListType(
        [["1", "string", "true"], ["2", "string2", "false"], ["3", "string3", "true"]]);

    test:assertEquals(rt18a , [
        [<int>1, "string", true],
        [<int>2, "string2", false],
        [<int>3, "string3", true]
    ]);

    [A2, B2, C2...][]|Error rt19a = parseListAsListType(
        [["1", "string", "true", "string"], ["2", "string2", "false", "string2"], ["3", "string3", "true", "string3"]]);

    test:assertEquals(rt19a , [
        [<int>1, "string", true, "string"],
        [<int>2, "string2", false, "string2"],
        [<int>3, "string3", true, "string3"]
    ]);

    [C2...][]|Error rt20a = parseListAsListType(
        [["1", "string", "true", "string"], ["2", "string2", "false", "string2"], ["3", "string3", "true", "string3"]]);

    test:assertEquals(rt20a, [["1", "string",true, "string"], 
        ["2", "string2", false, "string2"], ["3", "string3",true, "string3"]]);
}