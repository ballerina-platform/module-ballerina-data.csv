import ballerina/test;

@test:Config
function testCustomNameAnnotation() returns error? {
    RecordWithCustomAnnotation[]|Error cn1 = parseStringToRecord(string `b,c
                                                           1,3`, {});
    test:assertEquals(cn1, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|Error cn2 = parseStringToRecord(string `c,b
                                          3,1`, {});
    test:assertEquals(cn2, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|Error cn3 = parseStringToRecord(string `f,c,b,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn3, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|Error cn4 = parseStringToRecord(string `d,c
                                                           1,3`, {});
    test:assertEquals(cn4, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|Error cn5 = parseStringToRecord(string `c,d
                                          3,1`, {});
    test:assertEquals(cn5, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|Error cn6 = parseStringToRecord(string `c,f,d,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn6, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|Error cn7 = parseStringToRecord(string `a,b
                                          3,1`, {});
    test:assertTrue(cn7 is Error);
    test:assertEquals((<error>cn7).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation2[]|Error cn8 = parseStringToRecord(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn8 is Error);
    test:assertEquals((<error>cn8).message(), "Duplicate field found in record fields: 'a'");
    
    RecordWithCustomAnnotation3[]|Error cn9 = parseStringToRecord(string `d,c
                                                           1,3`, {});
    test:assertEquals(cn9, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|Error cn10 = parseStringToRecord(string `c,d
                                          3,1`, {});
    test:assertEquals(cn10, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|Error cn11 = parseStringToRecord(string `c,f,d,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn11, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|Error cn12 = parseStringToRecord(string `a,b
                                          3,1`, {});
    test:assertTrue(cn12 is Error);
    test:assertEquals((<error>cn12).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation3[]|Error cn13 = parseStringToRecord(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn13 is Error);
    test:assertEquals((<error>cn13).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|Error cn14 = parseStringToRecord(string `d,c,z
                                                           1,3,true`, {});
    test:assertEquals(cn14, [{b: 1, a: 3, z: true}]);

    RecordWithCustomAnnotation4[]|Error cn15 = parseStringToRecord(string `c,d
                                          3,1`, {});
    test:assertEquals(cn15, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|Error cn16 = parseStringToRecord(string `c,f,d,e
                                                           3,3,1,"cde"
                                                           3,3,1,"cde"`, {});
    test:assertEquals(cn16, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|Error cn17 = parseStringToRecord(string `a,b
                                          3,1`, {});
    test:assertTrue(cn17 is Error);
    test:assertEquals((<error>cn17).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|Error cn18 = parseStringToRecord(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn18 is Error);
    test:assertEquals((<error>cn18).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation5[]|Error cn19 = parseStringToRecord(string ` c,d,a,b
                                          3,1,4,5`, {});
    test:assertTrue(cn19 is Error);
    test:assertEquals((<error>cn19).message(), "Duplicate field found in record fields: 'c'");

    RecordWithCustomAnnotation6[]|Error cn20 = parseStringToRecord(string ` c,d,e
                                          3,1,4
                                          3,1,4`, {});
    test:assertEquals(cn20, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation7[]|Error cn21 = parseStringToRecord(string ` c,d,a
                                          3,1,4
                                          3,1,4`, {});
    test:assertEquals(cn21, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation8[]|Error cn22 = parseStringToRecord(string ` c,d,a
                                          3,1,4
                                          3,1,4`, {});
    test:assertTrue(cn22 is Error);
    test:assertEquals((<error>cn22).message(), "Duplicate field found in record fields: 'c'");

    RecordWithCustomAnnotation[]|Error cnrr1 = parseRecordAsRecordType([{"b": 1, "c": 3}], {});
    test:assertEquals(cnrr1, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|Error cnrr2 = parseRecordAsRecordType([{"c": 3, "b": 1}], {});
    test:assertEquals(cnrr2, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|Error cnrr3 = parseRecordAsRecordType(
                                    [{"f": 3, "c": 3, "b": 1, "e": "cde"}, {"f": 3, "c": 3, "b": 1, "e": "cde"}], {});
    test:assertEquals(cnrr3, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|Error cnrr4 = parseRecordAsRecordType([{"d": 1, "c": 3}], {});
    test:assertEquals(cnrr4, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|Error cnrr5 = parseRecordAsRecordType([{"c": 3, "d": 1}], {});
    test:assertEquals(cnrr5, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|Error cnrr6 = parseRecordAsRecordType(
                                    [{"c": 3, "f": 3, "d": 1, "e": "cde"}, {"c": 3, "f": 3, "d": 1, "e": "cde"}], {});
    test:assertEquals(cnrr6, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|Error cnrr7 = parseRecordAsRecordType([{"a":3, "b": 1}], {});
    test:assertTrue(cnrr7 is Error);
    test:assertEquals((<error>cnrr7).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation2[]|Error cnrr8 = parseRecordAsRecordType([{"c": 3, "d": 1, "a": 4, "b": 5}], {});
    test:assertTrue(cnrr8 is Error);
    test:assertEquals((<error>cnrr8).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation3[]|Error cnrr9 = parseRecordAsRecordType([{"d": 1, "c": 3}], {});
    test:assertEquals(cnrr9, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|Error cnrr10 = parseRecordAsRecordType([{"c": 3, "d": 1}], {});
    test:assertEquals(cnrr10, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|Error cnrr11 = parseRecordAsRecordType(
                                                [{"c": 3, "f": 3, "d": 1, "e": "cde"}, {"c": 3, "f": 3, "d": 1, "e": "cde"}], {});
    test:assertEquals(cnrr11, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|Error cnrr12 = parseRecordAsRecordType([{"a": 3, "b": 1}], {});
    test:assertTrue(cnrr12 is Error);
    test:assertEquals((<error>cnrr12).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation3[]|Error cnrr13 = parseRecordAsRecordType([{"c": 3, "d": 1, "a": 4, "b": 5}], {});
    test:assertTrue(cnrr13 is Error);
    test:assertEquals((<error>cnrr13).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|Error cnrr14 = parseRecordAsRecordType([{"d": 1, "c": 3, "z": true}], {});
    test:assertEquals(cnrr14, [{b: 1, a: 3, z: true}]);

    RecordWithCustomAnnotation4[]|Error cnrr15 = parseRecordAsRecordType([{"c": 3, "d": 1}], {});
    test:assertEquals(cnrr15, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|Error cnrr16 = parseRecordAsRecordType(
                                                [{"c": 3, "f": 3, "d": 1, "e": "cde"}, {"c": 3, "f": 3, "d": 1, "e": "cde"}], {});
    test:assertEquals(cnrr16, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|Error cnrr17 = parseRecordAsRecordType([{"a": 3, "b": 1}], {});
    test:assertTrue(cnrr17 is Error);
    test:assertEquals((<error>cnrr17).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|Error cnrr18 = parseRecordAsRecordType([{"c": 3, "d": 1, "a": 4, "b": 5}], {});
    test:assertTrue(cnrr18 is Error);
    test:assertEquals((<error>cnrr18).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation5[]|Error cnrr19 = parseRecordAsRecordType([{"c": 3, "d": 1, "a": 4, "b": 5}], {});
    test:assertTrue(cnrr19 is Error);
    test:assertEquals((<error>cnrr19).message(), "Duplicate field found in record fields: 'c'");

    RecordWithCustomAnnotation6[]|Error cnrr20 = parseRecordAsRecordType(
                                                [{"c": 3, "d": 1, "e": 4}, {"c": 3, "d": 1, "e": 4}], {});
    test:assertEquals(cnrr20, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation7[]|Error cnrr21 = parseRecordAsRecordType(
                                                [{"c": 3, "d": 1, "a": 4}, {"c": 3, "d": 1, "a": 4}], {});
    test:assertEquals(cnrr21, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation8[]|Error cnrr22 = parseRecordAsRecordType(
                                                [{"c": 3, "d": 1, "a": 4}, {"c": 3, "d": 1, "a": 4}], {});
    test:assertTrue(cnrr22 is Error);
    test:assertEquals((<error>cnrr22).message(), "Duplicate field found in record fields: 'c'");
}

@test:Config
function testCustomNameAnnotation2() returns error? {
    RecordWithCustomAnnotation[]|Error cntr1 = parseListAsRecordType([["1", "3"]], ["b", "c"], {});
    test:assertEquals(cntr1, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|Error cntr2 = parseListAsRecordType([["3", "1"]], ["c", "b"], {});
    test:assertEquals(cntr2, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation[]|Error cntr3 = parseListAsRecordType(
                                    [["3", "3", "1", "cde"], ["3", "3", "1", "cde"]], ["f", "c", "b", "e"], {});
    test:assertEquals(cntr3, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|Error cntr4 = parseListAsRecordType([["1", "3"]], ["d", "c"], {});
    test:assertEquals(cntr4, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|Error cntr5 = parseListAsRecordType([["3","1"]], ["c", "d"], {});
    test:assertEquals(cntr5, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation2[]|Error cntr6 = parseListAsRecordType(
                                    [["3", "3", "1", "cde"], ["3", "3", "1", "cde"]], ["c", "f", "d", "e"], {});
    test:assertEquals(cntr6, [{b: 1, a: 3, f: 3, e: "cde"}, {b: 1, a: 3, f: 3, e: "cde"}]);

    RecordWithCustomAnnotation2[]|Error cntr7 = parseListAsRecordType([["3", "1"]], ["a", "b"], {});
    test:assertTrue(cntr7 is Error);
    test:assertEquals((<error>cntr7).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation2[]|Error cntr8 = parseListAsRecordType([["3", "1", "4", "5"]], ["c", "d", "a", "b"], {});
    test:assertTrue(cntr8 is Error);
    test:assertEquals((<error>cntr8).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation3[]|Error cntr9 = parseListAsRecordType([["1", "3"]], ["d", "c"], {});
    test:assertEquals(cntr9, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|Error cntr10 = parseListAsRecordType([["3", "1"]], ["c", "d"], {});
    test:assertEquals(cntr10, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|Error cntr11 = parseListAsRecordType(
                                                [["3", "3", "1", "cde"], ["3", "3", "1", "cde"]], ["c", "f", "d", "e"], {});
    test:assertEquals(cntr11, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation3[]|Error cntr12 = parseListAsRecordType([["3", "1"]], ["a", "b"], {});
    test:assertTrue(cntr12 is Error);
    test:assertEquals((<error>cntr12).message(), generateErrorMessageForInvalidHeaders(string `["3","1"]`, "data.csv:RecordWithCustomAnnotation3"));

    RecordWithCustomAnnotation3[]|Error cntr13 = parseListAsRecordType([["3", "1", "4", "5"]], ["c", "d", "a", "b"], {});
    test:assertTrue(cntr13 is Error);
    test:assertEquals((<error>cntr13).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|Error cntr14 = parseListAsRecordType([["1", "3", "true"]], ["d", "c", "z"], {});
    test:assertEquals(cntr14, [{b: 1, a: 3, z: true}]);

    RecordWithCustomAnnotation4[]|Error cntr15 = parseListAsRecordType([["3", "1"]], ["c", "d"], {});
    test:assertEquals(cntr15, [{b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|Error cntr16 = parseListAsRecordType(
                                                [["3", "3", "1", "cde"], ["3", "3", "1", "cde"]], ["c", "f", "d", "e"], {});
    test:assertEquals(cntr16, [{b: 1, a: 3}, {b: 1, a: 3}]);

    RecordWithCustomAnnotation4[]|Error cntr17 = parseListAsRecordType([["3", "1"]], ["a", "b"], {});
    test:assertTrue(cntr17 is Error);
    test:assertEquals((<error>cntr17).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation4[]|Error cntr18 = parseListAsRecordType([["3", "1", "4", "5"]], ["c", "d", "a", "b"], {});
    test:assertTrue(cntr18 is Error);
    test:assertEquals((<error>cntr18).message(), "Duplicate field found in record fields: 'a'");

    RecordWithCustomAnnotation5[]|Error cntr19 = parseListAsRecordType([["3", "1", "4", "5"]], ["c", "d", "a", "b"], {});
    test:assertTrue(cntr19 is Error);
    test:assertEquals((<error>cntr19).message(), "Duplicate field found in record fields: 'c'");

    RecordWithCustomAnnotation6[]|Error cntr20 = parseListAsRecordType(
                                                [["3", "1", "4"], ["3", "1", "4"]], ["c", "d", "e"], {});
    test:assertEquals(cntr20, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation7[]|Error cntr21 = parseListAsRecordType(
                                                [["3", "1", "4"], ["3", "1", "4"]], ["c", "d", "a"], {});
    test:assertEquals(cntr21, [{a: 3, b: 1, c: 4}, {a: 3, b: 1, c: 4}]);

    RecordWithCustomAnnotation8[]|Error cntr22 = parseListAsRecordType(
                                                [["3", "1", "4"], ["3", "1", "4"]], ["c", "d", "a"], {});
    test:assertTrue(cntr22 is Error);
    test:assertEquals((<error>cntr22).message(), "Duplicate field found in record fields: 'c'");
}

@test:Config
function testAbsentAsNilableConfig() returns error? {
    record {|int a; int? g; int? h;|}[]|Error cn = parseStringToRecord(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1
    });
    test:assertEquals(cn, [{a: 1, g: (), h: ()}, {a: 2, g: (), h: ()}, {a: 3, g: (), h: ()}, {a: 4, g: (), h: ()}, {a: 5, g: (), h: ()}]);

    record {|int a; int? g?;|}[]|Error cn2 = parseStringToRecord(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn2, [{a: 1}]);

    record {|int a; int g?;|}[]|Error cn3 = parseStringToRecord(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn3, [{a: 1}]);

    record {|int a; int g;|}[]|Error cn4 = parseStringToRecord(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertTrue(cn4 is Error);
    test:assertEquals((<error>cn4).message(), generateErrorMessageForMissingRequiredField("g"));

    int?[][]|Error cn5 = parseStringToList(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1
    });
    test:assertEquals(cn5, [[1, 1, 1]]);

    map<int?>[]|Error cn6 = parseStringToRecord(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1
    });
    test:assertEquals(cn6, [{a: 1, b: 1, c: 1}]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|Error cn7 = parseStringToList(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn7, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|Error cn8 = parseStringToList(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn8, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|Error cn9 = parseStringToList(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn9, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|Error cn10 = parseStringToList(csvStringData1, {
        allowDataProjection: {absentAsNilableType: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn10, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);
}

@test:Config
function testAbsentAsNilableConfig2() returns error? {
    record {|int a; int? g; int? h;|}[]|Error cn = parseRecordAsRecordType([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn, [{a: 1, g: (), h: ()}, {a: 2, g: (), h: ()}]);

    record {|int a; int? g?;|}[]|Error cn2 = parseRecordAsRecordType([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn2, [{a: 1}, {a: 2}]);

    record {|int a; int g?;|}[]|Error cn3 = parseRecordAsRecordType([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn3, [{a: 1}, {a: 2}]);

    record {|int a; int g;|}[]|Error cn4 = parseRecordAsRecordType([{"a": 1}, {"a": 2}, {"a": 3}], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertTrue(cn4 is Error);
    test:assertEquals((<error>cn4).message(), generateErrorMessageForMissingRequiredField("g"));

    record {|string a; int? g; int? h;|}[]|Error cn5 = parseListAsRecordType([["a"], ["a"], ["a"]], ["a"], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn5, [{a: "a", g: (), h: ()}, {a: "a", g: (), h: ()}]);

    record {|string a; int? g?;|}[]|Error cn6 = parseListAsRecordType([["a"], ["a"], ["a"]], ["a"], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertEquals(cn6, [{a: "a"}, {a: "a"}]);

    record {|string a; int g?;|}[]|Error cn7 = parseListAsRecordType([["a"], ["a"], ["b"]], ["a"], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [2]
    });
    test:assertEquals(cn7, [{a: "a"}, {a: "b"}]);

    record {|string a; int g;|}[]|Error cn8 = parseListAsRecordType([["a"], ["a"], ["a"]], ["a"], {
        allowDataProjection: {absentAsNilableType: true}, skipLines: [3]
    });
    test:assertTrue(cn8 is Error);
    test:assertEquals((<error>cn8).message(), generateErrorMessageForMissingRequiredField("g"));
}

@test:Config
function testNilAsOptionalConfig() returns error? {
    record {|int a; int f?;|}[]|Error cn = parseStringToRecord(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1
    });
    test:assertEquals(cn, [{a: 1}, {a: 2}, {a: 3}, {a: 4}, {a: 5}]);

    record {|int a; int? f?;|}[]|Error cn2 = parseStringToRecord(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn2, [{a: 1, f: ()}]);

    record {|int a; int f?;|}[]|Error cn3 = parseStringToRecord(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn3, [{a: 1}]);

    record {|int a; int f;|}[]|Error cn4 = parseStringToRecord(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertTrue(cn4 is Error);
    test:assertEquals((<error>cn4).message(), generateErrorMessageForInvalidCast("()", "int"));

    int?[][]|Error cn5 = parseStringToList(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1
    });
    test:assertEquals(cn5, [[1, 1, 1]]);

    map<int?>[]|Error cn6 = parseStringToRecord(string `
                                                           a,b,c
                                                           1, 1,1`, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1
    });
    test:assertEquals(cn6, [{a: 1, b: 1, c: 1}]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|Error cn7 = parseStringToList(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn7, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|Error cn8 = parseStringToList(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn8, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|Error cn9 = parseStringToList(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn9, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);

    [int, string?, boolean?, decimal?, float?, (), string?][]|Error cn10 = parseStringToList(csvStringData1, {
        allowDataProjection: {nilAsOptionalField: true},
        header: 1,
        skipLines: "2-10"
    });
    test:assertEquals(cn10, [[1, "string1", true, <decimal>2.234, <float>2.234, null, null]]);
}

@test:Config
function testNilAsOptionalConfig2() returns error? {
    record {|int a; int? f;|}[]|Error cn = parseRecordAsRecordType([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertEquals(cn, [{a: 1, f: ()}, {a: 2, f: ()}]);

    record {|int a; int? f?;|}[]|Error cn2 = parseRecordAsRecordType([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertEquals(cn2, [{a: 1, f: ()}, {a: 2, f: ()}]);

    record {|int a; int f?;|}[]|Error cn3 = parseRecordAsRecordType([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertEquals(cn3, [{a: 1}, {a: 2}]);

    record {|int a; int f;|}[]|Error cn4 = parseRecordAsRecordType([{"a": 1, "f": ()}, {"a": 2, "f": ()}, {"a": 3, "f": ()}], {
        allowDataProjection: {nilAsOptionalField: true}, skipLines: [3]
    });
    test:assertTrue(cn4 is Error);
    test:assertEquals((<error>cn4).message(), generateErrorMessageForInvalidFieldType("null", "f"));
}

@test:Config
function testDataProjectionConfig() returns error? {
    string csvValue1 = string `a,b
                             "a",2
                             b,4`;
    record{}[] csvValue2 = [{"a": "a", "b": 2}, {"a": "b", "b": 4}];

    record{}[]|Error cn = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a; int b;|}[]|Error cn_2 = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn_2, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a;|}[]|Error cn2 = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn2 is Error);
    test:assertEquals((<error>cn2).message(), "No mapping field in the expected type for header 'b'");

    record{|string a; int...;|}[]|Error cn3 = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn3, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string...;|}[]|Error cn4 = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn4, [{"a": "a", "b": "2"}, {"a": "b", "b": "4"}]);

    record{|string a?;|}[]|Error cn5 = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn5 is Error);
    test:assertEquals((<error>cn5).message(), "No mapping field in the expected type for header 'b'");

    record{|string? a;|}[]|Error cn6 = parseStringToRecord(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn6 is Error);
    test:assertEquals((<error>cn6).message(), "No mapping field in the expected type for header 'b'");

    anydata[][]|Error c7 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(c7, [["a", 2], ["b", 4]]);

    [string, int][]|Error cn7_2 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn7_2, [["a", 2], ["b", 4]]);

    [string][]|Error cn8 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn8 is Error);
    test:assertEquals((<error>cn8).message(), "invalid array size for expected tuple type, cannot be greater than '1'");

    [string][]|Error cn8_2 = parseStringToList(csvValue1, {
        allowDataProjection: {}
    });
    test:assertEquals(cn8_2, [["a"], ["b"]]);

    [int][]|Error cn8_3 = parseStringToList(csvValue1, {
        allowDataProjection: {}
    });
    test:assertTrue(cn8_3 is Error);
    test:assertEquals((<error>cn8_3).message(), generateErrorMessageForInvalidCast("a", "int"));

    [string, int...][]|Error cn9 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn9, [["a", 2], ["b", 4]]);

    [string...][]|Error cn10 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn10, [["a", "2"], ["b", "4"]]);

    [string, ()][]|Error cn11 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn11 is Error);
    test:assertEquals((<error>cn11).message(), generateErrorMessageForInvalidCast("2", "()"));

    string[][]|Error cn12 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertEquals(cn12, [["a", "2"], ["b", "4"]]);

    string[][1]|Error cn13 = parseStringToList(csvValue1, {
        allowDataProjection: false
    });
    test:assertTrue(cn13 is Error);
    test:assertEquals((<error>cn13).message(), "invalid array size for expected array type, cannot be greater than '1'");

    record{}[]|Error cn14 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn14, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a; int b;|}[]|Error cn14_2 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn14_2, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string a;|}[]|Error cn15 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertTrue(cn15 is Error);
    test:assertEquals((<error>cn15).message(), "No mapping field in the expected type for header 'b'");

    record{|string a; int...;|}[]|Error cn16 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn16, [{"a": "a", "b": 2}, {"a": "b", "b": 4}]);

    record{|string...;|}[]|Error cn17 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertEquals(cn17, [{"a": "a"}, {"a": "b"}]);

    record{|string a?;|}[]|Error cn18 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertTrue(cn18 is Error);
    test:assertEquals((<error>cn18).message(), "No mapping field in the expected type for header 'b'");

    record{|string? a;|}[]|Error cn19 = parseRecordAsRecordType(csvValue2, {
        allowDataProjection: false
    });
    test:assertTrue(cn19 is Error);
    test:assertEquals((<error>cn19).message(), "No mapping field in the expected type for header 'b'");

    anydata[][]|Error c20 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertEquals(c20, [["a", 2], ["b", 4]]);

    [string, int][]|Error cn20_2 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertEquals(cn20_2, [["a", 2], ["b", 4]]);

    [string][]|Error cn21 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertTrue(cn21 is Error);
    test:assertEquals((<error>cn21).message(), "invalid array size for expected tuple type, cannot be greater than '1'");

    [string][]|Error cn21_2 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: {}
    });
    test:assertEquals(cn21_2, [["a"], ["b"]]);

    [int][]|Error cn21_3 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: {}
    });
    test:assertTrue(cn21_3 is Error);
    test:assertEquals((<error>cn21_3).message(), generateErrorMessageForInvalidValueForArrayType("a", "0", "int"));

    [string, int...][]|Error cn22 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertEquals(cn22, [["a", 2], ["b", 4]]);

    [string...][]|Error cn23 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false 
    });
    test:assertTrue(cn23 is Error);
    test:assertEquals((<error> cn23).message(), generateErrorMessageForInvalidValueForArrayType("2", "1", "string"));

    [string, ()][]|Error cn24 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertTrue(cn24 is Error);
    test:assertEquals((<error>cn24).message(), generateErrorMessageForInvalidValueForArrayType("2", "1", "()"));

    string[][]|Error cn25 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertTrue(cn25 is Error);
    test:assertEquals((<error> cn25).message(), generateErrorMessageForInvalidValueForArrayType("2", "1", "string"));

    string[][1]|Error cn26 = parseRecordAsListType(csvValue2, ["a", "b"] ,{
        allowDataProjection: false
    });
    test:assertTrue(cn26 is Error);
    test:assertEquals((<error>cn26).message(), "invalid array size for expected array type, cannot be greater than '1'");
}
