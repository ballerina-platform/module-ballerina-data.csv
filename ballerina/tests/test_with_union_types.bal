import ballerina/test;

// boolean enable = true;

// @test:Config {enable: !enable}
// function debugTest() returns error? {
//     record{int a; string b; boolean c; decimal d; float e; () f;}[] value = [
//         {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
//         {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
//         {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
//         {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
//         {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
//     ];

//     RecA[]|RecC[]|Error csv1op1 = parseStringToRecord(csvStringData1, {header: 1});
// }

type RecA record {int a; string b; boolean c; decimal d; float e; () f;};
type RecB record {|string...;|};
type RecC record {int a; int b; int c;};
type TupA [int, string, boolean, decimal, float, ()];
type TupB [int...];
type TupC [int, int, int];

@test:Config {enable}
function testParseToStringWithUnionExpectedTypes() returns error? {
    // TODO: Fix with tests RecA[]|RecC[]
    (RecA|RecC)[]|Error csv1op1 = parseStringToRecord(csvStringData1, {header: 1});
    test:assertEquals(csv1op1, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecA|RecC)[]|Error csv1op2 = parseStringToRecord(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertTrue(csv1op2 is (RecA|RecC)[]);
    test:assertEquals(csv1op2, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecC|RecA)[]|Error csv1op3 = parseStringToRecord(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecB|RecA)[]|Error csv1op4 = parseStringToRecord(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3", f: "()"}
    ]);

    (RecA|RecB)[]|Error csv1op5 = parseStringToRecord(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (record{|int a;|}|record{|string b;|})[]|Error csv1op6 = parseStringToRecord(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        {a: 1},
        {a: 3},
        {a: 5}
    ]);

    (record{|string b;|}|record{|int a;|})[]|Error csv1op7 = parseStringToRecord(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    (record{|string...;|}|record{|int...;|})[]|Error csv1op8 = parseStringToRecord(csvStringData1, {header: 1});
    test:assertEquals(csv1op8, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "2", b: "string2", c: "false", d: "0", e: "0", f: "null"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "4", b: "string4", c: "true", d: "-6.51", e: "-6.51", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3", f: "()"}
    ]);

    (record{|int...;|}|record{|string...;|})[]|Error csv1op9 = parseStringToRecord(csvStringData1, {header: 1});
    test:assertEquals(csv1op9, [
        {a: 1},
        {a: 2, d: 0, e: 0},
        {a: 3},
        {a: 4},
        {a: 5, d: 3, e: 3}
    ]);

    (record{|int a; string...;|}|record{|string a; int...;|})[]|Error csv1op10 = parseStringToRecord(csvStringData1, {header: 1});
    test:assertEquals(csv1op10, [
        {a: 1, b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: 2, b: "string2", c: "false", d: "0", e: "0", f: "null"},
        {a: 3, b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: 4, b: "string4", c: "true", d: "-6.51", e: "-6.51", f: "()"},
        {a: 5, b: "string5", c: "true", d: "3", e: "3", f: "()"}
    ]);

    (record{|string a; int...;|}|record{|int a; string...;|})[]|Error csv1op11 = parseStringToRecord(csvStringData1, {header: 1});
    test:assertEquals(csv1op11, [
        {a: "1"},
        {a: "2", d: 0, e: 0},
        {a: "3"},
        {a: "4"},
        {a: "5", d: 3, e: 3}
    ]);

    (record{|int a; int b;|}|record{|string a; string...;|})[]|Error csv1op12 = parseStringToRecord(string `
                                                                                                                        a,b
                                                                                                                        1, 2
                                                                                                                        a, b`, {header: 1});
    test:assertEquals(csv1op12, [
        {a: 1, b: 2},
        {a: "a", b: "b"}
    ]);

    ([int, int]|[string, string])[]|Error csv1op13 = parseStringToList(string `
                                                                                                                        a,b
                                                                                                                        1, 2
                                                                                                                        a, b`, {header: 1});
    test:assertEquals(csv1op13, [
        [1, 2],
        ["a", "b"]
    ]);
}

