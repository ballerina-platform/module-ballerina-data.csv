import ballerina/test;

// boolean enable = true;

// @test:Config {enable: !enable}
// function debugTest() {
//         StringRecord10Array|CsvConversionError st1sr10 = parseListAsRecordType([st1, st1], (), {}, StringRecord10Array);
//     test:assertEquals(st1sr10, [
//         {'1: "string", '2: ""},
//         {'1: "string", '2: ""}
//     ]);
// }

@test:Config {enable}
function testFromCsvWithTypeForMapAndRecordAsExpectedType() {
    BooleanRecord1Array|CsvConversionError bm1br1 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord1Array);
    test:assertTrue(bm1br1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br1).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord1Array|CsvConversionError bm2br1 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord1Array);
    test:assertTrue(bm2br1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2br1).message(), generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord1Array|CsvConversionError bm3br1 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord1Array);
    test:assertEquals(bm3br1, [
        {b1: true, b2: false, b3: (), b4: false, i1: 1},
        {b1: true, b2: false, b3: (), b4: false, i1: 1}
    ]);

    BooleanRecord1Array|CsvConversionError bm4br1 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord1Array);
    test:assertTrue(bm4br1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br1).message(), generateErrorMessageForMissingRequiredField("b2"));

    BooleanRecord1Array|CsvConversionError bm5br1 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord1Array);
    test:assertEquals(bm5br1, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord2Array|CsvConversionError bm1br2 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord2Array);
    test:assertTrue(bm1br2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br2).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord2Array|CsvConversionError bm2br2 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord2Array);
    test:assertTrue(bm2br2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2br2).message(), generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord2Array|CsvConversionError bm3br2 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord2Array);
    test:assertEquals(bm3br2, [
        {b1: true, b2: false, b3: (), b4: false},
        {b1: true, b2: false, b3: (), b4: false}
    ]);

    BooleanRecord2Array|CsvConversionError bm4br2 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord2Array);
    test:assertTrue(bm4br2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br2).message(), generateErrorMessageForMissingRequiredField("b2"));

    BooleanRecord2Array|CsvConversionError bm5br2 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord2Array);
    test:assertEquals(bm5br2, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord3Array|CsvConversionError bm1br3 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord3Array);
    test:assertTrue(bm1br3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br3).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord3Array|CsvConversionError bm2br3 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord3Array);
    test:assertEquals(bm2br3, [
        {b1: true, b3: ()},
        {b1: true, b3: ()}
    ]);

    BooleanRecord3Array|CsvConversionError bm3br3 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord3Array);
    test:assertEquals(bm3br3, [
        {b1: true, b3: ()},
        {b1: true, b3: ()}
    ]);

    BooleanRecord3Array|CsvConversionError bm4br3 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord3Array);
    test:assertTrue(bm4br3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br3).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord3Array|CsvConversionError bm5br3 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord3Array);
    test:assertEquals(bm5br3, [{b1: true, b3: ()}, {b1: true, b3: ()}]);

    BooleanRecord4Array|CsvConversionError bm1br4 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord4Array);
    test:assertTrue(bm1br4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br4).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord4Array|CsvConversionError bm2br4 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord4Array);
    test:assertEquals(bm2br4, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord4Array|CsvConversionError bm3br4 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord4Array);
    test:assertEquals(bm3br4, [
        {b1: true, b2: false, b3: (), b4: false, i1: 1},
        {b1: true, b2: false, b3: (), b4: false, i1: 1}
    ]);

    BooleanRecord4Array|CsvConversionError bm4br4 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord4Array);
    test:assertTrue(bm4br4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br4).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord4Array|CsvConversionError bm5br4 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord4Array);
    test:assertEquals(bm5br4, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord5Array|CsvConversionError bm1br5 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord5Array);
    test:assertTrue(bm1br5 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br5).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord5Array|CsvConversionError bm2br5 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord5Array);
    test:assertEquals(bm2br5, [
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, n1: (), n3: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, n1: (), n3: ()}
    ]);

    BooleanRecord5Array|CsvConversionError bm3br5 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord5Array);
    test:assertEquals(bm3br5, [
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, i1: 1, b4: false},
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, i1: 1, b4: false}
    ]);

    BooleanRecord5Array|CsvConversionError bm4br5 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord5Array);
    test:assertTrue(bm4br5 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br5).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord5Array|CsvConversionError bm5br5 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord5Array);
    test:assertEquals(bm5br5, [
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError bm1br6 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord6Array);
    test:assertTrue(bm1br6 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br6).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord6Array|CsvConversionError bm2br6 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord6Array);
    test:assertEquals(bm2br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError bm3br6 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord6Array);
    test:assertEquals(bm3br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError bm4br6 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord6Array);
    test:assertTrue(bm4br6 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br6).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord6Array|CsvConversionError bm5br6 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord6Array);
    test:assertEquals(bm5br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord7Array|CsvConversionError bm1br7 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord7Array);
    test:assertTrue(bm1br7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br7).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord7Array|CsvConversionError bm2br7 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord7Array);
    test:assertTrue(bm2br7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2br7).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord7Array|CsvConversionError bm3br7 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord7Array);
    test:assertTrue(bm3br7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3br7).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord7Array|CsvConversionError bm4br7 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord7Array);
    test:assertTrue(bm4br7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br7).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord7Array|CsvConversionError bm5br7 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord7Array);
    test:assertTrue(bm5br7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5br7).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|CsvConversionError bm1br8 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord8Array);
    test:assertTrue(bm1br8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br8).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord8Array|CsvConversionError bm2br8 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord8Array);
    test:assertTrue(bm2br8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2br8).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|CsvConversionError bm3br8 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord8Array);
    test:assertTrue(bm3br8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3br8).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|CsvConversionError bm4br8 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord8Array);
    test:assertTrue(bm4br8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br8).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord8Array|CsvConversionError bm5br8 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord8Array);
    test:assertTrue(bm5br8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5br8).message(), generateErrorMessageForMissingRequiredField("requiredField"));
}

