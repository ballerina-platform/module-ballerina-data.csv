import ballerina/test;

boolean enable = true;

@test:Config {enable: !enable}
function debugTest() returns error? {
    (int[] & readonly)[]|CsvConversionError a = parseStringToList(string `a,b
                                                                            1,2
                                                                            4,5`);
    test:assertEquals(a, [[1, 2], [4, 5]]);
}

@test:Config {enable}
function testIntersectionExpectedTypes() returns error? {
    (int[] & readonly)[]|CsvConversionError a = parseStringToList(string `a,b
                                                                            1,2
                                                                            4,5`);
    test:assertEquals(a, [[1, 2], [4, 5]]);

    ([string, string])[] & readonly|CsvConversionError a2 = parseStringToList(string `a,b
                                                                            a,a
                                                                            c,c`);
    test:assertEquals(a2, [["a", "a"], ["c", "c"]]);

    (record{int a; string b;} & readonly)[]|CsvConversionError a3 = parseStringToRecord(string `a,b
                                                                            1,2
                                                                            4,5`);
    test:assertEquals(a3, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    record{|string...;|}[] & readonly|CsvConversionError a4 = parseStringToRecord(string `a,b
                                                                            a,a
                                                                            c,c`);
    test:assertEquals(a4, [{a: "a", b: "a"}, {a: "c", b: "c"}]);
}

@test:Config {enable}
function testIntersectionExpectedTypes2() returns error? {
    (int[] & readonly)[]|CsvConversionError a = parseStringToList(string `a,b
                                                                            1,2
                                                                            4,5`);
    test:assertEquals(a, [[1, 2], [4, 5]]);

    ([string, string])[] & readonly|CsvConversionError a2 = parseStringToList(string `a,b
                                                                            a,a
                                                                            c,c`);
    test:assertEquals(a2, [["a", "a"], ["c", "c"]]);

    (record{int a; string b;} & readonly)[]|CsvConversionError a3 = parseStringToRecord(string `a,b
                                                                            1,2
                                                                            4,5`);
    test:assertEquals(a3, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    record{|string...;|}[] & readonly|CsvConversionError a4 = parseStringToRecord(string `a,b
                                                                            a,a
                                                                            c,c`);
    test:assertEquals(a4, [{a: "a", b: "a"}, {a: "c", b: "c"}]);
}

// TODO: Add tetsts for Singleton, table