@test:Config {enable}
function testParseToStringWithUnionExpectedTypes2() returns error? {
    record{int a; string b; boolean c; decimal d; float e; () f;}[] value = [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ];

    (RecA|RecC)[]|Error csv1op1 = parseRecordAsRecordType(value, {});
    test:assertEquals(csv1op1, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecA|RecC)[]|Error csv1op2 = parseRecordAsRecordType(value, {skipLines: [2, 4]});
    test:assertTrue(csv1op2 is (RecA|RecC)[]);
    test:assertEquals(csv1op2, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecC|RecA)[]|Error csv1op3 = parseRecordAsRecordType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecB|RecA)[]|Error csv1op4 = parseRecordAsRecordType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    (RecA|RecB)[]|Error csv1op5 = parseRecordAsRecordType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (record{|int a;|}|record{|string b;|})[]|Error csv1op6 = parseRecordAsRecordType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        {a: 1},
        {a: 3},
        {a: 5}
    ]);

    (record{|string b;|}|record{|int a;|})[]|Error csv1op7 = parseRecordAsRecordType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    (record{|string...;|}|record{|int...;|})[]|Error csv1op8 = parseRecordAsRecordType(value, {});
    test:assertEquals(csv1op8, [
        {b: "string1"},
        {b: "string2"},
        {b: "string3"},
        {b: "string4"},
        {b: "string5"}
    ]);

    (record{|int...;|}|record{|string...;|})[]|Error csv1op9 = parseRecordAsRecordType(value, {});
    test:assertEquals(csv1op9, [
        {a: 1, d: 2, e: 2},
        {a: 2, d: 0, e: 0},
        {a: 3, d: 1, e: 1},
        {a: 4, d: -7, e: -7},
        {a: 5, d: 3, e: 3}
    ]);

    (record{|int a; string...;|}|record{|string a; int...;|})[]|Error csv1op10 = parseRecordAsRecordType(value, {});
    test:assertEquals(csv1op10, [
        {a: 1, b: "string1"},
        {a: 2, b: "string2"},
        {a: 3, b: "string3"},
        {a: 4, b: "string4"},
        {a: 5, b: "string5"}
    ]);

    (record{|string a; int...;|}|record{|int a; string...;|})[]|Error csv1op11 = parseRecordAsRecordType(value, {});
    test:assertEquals(csv1op11, [
        {a: 1, b: "string1"},
        {a: 2, b: "string2"},
        {a: 3, b: "string3"},
        {a: 4, b: "string4"},
        {a: 5, b: "string5"}
    ]);

    (record{|string a; int...;|}|record{|string a; string...;|})[]|Error csv1op12 = parseRecordAsRecordType(value, {});
    test:assertTrue(csv1op12 is Error);
    test:assertEquals((<Error>csv1op12).message(), "The source value cannot convert in to the '(data.csv:record {| string a; int...; |}|data.csv:record {| string a; string...; |})[]'");

    (record{|int a; int...;|}|record{|string a; string...;|})[]|Error csv1op13 = parseRecordAsRecordType([{"a": 1, "b": 2}, {"a": "a", "b": "b"}], {});
    test:assertEquals(csv1op13, [
        {a: 1, b: 2},
        {a: "a", b: "b"}
    ]);
}

