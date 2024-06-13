import ballerina/test;

boolean enable = true;

@test:Config {enable: !enable}
function debugTest() returns error? {
    RecordWithCustomAnnotation5[]|CsvConversionError cn19 = parseStringToRecord(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn19 is CsvConversionError);
    test:assertEquals((<error>cn19).message(), "Duplicate field found in record fields: 'c'");
}

type RecordWithCustomAnnotation record {
    @Name {
        value: "c"
    }
    int a;
    int b;
};

type RecordWithCustomAnnotation2 record {
    @Name {
        value: "c"
    }
    int a?;
    @Name {
        value: "d"
    }
    int? b;
};

type RecordWithCustomAnnotation3 record {|
    @Name {
        value: "c"
    }
    int a?;
    @Name {
        value: "d"
    }
    int? b;
|};

type RecordWithCustomAnnotation4 record {|
    @Name {
        value: "c"
    }
    int a;
    @Name {
        value: "d"
    }
    int b;
    boolean...;
|};

type RecordWithCustomAnnotation5 record {
    @Name {
        value: "c"
    }
    int a;
    @Name {
        value: "d"
    }
    int b;
    int c?;
};

type RecordWithCustomAnnotation6 record {
    @Name {
        value: "c"
    }
    int a;
    @Name {
        value: "d"
    }
    int b;
    @Name {
        value: "e"
    }
    int c;
};

type RecordWithCustomAnnotation7 record {
    @Name {
        value: "c"
    }
    int a;
    @Name {
        value: "d"
    }
    int b;
    @Name {
        value: "a"
    }
    int c;
};

