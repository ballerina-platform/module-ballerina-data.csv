import ballerina/csv_commons as common;
import ballerina/data.csv as csv;
import ballerina/test;

@test:Config
function testCustomNameAnnotation() returns error? {
    RecordWithCustomAnnotation[]|csv:Error cn1 = csv:parseStringToRecord(string `b,c
                                                           1,3`, {});
    test:assertEquals(cn1, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|csv:Error cn2 = csv:parseStringToRecord(string `c,b
                                          3,1`, {});
    test:assertEquals(cn2, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|csv:Error cn3 = csv:parseStringToRecord(string `f,c,b,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn3, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|csv:Error cn4 = csv:parseStringToRecord(string `d,c
                                                           1,3`, {});
    test:assertEquals(cn4, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|csv:Error cn5 = csv:parseStringToRecord(string `c,d
                                          3,1`, {});
    test:assertEquals(cn5, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|csv:Error cn6 = csv:parseStringToRecord(string `c,f,d,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn6, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|csv:Error cn7 = csv:parseStringToRecord(string `a,b
                                          3,1`, {});
    test:assertTrue(cn7 is csv:Error);
    test:assertEquals((<error>cn7).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation2[]|csv:Error cn8 = csv:parseStringToRecord(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn8 is csv:Error);
    test:assertEquals((<error>cn8).message(), "Duplicate field found in record fields: 'a'");
    
    RecordWithCustomAnnotation3[]|csv:Error cn9 = csv:parseStringToRecord(string `d,c
                                                           1,3`, {});
    test:assertEquals(cn9, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cn10 = csv:parseStringToRecord(string `c,d
                                          3,1`, {});
    test:assertEquals(cn10, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cn11 = csv:parseStringToRecord(string `c,f,d,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn11, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cn12 = csv:parseStringToRecord(string `a,b
                                          3,1`, {});
    test:assertTrue(cn12 is csv:Error);
    test:assertEquals((<error>cn12).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation3[]|csv:Error cn13 = csv:parseStringToRecord(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn13 is csv:Error);
    test:assertEquals((<error>cn13).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|csv:Error cn14 = csv:parseStringToRecord(string `d,c,z
                                                           1,3,true`, {});
    test:assertEquals(cn14, [{b: 1, a: 3, z: true}]);

    RecordWithCustomAnnotation4[]|csv:Error cn15 = csv:parseStringToRecord(string `c,d
                                          3,1`, {});
    test:assertEquals(cn15, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|csv:Error cn16 = csv:parseStringToRecord(string `c,f,d,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn16, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|csv:Error cn17 = csv:parseStringToRecord(string `a,b
                                          3,1`, {});
    test:assertTrue(cn17 is csv:Error);
    test:assertEquals((<error>cn17).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|csv:Error cn18 = csv:parseStringToRecord(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn18 is csv:Error);
    test:assertEquals((<error>cn18).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation5[]|csv:Error cn19 = csv:parseStringToRecord(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn19 is csv:Error);
    test:assertEquals((<error>cn19).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation5[]|csv:Error cn20 = csv:parseStringToRecord(string ` c,d,e
                                          3,1,4
                                          3,1,4`, {});
    test:assertEquals(cn20, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation6[]|csv:Error cn21 = csv:parseStringToRecord(string ` c,d,a
                                          3,1,4
                                          3,1,4`, {});
    test:assertEquals(cn21, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation[]|csv:Error cnrr1 = csv:parseRecordAsRecordType([{"b": 1, "c": 3}], {});
    test:assertEquals(cnrr1, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|csv:Error cnrr2 = csv:parseRecordAsRecordType([{"c": 3, "b": 1}], {});
    test:assertEquals(cnrr2, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|csv:Error cnrr3 = csv:parseRecordAsRecordType(
                                    [{"f": 3, "c": 3, "b": 1, "e": "cde"}, {"f": 3, "c": 3, "b": 1, "e": "cde"}], {});
    test:assertEquals(cnrr3, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|csv:Error cnrr4 = csv:parseRecordAsRecordType([{"d": 1, "c": 3}], {});
    test:assertEquals(cnrr4, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|csv:Error cnrr5 = csv:parseRecordAsRecordType([{"c": 3, "d": 1}], {});
    test:assertEquals(cnrr5, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|csv:Error cnrr6 = csv:parseRecordAsRecordType(
                                    [{"c": 3, "f": 3, "d": 1, "e": "cde"}, {"c": 3, "f": 3, "d": 1, "e": "cde"}], {});
    test:assertEquals(cnrr6, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|csv:Error cnrr7 = csv:parseRecordAsRecordType([{"a":3, "b": 1}], {});
    test:assertTrue(cnrr7 is csv:Error);
    test:assertEquals((<error>cnrr7).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation2[]|csv:Error cnrr8 = csv:parseRecordAsRecordType([{"c": 3, "d": 1, "a": 4, "b": 5}], {});
    test:assertTrue(cnrr8 is csv:Error);
    test:assertEquals((<error>cnrr8).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation3[]|csv:Error cnrr9 = csv:parseRecordAsRecordType([{"d": 1, "c": 3}], {});
    test:assertEquals(cnrr9, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cnrr10 = csv:parseRecordAsRecordType([{"c": 3, "d": 1}], {});
    test:assertEquals(cnrr10, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cnrr11 = csv:parseRecordAsRecordType(
                                                [{"c": 3, "f": 3, "d": 1, "e": "cde"}, {"c": 3, "f": 3, "d": 1, "e": "cde"}], {});
    test:assertEquals(cnrr11, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cnrr12 = csv:parseRecordAsRecordType([{"a": 3, "b": 1}], {});
    test:assertTrue(cnrr12 is csv:Error);
    test:assertEquals((<error>cnrr12).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation3[]|csv:Error cnrr13 = csv:parseRecordAsRecordType([{"c": 3, "d": 1, "a": 4, "b": 5}], {});
    test:assertTrue(cnrr13 is csv:Error);
    test:assertEquals((<error>cnrr13).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|csv:Error cnrr14 = csv:parseRecordAsRecordType([{"d": 1, "c": 3, "z": true}], {});
    test:assertEquals(cnrr14, [{b: 1, a: 3, z: true}]);

    RecordWithCustomAnnotation4[]|csv:Error cnrr15 = csv:parseRecordAsRecordType([{"c": 3, "d": 1}], {});
    test:assertEquals(cnrr15, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|csv:Error cnrr16 = csv:parseRecordAsRecordType(
                                                [{"c": 3, "f": 3, "d": 1, "e": "cde"}, {"c": 3, "f": 3, "d": 1, "e": "cde"}], {});
    test:assertEquals(cnrr16, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation5[]|csv:Error cnrr20 = csv:parseRecordAsRecordType(
                                                [{"c": 3, "d": 1, "e": 4}, {"c": 3, "d": 1, "e": 4}], {});
    test:assertEquals(cnrr20, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation6[]|csv:Error cnrr21 = csv:parseRecordAsRecordType(
                                                [{"c": 3, "d": 1, "a": 4}, {"c": 3, "d": 1, "a": 4}], {});
    test:assertEquals(cnrr21, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);
}

@test:Config
function testCustomNameAnnotation2() returns error? {
    RecordWithCustomAnnotation[]|csv:Error cntr1 = csv:parseListAsRecordType([["1", "3"]], ["b", "c"], {});
    test:assertEquals(cntr1, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|csv:Error cntr2 = csv:parseListAsRecordType([["3", "1"]], ["c", "b"], {});
    test:assertEquals(cntr2, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|csv:Error cntr3 = csv:parseListAsRecordType(
                                    [["3", "3", "1", "cde"], ["3", "3", "1", "cde"]], ["f", "c", "b", "e"], {});
    test:assertEquals(cntr3, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|csv:Error cntr4 = csv:parseListAsRecordType([["1", "3"]], ["d", "c"], {});
    test:assertEquals(cntr4, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|csv:Error cntr5 = csv:parseListAsRecordType([["3","1"]], ["c", "d"], {});
    test:assertEquals(cntr5, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|csv:Error cntr6 = csv:parseListAsRecordType(
                                    [["3", "3", "1", "cde"], ["3", "3", "1", "cde"]], ["c", "f", "d", "e"], {});
    test:assertEquals(cntr6, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|csv:Error cntr7 = csv:parseListAsRecordType([["3", "1"]], ["a", "b"], {});
    test:assertTrue(cntr7 is csv:Error);
    test:assertEquals((<error>cntr7).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation2[]|csv:Error cntr8 = csv:parseListAsRecordType([["3", "1", "4", "5"]], ["c", "d", "a", "b"], {});
    test:assertTrue(cntr8 is csv:Error);
    test:assertEquals((<error>cntr8).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation3[]|csv:Error cntr9 = csv:parseListAsRecordType([["1", "3"]], ["d", "c"], {});
    test:assertEquals(cntr9, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cntr10 = csv:parseListAsRecordType([["3", "1"]], ["c", "d"], {});
    test:assertEquals(cntr10, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cntr11 = csv:parseListAsRecordType(
                                                [["3", "3", "1", "cde"], ["3", "3", "1", "cde"]], ["c", "f", "d", "e"], {});
    test:assertEquals(cntr11, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|csv:Error cntr12 = csv:parseListAsRecordType([["3", "1"]], ["a", "b"], {});
    test:assertTrue(cntr12 is csv:Error);
    test:assertEquals((<error>cntr12).message(), common:generateErrorMessageForInvalidHeaders(string `["3","1"]`, "user_config_tests:RecordWithCustomAnnotation3"));

    RecordWithCustomAnnotation3[]|csv:Error cntr13 = csv:parseListAsRecordType([["3", "1", "4", "5"]], ["c", "d", "a", "b"], {});
    test:assertTrue(cntr13 is csv:Error);
    test:assertEquals((<error>cntr13).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|csv:Error cntr14 = csv:parseListAsRecordType([["1", "3", "true"]], ["d", "c", "z"], {});
    test:assertEquals(cntr14, [{b: 1, a: 3, z: true}]);

    RecordWithCustomAnnotation4[]|csv:Error cntr15 = csv:parseListAsRecordType([["3", "1"]], ["c", "d"], {});
    test:assertEquals(cntr15, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|csv:Error cntr16 = csv:parseListAsRecordType(
                                                [["3", "3", "1", "cde"], ["3", "3", "1", "cde"]], ["c", "f", "d", "e"], {});
    test:assertEquals(cntr16, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|csv:Error cntr17 = csv:parseListAsRecordType([["3", "1"]], ["a", "b"], {});
    test:assertTrue(cntr17 is csv:Error);
    test:assertEquals((<error>cntr17).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|csv:Error cntr18 = csv:parseListAsRecordType([["3", "1", "4", "5"]], ["c", "d", "a", "b"], {});
    test:assertTrue(cntr18 is csv:Error);
    test:assertEquals((<error>cntr18).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation5[]|csv:Error cntr19 = csv:parseListAsRecordType([["3", "1", "4", "5"]], ["c", "d", "a", "b"], {});
    test:assertTrue(cntr19 is csv:Error);
    test:assertEquals((<error>cntr19).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation5[]|csv:Error cntr20 = csv:parseListAsRecordType(
                                                [["3", "1", "4"], ["3", "1", "4"]], ["c", "d", "e"], {});
    test:assertEquals(cntr20, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation6[]|csv:Error cntr21 = csv:parseListAsRecordType(
                                                [["3", "1", "4"], ["3", "1", "4"]], ["c", "d", "a"], {});
    test:assertEquals(cntr21, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);
}

@test:Config
function testAbsentAsNilableConfig() returns error? {
    record {|int a; int? g; int? h;|}[]|csv:Error cn = csv:parseStringToRecord(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1
    });
    test:assertEquals(cn, [{a: 1, g: (), h: ()}, {a: 2, g: (), h: ()}, {a: 3, g: (), h: ()}, {a: 4, g: (), h: ()}, {a: 5, g: (), h: ()}]);

    record {|int a; int? g?;|}[]|csv:Error cn2 = csv:parseStringToRecord(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn2, [{a: 1}]);

    record {|int a; int g?;|}[]|csv:Error cn3 = csv:parseStringToRecord(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn3, [{a: 1}]);

    record {|int a; int g;|}[]|csv:Error cn4 = csv:parseStringToRecord(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertTrue(cn4 is csv:Error);
    test:assertEquals((<error>cn4).message(), common:generateErrorMessageForMissingRequiredField("g"));

    int?[][]|csv:Error cn5 = csv:parseStringToList(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1
    });
    test:assertEquals(cn5, [[1, 1, 1]]);

    map<int?>[]|csv:Error cn6 = csv:parseStringToRecord(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1
    });
    test:assertEquals(cn6, [{a: 1, b: 1, c: 1}]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn7 = csv:parseStringToList(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn7, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn8 = csv:parseStringToList(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn8, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn9 = csv:parseStringToList(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn9, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn10 = csv:parseStringToList(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn10, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);
}

@test:Config
function testAbsentAsNilableConfig2() returns error? {
    record {|int a; int? g; int? h;|}[]|csv:Error cn = csv:parseRecordAsRecordType([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn, [{a: 1, g: (), h: ()}, {a: 2, g: (), h: ()}]);

    record {|int a; int? g?;|}[]|csv:Error cn2 = csv:parseRecordAsRecordType([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn2, [{a: 1}, {a: 2}]);

    record {|int a; int g?;|}[]|csv:Error cn3 = csv:parseRecordAsRecordType([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn3, [{a: 1}, {a: 2}]);

    record {|int a; int g;|}[]|csv:Error cn4 = csv:parseRecordAsRecordType([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertTrue(cn4 is csv:Error);
    test:assertEquals((<error>cn4).message(), common:generateErrorMessageForMissingRequiredField("g"));

    record {|string a; int? g; int? h;|}[]|csv:Error cn5 = csv:parseListAsRecordType([["a"], ["a"], ["a"]], ["a"], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn5, [{a: "a", g: (), h: ()}, {a: "a", g: (), h: ()}]);

    record {|string a; int? g?;|}[]|csv:Error cn6 = csv:parseListAsRecordType([["a"], ["a"], ["a"]], ["a"], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn6, [{a: "a"}, {a: "a"}]);

    record {|string a; int g?;|}[]|csv:Error cn7 = csv:parseListAsRecordType([["a"], ["a"], ["b"]], ["a"], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [2]
    });
    test:assertEquals(cn7, [{a: "a"}, {a: "b"}]);

    record {|string a; int g;|}[]|csv:Error cn8 = csv:parseListAsRecordType([["a"], ["a"], ["a"]], ["a"], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertTrue(cn8 is csv:Error);
    test:assertEquals((<error>cn8).message(), common:generateErrorMessageForMissingRequiredField("g"));
}

@test:Config
function testNilAsOptionalConfig() returns error? {
    record {|int a; int f?;|}[]|csv:Error cn = csv:parseStringToRecord(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1
    });
    test:assertEquals(cn, [{a: 1}, {a: 2}, {a: 3}, {a: 4}, {a: 5}]);

    record {|int a; int? f?;|}[]|csv:Error cn2 = csv:parseStringToRecord(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn2, [{a: 1, f: ()}]);

    record {|int a; int f?;|}[]|csv:Error cn3 = csv:parseStringToRecord(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn3, [{a: 1}]);

    record {|int a; int f;|}[]|csv:Error cn4 = csv:parseStringToRecord(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertTrue(cn4 is csv:Error);
    test:assertEquals((<error>cn4).message(), common:generateErrorMessageForInvalidCast("()", "int"));

    int?[][]|csv:Error cn5 = csv:parseStringToList(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1
    });
    test:assertEquals(cn5, [[1, 1, 1]]);

    map<int?>[]|csv:Error cn6 = csv:parseStringToRecord(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1
    });
    test:assertEquals(cn6, [{a: 1, b: 1, c: 1}]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn7 = csv:parseStringToList(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn7, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn8 = csv:parseStringToList(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn8, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn9 = csv:parseStringToList(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn9, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|csv:Error cn10 = csv:parseStringToList(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn10, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);
}

@test:Config
function testNilAsOptionalConfig2() returns error? {
    record {|int a; int? f;|}[]|csv:Error cn = csv:parseRecordAsRecordType([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertEquals(cn, [{a: 1, f: ()}, {a: 2, f: ()}]);

    record {|int a; int? f?;|}[]|csv:Error cn2 = csv:parseRecordAsRecordType([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertEquals(cn2, [{a: 1, f: ()}, {a: 2, f: ()}]);

    record {|int a; int f?;|}[]|csv:Error cn3 = csv:parseRecordAsRecordType([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertEquals(cn3, [{a: 1}, {a: 2}]);

    record {|int a; int f;|}[]|csv:Error cn4 = csv:parseRecordAsRecordType([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertTrue(cn4 is csv:Error);
    test:assertEquals((<error>cn4).message(), common:generateErrorMessageForInvalidFieldType("null", "f"));
}

@test:Config
function testDataProjectionConfig() returns error? {
    string csvValue1 = string `a,b
                             "a",2
                             b,4`;
    record{}[] csvValue2 = [{"a": "a", "b": 2}, {"a": "b", "b": 4}];

    record{}[]|csv:Error cn = csv:parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a; int b;|}[]|csv:Error cn_2 = csv:parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn_2, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a;|}[]|csv:Error cn2 = csv:parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn2 is csv:Error);
    test:assertEquals((<error>cn2).message(), "No mapping field in the expected type for header 'b'");

    record{|string a; int...;|}[]|csv:Error cn3 = csv:parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn3, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string...;|}[]|csv:Error cn4 = csv:parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn4, [{"a": "a", "b": "2"}, {"a": "b", "b": "4"}]);

    record{|string a?;|}[]|csv:Error cn5 = csv:parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn5 is csv:Error);
    test:assertEquals((<error>cn5).message(), "No mapping field in the expected type for header 'b'");

    record{|string? a;|}[]|csv:Error cn6 = csv:parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn6 is csv:Error);
    test:assertEquals((<error>cn6).message(), "No mapping field in the expected type for header 'b'");

    anydata[][]|csv:Error c7 = csv:parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(c7, [["a", 2], ["b", 4]]);

    [string, int][]|csv:Error cn7_2 = csv:parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn7_2, [["a", 2], ["b", 4]]);

    [string][]|csv:Error cn8 = csv:parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn8 is csv:Error);
    test:assertEquals((<error>cn8).message(), "invalid array size for expected tuple type, cannot be greater than '1'");

    [string][]|csv:Error cn8_2 = csv:parseStringToList(csvValue1, {
        allowDataProjection: {}
    });
    test:assertEquals(cn8_2, [["a"], ["b"]]);

    [int][]|csv:Error cn8_3 = csv:parseStringToList(csvValue1, {
        allowDataProjection: {}
    });
    test:assertTrue(cn8_3 is csv:Error);
    test:assertEquals((<error>cn8_3).message(), common:generateErrorMessageForInvalidCast("a", "int"));

    [string, int...][]|csv:Error cn9 = csv:parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn9, [["a", 2], ["b", 4]]);

    [string...][]|csv:Error cn10 = csv:parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn10, [["a", "2"], ["b", "4"]]);

    [string, ()][]|csv:Error cn11 = csv:parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn11 is csv:Error);
    test:assertEquals((<error>cn11).message(), common:generateErrorMessageForInvalidCast("2", "()"));

    string[][]|csv:Error cn12 = csv:parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn12, [["a", "2"], ["b", "4"]]);

    string[][1]|csv:Error cn13 = csv:parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn13 is csv:Error);
    test:assertEquals((<error>cn13).message(), "invalid array size for expected array type, cannot be greater than '1'");

    record{}[]|csv:Error cn14 = csv:parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn14, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a; int b;|}[]|csv:Error cn14_2 = csv:parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn14_2, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a;|}[]|csv:Error cn15 = csv:parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertTrue(cn15 is csv:Error);
    test:assertEquals((<error>cn15).message(), "No mapping field in the expected type for header 'b'");

    record{|string a; int...;|}[]|csv:Error cn16 = csv:parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn16, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string...;|}[]|csv:Error cn17 = csv:parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn17, [{"a": "a"}, {"a": "b"}]);

    record{|string a?;|}[]|csv:Error cn18 = csv:parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertTrue(cn18 is csv:Error);
    test:assertEquals((<error>cn18).message(), "No mapping field in the expected type for header 'b'");

    record{|string? a;|}[]|csv:Error cn19 = csv:parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertTrue(cn19 is csv:Error);
    test:assertEquals((<error>cn19).message(), "No mapping field in the expected type for header 'b'");

    anydata[][]|csv:Error c20 = csv:parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertEquals(c20, [["a", 2], ["b", 4]]);

    [string, int][]|csv:Error cn20_2 = csv:parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertEquals(cn20_2, [["a", 2], ["b", 4]]);

    [string][]|csv:Error cn21 = csv:parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertTrue(cn21 is csv:Error);
    test:assertEquals((<error>cn21).message(), "invalid array size for expected tuple type, cannot be greater than '1'");

    [string][]|csv:Error cn21_2 = csv:parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: {}
    });
    test:assertEquals(cn21_2, [["a"], ["b"]]);

    [int][]|csv:Error cn21_3 = csv:parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: {}
    });
    test:assertTrue(cn21_3 is csv:Error);
    test:assertEquals((<error>cn21_3).message(), common:generateErrorMessageForInvalidValueForArrayType("a", "0", "int"));

    [string, int...][]|csv:Error cn22 = csv:parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertEquals(cn22, [["a", 2], ["b", 4]]);

    [string...][]|csv:Error cn23 = csv:parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false 
    });
    test:assertTrue(cn23 is csv:Error);
    test:assertEquals((<error> cn23).message(), common:generateErrorMessageForInvalidValueForArrayType("2", "1", "string"));

    [string, ()][]|csv:Error cn24 = csv:parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertTrue(cn24 is csv:Error);
    test:assertEquals((<error>cn24).message(), common:generateErrorMessageForInvalidValueForArrayType("2", "1", "()"));

    string[][]|csv:Error cn25 = csv:parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertTrue(cn25 is csv:Error);
    test:assertEquals((<error> cn25).message(), common:generateErrorMessageForInvalidValueForArrayType("2", "1", "string"));

    string[][1]|csv:Error cn26 = csv:parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertTrue(cn26 is csv:Error);
    test:assertEquals((<error>cn26).message(), "invalid array size for expected array type, cannot be greater than '1'");
}