@test:Config {enable}
function testParseToStringWithUnionExpectedTypes3() returns error? {
    string[][] value = [
        ["1", "string1", "true", "2.234", "2.234", "()"],
        ["2", "string2", "false", "0", "0", "()"],
        ["3", "string3", "false", "1.23", "1.23", "()"],
        ["4", "string4", "true", "-6.51", "-6.51", "()"],
        ["5", "string5", "true", "3", "3.0", "()"]
    ];

    (RecA|RecC)[]|Error csv1op1 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertEquals(csv1op1, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecA|RecC)[]|Error csv1op2 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertTrue(csv1op2 is (RecA|RecC)[]);
    test:assertEquals(csv1op2, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecC|RecA)[]|Error csv1op3 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (RecB|RecA)[]|Error csv1op4 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3.0", f: "()"}
    ]);

    (RecA|RecB)[]|Error csv1op5 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    (record{|int a;|}|record{|string b;|})[]|Error csv1op6 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        {a: 1},
        {a: 3},
        {a: 5}
    ]);

    (record{|string b;|}|record{|int a;|})[]|Error csv1op7 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    (record{|string...;|}|record{|int...;|})[]|Error csv1op8 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [4, 2]});
    test:assertEquals(csv1op8, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3.0", f: "()"}
    ]);

    (record{|int...;|}|record{|string...;|})[]|Error csv1op9 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {stringConversion: true});
    test:assertEquals(csv1op9, [
        {a: 1},
        {a: 2, d: 0, e: 0},
        {a: 3},
        {a: 4},
        {a: 5, d: 3}
    ]);

    (record{|int...;|}|record{|string...;|})[]|Error csv1op9_2 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {stringConversion: false});
    test:assertEquals(csv1op9_2, [
        {},
        {},
        {},
        {},
        {}
    ]);

    (record{|int a; string...;|}|record{|string a; int...;|})[]|Error csv1op10 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, -1, 4]});
    test:assertEquals(csv1op10, [
        {a: 1, b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: 3, b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: 5, b: "string5", c: "true", d: "3", e: "3.0", f: "()"}
    ]);

    (record{|string a; int...;|}|record{|int a; string...;|})[]|Error csv1op11 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertEquals(csv1op11, [
        {a: "1"},
        {a: "2", d: 0, e: 0},
        {a: "3"},
        {a: "4"},
        {a: "5", d: 3}
    ]);

// Error Message is Wrong, Needs to check
    (record{|int a; int...;|}|record{|int a; string...;|})[]|Error csv1op12 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {stringConversion: false});
    test:assertTrue(csv1op12 is Error);
    test:assertEquals((<Error>csv1op12).message(), "The source value cannot convert in to the '(data.csv:record {| int a; int...; |}|data.csv:record {| int a; string...; |})[]'");

    (record{|int a; int...;|}|record{|string a; string...;|})[]|Error csv1op13 = parseListAsRecordType([["1", "2"], ["a", "b"]], ["a", "b"], {});
    test:assertEquals(csv1op13, [
        {a: 1, b: 2},
        {a: "a", b: "b"}
    ]);
}


@test:Config {enable}
function testParseToStringWithUnionExpectedTypes4() returns error? {
    record{int a; string b; boolean c; decimal d; float e; () f;}[] value = [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ];

    (TupA|TupC)[]|Error csv1op1 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertEquals(csv1op1, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [2, "string2", false, <decimal>0, <float>0, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupA|TupC)[]|Error csv1op2 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertTrue(csv1op2 is (TupA|TupC)[]);
    test:assertEquals(csv1op2, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupC|TupA)[]|Error csv1op3 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupB|TupA)[]|Error csv1op4 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    // TODO: Change the Error Message
    (TupB|[boolean])[]|Error csv1op4_2 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertTrue(csv1op4_2 is Error);
    test:assertEquals((<Error>csv1op4_2).message(), "The source value cannot convert in to the '(data.csv:TupB|[boolean])[]'");

    (TupA|TupB)[]|Error csv1op5 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    ([int]|[string])[]|Error csv1op6 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        [1],
        [3],
        [5]
    ]);

    ([string]|[int])[]|Error csv1op7 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        [1],
        [3],
        [5]
    ]);

    ([string...]|[int...])[]|Error csv1op8 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertTrue(csv1op8 is Error);
    test:assertEquals((<Error>csv1op8).message(), "The source value cannot convert in to the '([string...]|[int...])[]'");

    ([int...]|[string...])[]|Error csv1op9 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertTrue(csv1op9 is Error);
    test:assertEquals((<Error>csv1op9).message(), "The source value cannot convert in to the '([int...]|[string...])[]'");

    ([int, string...]|[string, int...])[]|Error csv1op10 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertTrue(csv1op10 is Error);
    test:assertEquals((<Error>csv1op10).message(), "The source value cannot convert in to the '([int,string...]|[string,int...])[]'");

    ([string, int...]|[int, string...])[]|Error csv1op11 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertTrue(csv1op11 is Error);
    test:assertEquals((<Error>csv1op11).message(), "The source value cannot convert in to the '([string,int...]|[int,string...])[]'");

    ([string, int...]|[string, string...])[]|Error csv1op12 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertTrue(csv1op12 is Error);
    test:assertEquals((<Error>csv1op12).message(), "The source value cannot convert in to the '([string,int...]|[string,string...])[]'");

    ([int, int...]|[string, string...])[]|Error csv1op13 = parseRecordAsListType([{"a": 1, "b": 2}, {"a": "a", "b": "b"}], ["a", "b"], {});
    test:assertEquals(csv1op13, [
        [1, 2],
        ["a", "b"]
    ]);
}

