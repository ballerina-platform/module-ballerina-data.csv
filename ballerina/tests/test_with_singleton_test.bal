import ballerina/test;

type Singleton 1; 

@test:Config
function testSingletonExpectedTypes() returns error? {
    1[][]|Error a = parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a, [[1, 1, 1], [1, 1, 1]]);

    record {1|2 a; 1 b;}[]|Error a2 = parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a2, [{a: 1, b: 1, c: 1}, {a: 1, b: 1, c: 1}]);

    record {|1 a; 1|2...;|}[]|Error a3 = parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a3, [{a: 1, b: 1, c: 1}, {a: 1, b: 1, c: 1}]);

    [Singleton, Singleton...][]|Error a4 = parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a4, [[1, 1, 1], [1, 1, 1]]);

    record {|1|"a" a; 1 b;|}[]|Error a5 = parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a5, [{a: 1, b: 1}, {a: 1, b: 1}]);

    [Singleton, Singleton][]|Error a6 = parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a6, [[1, 1], [1, 1]]);

    record {|"a"|"c" a; "b" b;|}[]|Error a7 = parseStringToRecord(string `a, b, c
                                                       a, c, 1
                                                       1, 1,1  `);
    test:assertTrue(a7 is Error);
    test:assertEquals((<error>a7).message(), generateErrorMessageForInvalidCast("c", "\"b\""));

    ["a"|"d", "b"][]|Error a8 = parseStringToList(string `a, b, c
                                                       a, b, 1
                                                       c, b,1  `);
    test:assertTrue(a8 is Error);
    test:assertEquals((<error>a8).message(), generateErrorMessageForInvalidCast("c", "(\"a\"|\"d\")"));
}

@test:Config
function testSingletonExpectedTypes2() returns error? {
    1[][]|Error a = parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a, [[1, 1, 1], [1, 1, 1]]);

    record {1|2 a; 1 b;}[]|Error a2 = parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a2, [{a: 1, b: 1, c: 1}, {a: 1, b: 1, c: 1}]);

    record {|1 a; 1|2...;|}[]|Error a3 = parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a3, [{a: 1, b: 1, c: 1}, {a: 1, b: 1, c: 1}]);

    [Singleton, Singleton...][]|Error a4 = parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a4, [[1, 1, 1], [1, 1, 1]]);

    record {|1|"a" a; 1 b;|}[]|Error a5 = parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a5, [{a: 1, b: 1}, {a: 1, b: 1}]);

    [Singleton, Singleton][]|Error a6 = parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a6, [[1, 1], [1, 1]]);

    record {|"a"|"c" a; "b" b;|}[]|Error a7 = parseStringToRecord(string `a, b, c
                                                       a, c, 1
                                                       1, 1,1  `);
    test:assertTrue(a7 is Error);
    test:assertEquals((<error>a7).message(), generateErrorMessageForInvalidCast("c", "\"b\""));

    ["a"|"d", "b"][]|Error a8 = parseStringToList(string `a, b, c
                                                       a, b, 1
                                                       c, b,1  `);
    test:assertTrue(a8 is Error);
    test:assertEquals((<error>a8).message(), generateErrorMessageForInvalidCast("c", "(\"a\"|\"d\")"));
}

type SubType byte|int:Signed8|int:Signed16|int:Signed32|string:Char|int:Unsigned8|int:Unsigned16|int:Unsigned32;

type SubtypeRecord record {
    byte a; int:Signed8 c; int:Signed16 d; int:Signed32 e; 
    string:Char f; int:Unsigned8 g; int:Unsigned16 h; int:Unsigned32 i;
};

type SubtypeRecord2 record {|
    byte a; int:Signed8 c;
|};

type SubtypeRecord3 record {|
    SubType...;
|};

type SubtypeTuple [
    byte, int:Signed8, int:Signed16, int:Signed32, 
    string:Char, int:Unsigned8, int:Unsigned16, int:Unsigned32
];

type SubtypeTuple2 [SubType, SubType];

type SubtypeTuple3 [SubType...];

