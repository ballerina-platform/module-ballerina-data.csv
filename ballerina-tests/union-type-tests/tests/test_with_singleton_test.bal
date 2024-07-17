import ballerina/data.csv as csv;
import ballerina/test;
import ballerina/csv_commons as common;

type Singleton 1; 

@test:Config
function testSingletonExpectedTypes() returns error? {
    1[][]|csv:Error a = csv:parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a, [[1, 1, 1], [1, 1, 1]]);

    record {1|2 a; 1 b;}[]|csv:Error a2 = csv:parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a2, [{a: 1, b: 1, c: 1}, {a: 1, b: 1, c: 1}]);

    record {|1 a; 1|2...;|}[]|csv:Error a3 = csv:parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a3, [{a: 1, b: 1, c: 1}, {a: 1, b: 1, c: 1}]);

    [Singleton, Singleton...][]|csv:Error a4 = csv:parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a4, [[1, 1, 1], [1, 1, 1]]);

    record {|1|"a" a; 1 b;|}[]|csv:Error a5 = csv:parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a5, [{a: 1, b: 1}, {a: 1, b: 1}]);

    [Singleton, Singleton][]|csv:Error a6 = csv:parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a6, [[1, 1], [1, 1]]);

    record {|"a"|"c" a; "b" b;|}[]|csv:Error a7 = csv:parseStringToRecord(string `a, b, c
                                                       a, c, 1
                                                       1, 1,1  `);
    test:assertTrue(a7 is csv:Error);
    test:assertEquals((<error>a7).message(), common:generateErrorMessageForInvalidCast("c", "\"b\""));

    ["a"|"d", "b"][]|csv:Error a8 = csv:parseStringToList(string `a, b, c
                                                       a, b, 1
                                                       c, b,1  `);
    test:assertTrue(a8 is csv:Error);
    test:assertEquals((<error>a8).message(), common:generateErrorMessageForInvalidCast("c", "(\"a\"|\"d\")"));
}