@test:Config {enable}
function testParseToStringWithUnionExpectedTypes5() returns error? {
    string[][] value = [
        ["1", "string1", "true", "2.234", "2.234", "()"],
        ["2", "string2", "false", "0", "0", "()"],
        ["3", "string3", "false", "1.23", "1.23", "()"],
        ["4", "string4", "true", "-6.51", "-6.51", "()"],
        ["5", "string5", "true", "3", "3.0", "()"]
    ];

    (TupA|TupC)[]|Error csv1op1 = parseListAsListType(value, {});
    test:assertEquals(csv1op1, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [2, "string2", false, <decimal>0, <float>0, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupA|TupC)[]|Error csv1op2 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertTrue(csv1op2 is (TupA|TupC)[]);
    test:assertEquals(csv1op2, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupC|TupA)[]|Error csv1op3 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    (TupB|TupA)[]|Error csv1op4 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    // TODO: Change the Error Message
    (TupB|[boolean])[]|Error csv1op4_2 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertTrue(csv1op4_2 is Error);
    test:assertEquals((<Error>csv1op4_2).message(), "The source value cannot convert in to the '(data.csv:TupB|[boolean])[]'");

    (TupA|TupB)[]|Error csv1op5 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    ([int]|[string])[]|Error csv1op6 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        [1],
        [3],
        [5]
    ]);

    ([string]|[int])[]|Error csv1op7 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        ["1"],
        ["3"],
        ["5"]
    ]);

    ([boolean...]|[int...])[]|Error csv1op8 = parseListAsListType(value, {stringConversion: false});
    test:assertTrue(csv1op8 is Error);
    test:assertEquals((<Error>csv1op8).message(), "The source value cannot convert in to the '([boolean...]|[int...])[]'");

    ([string...]|[int...])[]|Error csv1op8_2 = parseListAsListType(value, {});
    test:assertEquals(csv1op8_2, value);

    ([int...]|[string...])[]|Error csv1op9 = parseListAsListType(value, {});
    test:assertEquals(csv1op9, value);

    ([int, string...]|[string, int...])[]|Error csv1op10 = parseListAsListType(value, {});
    test:assertEquals(csv1op10, [
        [1, "string1", "true", "2.234", "2.234", "()"],
        [2, "string2", "false", "0", "0", "()"],
        [3, "string3", "false", "1.23", "1.23", "()"],
        [4, "string4", "true", "-6.51", "-6.51", "()"],
        [5, "string5", "true", "3", "3.0", "()"]
    ]);

    ([string, int...]|[int, string...])[]|Error csv1op11 = parseListAsListType(value, {});
    test:assertEquals(csv1op11, [
        [1, "string1", "true", "2.234", "2.234", "()"],
        [2, "string2", "false", "0", "0", "()"],
        [3, "string3", "false", "1.23", "1.23", "()"],
        [4, "string4", "true", "-6.51", "-6.51", "()"],
        [5, "string5", "true", "3", "3.0", "()"]
    ]);

    ([string, int...]|[string, string...])[]|Error csv1op12 = parseListAsListType(value, {});
    test:assertEquals(csv1op12, value);

    ([int, int...]|[string, string...])[]|Error csv1op13 = parseListAsListType([["1", "2"], ["a", "b"]], {});
    test:assertEquals(csv1op13, [
        [1, 2],
        ["a", "b"]
    ]);
}