@test:Config {enable}
function testFromCsvWithTypeForMapAndRecordAsExpectedType2() {
    BooleanRecord9Array|CsvConversionError bm1br9 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord9Array);
    test:assertTrue(bm1br9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br9).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord9Array|CsvConversionError bm2br9 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord9Array);
    test:assertEquals(bm2br9, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord9Array|CsvConversionError bm3br9 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord9Array);
    test:assertEquals(bm3br9, [
        {b1: true, b2: false, b3: (), b4: false},
        {b1: true, b2: false, b3: (), b4: false}
    ]);

    BooleanRecord9Array|CsvConversionError bm4br9 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord9Array);
    test:assertTrue(bm4br9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br9).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord9Array|CsvConversionError bm5br9 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord9Array);
    test:assertEquals(bm5br9, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord10Array|CsvConversionError bm1br10 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord10Array);
    test:assertEquals(bm1br10, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanRecord10Array|CsvConversionError bm2br10 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord10Array);
    test:assertEquals(bm2br10, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanRecord10Array|CsvConversionError bm3br10 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord10Array);
    test:assertEquals(bm3br10, [
        {b1: true, b2: false, b4: false},
        {b1: true, b2: false, b4: false}
    ]);

    BooleanRecord10Array|CsvConversionError bm4br10 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord10Array);
    test:assertEquals(bm4br10, [
        {},
        {}
    ]);

    BooleanRecord10Array|CsvConversionError bm5br10 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord10Array);
    test:assertEquals(bm5br10, [
        {b1: true, b2: false, b4: true},
        {b1: true, b2: false, b4: true}
    ]);

    BooleanRecord11Array|CsvConversionError bm1br11 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord11Array);
    test:assertEquals(bm1br11, [
        {b1: true, b2: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord11Array|CsvConversionError bm2br11 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord11Array);
    test:assertEquals(bm2br11, [
        {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null},
        {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null}
    ]);

    BooleanRecord11Array|CsvConversionError bm3br11 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord11Array);
    test:assertEquals(bm3br11, [
        {b1: true, b2: false, b3: (), b4: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b3: (), b4: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord11Array|CsvConversionError bm4br11 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord11Array);
    test:assertTrue(bm4br11 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br11).message(), generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord11Array|CsvConversionError bm5br11 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord11Array);
    test:assertEquals(bm5br11, [
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord12Array|CsvConversionError bm1br12 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord12Array);
    test:assertTrue(bm1br12 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|CsvConversionError bm2br12 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord12Array);
    test:assertTrue(bm2br12 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|CsvConversionError bm3br12 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord12Array);
    test:assertTrue(bm3br12 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|CsvConversionError bm4br12 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord12Array);
    test:assertTrue(bm4br12 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|CsvConversionError bm5br12 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord12Array);
    test:assertTrue(bm5br12 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord13Array|CsvConversionError bm1br13 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord13Array);
    test:assertEquals(bm1br13, [
        {b1: true, b2: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|CsvConversionError bm2br13 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord13Array);
    test:assertEquals(bm2br13, [
        {b1: true, b2: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|CsvConversionError bm3br13 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord13Array);
    test:assertEquals(bm3br13, [
        {b1: true, b2: false, b4: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b4: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|CsvConversionError bm4br13 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord13Array);
    test:assertEquals(bm4br13, [
        {defaultableField: "", nillableField :null},
        {defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|CsvConversionError bm5br13 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord13Array);
    test:assertEquals(bm5br13, [
        {b1: true, b2: false, b4: true, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b4: true, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord14Array|CsvConversionError bm1br14 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord14Array);
    test:assertTrue(bm1br14 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|CsvConversionError bm2br14 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord14Array);
    test:assertTrue(bm2br14 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|CsvConversionError bm3br14 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord14Array);
    test:assertTrue(bm3br14 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|CsvConversionError bm4br14 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord14Array);
    test:assertTrue(bm4br14 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|CsvConversionError bm5br14 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord14Array);
    test:assertTrue(bm5br14 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord15Array|CsvConversionError bm1br15 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord15Array);
    test:assertTrue(bm1br15 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br15).message(), generateErrorMessageForInvalidFieldType("true", "b1"));

    BooleanRecord15Array|CsvConversionError bm3br15 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord15Array);
    test:assertTrue(bm3br15 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3br15).message(), generateErrorMessageForInvalidFieldType("true", "b1"));

    BooleanRecord15Array|CsvConversionError bm4br15 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord15Array);
    test:assertTrue(bm4br15 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br15).message(), generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord16Array|CsvConversionError bm1br16 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord16Array);
    test:assertEquals(bm1br16, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanRecord16Array|CsvConversionError bm2br16 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord16Array);
    test:assertEquals(bm2br16, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord16Array|CsvConversionError bm3br16 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord16Array);
    test:assertEquals(bm3br16, [
        {b1: true, b2: false, b4: false, b3: ()},
        {b1: true, b2: false, b4: false, b3: ()}
    ]);

    BooleanRecord16Array|CsvConversionError bm4br16 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord16Array);
    test:assertEquals(bm4br16, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    BooleanRecord16Array|CsvConversionError bm5br16 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord16Array);
    test:assertEquals(bm5br16, [
        {b1: true, b2: false, b4: true, b3: ()},
        {b1: true, b2: false, b4: true, b3: ()}
    ]);

    BooleanRecord17Array|CsvConversionError bm1br17 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord17Array);
    test:assertEquals(bm1br17, [
        {},
        {}
    ]);

    BooleanRecord17Array|CsvConversionError bm2br17 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord17Array);
    test:assertEquals(bm2br17, [
        {},
        {}
    ]);

    BooleanRecord17Array|CsvConversionError bm3br17 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord17Array);
    test:assertEquals(bm3br17, [
        {i1: 1},
        {i1: 1}
    ]);

    BooleanRecord17Array|CsvConversionError bm4br17 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord17Array);
    test:assertEquals(bm4br17, [
        {},
        {}
    ]);

    BooleanRecord17Array|CsvConversionError bm5br17 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord17Array);
    test:assertEquals(bm5br17, [
        {},
        {}
    ]);

    BooleanRecord18Array|CsvConversionError bm1br18 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord18Array);
    test:assertEquals(bm1br18, [
        {b2: false},
        {b2: false}
    ]);

    BooleanRecord18Array|CsvConversionError bm2br18 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord18Array);
    test:assertEquals(bm2br18, [
        {b2: false, b3: (), n1: (), n3: ()},
        {b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord18Array|CsvConversionError bm3br18 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord18Array);
    test:assertEquals(bm3br18, [
        {b2: false, b3: (), i1: 1},
        {b2: false, b3: (), i1: 1}
    ]);

    BooleanRecord18Array|CsvConversionError bm4br18 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord18Array);
    test:assertTrue(bm4br18 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br18).message(), generateErrorMessageForMissingRequiredField("b2"));

    BooleanRecord18Array|CsvConversionError bm5br18 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord18Array);
    test:assertEquals(bm5br18, [
        {b2: false, b3: ()},
        {b2: false, b3: ()}
    ]);
}