@test:Config
function testSubtypeExpectedTypes() returns error? {
    var value1 = [{a: 1, c: 1, d: 1, e: 1, f: "a", g: 1, h: 1, i: 1},
                  {a: 1, c: 1, d: 1, e: 1, f: "a", g: 1, h: 1, i: 1}];
    var value2 = [{a: 1, c: int:MAX_VALUE, d: 1, e: 1, f: "a", g: 1, h: 1, i: 1},
                  {a: 1, c: 1, d: 1, e: 1, f: "a", g: 1, h: 1, i: 1}]; 
    var value3 = [[1, 1, 1, 1, "a", 1, 1, 1],
                  [1, 1, 1, 1, "a", 1, 1, 1]];
    var value4 = [["1", "1", "1", "1", "a", "1", "1", "1"],
                  ["1", "1", "1", "1", "a", "1", "1", "1"]];

    SubtypeRecord[]|Error a = parseStringToRecord(string `a, c, d, e, f, g, h, i
                                                       1, 1, 1, 1, a, 1, 1, 1
                                                       1, 1, 1, 1, a, 1, 1, 1  `);
    test:assertEquals(a, value1);

    SubtypeRecord2[]|Error a2 = parseStringToRecord(string `a, c, d, e, f, g, h, i
                                                       1, 1, 1, 1, a, 1, 1, 1
                                                       1, 1, 1, 1, a, 1, 1, 1  `);

    test:assertEquals(a2, [{a: 1, c: 1}, {a: 1, c: 1}]);

    SubtypeRecord3[]|Error a3 = parseStringToRecord(string `a, c, d, e, f, g, h, i
                                                       1, 1, 1, 1, a, 1, 1, 1
                                                       1, 1, 1, 1, a, 1, 1, 1  `);
    test:assertEquals(a3, value1); 

    SubtypeTuple[]|Error a4 = parseStringToList(string `a, c, d, e, f, g, h, i
                                                       1, 1, 1, 1, a, 1, 1, 1
                                                       1, 1, 1, 1, a, 1, 1, 1  `);
    test:assertEquals(a4, value3);

    SubtypeTuple2[]|Error a5 = parseStringToList(string `a, c, d, e, f, g, h, i
                                                       1, 1, 1, 1, a, 1, 1, 1
                                                       1, 1, 1, 1, a, 1, 1, 1  `);
    test:assertEquals(a5, [[1, 1], [1, 1]]);

    SubtypeTuple3[]|Error a6 = parseStringToList(string `a, c, d, e, f, g, h, i
                                                       1, 1, 1, 1, a, 1, 1, 1
                                                       1, 1, 1, 1, a, 1, 1, 1  `);
    test:assertEquals(a6, value3);

    SubtypeRecord[]|Error a7 = parseRecordAsRecordType(value1, {});
    test:assertEquals(a7, value1);

    SubtypeRecord2[]|Error a8 = parseRecordAsRecordType(value1, {});

    test:assertEquals(a8, [{a: 1, c: 1}, {a: 1, c: 1}]);

    SubtypeRecord3[]|Error a9 = parseRecordAsRecordType(value1, {});
    test:assertEquals(a9, value1); 

    SubtypeTuple[]|Error a10 = parseRecordAsListType(value1, 
                                    ["a", "c", "d", "e", "f", "g", "h", "i"], {});
    test:assertEquals(a10, value3);

    SubtypeTuple2[]|Error a11 = parseRecordAsListType(value1, 
                                    ["a", "c", "d", "e", "f", "g", "h", "i"], {});
    test:assertEquals(a11, [[1, 1], [1, 1]]);

    SubtypeTuple3[]|Error a12 = parseRecordAsListType(value1, 
                                    ["a", "c", "d", "e", "f", "g", "h", "i"], {});
    test:assertEquals(a12, value3); 

    SubtypeRecord[]|Error a13 = parseListAsRecordType(value4, 
                                    ["a", "c", "d", "e", "f", "g", "h", "i"], {});
    test:assertEquals(a13, value1);

    SubtypeRecord2[]|Error a14 = parseListAsRecordType(value4, 
                                    ["a", "c", "d", "e", "f", "g", "h", "i"], {});
    test:assertEquals(a14, [{a: 1, c: 1}, {a: 1, c: 1}]);

    SubtypeRecord3[]|Error a15 = parseListAsRecordType(value4, 
                                    ["a", "c", "d", "e", "f", "g", "h", "i"], {});
    test:assertEquals(a15, value1);

    SubtypeTuple[]|Error a16 = parseListAsListType(value4, {});
    test:assertEquals(a16, value3);

    SubtypeTuple2[]|Error a17 = parseListAsListType(value4, {});
    test:assertEquals(a17, [[1, 1], [1, 1]]);

    SubtypeTuple3[]|Error a18 = parseListAsListType(value4, {});
    test:assertEquals(a18, value3);   
}