@test:Config {enable}
function testParseToStringWithUnionExpectedTypes6() returns error? {
    // TODO: Fix with tests RecA[]|RecC[]
    RecA[]|RecC[]|Error csv1op1 = parseStringToRecord(csvStringData1, {header: 1});
    test:assertEquals(csv1op1, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecA[]|RecC[]|Error csv1op2 = parseStringToRecord(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertTrue(csv1op2 is RecA[]|RecC[]);
    test:assertEquals(csv1op2, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecC[]|RecA[]|Error csv1op3 = parseStringToRecord(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecB[]|RecA[]|Error csv1op4 = parseStringToRecord(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3", f: "()"}
    ]);

    RecA[]|RecB[]|Error csv1op5 = parseStringToRecord(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    record{|int a;|}[]|record{|string b;|}[]|Error csv1op6 = parseStringToRecord(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        {a: 1},
        {a: 3},
        {a: 5}
    ]);

    record{|string b;|}[]|record{|int a;|}[]|Error csv1op7 = parseStringToRecord(csvStringData1, {header: 1, skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    record{|string...;|}[]|record{|int...;|}[]|Error csv1op8 = parseStringToRecord(csvStringData1, {header: 1});
    test:assertEquals(csv1op8, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "2", b: "string2", c: "false", d: "0", e: "0", f: "null"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "4", b: "string4", c: "true", d: "-6.51", e: "-6.51", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3", f: "()"}
    ]);

    record{|int...;|}[]|record{|string...;|}[]|Error csv1op9 = parseStringToRecord(csvStringData1, {header: 1});
    test:assertEquals(csv1op9, [
        {a: 1},
        {a: 2, d: 0, e: 0},
        {a: 3},
        {a: 4},
        {a: 5, d: 3, e: 3}
    ]);

    record{|int a; string...;|}[]|record{|string a; int...;|}[]|Error csv1op10 = parseStringToRecord(csvStringData1, {header: 1});
    test:assertEquals(csv1op10, [
        {a: 1, b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: 2, b: "string2", c: "false", d: "0", e: "0", f: "null"},
        {a: 3, b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: 4, b: "string4", c: "true", d: "-6.51", e: "-6.51", f: "()"},
        {a: 5, b: "string5", c: "true", d: "3", e: "3", f: "()"}
    ]);

    record{|string a; int...;|}[]|record{|int a; string...;|}[]|Error csv1op11 = parseStringToRecord(csvStringData1, {header: 1});
    test:assertEquals(csv1op11, [
        {a: "1"},
        {a: "2", d: 0, e: 0},
        {a: "3"},
        {a: "4"},
        {a: "5", d: 3, e: 3}
    ]);

    record{|int a; int b;|}[]|record{|string a; string...;|}[]|Error csv1op12 = parseStringToRecord(string `
                                                                                                                        a,b
                                                                                                                        1, 2
                                                                                                                        a, b`, {header: 1});
    test:assertEquals(csv1op12, [
        {a: "1", b: "2"},
        {a: "a", b: "b"}
    ]);
}

@test:Config {enable}
function testParseToStringWithUnionExpectedTypes7() returns error? {
    record{int a; string b; boolean c; decimal d; float e; () f;}[] value = [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ];

    RecA[]|RecC[]|Error csv1op1 = parseRecordAsRecordType(value, {});
    test:assertEquals(csv1op1, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecA[]|RecC[]|Error csv1op2 = parseRecordAsRecordType(value, {skipLines: [2, 4]});
    test:assertTrue(csv1op2 is RecA[]|RecC[]);
    test:assertEquals(csv1op2, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecC[]|RecA[]|Error csv1op3 = parseRecordAsRecordType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecB[]|RecA[]|Error csv1op4 = parseRecordAsRecordType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    RecA[]|RecB[]|Error csv1op5 = parseRecordAsRecordType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    record{|int a;|}[]|record{|string b;|}[]|Error csv1op6 = parseRecordAsRecordType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        {a: 1},
        {a: 3},
        {a: 5}
    ]);

    record{|string b;|}[]|record{|int a;|}[]|Error csv1op7 = parseRecordAsRecordType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    record{|string...;|}[]|record{|int...;|}[]|Error csv1op8 = parseRecordAsRecordType(value, {});
    test:assertEquals(csv1op8, [
        {b: "string1"},
        {b: "string2"},
        {b: "string3"},
        {b: "string4"},
        {b: "string5"}
    ]);

    record{|int...;|}[]|record{|string...;|}[]|Error csv1op9 = parseRecordAsRecordType(value, {});
    test:assertEquals(csv1op9, [
        {a: 1, d: 2, e: 2},
        {a: 2, d: 0, e: 0},
        {a: 3, d: 1, e: 1},
        {a: 4, d: -7, e: -7},
        {a: 5, d: 3, e: 3}
    ]);

    record{|int a; string...;|}[]|record{|string a; int...;|}[]|Error csv1op10 = parseRecordAsRecordType(value, {});
    test:assertEquals(csv1op10, [
        {a: 1, b: "string1"},
        {a: 2, b: "string2"},
        {a: 3, b: "string3"},
        {a: 4, b: "string4"},
        {a: 5, b: "string5"}
    ]);

    record{|string a; int...;|}[]|record{|int a; string...;|}[]|Error csv1op11 = parseRecordAsRecordType(value, {});
    test:assertEquals(csv1op11, [
        {a: 1, b: "string1"},
        {a: 2, b: "string2"},
        {a: 3, b: "string3"},
        {a: 4, b: "string4"},
        {a: 5, b: "string5"}
    ]);

    record{|string a; int...;|}[]|record{|string a; string...;|}[]|Error csv1op12 = parseRecordAsRecordType(value, {});
    test:assertTrue(csv1op12 is Error);
    test:assertEquals((<Error>csv1op12).message(), "The source value cannot convert in to the '(data.csv:record {| string a; int...; |}[]|data.csv:record {| string a; string...; |}[])'");
}

@test:Config {enable}
function testParseToStringWithUnionExpectedTypes8() returns error? {
    string[][] value = [
        ["1", "string1", "true", "2.234", "2.234", "()"],
        ["2", "string2", "false", "0", "0", "()"],
        ["3", "string3", "false", "1.23", "1.23", "()"],
        ["4", "string4", "true", "-6.51", "-6.51", "()"],
        ["5", "string5", "true", "3", "3.0", "()"]
    ];

    RecA[]|RecC[]|Error csv1op1 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertEquals(csv1op1, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecA[]|RecC[]|Error csv1op2 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertTrue(csv1op2 is RecA[]|RecC[]);
    test:assertEquals(csv1op2, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecC[]|RecA[]|Error csv1op3 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    RecB[]|RecA[]|Error csv1op4 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3.0", f: "()"}
    ]);

    RecA[]|RecB[]|Error csv1op5 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ]);

    record{|int a;|}[]|record{|string b;|}[]|Error csv1op6 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        {a: 1},
        {a: 3},
        {a: 5}
    ]);

    record{|string b;|}[]|record{|int a;|}[]|Error csv1op7 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        {b: "string1"},
        {b: "string3"},
        {b: "string5"}
    ]);

    record{|string...;|}[]|record{|int...;|}[]|Error csv1op8 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [4, 2]});
    test:assertEquals(csv1op8, [
        {a: "1", b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: "3", b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: "5", b: "string5", c: "true", d: "3", e: "3.0", f: "()"}
    ]);

    record{|int...;|}[]|record{|string...;|}[]|Error csv1op9 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {stringConversion: true});
    test:assertEquals(csv1op9, [
        {a: 1},
        {a: 2, d: 0, e: 0},
        {a: 3},
        {a: 4},
        {a: 5, d: 3}
    ]);

    record{|int...;|}[]|record{|string...;|}[]|Error csv1op9_2 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {stringConversion: false});
    test:assertEquals(csv1op9_2, [
        {},
        {},
        {},
        {},
        {}
    ]);

    record{|int a; string...;|}[]|record{|string a; int...;|}[]|Error csv1op10 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, -1, 4]});
    test:assertEquals(csv1op10, [
        {a: 1, b: "string1", c: "true", d: "2.234", e: "2.234", f: "()"},
        {a: 3, b: "string3", c: "false", d: "1.23", e: "1.23", f: "()"},
        {a: 5, b: "string5", c: "true", d: "3", e: "3.0", f: "()"}
    ]);

    record{|string a; int...;|}[]|record{|int a; string...;|}[]|Error csv1op11 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertEquals(csv1op11, [
        {a: "1"},
        {a: "2", d: 0, e: 0},
        {a: "3"},
        {a: "4"},
        {a: "5", d: 3}
    ]);

    record{|int a; int...;|}[]|record{|int a; string...;|}[]|Error csv1op12 = parseListAsRecordType(value, ["a", "b", "c", "d", "e", "f"], {stringConversion: false});
    test:assertTrue(csv1op12 is Error);
    test:assertEquals((<Error>csv1op12).message(), "The source value cannot convert in to the '(data.csv:record {| int a; int...; |}[]|data.csv:record {| int a; string...; |}[])'");

    record{|int a; int...;|}[]|record{|string a; string...;|}[]|Error csv1op13 = parseListAsRecordType([["1", "2"], ["a", "b"]], ["a", "b"], {});
    test:assertEquals(csv1op13, [
        {a: "1", b: "2"},
        {a: "a", b: "b"}
    ]);
}