@test:Config {enable}
function testFromCsvWithTypeForMapAndMapAsExpectedType() {
    BooleanMapArray|CsvConversionError bm1bma = parseRecordAsRecordType([bm1, bm1], {}, BooleanMapArray);
    test:assertEquals(bm1bma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanMapArray|CsvConversionError bm2bma = parseRecordAsRecordType([bm2, bm2], {}, BooleanMapArray);
    test:assertEquals(bm2bma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanMapArray|CsvConversionError bm3bma = parseRecordAsRecordType([bm3, bm3], {}, BooleanMapArray);
    test:assertEquals(bm3bma, [
        {b1: true, b2: false, b4: false},
        {b1: true, b2: false, b4: false}
    ]);

    BooleanMapArray|CsvConversionError bm4bma = parseRecordAsRecordType([bm4, bm4], {}, BooleanMapArray);
    test:assertEquals(bm4bma, [
        {},
        {}
    ]);

    BooleanMapArray|CsvConversionError bm5bma = parseRecordAsRecordType([bm5, bm5], {}, BooleanMapArray);
    test:assertEquals(bm5bma, [
        {b1: true, b2: false, b4: true},
        {b1: true, b2: false, b4: true}
    ]);

    NillableBooleanMapArray|CsvConversionError bm1nbma = parseRecordAsRecordType([bm1, bm1], {}, NillableBooleanMapArray);
    test:assertEquals(bm1nbma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    NillableBooleanMapArray|CsvConversionError bm2nbma = parseRecordAsRecordType([bm2, bm2], {}, NillableBooleanMapArray);
    test:assertEquals(bm2nbma, [
        {b1: true, b2: false, b3:(), n1: (), n3: ()},
        {b1: true, b2: false, b3:(), n1: (), n3: ()}
    ]);

    NillableBooleanMapArray|CsvConversionError bm3nbma = parseRecordAsRecordType([bm3, bm3], {}, NillableBooleanMapArray);
    test:assertEquals(bm3nbma, [
        {b1: true, b2: false, b3:(), b4: false},
        {b1: true, b2: false, b3:(), b4: false}
    ]);

    NillableBooleanMapArray|CsvConversionError bm4nbma = parseRecordAsRecordType([bm4, bm4], {}, NillableBooleanMapArray);
    test:assertEquals(bm4nbma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    NillableBooleanMapArray|CsvConversionError bm5nbma = parseRecordAsRecordType([bm5, bm5], {}, NillableBooleanMapArray);
    test:assertEquals(bm5nbma, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bm1niubma = parseRecordAsRecordType([bm1, bm1], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm1niubma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bm2niubma = parseRecordAsRecordType([bm2, bm2], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm2niubma, [
        {b1: true, b2: false, b3:(), n1: (), n3: ()},
        {b1: true, b2: false, b3:(), n1: (), n3: ()}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bm3niubma = parseRecordAsRecordType([bm3, bm3], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm3niubma, [
        {b1: true, b2: false, b3:(), b4: false, i1: 1},
        {b1: true, b2: false, b3:(), b4: false, i1: 1}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bm4niubma = parseRecordAsRecordType([bm4, bm4], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm4niubma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bm5niubma = parseRecordAsRecordType([bm5, bm5], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm5niubma, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bm1iubma = parseRecordAsRecordType([bm1, bm1], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm1iubma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bm2iubma = parseRecordAsRecordType([bm2, bm2], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm2iubma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bm3iubma = parseRecordAsRecordType([bm3, bm3], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm3iubma, [
        {b1: true, b2: false, b4: false, i1: 1},
        {b1: true, b2: false, b4: false, i1: 1}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bm4iubma = parseRecordAsRecordType([bm4, bm4], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm4iubma, [
        {},
        {}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bm5iubma = parseRecordAsRecordType([bm5, bm5], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm5iubma, [
        {b1: true, b2: false, b4: true},
        {b1: true, b2: false, b4: true}
    ]);

    NilMapArray|CsvConversionError bm1nma = parseRecordAsRecordType([bm1, bm1], {}, NilMapArray);
    test:assertEquals(bm1nma, [
        {},
        {}
    ]);

    NilMapArray|CsvConversionError bm2nma = parseRecordAsRecordType([bm2, bm2], {}, NilMapArray);
    test:assertEquals(bm2nma, [
        {n1: (), n3: (), b3: ()},
        {n1: (), n3: (), b3: ()}
    ]);

    NilMapArray|CsvConversionError bm3nma = parseRecordAsRecordType([bm3, bm3], {}, NilMapArray);
    test:assertEquals(bm3nma, [
        {b3: ()},
        {b3: ()}
    ]);

    NilMapArray|CsvConversionError bm4nma = parseRecordAsRecordType([bm4, bm4], {}, NilMapArray);
    test:assertEquals(bm4nma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);
    NilMapArray|CsvConversionError bm5nma = parseRecordAsRecordType([bm5, bm5], {}, NilMapArray);
    test:assertEquals(bm5nma, [
        {b3: ()},
        {b3: ()}
    ]);

    JsonMapArray|CsvConversionError bm1jma = parseRecordAsRecordType([bm1, bm1], {}, JsonMapArray);
    test:assertEquals(bm1jma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    JsonMapArray|CsvConversionError bm2jma = parseRecordAsRecordType([bm2, bm2], {}, JsonMapArray);
    test:assertEquals(bm2jma, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    JsonMapArray|CsvConversionError bm3jma = parseRecordAsRecordType([bm3, bm3], {}, JsonMapArray);
    test:assertEquals(bm3jma, [
        {b1: true, b2: false, b4: false, b3: (), i1: 1},
        {b1: true, b2: false, b4: false, b3: (), i1: 1}
    ]);

    JsonMapArray|CsvConversionError bm4jma = parseRecordAsRecordType([bm4, bm4], {}, JsonMapArray);
    test:assertEquals(bm4jma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    JsonMapArray|CsvConversionError bm5jma = parseRecordAsRecordType([bm5, bm5], {}, JsonMapArray);
    test:assertEquals(bm5jma, [
        {b1: true, b2: false, b4: true, b3: ()},
        {b1: true, b2: false, b4: true, b3: ()}
    ]);

    AnydataMapArray|CsvConversionError bm1anydma = parseRecordAsRecordType([bm1, bm1], {}, AnydataMapArray);
    test:assertEquals(bm1anydma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    AnydataMapArray|CsvConversionError bm2anydma = parseRecordAsRecordType([bm2, bm2], {}, AnydataMapArray);
    test:assertEquals(bm2anydma, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    AnydataMapArray|CsvConversionError bm3anydma = parseRecordAsRecordType([bm3, bm3], {}, AnydataMapArray);
    test:assertEquals(bm3anydma, [
        {b1: true, b2: false, b4: false, b3: (), i1: 1},
        {b1: true, b2: false, b4: false, b3: (), i1: 1}
    ]);

    AnydataMapArray|CsvConversionError bm4anydma = parseRecordAsRecordType([bm4, bm4], {}, AnydataMapArray);
    test:assertEquals(bm4anydma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    AnydataMapArray|CsvConversionError bm5anydma = parseRecordAsRecordType([bm5, bm5], {}, AnydataMapArray);
    test:assertEquals(bm5anydma, [
        {b1: true, b2: false, b4: true, b3: ()},
        {b1: true, b2: false, b4: true, b3: ()}
    ]);

    CustomMapArray|CsvConversionError bm1cma = parseRecordAsRecordType([bm1, bm1], {}, CustomMapArray);
    test:assertEquals(bm1cma, [
        {},
        {}
    ]);

    CustomMapArray|CsvConversionError bm2cma = parseRecordAsRecordType([bm2, bm2], {}, CustomMapArray);
    test:assertEquals(bm2cma, [
        {},
        {}
    ]);

    CustomMapArray|CsvConversionError bm3cma = parseRecordAsRecordType([bm3, bm3], {}, CustomMapArray);
    test:assertEquals(bm3cma, [
        {i1: 1},
        {i1: 1}
    ]);

    CustomMapArray|CsvConversionError bm4cma = parseRecordAsRecordType([bm4, bm4], {}, CustomMapArray);
    test:assertEquals(bm4cma, [
        {},
        {}
    ]);

    CustomMapArray|CsvConversionError bm5cma = parseRecordAsRecordType([bm5, bm5], {}, CustomMapArray);
    test:assertEquals(bm5cma, [
        {},
        {}
    ]);

    StringMapArray|CsvConversionError bm1sma = parseRecordAsRecordType([bm1, bm1], {}, StringMapArray);
    test:assertEquals(bm1sma, [
        {},
        {}
    ]);

    StringMapArray|CsvConversionError bm2sma = parseRecordAsRecordType([bm2, bm2], {}, StringMapArray);
    test:assertEquals(bm2sma, [
        {},
        {}
    ]);

    StringMapArray|CsvConversionError bm3sma = parseRecordAsRecordType([bm3, bm3], {}, StringMapArray);
    test:assertEquals(bm3sma, [
        {},
        {}
    ]);

    StringMapArray|CsvConversionError bm4sma = parseRecordAsRecordType([bm4, bm4], {}, StringMapArray);
    test:assertEquals(bm4sma, [
        {},
        {}
    ]);

    StringMapArray|CsvConversionError bm5sma = parseRecordAsRecordType([bm5, bm5], {}, StringMapArray);
    test:assertEquals(bm5sma, [
        {},
        {}
    ]);
}