@test:Config
function testSingletonExpectedTypes2() returns error? {
    1[][]|csv:Error a = csv:parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a, [[1, 1, 1], [1, 1, 1]]);

    record {1|2 a; 1 b;}[]|csv:Error a2 = csv:parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a2, [{a: 1, b: 1, c: 1}, {a: 1, b: 1, c: 1}]);

    record {|1 a; 1|2...;|}[]|csv:Error a3 = csv:parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a3, [{a: 1, b: 1, c: 1}, {a: 1, b: 1, c: 1}]);

    [Singleton, Singleton...][]|csv:Error a4 = csv:parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a4, [[1, 1, 1], [1, 1, 1]]);

    record {|1|"a" a; 1 b;|}[]|csv:Error a5 = csv:parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a5, [{a: 1, b: 1}, {a: 1, b: 1}]);

    [Singleton, Singleton][]|csv:Error a6 = csv:parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a6, [[1, 1], [1, 1]]);

    record {|"a"|"c" a; "b" b;|}[]|csv:Error a7 = csv:parseStringToRecord(string `a, b, c
                                                       a, c, 1
                                                       1, 1,1  `);
    test:assertTrue(a7 is csv:Error);
    test:assertEquals((<error>a7).message(), common:generateErrorMessageForInvalidCast("c", "\"b\""));

    ["a"|"d", "b"][]|csv:Error a8 = csv:parseStringToList(string `a, b, c
                                                       a, b, 1
                                                       c, b,1  `);
    test:assertTrue(a8 is csv:Error);
    test:assertEquals((<error>a8).message(), common:generateErrorMessageForInvalidCast("c", "(\"a\"|\"d\")"));
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
    var value2 = [["1", "1", "1", "1", "a", "1", "1", "1"],
                  ["1", "1", "1", "1", "a", "1", "1", "1"]];
    var value3 = [[1, 1, 1, 1, "a", 1, 1, 1],
                  [1, 1, 1, 1, "a", 1, 1, 1]];

    SubtypeRecord[]|csv:Error a = csv:parseStringToRecord(string `a, c, d, e, f, g, h, i
                                                       1, 1, 1, 1, a, 1, 1, 1
                                                       1, 1, 1, 1, a, 1, 1, 1  `);
    test:assertEquals(a, value1);

    SubtypeRecord2[]|csv:Error a2 = csv:parseStringToRecord(string `a, c, d, e, f, g, h, i
                                                       1, 1, 1, 1, a, 1, 1, 1
                                                       1, 1, 1, 1, a, 1, 1, 1  `);

    test:assertEquals(a2, [{a: 1, c: 1}, {a: 1, c: 1}]);

    SubtypeRecord3[]|csv:Error a3 = csv:parseStringToRecord(string `a, c, d, e, f, g, h, i
                                                       1, 1, 1, 1, a, 1, 1, 1
                                                       1, 1, 1, 1, a, 1, 1, 1  `);
    test:assertEquals(a3, value1); 

    SubtypeTuple[]|csv:Error a4 = csv:parseStringToList(string `a, c, d, e, f, g, h, i
                                                       1, 1, 1, 1, a, 1, 1, 1
                                                       1, 1, 1, 1, a, 1, 1, 1  `);
    test:assertEquals(a4, value3);

    SubtypeTuple2[]|csv:Error a5 = csv:parseStringToList(string `a, c, d, e, f, g, h, i
                                                       1, 1, 1, 1, a, 1, 1, 1
                                                       1, 1, 1, 1, a, 1, 1, 1  `);
    test:assertEquals(a5, [[1, 1], [1, 1]]);

    SubtypeTuple3[]|csv:Error a6 = csv:parseStringToList(string `a, c, d, e, f, g, h, i
                                                       1, 1, 1, 1, a, 1, 1, 1
                                                       1, 1, 1, 1, a, 1, 1, 1  `);
    test:assertEquals(a6, value3);

    SubtypeRecord[]|csv:Error a7 = csv:parseRecordAsRecordType(value1, {});
    test:assertEquals(a7, value1);

    SubtypeRecord2[]|csv:Error a8 = csv:parseRecordAsRecordType(value1, {});

    test:assertEquals(a8, [{a: 1, c: 1}, {a: 1, c: 1}]);

    SubtypeRecord3[]|csv:Error a9 = csv:parseRecordAsRecordType(value1, {});
    test:assertEquals(a9, value1); 

    SubtypeTuple[]|csv:Error a10 = csv:parseRecordAsListType(value1, 
                                    ["a", "c", "d", "e", "f", "g", "h", "i"], {});
    test:assertEquals(a10, value3);

    SubtypeTuple2[]|csv:Error a11 = csv:parseRecordAsListType(value1, 
                                    ["a", "c", "d", "e", "f", "g", "h", "i"], {});
    test:assertEquals(a11, [[1, 1], [1, 1]]);

    SubtypeTuple3[]|csv:Error a12 = csv:parseRecordAsListType(value1, 
                                    ["a", "c", "d", "e", "f", "g", "h", "i"], {});
    test:assertEquals(a12, value3); 

    SubtypeRecord[]|csv:Error a13 = csv:parseListAsRecordType(value2, 
                                    ["a", "c", "d", "e", "f", "g", "h", "i"], {});
    test:assertEquals(a13, value1);

    SubtypeRecord2[]|csv:Error a14 = csv:parseListAsRecordType(value2, 
                                    ["a", "c", "d", "e", "f", "g", "h", "i"], {});
    test:assertEquals(a14, [{a: 1, c: 1}, {a: 1, c: 1}]);

    SubtypeRecord3[]|csv:Error a15 = csv:parseListAsRecordType(value2, 
                                    ["a", "c", "d", "e", "f", "g", "h", "i"], {});
    test:assertEquals(a15, value1);

    SubtypeTuple[]|csv:Error a16 = csv:parseListAsListType(value2, {});
    test:assertEquals(a16, value3);

    SubtypeTuple2[]|csv:Error a17 = csv:parseListAsListType(value2, {});
    test:assertEquals(a17, [[1, 1], [1, 1]]);

    SubtypeTuple3[]|csv:Error a18 = csv:parseListAsListType(value2, {});
    test:assertEquals(a18, value3);   
}