@test:Config {enable}
function testParseToStringWithUnionExpectedTypes9() returns error? {
    record{int a; string b; boolean c; decimal d; float e; () f;}[] value = [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: ()},
        {a: 2, b: "string2", c: false, d: <decimal>0, e: <float>0, f: ()},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: ()},
        {a: 4, b: "string4", c: true, d: <decimal>-6.51, e: <float>-6.51, f: ()},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: ()}
    ];

    TupA[]|TupC[]|Error csv1op1 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertEquals(csv1op1, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [2, "string2", false, <decimal>0, <float>0, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupA[]|TupC[]|Error csv1op2 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertTrue(csv1op2 is TupA[]|TupC[]);
    test:assertEquals(csv1op2, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupC[]|TupA[]|Error csv1op3 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupB[]|TupA[]|Error csv1op4 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    // TODO: Change the Error Message
    TupB[]|[boolean][]|Error csv1op4_2 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertTrue(csv1op4_2 is Error);
    test:assertEquals((<Error>csv1op4_2).message(), "The source value cannot convert in to the '(data.csv:TupB[]|[boolean][])'");

    TupA[]|TupB[]|Error csv1op5 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    [int][]|[string][]|Error csv1op6 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        [1],
        [3],
        [5]
    ]);

    [string][]|[int][]|Error csv1op7 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        [1],
        [3],
        [5]
    ]);

    [string...][]|[int...][]|Error csv1op8 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertTrue(csv1op8 is Error);
    test:assertEquals((<Error>csv1op8).message(), "The source value cannot convert in to the '([string...][]|[int...][])'");

    [int...][]|[string...][]|Error csv1op9 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertTrue(csv1op9 is Error);
    test:assertEquals((<Error>csv1op9).message(), "The source value cannot convert in to the '([int...][]|[string...][])'");

    [int, string...][]|[string, int...][]|Error csv1op10 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertTrue(csv1op10 is Error);
    test:assertEquals((<Error>csv1op10).message(), "The source value cannot convert in to the '([int,string...][]|[string,int...][])'");

    [string, int...][]|[int, string...][]|Error csv1op11 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertTrue(csv1op11 is Error);
    test:assertEquals((<Error>csv1op11).message(), "The source value cannot convert in to the '([string,int...][]|[int,string...][])'");

    [string, int...][]|[string, string...][]|Error csv1op12 = parseRecordAsListType(value, ["a", "b", "c", "d", "e", "f"], {});
    test:assertTrue(csv1op12 is Error);
    test:assertEquals((<Error>csv1op12).message(), "The source value cannot convert in to the '([string,int...][]|[string,string...][])'");
}