@test:Config {enable}
function testCustomNameAnnotation() returns error? {
    RecordWithCustomAnnotation[]|CsvConversionError cn1 = parseStringToRecord(string `b,c
                                                           1,3`, {});
    test:assertEquals(cn1, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|CsvConversionError cn2 = parseStringToRecord(string `c,b
                                          3,1`, {});
    test:assertEquals(cn2, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|CsvConversionError cn3 = parseStringToRecord(string `f,c,b,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn3, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|CsvConversionError cn4 = parseStringToRecord(string `d,c
                                                           1,3`, {});
    test:assertEquals(cn4, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|CsvConversionError cn5 = parseStringToRecord(string `c,d
                                          3,1`, {});
    test:assertEquals(cn5, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|CsvConversionError cn6 = parseStringToRecord(string `c,f,d,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn6, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|CsvConversionError cn7 = parseStringToRecord(string `a,b
                                          3,1`, {});
    test:assertTrue(cn7 is CsvConversionError);
    test:assertEquals((<error>cn7).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation2[]|CsvConversionError cn8 = parseStringToRecord(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn8 is CsvConversionError);
    test:assertEquals((<error>cn8).message(), "Duplicate field found in record fields: 'a'");
    
    RecordWithCustomAnnotation3[]|CsvConversionError cn9 = parseStringToRecord(string `d,c
                                                           1,3`, {});
    test:assertEquals(cn9, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|CsvConversionError cn10 = parseStringToRecord(string `c,d
                                          3,1`, {});
    test:assertEquals(cn10, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|CsvConversionError cn11 = parseStringToRecord(string `c,f,d,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn11, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|CsvConversionError cn12 = parseStringToRecord(string `a,b
                                          3,1`, {});
    test:assertTrue(cn12 is CsvConversionError);
    test:assertEquals((<error>cn12).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation3[]|CsvConversionError cn13 = parseStringToRecord(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn13 is CsvConversionError);
    test:assertEquals((<error>cn13).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|CsvConversionError cn14 = parseStringToRecord(string `d,c
                                                           1,3`, {});
    test:assertEquals(cn14, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|CsvConversionError cn15 = parseStringToRecord(string `c,d
                                          3,1`, {});
    test:assertEquals(cn15, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|CsvConversionError cn16 = parseStringToRecord(string `c,f,d,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn16, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|CsvConversionError cn17 = parseStringToRecord(string `a,b
                                          3,1`, {});
    test:assertTrue(cn17 is CsvConversionError);
    test:assertEquals((<error>cn17).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|CsvConversionError cn18 = parseStringToRecord(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn18 is CsvConversionError);
    test:assertEquals((<error>cn18).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation5[]|CsvConversionError cn19 = parseStringToRecord(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn19 is CsvConversionError);
    test:assertEquals((<error>cn19).message(), "Duplicate field found in record fields: 'c'");

    RecordWithCustomAnnotation6[]|CsvConversionError cn20 = parseStringToRecord(string ` c,d,e
                                          3,1,4
                                          3,1,4`, {});
    test:assertEquals(cn20, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation7[]|CsvConversionError cn21 = parseStringToRecord(string ` c,d,a
                                          3,1,4
                                          3,1,4`, {});
    test:assertEquals(cn21, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);
}

@test:Config {enable}
function testAbsentAsNilableConfig() returns error? {
    record {|int a; int? g; int? h;|}[]|CsvConversionError cn = parseStringToRecord(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1
    });
    test:assertEquals(cn, [{a: 1, g: (), h: ()}, {a: 2, g: (), h: ()}, {a: 3, g: (), h: ()}, {a: 4, g: (), h: ()}, {a: 5, g: (), h: ()}]);

    record {|int a; int? g?;|}[]|CsvConversionError cn2 = parseStringToRecord(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn2, [{a: 1}]);

    record {|int a; int g?;|}[]|CsvConversionError cn3 = parseStringToRecord(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn3, [{a: 1}]);

    record {|int a; int g;|}[]|CsvConversionError cn4 = parseStringToRecord(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertTrue(cn4 is CsvConversionError);
    test:assertEquals((<error>cn4).message(), generateErrorMessageForMissingRequiredField("g"));

    int?[][]|CsvConversionError cn5 = parseStringToList(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1
    });
    test:assertEquals(cn5, [[1, 1, 1]]);

    map<int?>[]|CsvConversionError cn6 = parseStringToRecord(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1
    });
    test:assertEquals(cn6, [{a: 1, b: 1, c: 1}]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|CsvConversionError cn7 = parseStringToList(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn7, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|CsvConversionError cn8 = parseStringToList(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn8, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|CsvConversionError cn9 = parseStringToList(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn9, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|CsvConversionError cn10 = parseStringToList(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn10, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);
}

@test:Config {enable}
function testAbsentAsNilableConfig2() returns error? {
    record {|int a; int? g; int? h;|}[]|CsvConversionError cn = parseRecordAsRecordType([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn, [{a: 1, g: (), h: ()}, {a: 2, g: (), h: ()}]);

    record {|int a; int? g?;|}[]|CsvConversionError cn2 = parseRecordAsRecordType([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn2, [{a: 1}, {a: 2}]);

    record {|int a; int g?;|}[]|CsvConversionError cn3 = parseRecordAsRecordType([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn3, [{a: 1}, {a: 2}]);

    record {|int a; int g;|}[]|CsvConversionError cn4 = parseRecordAsRecordType([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertTrue(cn4 is CsvConversionError);
    test:assertEquals((<error>cn4).message(), generateErrorMessageForMissingRequiredField("g"));

    record {|string a; int? g; int? h;|}[]|CsvConversionError cn5 = parseListAsRecordType([["a"], ["a"], ["a"]], ["a"], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn5, [{a: "a", g: (), h: ()}, {a: "a", g: (), h: ()}]);

    record {|string a; int? g?;|}[]|CsvConversionError cn6 = parseListAsRecordType([["a"], ["a"], ["a"]], ["a"], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn6, [{a: "a"}, {a: "a"}]);

    record {|string a; int g?;|}[]|CsvConversionError cn7 = parseListAsRecordType([["a"], ["a"], ["b"]], ["a"], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [2]
    });
    test:assertEquals(cn7, [{a: "a"}, {a: "b"}]);

    record {|string a; int g;|}[]|CsvConversionError cn8 = parseListAsRecordType([["a"], ["a"], ["a"]], ["a"], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertTrue(cn8 is CsvConversionError);
    test:assertEquals((<error>cn8).message(), generateErrorMessageForMissingRequiredField("g"));
}

@test:Config {enable}
function testNilAsOptionalConfig() returns error? {
    record {|int a; int f?;|}[]|CsvConversionError cn = parseStringToRecord(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1
    });
    test:assertEquals(cn, [{a: 1}, {a: 2}, {a: 3}, {a: 4}, {a: 5}]);

    record {|int a; int? f?;|}[]|CsvConversionError cn2 = parseStringToRecord(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn2, [{a: 1, f: ()}]);

    record {|int a; int f?;|}[]|CsvConversionError cn3 = parseStringToRecord(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn3, [{a: 1}]);

    record {|int a; int f;|}[]|CsvConversionError cn4 = parseStringToRecord(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertTrue(cn4 is CsvConversionError);
    test:assertEquals((<error>cn4).message(), generateErrorMessageForInvalidCast("()", "int"));

    int?[][]|CsvConversionError cn5 = parseStringToList(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1
    });
    test:assertEquals(cn5, [[1, 1, 1]]);

    map<int?>[]|CsvConversionError cn6 = parseStringToRecord(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1
    });
    test:assertEquals(cn6, [{a: 1, b: 1, c: 1}]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|CsvConversionError cn7 = parseStringToList(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn7, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|CsvConversionError cn8 = parseStringToList(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn8, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|CsvConversionError cn9 = parseStringToList(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn9, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|CsvConversionError cn10 = parseStringToList(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn10, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);
}

@test:Config {enable}
function testNilAsOptionalConfig2() returns error? {
    record {|int a; int? f;|}[]|CsvConversionError cn = parseRecordAsRecordType([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertEquals(cn, [{a: 1, f: ()}, {a: 2, f: ()}]);

    record {|int a; int? f?;|}[]|CsvConversionError cn2 = parseRecordAsRecordType([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertEquals(cn2, [{a: 1, f: ()}, {a: 2, f: ()}]);

    record {|int a; int f?;|}[]|CsvConversionError cn3 = parseRecordAsRecordType([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertEquals(cn3, [{a: 1}, {a: 2}]);

    record {|int a; int f;|}[]|CsvConversionError cn4 = parseRecordAsRecordType([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertTrue(cn4 is CsvConversionError);
    test:assertEquals((<error>cn4).message(), generateErrorMessageForInvalidFieldType("null", "f"));

    // TODO: After add string[] => anydata[]

    // record {|string a; int? f;|}[]|CsvConversionError cn5 = parseListAsRecordType([["a"], ["a"], ["a"]], ["a"], {
    //     allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    // });
    // test:assertEquals(cn5, [{a: "a", f: ()}, {a: "a", f: ()}]);

    // record {|string a; int? f?;|}[]|CsvConversionError cn6 = parseListAsRecordType([["a", ()], ["a", ()], ["a", ()]], ["a", "f"], {
    //     allowDataProjection: {nilAsOptionalField: true}, skipLines: [3],
    // });
    // test:assertEquals(cn6, [{a: "a"}, {a: "a"}]);

    // record {|string a; int f?;|}[]|CsvConversionError cn7 = parseListAsRecordType([["a"], ["a"], ["b"]], ["a"], {
    //     allowDataProjection: {nilAsOptionalField: true}, skipLines: [2]
    // });
    // test:assertEquals(cn7, [{a: "a"}, {a: "b"}]);

    // record {|string a; int f;|}[]|CsvConversionError cn8 = parseListAsRecordType([["a"], ["a"], ["a"]], ["a"], {
    //     allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    // });
    // test:assertTrue(cn8 is CsvConversionError);
    // test:assertEquals((<error>cn8).message(), generateErrorMessageForInvalidCast("()", "int"));
}

@test:Config {enable}
function testDataProjectionConfig() returns error? {
    string csvValue1 = string `a,b
                             "a",2
                             b,4`;
    record{}[] csvValue2 = [{"a": "a", "b": 2}, {"a": "b", "b": 4}];
    [string, int][] csvValue3 = [["a", 2], ["b", 4]];

    record{}[]|CsvConversionError cn = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a; int b;|}[]|CsvConversionError cn_2 = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn_2, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a;|}[]|CsvConversionError cn2 = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn2 is CsvConversionError);
    test:assertEquals((<error>cn2).message(), "No mapping field in the expected type for header 'b'");

    record{|string a; int...;|}[]|CsvConversionError cn3 = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn3, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string...;|}[]|CsvConversionError cn4 = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn4, [{"a": "a", "b": "2"}, {"a": "b", "b": "4"}]);

    record{|string a?;|}[]|CsvConversionError cn5 = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn5 is CsvConversionError);
    test:assertEquals((<error>cn5).message(), "No mapping field in the expected type for header 'b'");

    record{|string? a;|}[]|CsvConversionError cn6 = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn6 is CsvConversionError);
    test:assertEquals((<error>cn6).message(), "No mapping field in the expected type for header 'b'");

    anydata[][]|CsvConversionError c7 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(c7, [["a", 2], ["b", 4]]);

    [string, int][]|CsvConversionError cn7_2 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn7_2, [["a", 2], ["b", 4]]);

    [string][]|CsvConversionError cn8 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn8 is CsvConversionError);
    test:assertEquals((<error>cn8).message(), "invalid array size for expected tuple type, cannot be greater than '1'");

    [string][]|CsvConversionError cn8_2 = parseStringToList(csvValue1, {
        allowDataProjection: {}
    });
    test:assertEquals(cn8_2, [["a"], ["b"]]);

    [int][]|CsvConversionError cn8_3 = parseStringToList(csvValue1, {
        allowDataProjection: {}
    });
    test:assertTrue(cn8_3 is CsvConversionError);
    test:assertEquals((<error>cn8_3).message(), generateErrorMessageForInvalidCast("a", "int"));

    [string, int...][]|CsvConversionError cn9 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn9, [["a", 2], ["b", 4]]);

    [string...][]|CsvConversionError cn10 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn10, [["a", "2"], ["b", "4"]]);

    [string, ()][]|CsvConversionError cn11 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn11 is CsvConversionError);
    test:assertEquals((<error>cn11).message(), generateErrorMessageForInvalidCast("2", "()"));

    string[][]|CsvConversionError cn12 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn12, [["a", "2"], ["b", "4"]]);

    string[][1]|CsvConversionError cn13 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn13 is CsvConversionError);
    test:assertEquals((<error>cn13).message(), "invalid array size for expected array type, cannot be greater than '1'");

    record{}[]|CsvConversionError cn14 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn14, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a; int b;|}[]|CsvConversionError cn14_2 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn14_2, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a;|}[]|CsvConversionError cn15 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertTrue(cn15 is CsvConversionError);
    test:assertEquals((<error>cn15).message(), "No mapping field in the expected type for header 'b'");

    record{|string a; int...;|}[]|CsvConversionError cn16 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn16, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string...;|}[]|CsvConversionError cn17 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn17, [{"a": "a"}, {"a": "b"}]);

    record{|string a?;|}[]|CsvConversionError cn18 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertTrue(cn18 is CsvConversionError);
    test:assertEquals((<error>cn18).message(), "No mapping field in the expected type for header 'b'");

    record{|string? a;|}[]|CsvConversionError cn19 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertTrue(cn19 is CsvConversionError);
    test:assertEquals((<error>cn19).message(), "No mapping field in the expected type for header 'b'");

    anydata[][]|CsvConversionError c20 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertEquals(c20, [["a", 2], ["b", 4]]);

    [string, int][]|CsvConversionError cn20_2 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertEquals(cn20_2, [["a", 2], ["b", 4]]);

    [string][]|CsvConversionError cn21 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertTrue(cn21 is CsvConversionError);
    test:assertEquals((<error>cn21).message(), "invalid array size for expected tuple type, cannot be greater than '1'");

    [string][]|CsvConversionError cn21_2 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: {}
    });
    test:assertEquals(cn21_2, [["a"], ["b"]]);

    [int][]|CsvConversionError cn21_3 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: {}
    });
    test:assertTrue(cn21_3 is CsvConversionError);
    test:assertEquals((<error>cn21_3).message(), generateErrorMessageForInvalidValueForArrayType("a", "0", "int"));

    [string, int...][]|CsvConversionError cn22 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertEquals(cn22, [["a", 2], ["b", 4]]);

    [string...][]|CsvConversionError cn23 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertTrue(cn23 is CsvConversionError);
    test:assertEquals((<error> cn23).message(), generateErrorMessageForInvalidValueForArrayType("2", "1", "string"));

    [string, ()][]|CsvConversionError cn24 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertTrue(cn24 is CsvConversionError);
    test:assertEquals((<error>cn24).message(), generateErrorMessageForInvalidValueForArrayType("2", "1", "()"));

    string[][]|CsvConversionError cn25 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertTrue(cn25 is CsvConversionError);
    test:assertEquals((<error> cn25).message(), generateErrorMessageForInvalidValueForArrayType("2", "1", "string"));

    string[][1]|CsvConversionError cn26 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertTrue(cn26 is CsvConversionError);
    test:assertEquals((<error>cn26).message(), "invalid array size for expected array type, cannot be greater than '1'");

    // TODO: After fixing the issue with the anydata[]

    // record{}[]|CsvConversionError cnl14 = parseListAsRecordType(csvValue3, ["a", "b"], {
    //     allowDataProjection: false
    // });
    // test:assertEquals(cnl14, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    // record{|string a; int b;|}[]|CsvConversionError cnl14_2 = parseListAsRecordType(csvValue3, ["a", "b"], {
    //     allowDataProjection: false
    // });
    // test:assertEquals(cnl14_2, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    // record{|string a;|}[]|CsvConversionError cnl15 = parseListAsRecordType(csvValue3, ["a", "b"], {
    //     allowDataProjection: false
    // });
    // test:assertTrue(cnl15 is CsvConversionError);
    // test:assertEquals((<error>cnl15).message(), "No mapping field in the expected type for header 'b'");

    // record{|string a; int...;|}[]|CsvConversionError cnl16 = parseListAsRecordType(csvValue3, ["a", "b"], {
    //     allowDataProjection: false
    // });
    // test:assertEquals(cnl16, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    // record{|string...;|}[]|CsvConversionError cnl17 = parseListAsRecordType(csvValue3, ["a", "b"], {
    //     allowDataProjection: false
    // });
    // test:assertEquals(cnl17, [{"a": "a"}, {"a": "b"}]);

    // record{|string a?;|}[]|CsvConversionError cnl18 = parseListAsRecordType(csvValue3, ["a", "b"], {
    //     allowDataProjection: false
    // });
    // test:assertTrue(cnl18 is CsvConversionError);
    // test:assertEquals((<error>cnl18).message(), "No mapping field in the expected type for header 'b'");

    // record{|string? a;|}[]|CsvConversionError cnl19 = parseListAsRecordType(csvValue3, ["a", "b"], {
    //     allowDataProjection: false
    // });
    // test:assertTrue(cnl19 is CsvConversionError);
    // test:assertEquals((<error>cnl19).message(), "No mapping field in the expected type for header 'b'");

    // anydata[][]|CsvConversionError cnl20 = parseListAsListType(csvValue3 ,{
    //     allowDataProjection: false
    // });
    // test:assertEquals(cnl20, [["a", 2], ["b", 4]]);

    // [string, int][]|CsvConversionError cnl20_2 = parseListAsListType(csvValue3 ,{
    //     allowDataProjection: false
    // });
    // test:assertEquals(cnl20_2, [["a", 2], ["b", 4]]);

    // [string][]|CsvConversionError cnl21 = parseListAsListType(csvValue3 ,{
    //     allowDataProjection: false
    // });
    // test:assertTrue(cnl21 is CsvConversionError);
    // test:assertEquals((<error>cnl21).message(), "invalid array size for expected tuple type, cannot be greater than '1'");

    // [string][]|CsvConversionError cnl21_2 = parseListAsListType(csvValue3 ,{
    //     allowDataProjection: {}
    // });
    // test:assertEquals(cnl21_2, [["a"], ["b"]]);

    // [int][]|CsvConversionError cnl21_3 = parseListAsListType(csvValue3 ,{
    //     allowDataProjection: {}
    // });
    // test:assertTrue(cnl21_3 is CsvConversionError);
    // test:assertEquals((<error>cnl21_3).message(), generateErrorMessageForInvalidValueForArrayType("a", "0", "int"));

    // [string, int...][]|CsvConversionError cnl22 = parseListAsListType(csvValue3 ,{
    //     allowDataProjection: false
    // });
    // test:assertEquals(cnl22, [["a", 2], ["b", 4]]);

    // [string...][]|CsvConversionError cnl23 = parseListAsListType(csvValue3 ,{
    //     allowDataProjection: false
    // });
    // test:assertTrue(cnl23 is CsvConversionError);
    // test:assertEquals((<error> cnl23).message(), generateErrorMessageForInvalidValueForArrayType("2", "1", "string"));

    // [string, ()][]|CsvConversionError cnl24 = parseListAsListType(csvValue3 ,{
    //     allowDataProjection: false
    // });
    // test:assertTrue(cnl24 is CsvConversionError);
    // test:assertEquals((<error>cnl24).message(), generateErrorMessageForInvalidValueForArrayType("2", "1", "()"));

    // string[][]|CsvConversionError cnl25 = parseListAsListType(csvValue3 ,{
    //     allowDataProjection: false
    // });
    // test:assertTrue(cnl25 is CsvConversionError);
    // test:assertEquals((<error> cnl25).message(), generateErrorMessageForInvalidValueForArrayType("2", "1", "string"));

    // string[][1]|CsvConversionError cnl26 = parseListAsListType(csvValue3 ,{
    //     allowDataProjection: false
    // });
    // test:assertTrue(cnl26 is CsvConversionError);
    // test:assertEquals((<error>cnl26).message(), "invalid array size for expected array type, cannot be greater than '1'");
}