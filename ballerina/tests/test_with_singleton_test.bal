import ballerina/test;

boolean enable = true;

@test:Config {enable: !enable}
function debugTest() returns error? {
    
}

type Singleton 1; 

@test:Config {enable}
function testSingletonExpectedTypes() returns error? {
    1[][]|CsvConversionError a = parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a, [[1, 1, 1], [1, 1, 1]]);

    record {1|2 a; 1 b;}[]|CsvConversionError a2 = parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a2, [{a: 1, b: 1, c: 1}, {a: 1, b: 1, c: 1}]);

    record {|1 a; 1|2...;|}[]|CsvConversionError a3 = parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a3, [{a: 1, b: 1, c: 1}, {a: 1, b: 1, c: 1}]);

    [Singleton, Singleton...][]|CsvConversionError a4 = parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a4, [[1, 1, 1], [1, 1, 1]]);

    record {|1|"a" a; 1 b;|}[]|CsvConversionError a5 = parseStringToRecord(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a5, [{a: 1, b: 1}, {a: 1, b: 1}]);

    [Singleton, Singleton][]|CsvConversionError a6 = parseStringToList(string `a, b, c
                                                       1, 1, 1
                                                       1, 1,1  `);
    test:assertEquals(a6, [[1, 1], [1, 1]]);

    record {|"a"|"c" a; "b" b;|}[]|CsvConversionError a7 = parseStringToRecord(string `a, b, c
                                                       a, c, 1
                                                       1, 1,1  `);
    test:assertTrue(a7 is CsvConversionError);
    test:assertEquals((<error>a7).message(), generateErrorMessageForInvalidCast("c", "\"b\""));

    ["a"|"d", "b"][]|CsvConversionError a8 = parseStringToList(string `a, b, c
                                                       a, b, 1
                                                       c, b,1  `);
    test:assertTrue(a8 is CsvConversionError);
    test:assertEquals((<error>a8).message(), generateErrorMessageForInvalidCast("c", "(\"a\"|\"d\")"));
}