@test:Config {enable}
function testParseToStringWithUnionExpectedTypes10() returns error? {
    string[][] value = [
        ["1", "string1", "true", "2.234", "2.234", "()"],
        ["2", "string2", "false", "0", "0", "()"],
        ["3", "string3", "false", "1.23", "1.23", "()"],
        ["4", "string4", "true", "-6.51", "-6.51", "()"],
        ["5", "string5", "true", "3", "3.0", "()"]
    ];

    TupA[]|TupC[]|Error csv1op1 = parseListAsListType(value, {});
    test:assertEquals(csv1op1, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [2, "string2", false, <decimal>0, <float>0, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupA[]|TupC[]|Error csv1op2 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertTrue(csv1op2 is TupA[]|TupC[]);
    test:assertEquals(csv1op2, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupC[]|TupA[]|Error csv1op3 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op3, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    TupB[]|TupA[]|Error csv1op4 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op4, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    // TODO: Change the Error Message
    TupB[]|[boolean][]|Error csv1op4_2 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertTrue(csv1op4_2 is Error);
    test:assertEquals((<Error>csv1op4_2).message(), "The source value cannot convert in to the '(data.csv:TupB[]|[boolean][])'");

    TupA[]|TupB[]|Error csv1op5 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op5, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    [int][]|[string][]|Error csv1op6 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op6, [
        [1],
        [3],
        [5]
    ]);

    [string][]|[int][]|Error csv1op7 = parseListAsListType(value, {skipLines: [2, 4]});
    test:assertEquals(csv1op7, [
        ["1"],
        ["3"],
        ["5"]
    ]);

    [boolean...][]|[int...][]|Error csv1op8 = parseListAsListType(value, {stringConversion: false});
    test:assertTrue(csv1op8 is Error);
    test:assertEquals((<Error>csv1op8).message(), "The source value cannot convert in to the '([boolean...][]|[int...][])'");

    [string...][]|[int...][]|Error csv1op8_2 = parseListAsListType(value, {});
    test:assertEquals(csv1op8_2, value);

    [int...][]|[string...][]|Error csv1op9 = parseListAsListType(value, {});
    test:assertEquals(csv1op9, value);

    [int, string...][]|[string, int...][]|Error csv1op10 = parseListAsListType(value, {});
    test:assertEquals(csv1op10, [
        [1, "string1", "true", "2.234", "2.234", "()"],
        [2, "string2", "false", "0", "0", "()"],
        [3, "string3", "false", "1.23", "1.23", "()"],
        [4, "string4", "true", "-6.51", "-6.51", "()"],
        [5, "string5", "true", "3", "3.0", "()"]
    ]);

    [string, int...][]|[int, string...][]|Error csv1op11 = parseListAsListType(value, {});
    test:assertEquals(csv1op11, [
        [1, "string1", "true", "2.234", "2.234", "()"],
        [2, "string2", "false", "0", "0", "()"],
        [3, "string3", "false", "1.23", "1.23", "()"],
        [4, "string4", "true", "-6.51", "-6.51", "()"],
        [5, "string5", "true", "3", "3.0", "()"]
    ]);

    [string, int...][]|[string, string...][]|Error csv1op12 = parseListAsListType(value, {});
    test:assertEquals(csv1op12, value);
}

//TODO: Add test for intersection type in exp type