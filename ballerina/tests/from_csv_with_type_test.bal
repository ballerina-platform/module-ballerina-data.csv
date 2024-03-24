import ballerina/test;

@test:Config {enable}
function testFromCsvWithTypeForMapAndRecordAsExpectedType() {
    BooleanRecord1Array|CsvConversionError bm1br1 = fromCsvWithType([bm1, bm1], {}, BooleanRecord1Array);
    test:assertTrue(bm1br1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br1).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord1Array|CsvConversionError bm2br1 = fromCsvWithType([bm2, bm2], {}, BooleanRecord1Array);
    test:assertTrue(bm2br1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2br1).message(), generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord1Array|CsvConversionError bm3br1 = fromCsvWithType([bm3, bm3], {}, BooleanRecord1Array);
    test:assertEquals(bm3br1, [
        {b1: true, b2: false, b3: (), b4: false, i1: 1},
        {b1: true, b2: false, b3: (), b4: false, i1: 1}
    ]);

    BooleanRecord1Array|CsvConversionError bm4br1 = fromCsvWithType([bm4, bm4], {}, BooleanRecord1Array);
    test:assertTrue(bm4br1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br1).message(), generateErrorMessageForMissingRequiredField("b2"));

    BooleanRecord1Array|CsvConversionError bm5br1 = fromCsvWithType([bm5, bm5], {}, BooleanRecord1Array);
    test:assertEquals(bm5br1, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord2Array|CsvConversionError bm1br2 = fromCsvWithType([bm1, bm1], {}, BooleanRecord2Array);
    test:assertTrue(bm1br2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br2).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord2Array|CsvConversionError bm2br2 = fromCsvWithType([bm2, bm2], {}, BooleanRecord2Array);
    test:assertTrue(bm2br2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2br2).message(), generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord2Array|CsvConversionError bm3br2 = fromCsvWithType([bm3, bm3], {}, BooleanRecord2Array);
    test:assertEquals(bm3br2, [
        {b1: true, b2: false, b3: (), b4: false},
        {b1: true, b2: false, b3: (), b4: false}
    ]);

    BooleanRecord2Array|CsvConversionError bm4br2 = fromCsvWithType([bm4, bm4], {}, BooleanRecord2Array);
    test:assertTrue(bm4br2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br2).message(), generateErrorMessageForMissingRequiredField("b2"));

    BooleanRecord2Array|CsvConversionError bm5br2 = fromCsvWithType([bm5, bm5], {}, BooleanRecord2Array);
    test:assertEquals(bm5br2, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord3Array|CsvConversionError bm1br3 = fromCsvWithType([bm1, bm1], {}, BooleanRecord3Array);
    test:assertTrue(bm1br3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br3).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord3Array|CsvConversionError bm2br3 = fromCsvWithType([bm2, bm2], {}, BooleanRecord3Array);
    test:assertEquals(bm2br3, [
        {b1: true, b3: ()},
        {b1: true, b3: ()}
    ]);

    BooleanRecord3Array|CsvConversionError bm3br3 = fromCsvWithType([bm3, bm3], {}, BooleanRecord3Array);
    test:assertEquals(bm3br3, [
        {b1: true, b3: ()},
        {b1: true, b3: ()}
    ]);

    BooleanRecord3Array|CsvConversionError bm4br3 = fromCsvWithType([bm4, bm4], {}, BooleanRecord3Array);
    test:assertTrue(bm4br3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br3).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord3Array|CsvConversionError bm5br3 = fromCsvWithType([bm5, bm5], {}, BooleanRecord3Array);
    test:assertEquals(bm5br3, [{b1: true, b3: ()}, {b1: true, b3: ()}]);

    BooleanRecord4Array|CsvConversionError bm1br4 = fromCsvWithType([bm1, bm1], {}, BooleanRecord4Array);
    test:assertTrue(bm1br4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br4).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord4Array|CsvConversionError bm2br4 = fromCsvWithType([bm2, bm2], {}, BooleanRecord4Array);
    test:assertEquals(bm2br4, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord4Array|CsvConversionError bm3br4 = fromCsvWithType([bm3, bm3], {}, BooleanRecord4Array);
    test:assertEquals(bm3br4, [
        {b1: true, b2: false, b3: (), b4: false, i1: 1},
        {b1: true, b2: false, b3: (), b4: false, i1: 1}
    ]);

    BooleanRecord4Array|CsvConversionError bm4br4 = fromCsvWithType([bm4, bm4], {}, BooleanRecord4Array);
    test:assertTrue(bm4br4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br4).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord4Array|CsvConversionError bm5br4 = fromCsvWithType([bm5, bm5], {}, BooleanRecord4Array);
    test:assertEquals(bm5br4, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord5Array|CsvConversionError bm1br5 = fromCsvWithType([bm1, bm1], {}, BooleanRecord5Array);
    test:assertTrue(bm1br5 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br5).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord5Array|CsvConversionError bm2br5 = fromCsvWithType([bm2, bm2], {}, BooleanRecord5Array);
    test:assertEquals(bm2br5, [
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, n1: (), n3: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, n1: (), n3: ()}
    ]);

    BooleanRecord5Array|CsvConversionError bm3br5 = fromCsvWithType([bm3, bm3], {}, BooleanRecord5Array);
    test:assertEquals(bm3br5, [
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, i1: 1, b4: false},
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, i1: 1, b4: false}
    ]);

    BooleanRecord5Array|CsvConversionError bm4br5 = fromCsvWithType([bm4, bm4], {}, BooleanRecord5Array);
    test:assertTrue(bm4br5 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br5).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord5Array|CsvConversionError bm5br5 = fromCsvWithType([bm5, bm5], {}, BooleanRecord5Array);
    test:assertEquals(bm5br5, [
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError bm1br6 = fromCsvWithType([bm1, bm1], {}, BooleanRecord6Array);
    test:assertTrue(bm1br6 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br6).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord6Array|CsvConversionError bm2br6 = fromCsvWithType([bm2, bm2], {}, BooleanRecord6Array);
    test:assertEquals(bm2br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError bm3br6 = fromCsvWithType([bm3, bm3], {}, BooleanRecord6Array);
    test:assertEquals(bm3br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError bm4br6 = fromCsvWithType([bm4, bm4], {}, BooleanRecord6Array);
    test:assertTrue(bm4br6 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br6).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord6Array|CsvConversionError bm5br6 = fromCsvWithType([bm5, bm5], {}, BooleanRecord6Array);
    test:assertEquals(bm5br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord7Array|CsvConversionError bm1br7 = fromCsvWithType([bm1, bm1], {}, BooleanRecord7Array);
    test:assertTrue(bm1br7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br7).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord7Array|CsvConversionError bm2br7 = fromCsvWithType([bm2, bm2], {}, BooleanRecord7Array);
    test:assertTrue(bm2br7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2br7).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord7Array|CsvConversionError bm3br7 = fromCsvWithType([bm3, bm3], {}, BooleanRecord7Array);
    test:assertTrue(bm3br7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3br7).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord7Array|CsvConversionError bm4br7 = fromCsvWithType([bm4, bm4], {}, BooleanRecord7Array);
    test:assertTrue(bm4br7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br7).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord7Array|CsvConversionError bm5br7 = fromCsvWithType([bm5, bm5], {}, BooleanRecord7Array);
    test:assertTrue(bm5br7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5br7).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|CsvConversionError bm1br8 = fromCsvWithType([bm1, bm1], {}, BooleanRecord8Array);
    test:assertTrue(bm1br8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br8).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord8Array|CsvConversionError bm2br8 = fromCsvWithType([bm2, bm2], {}, BooleanRecord8Array);
    test:assertTrue(bm2br8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2br8).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|CsvConversionError bm3br8 = fromCsvWithType([bm3, bm3], {}, BooleanRecord8Array);
    test:assertTrue(bm3br8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3br8).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|CsvConversionError bm4br8 = fromCsvWithType([bm4, bm4], {}, BooleanRecord8Array);
    test:assertTrue(bm4br8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br8).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord8Array|CsvConversionError bm5br8 = fromCsvWithType([bm5, bm5], {}, BooleanRecord8Array);
    test:assertTrue(bm5br8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5br8).message(), generateErrorMessageForMissingRequiredField("requiredField"));
}

@test:Config {enable}
function testFromCsvWithTypeForMapAndRecordAsExpectedType2() {
    BooleanRecord9Array|CsvConversionError bm1br9 = fromCsvWithType([bm1, bm1], {}, BooleanRecord9Array);
    test:assertTrue(bm1br9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br9).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord9Array|CsvConversionError bm2br9 = fromCsvWithType([bm2, bm2], {}, BooleanRecord9Array);
    test:assertEquals(bm2br9, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord9Array|CsvConversionError bm3br9 = fromCsvWithType([bm3, bm3], {}, BooleanRecord9Array);
    test:assertEquals(bm3br9, [
        {b1: true, b2: false, b3: (), b4: false},
        {b1: true, b2: false, b3: (), b4: false}
    ]);

    BooleanRecord9Array|CsvConversionError bm4br9 = fromCsvWithType([bm4, bm4], {}, BooleanRecord9Array);
    test:assertTrue(bm4br9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br9).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord9Array|CsvConversionError bm5br9 = fromCsvWithType([bm5, bm5], {}, BooleanRecord9Array);
    test:assertEquals(bm5br9, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord10Array|CsvConversionError bm1br10 = fromCsvWithType([bm1, bm1], {}, BooleanRecord10Array);
    test:assertEquals(bm1br10, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanRecord10Array|CsvConversionError bm2br10 = fromCsvWithType([bm2, bm2], {}, BooleanRecord10Array);
    test:assertEquals(bm2br10, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanRecord10Array|CsvConversionError bm3br10 = fromCsvWithType([bm3, bm3], {}, BooleanRecord10Array);
    test:assertEquals(bm3br10, [
        {b1: true, b2: false, b4: false},
        {b1: true, b2: false, b4: false}
    ]);

    BooleanRecord10Array|CsvConversionError bm4br10 = fromCsvWithType([bm4, bm4], {}, BooleanRecord10Array);
    test:assertEquals(bm4br10, [
        {},
        {}
    ]);

    BooleanRecord10Array|CsvConversionError bm5br10 = fromCsvWithType([bm5, bm5], {}, BooleanRecord10Array);
    test:assertEquals(bm5br10, [
        {b1: true, b2: false, b4: true},
        {b1: true, b2: false, b4: true}
    ]);

    BooleanRecord11Array|CsvConversionError bm1br11 = fromCsvWithType([bm1, bm1], {}, BooleanRecord11Array);
    test:assertEquals(bm1br11, [
        {b1: true, b2: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord11Array|CsvConversionError bm2br11 = fromCsvWithType([bm2, bm2], {}, BooleanRecord11Array);
    test:assertEquals(bm2br11, [
        {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null},
        {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null}
    ]);

    BooleanRecord11Array|CsvConversionError bm3br11 = fromCsvWithType([bm3, bm3], {}, BooleanRecord11Array);
    test:assertEquals(bm3br11, [
        {b1: true, b2: false, b3: (), b4: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b3: (), b4: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord11Array|CsvConversionError bm4br11 = fromCsvWithType([bm4, bm4], {}, BooleanRecord11Array);
    test:assertTrue(bm4br11 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br11).message(), generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord11Array|CsvConversionError bm5br11 = fromCsvWithType([bm5, bm5], {}, BooleanRecord11Array);
    test:assertEquals(bm5br11, [
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord12Array|CsvConversionError bm1br12 = fromCsvWithType([bm1, bm1], {}, BooleanRecord12Array);
    test:assertTrue(bm1br12 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|CsvConversionError bm2br12 = fromCsvWithType([bm2, bm2], {}, BooleanRecord12Array);
    test:assertTrue(bm2br12 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|CsvConversionError bm3br12 = fromCsvWithType([bm3, bm3], {}, BooleanRecord12Array);
    test:assertTrue(bm3br12 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|CsvConversionError bm4br12 = fromCsvWithType([bm4, bm4], {}, BooleanRecord12Array);
    test:assertTrue(bm4br12 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|CsvConversionError bm5br12 = fromCsvWithType([bm5, bm5], {}, BooleanRecord12Array);
    test:assertTrue(bm5br12 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord13Array|CsvConversionError bm1br13 = fromCsvWithType([bm1, bm1], {}, BooleanRecord13Array);
    test:assertEquals(bm1br13, [
        {b1: true, b2: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|CsvConversionError bm2br13 = fromCsvWithType([bm2, bm2], {}, BooleanRecord13Array);
    test:assertEquals(bm2br13, [
        {b1: true, b2: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|CsvConversionError bm3br13 = fromCsvWithType([bm3, bm3], {}, BooleanRecord13Array);
    test:assertEquals(bm3br13, [
        {b1: true, b2: false, b4: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b4: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|CsvConversionError bm4br13 = fromCsvWithType([bm4, bm4], {}, BooleanRecord13Array);
    test:assertEquals(bm4br13, [
        {defaultableField: "", nillableField :null},
        {defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|CsvConversionError bm5br13 = fromCsvWithType([bm5, bm5], {}, BooleanRecord13Array);
    test:assertEquals(bm5br13, [
        {b1: true, b2: false, b4: true, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b4: true, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord14Array|CsvConversionError bm1br14 = fromCsvWithType([bm1, bm1], {}, BooleanRecord14Array);
    test:assertTrue(bm1br14 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|CsvConversionError bm2br14 = fromCsvWithType([bm2, bm2], {}, BooleanRecord14Array);
    test:assertTrue(bm2br14 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|CsvConversionError bm3br14 = fromCsvWithType([bm3, bm3], {}, BooleanRecord14Array);
    test:assertTrue(bm3br14 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|CsvConversionError bm4br14 = fromCsvWithType([bm4, bm4], {}, BooleanRecord14Array);
    test:assertTrue(bm4br14 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|CsvConversionError bm5br14 = fromCsvWithType([bm5, bm5], {}, BooleanRecord14Array);
    test:assertTrue(bm5br14 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord15Array|CsvConversionError bm1br15 = fromCsvWithType([bm1, bm1], {}, BooleanRecord15Array);
    test:assertTrue(bm1br15 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1br15).message(), generateErrorMessageForInvalidFieldType("true", "b1"));

    BooleanRecord15Array|CsvConversionError bm3br15 = fromCsvWithType([bm3, bm3], {}, BooleanRecord15Array);
    test:assertTrue(bm3br15 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3br15).message(), generateErrorMessageForInvalidFieldType("true", "b1"));

    BooleanRecord15Array|CsvConversionError bm4br15 = fromCsvWithType([bm4, bm4], {}, BooleanRecord15Array);
    test:assertTrue(bm4br15 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br15).message(), generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord16Array|CsvConversionError bm1br16 = fromCsvWithType([bm1, bm1], {}, BooleanRecord16Array);
    test:assertEquals(bm1br16, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanRecord16Array|CsvConversionError bm2br16 = fromCsvWithType([bm2, bm2], {}, BooleanRecord16Array);
    test:assertEquals(bm2br16, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord16Array|CsvConversionError bm3br16 = fromCsvWithType([bm3, bm3], {}, BooleanRecord16Array);
    test:assertEquals(bm3br16, [
        {b1: true, b2: false, b4: false, b3: ()},
        {b1: true, b2: false, b4: false, b3: ()}
    ]);

    BooleanRecord16Array|CsvConversionError bm4br16 = fromCsvWithType([bm4, bm4], {}, BooleanRecord16Array);
    test:assertEquals(bm4br16, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    BooleanRecord16Array|CsvConversionError bm5br16 = fromCsvWithType([bm5, bm5], {}, BooleanRecord16Array);
    test:assertEquals(bm5br16, [
        {b1: true, b2: false, b4: true, b3: ()},
        {b1: true, b2: false, b4: true, b3: ()}
    ]);

    BooleanRecord17Array|CsvConversionError bm1br17 = fromCsvWithType([bm1, bm1], {}, BooleanRecord17Array);
    test:assertEquals(bm1br17, [
        {},
        {}
    ]);

    BooleanRecord17Array|CsvConversionError bm2br17 = fromCsvWithType([bm2, bm2], {}, BooleanRecord17Array);
    test:assertEquals(bm2br17, [
        {},
        {}
    ]);

    BooleanRecord17Array|CsvConversionError bm3br17 = fromCsvWithType([bm3, bm3], {}, BooleanRecord17Array);
    test:assertEquals(bm3br17, [
        {i1: 1},
        {i1: 1}
    ]);

    BooleanRecord17Array|CsvConversionError bm4br17 = fromCsvWithType([bm4, bm4], {}, BooleanRecord17Array);
    test:assertEquals(bm4br17, [
        {},
        {}
    ]);

    BooleanRecord17Array|CsvConversionError bm5br17 = fromCsvWithType([bm5, bm5], {}, BooleanRecord17Array);
    test:assertEquals(bm5br17, [
        {},
        {}
    ]);

    BooleanRecord18Array|CsvConversionError bm1br18 = fromCsvWithType([bm1, bm1], {}, BooleanRecord18Array);
    test:assertEquals(bm1br18, [
        {b2: false},
        {b2: false}
    ]);

    BooleanRecord18Array|CsvConversionError bm2br18 = fromCsvWithType([bm2, bm2], {}, BooleanRecord18Array);
    test:assertEquals(bm2br18, [
        {b2: false, b3: (), n1: (), n3: ()},
        {b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord18Array|CsvConversionError bm3br18 = fromCsvWithType([bm3, bm3], {}, BooleanRecord18Array);
    test:assertEquals(bm3br18, [
        {b2: false, b3: (), i1: 1},
        {b2: false, b3: (), i1: 1}
    ]);

    BooleanRecord18Array|CsvConversionError bm4br18 = fromCsvWithType([bm4, bm4], {}, BooleanRecord18Array);
    test:assertTrue(bm4br18 is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4br18).message(), generateErrorMessageForMissingRequiredField("b2"));

    BooleanRecord18Array|CsvConversionError bm5br18 = fromCsvWithType([bm5, bm5], {}, BooleanRecord18Array);
    test:assertEquals(bm5br18, [
        {b2: false, b3: ()},
        {b2: false, b3: ()}
    ]);
}

@test:Config {enable}
function testFromCsvWithTypeForMapAndMapAsExpectedType() {
    BooleanMapArray|CsvConversionError bm1bma = fromCsvWithType([bm1, bm1], {}, BooleanMapArray);
    test:assertEquals(bm1bma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanMapArray|CsvConversionError bm2bma = fromCsvWithType([bm2, bm2], {}, BooleanMapArray);
    test:assertEquals(bm2bma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanMapArray|CsvConversionError bm3bma = fromCsvWithType([bm3, bm3], {}, BooleanMapArray);
    test:assertEquals(bm3bma, [
        {b1: true, b2: false, b4: false},
        {b1: true, b2: false, b4: false}
    ]);

    BooleanMapArray|CsvConversionError bm4bma = fromCsvWithType([bm4, bm4], {}, BooleanMapArray);
    test:assertEquals(bm4bma, [
        {},
        {}
    ]);

    BooleanMapArray|CsvConversionError bm5bma = fromCsvWithType([bm5, bm5], {}, BooleanMapArray);
    test:assertEquals(bm5bma, [
        {b1: true, b2: false, b4: true},
        {b1: true, b2: false, b4: true}
    ]);

    NillableBooleanMapArray|CsvConversionError bm1nbma = fromCsvWithType([bm1, bm1], {}, NillableBooleanMapArray);
    test:assertEquals(bm1nbma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    NillableBooleanMapArray|CsvConversionError bm2nbma = fromCsvWithType([bm2, bm2], {}, NillableBooleanMapArray);
    test:assertEquals(bm2nbma, [
        {b1: true, b2: false, b3:(), n1: (), n3: ()},
        {b1: true, b2: false, b3:(), n1: (), n3: ()}
    ]);

    NillableBooleanMapArray|CsvConversionError bm3nbma = fromCsvWithType([bm3, bm3], {}, NillableBooleanMapArray);
    test:assertEquals(bm3nbma, [
        {b1: true, b2: false, b3:(), b4: false},
        {b1: true, b2: false, b3:(), b4: false}
    ]);

    NillableBooleanMapArray|CsvConversionError bm4nbma = fromCsvWithType([bm4, bm4], {}, NillableBooleanMapArray);
    test:assertEquals(bm4nbma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    NillableBooleanMapArray|CsvConversionError bm5nbma = fromCsvWithType([bm5, bm5], {}, NillableBooleanMapArray);
    test:assertEquals(bm5nbma, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bm1niubma = fromCsvWithType([bm1, bm1], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm1niubma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bm2niubma = fromCsvWithType([bm2, bm2], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm2niubma, [
        {b1: true, b2: false, b3:(), n1: (), n3: ()},
        {b1: true, b2: false, b3:(), n1: (), n3: ()}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bm3niubma = fromCsvWithType([bm3, bm3], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm3niubma, [
        {b1: true, b2: false, b3:(), b4: false, i1: 1},
        {b1: true, b2: false, b3:(), b4: false, i1: 1}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bm4niubma = fromCsvWithType([bm4, bm4], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm4niubma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bm5niubma = fromCsvWithType([bm5, bm5], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm5niubma, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bm1iubma = fromCsvWithType([bm1, bm1], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm1iubma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bm2iubma = fromCsvWithType([bm2, bm2], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm2iubma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bm3iubma = fromCsvWithType([bm3, bm3], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm3iubma, [
        {b1: true, b2: false, b4: false, i1: 1},
        {b1: true, b2: false, b4: false, i1: 1}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bm4iubma = fromCsvWithType([bm4, bm4], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm4iubma, [
        {},
        {}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bm5iubma = fromCsvWithType([bm5, bm5], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm5iubma, [
        {b1: true, b2: false, b4: true},
        {b1: true, b2: false, b4: true}
    ]);

    NilMapArray|CsvConversionError bm1nma = fromCsvWithType([bm1, bm1], {}, NilMapArray);
    test:assertEquals(bm1nma, [
        {},
        {}
    ]);

    NilMapArray|CsvConversionError bm2nma = fromCsvWithType([bm2, bm2], {}, NilMapArray);
    test:assertEquals(bm2nma, [
        {n1: (), n3: (), b3: ()},
        {n1: (), n3: (), b3: ()}
    ]);

    NilMapArray|CsvConversionError bm3nma = fromCsvWithType([bm3, bm3], {}, NilMapArray);
    test:assertEquals(bm3nma, [
        {b3: ()},
        {b3: ()}
    ]);

    NilMapArray|CsvConversionError bm4nma = fromCsvWithType([bm4, bm4], {}, NilMapArray);
    test:assertEquals(bm4nma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);
    NilMapArray|CsvConversionError bm5nma = fromCsvWithType([bm5, bm5], {}, NilMapArray);
    test:assertEquals(bm5nma, [
        {b3: ()},
        {b3: ()}
    ]);

    JsonMapArray|CsvConversionError bm1jma = fromCsvWithType([bm1, bm1], {}, JsonMapArray);
    test:assertEquals(bm1jma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    JsonMapArray|CsvConversionError bm2jma = fromCsvWithType([bm2, bm2], {}, JsonMapArray);
    test:assertEquals(bm2jma, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    JsonMapArray|CsvConversionError bm3jma = fromCsvWithType([bm3, bm3], {}, JsonMapArray);
    test:assertEquals(bm3jma, [
        {b1: true, b2: false, b4: false, b3: (), i1: 1},
        {b1: true, b2: false, b4: false, b3: (), i1: 1}
    ]);

    JsonMapArray|CsvConversionError bm4jma = fromCsvWithType([bm4, bm4], {}, JsonMapArray);
    test:assertEquals(bm4jma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    JsonMapArray|CsvConversionError bm5jma = fromCsvWithType([bm5, bm5], {}, JsonMapArray);
    test:assertEquals(bm5jma, [
        {b1: true, b2: false, b4: true, b3: ()},
        {b1: true, b2: false, b4: true, b3: ()}
    ]);

    AnydataMapArray|CsvConversionError bm1anydma = fromCsvWithType([bm1, bm1], {}, AnydataMapArray);
    test:assertEquals(bm1anydma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    AnydataMapArray|CsvConversionError bm2anydma = fromCsvWithType([bm2, bm2], {}, AnydataMapArray);
    test:assertEquals(bm2anydma, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    AnydataMapArray|CsvConversionError bm3anydma = fromCsvWithType([bm3, bm3], {}, AnydataMapArray);
    test:assertEquals(bm3anydma, [
        {b1: true, b2: false, b4: false, b3: (), i1: 1},
        {b1: true, b2: false, b4: false, b3: (), i1: 1}
    ]);

    AnydataMapArray|CsvConversionError bm4anydma = fromCsvWithType([bm4, bm4], {}, AnydataMapArray);
    test:assertEquals(bm4anydma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    AnydataMapArray|CsvConversionError bm5anydma = fromCsvWithType([bm5, bm5], {}, AnydataMapArray);
    test:assertEquals(bm5anydma, [
        {b1: true, b2: false, b4: true, b3: ()},
        {b1: true, b2: false, b4: true, b3: ()}
    ]);

    CustomMapArray|CsvConversionError bm1cma = fromCsvWithType([bm1, bm1], {}, CustomMapArray);
    test:assertEquals(bm1cma, [
        {},
        {}
    ]);

    CustomMapArray|CsvConversionError bm2cma = fromCsvWithType([bm2, bm2], {}, CustomMapArray);
    test:assertEquals(bm2cma, [
        {},
        {}
    ]);

    CustomMapArray|CsvConversionError bm3cma = fromCsvWithType([bm3, bm3], {}, CustomMapArray);
    test:assertEquals(bm3cma, [
        {i1: 1},
        {i1: 1}
    ]);

    CustomMapArray|CsvConversionError bm4cma = fromCsvWithType([bm4, bm4], {}, CustomMapArray);
    test:assertEquals(bm4cma, [
        {},
        {}
    ]);

    CustomMapArray|CsvConversionError bm5cma = fromCsvWithType([bm5, bm5], {}, CustomMapArray);
    test:assertEquals(bm5cma, [
        {},
        {}
    ]);

    StringMapArray|CsvConversionError bm1sma = fromCsvWithType([bm1, bm1], {}, StringMapArray);
    test:assertEquals(bm1sma, [
        {},
        {}
    ]);

    StringMapArray|CsvConversionError bm2sma = fromCsvWithType([bm2, bm2], {}, StringMapArray);
    test:assertEquals(bm2sma, [
        {},
        {}
    ]);

    StringMapArray|CsvConversionError bm3sma = fromCsvWithType([bm3, bm3], {}, StringMapArray);
    test:assertEquals(bm3sma, [
        {},
        {}
    ]);

    StringMapArray|CsvConversionError bm4sma = fromCsvWithType([bm4, bm4], {}, StringMapArray);
    test:assertEquals(bm4sma, [
        {},
        {}
    ]);

    StringMapArray|CsvConversionError bm5sma = fromCsvWithType([bm5, bm5], {}, StringMapArray);
    test:assertEquals(bm5sma, [
        {},
        {}
    ]);
}

@test:Config {enable}
function testFromCsvWithTypeForMapAndArrayAsExpectedType() {
    BooleanArrayArray|CsvConversionError bm1ba = fromCsvWithType([bm1, bm1], {}, BooleanArrayArray);
    test:assertEquals(bm1ba, [
        [true, false],
        [true, false]
    ]);

    BooleanArrayArray|CsvConversionError bm2ba = fromCsvWithType([bm2, bm2], {}, BooleanArrayArray);
    test:assertTrue(bm2ba is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2ba).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanArrayArray|CsvConversionError bm3ba = fromCsvWithType([bm3, bm3], {}, BooleanArrayArray);
    test:assertTrue(bm3ba is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3ba).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanArrayArray|CsvConversionError bm4ba = fromCsvWithType([bm4, bm4], {}, BooleanArrayArray);
    test:assertTrue(bm4ba is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4ba).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanArrayArray|CsvConversionError bm5ba = fromCsvWithType([bm5, bm5], {}, BooleanArrayArray);
    test:assertTrue(bm5ba is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5ba).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    NillableBooleanArrayArray|CsvConversionError bm1nba = fromCsvWithType([bm1, bm1], {}, NillableBooleanArrayArray);
    test:assertEquals(bm1nba, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanArrayArray|CsvConversionError bm2nba = fromCsvWithType([bm2, bm2], {}, NillableBooleanArrayArray);
    test:assertEquals(bm2nba, [
        [true, false, null, null, null],
        [true, false, null, null, null]
    ]);

    NillableBooleanArrayArray|CsvConversionError bm3nba = fromCsvWithType([bm3, bm3], {}, NillableBooleanArrayArray);
    test:assertTrue(bm3nba is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3nba).message(), generateErrorMessageForInvalidValueForArrayType("1", "4", "boolean?"));

    NillableBooleanArrayArray|CsvConversionError bm4nba = fromCsvWithType([bm4, bm4], {}, NillableBooleanArrayArray);
    test:assertEquals(bm4nba, [
        [(), ()],
        [(), ()]
    ]);

    NillableBooleanArrayArray|CsvConversionError bm5nba = fromCsvWithType([bm5, bm5], {}, NillableBooleanArrayArray);
    test:assertEquals(bm5nba, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError bm1niouba = fromCsvWithType([bm1, bm1], {}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm1niouba, [
        [true, false],
        [true, false]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError bm2niouba = fromCsvWithType([bm2, bm2], {}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm2niouba, [
        [true, false, null, null, null],
        [true, false, null, null, null]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError bm3niouba = fromCsvWithType([bm3, bm3], {}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm3niouba, [
        [true, false, null, false, 1],
        [true, false, null, false, 1]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError bm4niouba = fromCsvWithType([bm4, bm4], {}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm4niouba, [
        [(), ()],
        [(), ()]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError bm5niouba = fromCsvWithType([bm5, bm5], {}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm5niouba, [
        [true, false, (), true],
        [true, false, (), true]
    ]);
    
    JsonArray1Array|CsvConversionError bm1ja = fromCsvWithType([bm1, bm1], {}, JsonArray1Array);
    test:assertEquals(bm1ja, [
        [true, false],
        [true, false]
    ]);

    JsonArray1Array|CsvConversionError bm2ja = fromCsvWithType([bm2, bm2], {}, JsonArray1Array);
    test:assertEquals(bm2ja, [
        [true, false, null, null, null],
        [true, false, null, null, null]
    ]);

    JsonArray1Array|CsvConversionError bm3ja = fromCsvWithType([bm3, bm3], {}, JsonArray1Array);
    test:assertEquals(bm3ja, [
        [true, false, null, false, 1],
        [true, false, null, false, 1]
    ]);

    JsonArray1Array|CsvConversionError bm4ja = fromCsvWithType([bm4, bm4], {}, JsonArray1Array);
    test:assertEquals(bm4ja, [
        [(), ()],
        [(), ()]
    ]);

    JsonArray1Array|CsvConversionError bm5ja = fromCsvWithType([bm5, bm5], {}, JsonArray1Array);
    test:assertEquals(bm5ja, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    AnydataArray1Array|CsvConversionError bm1anyda = fromCsvWithType([bm1, bm1], {}, AnydataArray1Array);
    test:assertEquals(bm1anyda, [
        [true, false],
        [true, false]
    ]);

    AnydataArray1Array|CsvConversionError bm2anyda = fromCsvWithType([bm2, bm2], {}, AnydataArray1Array);
    test:assertEquals(bm2anyda, [
        [true, false, null, null, null],
        [true, false, null, null, null]
    ]);

    AnydataArray1Array|CsvConversionError bm3anyda = fromCsvWithType([bm3, bm3], {}, AnydataArray1Array);
    test:assertEquals(bm3anyda, [
        [true, false, null, false, 1],
        [true, false, null, false, 1]
    ]);

    AnydataArray1Array|CsvConversionError bm4anyda = fromCsvWithType([bm4, bm4], {}, AnydataArray1Array);
    test:assertEquals(bm4anyda, [
        [(), ()],
        [(), ()]
    ]);

    AnydataArray1Array|CsvConversionError bm5anyda = fromCsvWithType([bm5, bm5], {}, AnydataArray1Array);
    test:assertEquals(bm5anyda, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    StringArray1Array|CsvConversionError bm1sa = fromCsvWithType([bm1, bm1], {}, StringArray1Array);
    test:assertTrue(bm1sa is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1sa).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringArray1Array|CsvConversionError bm2sa = fromCsvWithType([bm2, bm2], {}, StringArray1Array);
    test:assertTrue(bm2sa is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2sa).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringArray1Array|CsvConversionError bm3sa = fromCsvWithType([bm3, bm3], {}, StringArray1Array);
    test:assertTrue(bm3sa is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3sa).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringArray1Array|CsvConversionError bm4sa = fromCsvWithType([bm4, bm4], {}, StringArray1Array);
    test:assertTrue(bm4sa is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4sa).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "string"));

    StringArray1Array|CsvConversionError bm5sa = fromCsvWithType([bm5, bm5], {}, StringArray1Array);
    test:assertTrue(bm5sa is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5sa).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));
}

@test:Config {enable}
function testFromCsvWithTypeForMapAndTupleAsExpectedType() {
    BooleanTuple1Array|CsvConversionError bm1bt = fromCsvWithType([bm1, bm1], {}, BooleanTuple1Array);
    test:assertEquals(bm1bt, [
        [true, false, false, false],
        [true, false, false, false]
    ]);

    BooleanTuple1Array|CsvConversionError bm2bt = fromCsvWithType([bm2, bm2], {}, BooleanTuple1Array);
    test:assertTrue(bm2bt is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2bt).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple1Array|CsvConversionError bm3bt = fromCsvWithType([bm3, bm3], {}, BooleanTuple1Array);
    test:assertTrue(bm3bt is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3bt).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple1Array|CsvConversionError bm4bt = fromCsvWithType([bm4, bm4], {}, BooleanTuple1Array);
    test:assertTrue(bm4bt is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4bt).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanTuple1Array|CsvConversionError bm5bt = fromCsvWithType([bm5, bm5], {}, BooleanTuple1Array);
    test:assertTrue(bm5bt is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5bt).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple2Array|CsvConversionError bm1b2t = fromCsvWithType([bm1, bm1], {}, BooleanTuple2Array);
    test:assertEquals(bm1b2t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|CsvConversionError bm2b2t = fromCsvWithType([bm2, bm2], {}, BooleanTuple2Array);
    test:assertEquals(bm2b2t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|CsvConversionError bm3b2t = fromCsvWithType([bm3, bm3], {}, BooleanTuple2Array);
    test:assertEquals(bm3b2t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|CsvConversionError bm4b2t = fromCsvWithType([bm4, bm4], {}, BooleanTuple2Array);
    test:assertTrue(bm4b2t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4b2t).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanTuple2Array|CsvConversionError bm5b2t = fromCsvWithType([bm5, bm5], {}, BooleanTuple2Array);
    test:assertEquals(bm5b2t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple3Array|CsvConversionError bm1b3t = fromCsvWithType([bm1, bm1], {}, BooleanTuple3Array);
    test:assertEquals(bm1b3t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple3Array|CsvConversionError bm2b3t = fromCsvWithType([bm2, bm2], {}, BooleanTuple3Array);
    test:assertTrue(bm2b3t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2b3t).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple3Array|CsvConversionError bm3b3t = fromCsvWithType([bm3, bm3], {}, BooleanTuple3Array);
    test:assertTrue(bm3b3t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3b3t).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple3Array|CsvConversionError bm4b3t = fromCsvWithType([bm4, bm4], {}, BooleanTuple3Array);
    test:assertTrue(bm4b3t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4b3t).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanTuple3Array|CsvConversionError bm5b3t = fromCsvWithType([bm5, bm5], {}, BooleanTuple3Array);
    test:assertTrue(bm5b3t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5b3t).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple4Array|CsvConversionError bm1b4t = fromCsvWithType([bm1, bm1], {}, BooleanTuple4Array);
    test:assertEquals(bm1b4t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple4Array|CsvConversionError bm2b4t = fromCsvWithType([bm2, bm2], {}, BooleanTuple4Array);
    test:assertTrue(bm2b4t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2b4t).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple4Array|CsvConversionError bm3b4t = fromCsvWithType([bm3, bm3], {}, BooleanTuple4Array);
    test:assertTrue(bm3b4t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3b4t).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple4Array|CsvConversionError bm4b4t = fromCsvWithType([bm4, bm4], {}, BooleanTuple4Array);
    test:assertTrue(bm4b4t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4b4t).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanTuple4Array|CsvConversionError bm5b4t = fromCsvWithType([bm5, bm5], {}, BooleanTuple4Array);
    test:assertTrue(bm5b4t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5b4t).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    NillableBooleanTuple5Array|CsvConversionError bm1nbt = fromCsvWithType([bm1, bm1], {}, NillableBooleanTuple5Array);
    test:assertEquals(bm1nbt, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableBooleanTuple5Array|CsvConversionError bm2nbt = fromCsvWithType([bm2, bm2], {}, NillableBooleanTuple5Array);
    test:assertEquals(bm2nbt, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableBooleanTuple5Array|CsvConversionError bm3nbt = fromCsvWithType([bm3, bm3], {}, NillableBooleanTuple5Array);
    test:assertTrue(bm3nbt is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3nbt).message(), generateErrorMessageForInvalidValueForArrayType("1", "4", "boolean?"));

    NillableBooleanTuple5Array|CsvConversionError bm4nbt = fromCsvWithType([bm4, bm4], {}, NillableBooleanTuple5Array);
    test:assertEquals(bm4nbt, [
        [(), (), (), (), ()],
        [(), (), (), (), ()]
    ]);

    NillableBooleanTuple5Array|CsvConversionError bm5nbt = fromCsvWithType([bm5, bm5], {}, NillableBooleanTuple5Array);
    test:assertEquals(bm5nbt, [
        [true, false, (), true, ()],
        [true, false, (), true, ()]
    ]);

    NillableBooleanTuple6Array|CsvConversionError bm1nb6t = fromCsvWithType([bm1, bm1], {}, NillableBooleanTuple6Array);
    test:assertEquals(bm1nb6t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|CsvConversionError bm2nb6t = fromCsvWithType([bm2, bm2], {}, NillableBooleanTuple6Array);
    test:assertEquals(bm2nb6t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|CsvConversionError bm3nb6t = fromCsvWithType([bm3, bm3], {}, NillableBooleanTuple6Array);
    test:assertEquals(bm3nb6t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|CsvConversionError bm4nb6t = fromCsvWithType([bm4, bm4], {}, NillableBooleanTuple6Array);
    test:assertEquals(bm4nb6t, [
        [(), ()],
        [(), ()]
    ]);

    NillableBooleanTuple6Array|CsvConversionError bm5nb6t = fromCsvWithType([bm5, bm5], {}, NillableBooleanTuple6Array);
    test:assertEquals(bm5nb6t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple7Array|CsvConversionError bm1nb7t = fromCsvWithType([bm1, bm1], {}, NillableBooleanTuple7Array);
    test:assertEquals(bm1nb7t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple7Array|CsvConversionError bm2nb7t = fromCsvWithType([bm2, bm2], {}, NillableBooleanTuple7Array);
    test:assertEquals(bm2nb7t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableBooleanTuple7Array|CsvConversionError bm3nb7t = fromCsvWithType([bm3, bm3], {}, NillableBooleanTuple7Array);
    test:assertTrue(bm3nb7t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3nb7t).message(), generateErrorMessageForInvalidValueForArrayType("1", "4", "boolean?"));

    NillableBooleanTuple7Array|CsvConversionError bm4nb7t = fromCsvWithType([bm4, bm4], {}, NillableBooleanTuple7Array);
    test:assertEquals(bm4nb7t, [
        [(), ()],
        [(), ()]
    ]);

    NillableBooleanTuple7Array|CsvConversionError bm5nb7t = fromCsvWithType([bm5, bm5], {}, NillableBooleanTuple7Array);
    test:assertEquals(bm5nb7t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    NillableBooleanTuple8Array|CsvConversionError bm1nb8t = fromCsvWithType([bm1, bm1], {}, NillableBooleanTuple8Array);
    test:assertEquals(bm1nb8t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple8Array|CsvConversionError bm2nb8t = fromCsvWithType([bm2, bm2], {}, NillableBooleanTuple8Array);
    test:assertEquals(bm2nb8t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableBooleanTuple8Array|CsvConversionError bm3nb8t = fromCsvWithType([bm3, bm3], {}, NillableBooleanTuple8Array);
    test:assertTrue(bm3nb8t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3nb8t).message(), generateErrorMessageForInvalidValueForArrayType("1", "4", "boolean?"));

    NillableBooleanTuple8Array|CsvConversionError bm4nb8t = fromCsvWithType([bm4, bm4], {}, NillableBooleanTuple8Array);
    test:assertEquals(bm4nb8t, [
        [(), ()],
        [(), ()]
    ]);

    NillableBooleanTuple8Array|CsvConversionError bm5nb8t = fromCsvWithType([bm5, bm5], {}, NillableBooleanTuple8Array);
    test:assertEquals(bm5nb8t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError bm1nb9t = fromCsvWithType([bm1, bm1], {}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm1nb9t, [
        [true, false],
        [true, false]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError bm2nb9t = fromCsvWithType([bm2, bm2], {}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm2nb9t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError bm3nb9t = fromCsvWithType([bm3, bm3], {}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm3nb9t, [
        [true, false, (), false, 1],
        [true, false, (), false, 1]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError bm4nb9t = fromCsvWithType([bm4, bm4], {}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm4nb9t, [
        [(), ()],
        [(), ()]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError bm5nb9t = fromCsvWithType([bm5, bm5], {}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm5nb9t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    NilTuple3Array|CsvConversionError bm1n3t = fromCsvWithType([bm1, bm1], {}, NilTuple3Array);
    test:assertTrue(bm1n3t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1n3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "()"));

    NilTuple3Array|CsvConversionError bm2n3t = fromCsvWithType([bm2, bm2], {}, NilTuple3Array);
    test:assertTrue(bm2n3t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2n3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "()"));

    NilTuple3Array|CsvConversionError bm3n3t = fromCsvWithType([bm3, bm3], {}, NilTuple3Array);
    test:assertTrue(bm3n3t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3n3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "()"));

    NilTuple3Array|CsvConversionError bm4n3t = fromCsvWithType([bm4, bm4], {}, NilTuple3Array);
    test:assertEquals(bm4n3t, [
        [(), ()],
        [(), ()]
    ]);

    NilTuple3Array|CsvConversionError bm5n3t = fromCsvWithType([bm5, bm5], {}, NilTuple3Array);
    test:assertTrue(bm5n3t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5n3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "()"));

    AnydataTuple3Array|CsvConversionError bm1anyd3t = fromCsvWithType([bm1, bm1], {}, AnydataTuple3Array);
    test:assertEquals(bm1anyd3t, [
        [true, false],
        [true, false]
    ]);

    AnydataTuple3Array|CsvConversionError bm2anyd3t = fromCsvWithType([bm2, bm2], {}, AnydataTuple3Array);
    test:assertEquals(bm2anyd3t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    AnydataTuple3Array|CsvConversionError bm3anyd3t = fromCsvWithType([bm3, bm3], {}, AnydataTuple3Array);
    test:assertEquals(bm3anyd3t, [
        [true, false, (), false, 1],
        [true, false, (), false, 1]
    ]);

    AnydataTuple3Array|CsvConversionError bm4anyd3t = fromCsvWithType([bm4, bm4], {}, AnydataTuple3Array);
    test:assertEquals(bm4anyd3t, [
        [(), ()],
        [(), ()]
    ]);

    AnydataTuple3Array|CsvConversionError bm5anyd3t = fromCsvWithType([bm5, bm5], {}, AnydataTuple3Array);
    test:assertEquals(bm5anyd3t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    JsonTuple3Array|CsvConversionError bm1j3t = fromCsvWithType([bm1, bm1], {}, JsonTuple3Array);
    test:assertEquals(bm1j3t, [
        [true, false],
        [true, false]
    ]);

    JsonTuple3Array|CsvConversionError bm2j3t = fromCsvWithType([bm2, bm2], {}, JsonTuple3Array);
    test:assertEquals(bm2j3t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    JsonTuple3Array|CsvConversionError bm3j3t = fromCsvWithType([bm3, bm3], {}, JsonTuple3Array);
    test:assertEquals(bm3j3t, [
        [true, false, (), false, 1],
        [true, false, (), false, 1]
    ]);

    JsonTuple3Array|CsvConversionError bm4j3t = fromCsvWithType([bm4, bm4], {}, JsonTuple3Array);
    test:assertEquals(bm4j3t, [
        [(), ()],
        [(), ()]
    ]);

    JsonTuple3Array|CsvConversionError bm5j3t = fromCsvWithType([bm5, bm5], {}, JsonTuple3Array);
    test:assertEquals(bm5j3t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    StringTuple3Array|CsvConversionError bm1s3t = fromCsvWithType([bm1, bm1], {}, StringTuple3Array);
    test:assertTrue(bm1s3t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm1s3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringTuple3Array|CsvConversionError bm2s3t = fromCsvWithType([bm2, bm2], {}, StringTuple3Array);
    test:assertTrue(bm2s3t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm2s3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringTuple3Array|CsvConversionError bm3s3t = fromCsvWithType([bm3, bm3], {}, StringTuple3Array);
    test:assertTrue(bm3s3t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm3s3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringTuple3Array|CsvConversionError bm4s3t = fromCsvWithType([bm4, bm4], {}, StringTuple3Array);
    test:assertTrue(bm4s3t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm4s3t).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "string"));

    StringTuple3Array|CsvConversionError bm5s3t = fromCsvWithType([bm5, bm5], {}, StringTuple3Array);
    test:assertTrue(bm5s3t is CsvConversionError);
    test:assertEquals((<CsvConversionError>bm5s3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));
}

@test:Config {enable}
function testFromCsvWithTypeForTupleAndRecordAsExpectedType() {
    StringRecord1Array|CsvConversionError st1sr1 = fromCsvWithType([st1, st1], {}, StringRecord1Array);
    test:assertTrue(st1sr1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1sr1).message(), generateErrorMessageForMissingRequiredField("s3"));

    StringRecord1Array|CsvConversionError st2sr1 = fromCsvWithType([st2, st2], {}, StringRecord1Array);
    test:assertTrue(st2sr1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st2sr1).message(), generateErrorMessageForMissingRequiredField("s3"));

    StringRecord2Array|CsvConversionError st1sr2 = fromCsvWithType([st1, st1], {}, StringRecord2Array);
    test:assertTrue(st1sr2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1sr2).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "data.csv:StringRecord2"));

    StringRecord2Array|CsvConversionError st2sr2 = fromCsvWithType([st2, st2], {}, StringRecord2Array);
    test:assertTrue(st2sr2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st2sr2).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","data.csv:StringRecord2"));

    StringRecord9Array|CsvConversionError st1sr9 = fromCsvWithType([st1, st1], {}, StringRecord9Array);
    test:assertTrue(st1sr9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1sr9).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "data.csv:StringRecord9"));

    StringRecord9Array|CsvConversionError st2sr9 = fromCsvWithType([st2, st2], {}, StringRecord9Array);
    test:assertTrue(st2sr9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st2sr9).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","data.csv:StringRecord9"));

    StringRecord10Array|CsvConversionError st1sr10 = fromCsvWithType([st1, st1], {}, StringRecord10Array);
    test:assertEquals(st1sr10, [
        {'1: "string", '2: ""},
        {'1: "string", '2: ""}
    ]);

    StringRecord10Array|CsvConversionError st2sr10 = fromCsvWithType([st2, st2], {}, StringRecord10Array);
    test:assertEquals(st2sr10, [
        {'1: "string", '2: "", '3: "a", '4: ""},
        {'1: "string", '2: "", '3: "a", '4: ""}
    ]);

    StringRecord19Array|CsvConversionError st1sr19 = fromCsvWithType([st1, st1], {}, StringRecord19Array);
    test:assertEquals(st1sr19, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord19Array|CsvConversionError st2sr19 = fromCsvWithType([st2, st2], {}, StringRecord19Array);
    test:assertEquals(st2sr19, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord20Array|CsvConversionError st1sr20 = fromCsvWithType([st1, st1], {}, StringRecord20Array);
    test:assertEquals(st1sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord20Array|CsvConversionError st2sr20 = fromCsvWithType([st2, st2], {}, StringRecord20Array);
    test:assertEquals(st2sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord21Array|CsvConversionError st1sr21 = fromCsvWithType([st1, st1], {}, StringRecord21Array);
    test:assertEquals(st1sr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord21Array|CsvConversionError st2sr21 = fromCsvWithType([st2, st2], {}, StringRecord21Array);
    test:assertEquals(st2sr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord22Array|CsvConversionError st1sr22 = fromCsvWithType([st1, st1], {}, StringRecord22Array);
    test:assertEquals(st1sr22, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord22Array|CsvConversionError st2sr22 = fromCsvWithType([st2, st2], {}, StringRecord22Array);
    test:assertEquals(st2sr22, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord23Array|CsvConversionError st1sr23 = fromCsvWithType([st1, st1], {}, StringRecord23Array);
    test:assertEquals(st1sr23, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord23Array|CsvConversionError st2sr23 = fromCsvWithType([st2, st2], {}, StringRecord23Array);
    test:assertEquals(st2sr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord15Array|CsvConversionError st1cr15 = fromCsvWithType([st1, st1], {}, CustomRecord15Array);
    test:assertEquals(st1cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord15Array|CsvConversionError st2cr15 = fromCsvWithType([st2, st2], {}, CustomRecord15Array);
    test:assertEquals(st2cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord16Array|CsvConversionError st1cr16 = fromCsvWithType([st1, st1], {}, CustomRecord16Array);
    test:assertTrue(st1cr16 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1cr16).message(), generateErrorMessageForMissingRequiredField("3"));

    CustomRecord16Array|CsvConversionError st2cr16 = fromCsvWithType([st2, st2], {}, CustomRecord16Array);
    test:assertEquals(st2cr16, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord17Array|CsvConversionError st1cr17 = fromCsvWithType([st1, st1], {}, CustomRecord17Array);
    test:assertEquals(st1cr17, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord17Array|CsvConversionError st2cr17 = fromCsvWithType([st2, st2], {}, CustomRecord17Array);
    test:assertEquals(st2cr17, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord18Array|CsvConversionError st1cr18 = fromCsvWithType([st1, st1], {}, CustomRecord18Array);
    test:assertTrue(st1cr18 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1cr18).message(), generateErrorMessageForMissingRequiredField("3"));

    CustomRecord18Array|CsvConversionError st2cr18 = fromCsvWithType([st2, st2], {}, CustomRecord18Array);
    test:assertEquals(st2cr18, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord19Array|CsvConversionError st1cr19 = fromCsvWithType([st1, st1], {}, CustomRecord19Array);
    test:assertEquals(st1cr19, [
        {'1: s1, '2: s2, '3: "", '4: ""},
        {'1: s1, '2: s2, '3: "", '4: ""}
    ]);

    CustomRecord19Array|CsvConversionError st2cr19 = fromCsvWithType([st2, st2], {}, CustomRecord19Array);
    test:assertEquals(st2cr19, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord20Array|CsvConversionError st1cr20 = fromCsvWithType([st1, st1], {}, CustomRecord20Array);
    test:assertEquals(st1cr20, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord20Array|CsvConversionError st2cr20 = fromCsvWithType([st2, st2], {}, CustomRecord20Array);
    test:assertEquals(st2cr20, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord21Array|CsvConversionError st1cr21 = fromCsvWithType([st1, st1], {}, CustomRecord21Array);
    test:assertEquals(st1cr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord21Array|CsvConversionError st2cr21 = fromCsvWithType([st2, st2], {}, CustomRecord21Array);
    test:assertEquals(st2cr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord22Array|CsvConversionError st1cr22 = fromCsvWithType([st1, st1], {}, CustomRecord22Array);
    test:assertEquals(st1cr22, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord22Array|CsvConversionError st2cr22 = fromCsvWithType([st2, st2], {}, CustomRecord22Array);
    test:assertEquals(st2cr22, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord23Array|CsvConversionError st1cr23 = fromCsvWithType([st1, st1], {}, CustomRecord23Array);
    test:assertEquals(st1cr23, [
        {"1": s1, "2": s2, a: ""},
        {"1": s1, "2": s2, a: ""}
    ]);

    CustomRecord23Array|CsvConversionError st2cr23 = fromCsvWithType([st2, st2], {}, CustomRecord23Array);
    test:assertEquals(st2cr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""},
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""}
    ]);

    CustomRecord24Array|CsvConversionError st1cr24 = fromCsvWithType([st1, st1], {}, CustomRecord24Array);
    test:assertEquals(st1cr24, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord24Array|CsvConversionError st2cr24 = fromCsvWithType([st2, st2], {}, CustomRecord24Array);
    test:assertEquals(st2cr24, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord25Array|CsvConversionError st1cr25 = fromCsvWithType([st1, st1], {}, CustomRecord25Array);
    test:assertTrue(st1cr25 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1cr25).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "data.csv:CustomRecord25"));

    CustomRecord25Array|CsvConversionError st2cr25 = fromCsvWithType([st2, st2], {}, CustomRecord25Array);
    test:assertTrue(st2cr25 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st2cr25).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","data.csv:CustomRecord25"));

    CustomRecord25Array|CsvConversionError st3cr25 = fromCsvWithType([st3, st3], {}, CustomRecord25Array);
    test:assertTrue(st3cr25 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3cr25).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "data.csv:CustomRecord25"));

    CustomRecord25Array|CsvConversionError st4cr25 = fromCsvWithType([st4, st4], {}, CustomRecord25Array);
    test:assertTrue(st4cr25 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st4cr25).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","data.csv:CustomRecord25"));

    CustomRecord26Array|CsvConversionError st1cr26 = fromCsvWithType([st1, st1], {}, CustomRecord26Array);
    test:assertEquals(st1cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|CsvConversionError st2cr26 = fromCsvWithType([st2, st2], {}, CustomRecord26Array);
    test:assertEquals(st2cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|CsvConversionError st3cr26 = fromCsvWithType([st3, st3], {}, CustomRecord26Array);
    test:assertEquals(st3cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|CsvConversionError st4cr26 = fromCsvWithType([st4, st4], {}, CustomRecord26Array);
    test:assertEquals(st4cr26 , [
        {'1: s1},
        {'1: s1}
    ]);
}

@test:Config {enable}
function testFromCsvWithTypeForTupleAndRecordAsExpectedType2() {
    StringRecord1Array|CsvConversionError st3sr1 = fromCsvWithType([st3, st3], {}, StringRecord1Array);
    test:assertTrue(st3sr1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3sr1).message(), generateErrorMessageForMissingRequiredField("s3"));

    StringRecord1Array|CsvConversionError st4sr1 = fromCsvWithType([st4, st4], {}, StringRecord1Array);
    test:assertTrue(st4sr1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st4sr1).message(), generateErrorMessageForMissingRequiredField("s3"));

    StringRecord2Array|CsvConversionError st3sr2 = fromCsvWithType([st3, st3], {}, StringRecord2Array);
    test:assertTrue(st3sr2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3sr2).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "data.csv:StringRecord2"));

    StringRecord2Array|CsvConversionError st4sr2 = fromCsvWithType([st4, st4], {}, StringRecord2Array);
    test:assertTrue(st4sr2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st4sr2).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","data.csv:StringRecord2"));

    StringRecord9Array|CsvConversionError st3sr9 = fromCsvWithType([st3, st3], {}, StringRecord9Array);
    test:assertTrue(st3sr9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3sr9).message(), generateErrorMessageForMissingRequiredField("s1"));

    StringRecord9Array|CsvConversionError st4sr9 = fromCsvWithType([st4, st4], {}, StringRecord9Array);
    test:assertTrue(st4sr9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st4sr9).message(), generateErrorMessageForMissingRequiredField("s1"));

    StringRecord10Array|CsvConversionError st3sr10 = fromCsvWithType([st3, st3], {}, StringRecord10Array);
    test:assertEquals(st3sr10, [
        {'1: "string", '2: ""},
        {'1: "string", '2: ""}
    ]);

    StringRecord10Array|CsvConversionError st4sr10 = fromCsvWithType([st4, st4], {}, StringRecord10Array);
    test:assertEquals(st4sr10, [
        {'1: "string", '2: "", '3: "a", '4: ""},
        {'1: "string", '2: "", '3: "a", '4: ""}
    ]);

    StringRecord19Array|CsvConversionError st3sr19 = fromCsvWithType([st3, st3], {}, StringRecord19Array);
    test:assertEquals(st3sr19, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord19Array|CsvConversionError st4sr19 = fromCsvWithType([st4, st4], {}, StringRecord19Array);
    test:assertEquals(st4sr19, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord20Array|CsvConversionError st3sr20 = fromCsvWithType([st3, st3], {}, StringRecord20Array);
    test:assertEquals(st3sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord20Array|CsvConversionError st4sr20 = fromCsvWithType([st4, st4], {}, StringRecord20Array);
    test:assertEquals(st4sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord21Array|CsvConversionError st3sr21 = fromCsvWithType([st3, st3], {}, StringRecord21Array);
    test:assertEquals(st3sr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord21Array|CsvConversionError st4sr21 = fromCsvWithType([st4, st4], {}, StringRecord21Array);
    test:assertEquals(st4sr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord22Array|CsvConversionError st3sr22 = fromCsvWithType([st3, st3], {}, StringRecord22Array);
    test:assertEquals(st3sr22, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord22Array|CsvConversionError st4sr22 = fromCsvWithType([st4, st4], {}, StringRecord22Array);
    test:assertEquals(st4sr22, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord23Array|CsvConversionError st3sr23 = fromCsvWithType([st3, st3], {}, StringRecord23Array);
    test:assertEquals(st3sr23, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord23Array|CsvConversionError st4sr23 = fromCsvWithType([st4, st4], {}, StringRecord23Array);
    test:assertEquals(st4sr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord15Array|CsvConversionError st3cr15 = fromCsvWithType([st3, st3], {}, CustomRecord15Array);
    test:assertEquals(st3cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord15Array|CsvConversionError st4cr15 = fromCsvWithType([st4, st4], {}, CustomRecord15Array);
    test:assertEquals(st4cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord16Array|CsvConversionError st3cr16 = fromCsvWithType([st3, st3], {}, CustomRecord16Array);
    test:assertTrue(st3cr16 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3cr16).message(), generateErrorMessageForMissingRequiredField("3"));

    CustomRecord16Array|CsvConversionError st4cr16 = fromCsvWithType([st4, st4], {}, CustomRecord16Array);
    test:assertEquals(st4cr16, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord17Array|CsvConversionError st3cr17 = fromCsvWithType([st3, st3], {}, CustomRecord17Array);
    test:assertEquals(st3cr17, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord17Array|CsvConversionError st4cr17 = fromCsvWithType([st4, st4], {}, CustomRecord17Array);
    test:assertEquals(st4cr17, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord18Array|CsvConversionError st3cr18 = fromCsvWithType([st3, st3], {}, CustomRecord18Array);
    test:assertTrue(st3cr18 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3cr18).message(), generateErrorMessageForMissingRequiredField("3"));

    CustomRecord18Array|CsvConversionError st4cr18 = fromCsvWithType([st4, st4], {}, CustomRecord18Array);
    test:assertEquals(st4cr18, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord19Array|CsvConversionError st3cr19 = fromCsvWithType([st3, st3], {}, CustomRecord19Array);
    test:assertEquals(st3cr19, [
        {'1: s1, '2: s2, '3: "", '4: ""},
        {'1: s1, '2: s2, '3: "", '4: ""}
    ]);

    CustomRecord19Array|CsvConversionError st4cr19 = fromCsvWithType([st4, st4], {}, CustomRecord19Array);
    test:assertEquals(st4cr19, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord20Array|CsvConversionError st3cr20 = fromCsvWithType([st3, st3], {}, CustomRecord20Array);
    test:assertEquals(st3cr20, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord20Array|CsvConversionError st4cr20 = fromCsvWithType([st4, st4], {}, CustomRecord20Array);
    test:assertEquals(st4cr20, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord21Array|CsvConversionError st3cr21 = fromCsvWithType([st3, st3], {}, CustomRecord21Array);
    test:assertEquals(st3cr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord21Array|CsvConversionError st4cr21 = fromCsvWithType([st4, st4], {}, CustomRecord21Array);
    test:assertEquals(st4cr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord22Array|CsvConversionError st3cr22 = fromCsvWithType([st3, st3], {}, CustomRecord22Array);
    test:assertEquals(st3cr22, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord22Array|CsvConversionError st4cr22 = fromCsvWithType([st4, st4], {}, CustomRecord22Array);
    test:assertEquals(st4cr22, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord23Array|CsvConversionError st3cr23 = fromCsvWithType([st3, st3], {}, CustomRecord23Array);
    test:assertEquals(st3cr23, [
        {"1": s1, "2": s2, a: ""},
        {"1": s1, "2": s2, a: ""}
    ]);

    CustomRecord23Array|CsvConversionError st4cr23 = fromCsvWithType([st4, st4], {}, CustomRecord23Array);
    test:assertEquals(st4cr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""},
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""}
    ]);

    CustomRecord24Array|CsvConversionError st3cr24 = fromCsvWithType([st3, st3], {}, CustomRecord24Array);
    test:assertEquals(st3cr24, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord24Array|CsvConversionError st4cr24 = fromCsvWithType([st4, st4], {}, CustomRecord24Array);
    test:assertEquals(st4cr24, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);
}

@test:Config {enable}
function testFromCsvWithTypeForTupleAndTupleAsExpectedType() {
    StringTuple1Array|CsvConversionError st1st1 = fromCsvWithType([st1, st1], {}, StringTuple1Array);
    test:assertEquals(st1st1, [
        [s1, s2, "", ""],
        [s1, s2, "", ""]
    ]);

    StringTuple1Array|CsvConversionError st2st1 = fromCsvWithType([st2, st2], {}, StringTuple1Array);
    test:assertEquals(st2st1, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);
    StringTuple1Array|CsvConversionError st3st1 = fromCsvWithType([st3, st3], {}, StringTuple1Array);
    test:assertEquals(st3st1, [
        [s1, s2, "", ""],
        [s1, s2, "", ""]
    ]);

    StringTuple1Array|CsvConversionError st4st1 = fromCsvWithType([st4, st4], {}, StringTuple1Array);
    test:assertEquals(st4st1, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    StringTuple2Array|CsvConversionError st1st2 = fromCsvWithType([st1, st1], {}, StringTuple2Array);
    test:assertEquals(st1st2, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple2Array|CsvConversionError st2st2 = fromCsvWithType([st2, st2], {}, StringTuple2Array);
    test:assertEquals(st2st2, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple2Array|CsvConversionError st3st2 = fromCsvWithType([st3, st3], {}, StringTuple2Array);
    test:assertEquals(st3st2, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple2Array|CsvConversionError st4st2 = fromCsvWithType([st4, st4], {}, StringTuple2Array);
    test:assertEquals(st4st2, [
        [s1, s2],
        [s1, s2]
    ]);    

    StringTuple3Array|CsvConversionError st1st3 = fromCsvWithType([st1, st1], {}, StringTuple3Array);
    test:assertEquals(st1st3, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple3Array|CsvConversionError st2st3 = fromCsvWithType([st2, st2], {}, StringTuple3Array);
    test:assertEquals(st2st3, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    StringTuple3Array|CsvConversionError st3st3 = fromCsvWithType([st3, st3], {}, StringTuple3Array);
    test:assertEquals(st3st3, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple3Array|CsvConversionError st4st3 = fromCsvWithType([st4, st4], {}, StringTuple3Array);
    test:assertEquals(st4st3, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    StringTuple4Array|CsvConversionError st1st4 = fromCsvWithType([st1, st1], {}, StringTuple4Array);
    test:assertEquals(st1st4, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple4Array|CsvConversionError st2st4 = fromCsvWithType([st2, st2], {}, StringTuple4Array);
    test:assertEquals(st2st4, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    StringTuple4Array|CsvConversionError st3st4 = fromCsvWithType([st3, st3], {}, StringTuple4Array);
    test:assertEquals(st3st4, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple4Array|CsvConversionError st4st4 = fromCsvWithType([st4, st4], {}, StringTuple4Array);
    test:assertEquals(st4st4, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    AnydataTuple3Array|CsvConversionError st1anydt3 = fromCsvWithType([st1, st1], {}, AnydataTuple3Array);
    test:assertEquals(st1anydt3, [
        [s1, s2],
        [s1, s2]
    ]);

    AnydataTuple3Array|CsvConversionError st2anydt3 = fromCsvWithType([st2, st2], {}, AnydataTuple3Array);
    test:assertEquals(st2anydt3, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    AnydataTuple3Array|CsvConversionError st3anydt3 = fromCsvWithType([st3, st3], {}, AnydataTuple3Array);
    test:assertEquals(st3anydt3, [
        [s1, s2],
        [s1, s2]
    ]);

    AnydataTuple3Array|CsvConversionError st4anydt3 = fromCsvWithType([st4, st4], {}, AnydataTuple3Array);
    test:assertEquals(st4anydt3, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    JsonTuple3Array|CsvConversionError st1jt3 = fromCsvWithType([st1, st1], {}, JsonTuple3Array);
    test:assertEquals(st1jt3, [
        [s1, s2],
        [s1, s2]
    ]);

    JsonTuple3Array|CsvConversionError st2jt3 = fromCsvWithType([st2, st2], {}, JsonTuple3Array);
    test:assertEquals(st2jt3, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    JsonTuple3Array|CsvConversionError st3jt3 = fromCsvWithType([st3, st3], {}, JsonTuple3Array);
    test:assertEquals(st3jt3, [
        [s1, s2],
        [s1, s2]
    ]);

    JsonTuple3Array|CsvConversionError st4jt3 = fromCsvWithType([st4, st4], {}, JsonTuple3Array);
    test:assertEquals(st4jt3, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    DecimalTuple4Array|CsvConversionError st1dta = fromCsvWithType([st1, st1], {}, DecimalTuple4Array);
    test:assertTrue(st1dta is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1dta).message(), generateErrorMessageForInvalidValueForArrayType("string", "0", "decimal"));

    IntegerTuple3Array|CsvConversionError st2bta = fromCsvWithType([st2, st2], {}, IntegerTuple3Array);
    test:assertTrue(st2bta is CsvConversionError);
    test:assertEquals((<CsvConversionError>st2bta).message(), generateErrorMessageForInvalidValueForArrayType("string", "0", "int"));

    NilTuple3Array|CsvConversionError st3nta = fromCsvWithType([st3, st3], {}, NilTuple3Array);
    test:assertTrue(st3nta is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3nta).message(), generateErrorMessageForInvalidValueForArrayType("string", "0", "()"));

    BooleanTuple4Array|CsvConversionError st4bta = fromCsvWithType([st4, st4], {}, BooleanTuple4Array);
    test:assertTrue(st4bta is CsvConversionError);
    test:assertEquals((<CsvConversionError>st4bta).message(), generateErrorMessageForInvalidValueForArrayType("string", "0", "boolean"));
}

@test:Config {enable}
function testFromCsvWithTypeForTupleAndMapAsExpectedType() {
    StringMapArray|CsvConversionError st1sma = fromCsvWithType([st1, st1], {}, StringMapArray);
    test:assertEquals(st1sma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    StringMapArray|CsvConversionError st2sma = fromCsvWithType([st2, st2], {}, StringMapArray);
    test:assertEquals(st2sma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringMapArray|CsvConversionError st3sma = fromCsvWithType([st3, st3], {}, StringMapArray);
    test:assertEquals(st3sma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    StringMapArray|CsvConversionError st4sma = fromCsvWithType([st4, st4], {}, StringMapArray);
    test:assertEquals(st4sma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NillableIntUnionStringMapArray|CsvConversionError st1niusma = fromCsvWithType([st1, st1], {}, NillableIntUnionStringMapArray);
    test:assertEquals(st1niusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    NillableIntUnionStringMapArray|CsvConversionError st2niusma = fromCsvWithType([st2, st2], {}, NillableIntUnionStringMapArray);
    test:assertEquals(st2niusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NillableIntUnionStringMapArray|CsvConversionError st3niusma = fromCsvWithType([st3, st3], {}, NillableIntUnionStringMapArray);
    test:assertEquals(st3niusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    NillableIntUnionStringMapArray|CsvConversionError st4niusma = fromCsvWithType([st4, st4], {}, NillableIntUnionStringMapArray);
    test:assertEquals(st4niusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    IntUnionStringMapArray|CsvConversionError st1iusma = fromCsvWithType([st1, st1], {}, IntUnionStringMapArray);
    test:assertEquals(st1iusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    IntUnionStringMapArray|CsvConversionError st2iusma = fromCsvWithType([st2, st2], {}, IntUnionStringMapArray);
    test:assertEquals(st2iusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    IntUnionStringMapArray|CsvConversionError st3iusma = fromCsvWithType([st3, st3], {}, IntUnionStringMapArray);
    test:assertEquals(st3iusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    IntUnionStringMapArray|CsvConversionError st4iusma = fromCsvWithType([st4, st4], {}, IntUnionStringMapArray);
    test:assertEquals(st4iusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    JsonMapArray|CsvConversionError st1jma = fromCsvWithType([st1, st1], {}, JsonMapArray);
    test:assertEquals(st1jma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    JsonMapArray|CsvConversionError st2jma = fromCsvWithType([st2, st2], {}, JsonMapArray);
    test:assertEquals(st2jma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    JsonMapArray|CsvConversionError st3jma = fromCsvWithType([st3, st3], {}, JsonMapArray);
    test:assertEquals(st3jma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    JsonMapArray|CsvConversionError st4jma = fromCsvWithType([st4, st4], {}, JsonMapArray);
    test:assertEquals(st4jma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    AnydataMapArray|CsvConversionError st1anydma = fromCsvWithType([st1, st1], {}, AnydataMapArray);
    test:assertEquals(st1anydma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    AnydataMapArray|CsvConversionError st2anydma = fromCsvWithType([st2, st2], {}, AnydataMapArray);
    test:assertEquals(st2anydma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    AnydataMapArray|CsvConversionError st3anydma = fromCsvWithType([st3, st3], {}, AnydataMapArray);
    test:assertEquals(st3anydma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    AnydataMapArray|CsvConversionError st4anydma = fromCsvWithType([st4, st4], {}, AnydataMapArray);
    test:assertEquals(st4anydma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomMapArray|CsvConversionError st1cma = fromCsvWithType([st1, st1], {}, CustomMapArray);
    test:assertEquals(st1cma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    CustomMapArray|CsvConversionError st2cma = fromCsvWithType([st2, st2], {}, CustomMapArray);
    test:assertEquals(st2cma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomMapArray|CsvConversionError st3cma = fromCsvWithType([st3, st3], {}, CustomMapArray);
    test:assertEquals(st3cma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    CustomMapArray|CsvConversionError st4cma = fromCsvWithType([st4, st4], {}, CustomMapArray);
    test:assertEquals(st4cma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NilMapArray|CsvConversionError st1nma = fromCsvWithType([st1, st1], {}, NilMapArray);
    test:assertEquals(st1nma, ([
        {},
        {}
    ]));

    IntegerMapArray|CsvConversionError st2ima = fromCsvWithType([st2, st2], {}, IntegerMapArray);
    test:assertEquals(st2ima, ([
        {},
        {}
    ]));

    DecimalMapArray|CsvConversionError st3dma = fromCsvWithType([st3, st3], {}, DecimalMapArray);
    test:assertEquals(st3dma, ([
        {},
        {}
    ]));

    BooleanMapArray|CsvConversionError st4bma = fromCsvWithType([st4, st4], {}, BooleanMapArray);
    test:assertEquals(st4bma, ([
        {},
        {}
    ]));
}

@test:Config {enable}
function testFromCsvWithTypeForTupleAndArrayAsExpectedType() {
    StringArrayArray|CsvConversionError st1saa = fromCsvWithType([st1, st1], {}, StringArrayArray);
    test:assertEquals(st1saa , [
        [s1, s2],
        [s1, s2]
    ]);

    StringArrayArray|CsvConversionError st2saa = fromCsvWithType([st2, st2], {}, StringArrayArray);
    test:assertEquals(st2saa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    StringArrayArray|CsvConversionError st3saa = fromCsvWithType([st3, st3], {}, StringArrayArray);
    test:assertEquals(st3saa , [
        [s1, s2],
        [s1, s2]
    ]);

    StringArrayArray|CsvConversionError st4saa = fromCsvWithType([st4, st4], {}, StringArrayArray);
    test:assertEquals(st4saa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    NillableStringArrayArray|CsvConversionError st1nsaa = fromCsvWithType([st1, st1], {}, NillableStringArrayArray);
    test:assertEquals(st1nsaa , [
        [s1, s2],
        [s1, s2]
    ]);

    NillableStringArrayArray|CsvConversionError st2nsaa = fromCsvWithType([st2, st2], {}, NillableStringArrayArray);
    test:assertEquals(st2nsaa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    NillableStringArrayArray|CsvConversionError st3nsaa = fromCsvWithType([st3, st3], {}, NillableStringArrayArray);
    test:assertEquals(st3nsaa , [
        [s1, s2],
        [s1, s2]
    ]);

    NillableStringArrayArray|CsvConversionError st4nsaa = fromCsvWithType([st4, st4], {}, NillableStringArrayArray);
    test:assertEquals(st4nsaa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    NillableIntOrUnionStringArrayArray|CsvConversionError st1nsuiaa = fromCsvWithType([st1, st1], {}, NillableIntOrUnionStringArrayArray);
    test:assertEquals(st1nsuiaa , [
        [s1, s2],
        [s1, s2]
    ]);

    NillableIntOrUnionStringArrayArray|CsvConversionError st2nsuiaa = fromCsvWithType([st2, st2], {}, NillableIntOrUnionStringArrayArray);
    test:assertEquals(st2nsuiaa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    NillableIntOrUnionStringArrayArray|CsvConversionError st3nsuiaa = fromCsvWithType([st3, st3], {}, NillableIntOrUnionStringArrayArray);
    test:assertEquals(st3nsuiaa , [
        [s1, s2],
        [s1, s2]
    ]);

    NillableIntOrUnionStringArrayArray|CsvConversionError st4nsuiaa = fromCsvWithType([st4, st4], {}, NillableIntOrUnionStringArrayArray);
    test:assertEquals(st4nsuiaa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    StringArray2Array|CsvConversionError st1saa2 = fromCsvWithType([st1, st1], {}, StringArray2Array);
    test:assertEquals(st1saa2 , [
        [s1, s2],
        [s1, s2]
    ]);

    StringArray2Array|CsvConversionError st2saa2 = fromCsvWithType([st2, st2], {}, StringArray2Array);
    test:assertEquals(st2saa2 , [
        [s1, s2],
        [s1, s2]
    ]);

    StringArray2Array|CsvConversionError st3saa2 = fromCsvWithType([st3, st3], {}, StringArray2Array);
    test:assertEquals(st3saa2 , [
        [s1, s2],
        [s1, s2]
    ]);

    StringArray2Array|CsvConversionError st4saa2 = fromCsvWithType([st4, st4], {}, StringArray2Array);
    test:assertEquals(st4saa2 , [
        [s1, s2],
        [s1, s2]
    ]);

    JsonArray1Array|CsvConversionError st1jaa = fromCsvWithType([st1, st1], {}, JsonArray1Array);
    test:assertEquals(st1jaa , [
        [s1, s2],
        [s1, s2]
    ]);

    JsonArray1Array|CsvConversionError st2jaa = fromCsvWithType([st2, st2], {}, JsonArray1Array);
    test:assertEquals(st2jaa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    JsonArray1Array|CsvConversionError st3jaa = fromCsvWithType([st3, st3], {}, JsonArray1Array);
    test:assertEquals(st3jaa , [
        [s1, s2],
        [s1, s2]
    ]);

    JsonArray1Array|CsvConversionError st4jaa = fromCsvWithType([st4, st4], {}, JsonArray1Array);
    test:assertEquals(st4jaa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    AnydataArray1Array|CsvConversionError st1anyda = fromCsvWithType([st1, st1], {}, AnydataArray1Array);
    test:assertEquals(st1anyda , [
        [s1, s2],
        [s1, s2]
    ]);

    AnydataArray1Array|CsvConversionError st2anyda = fromCsvWithType([st2, st2], {}, AnydataArray1Array);
    test:assertEquals(st2anyda , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    AnydataArray1Array|CsvConversionError st3anyda = fromCsvWithType([st3, st3], {}, AnydataArray1Array);
    test:assertEquals(st3anyda , [
        [s1, s2],
        [s1, s2]
    ]);

    AnydataArray1Array|CsvConversionError st4anyda = fromCsvWithType([st4, st4], {}, AnydataArray1Array);
    test:assertEquals(st4anyda , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    DecimalArray1Array|CsvConversionError st1dda = fromCsvWithType([st1, st1], {}, DecimalArray1Array);
    test:assertTrue(st1dda is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1dda).message(), generateErrorMessageForInvalidValueForArrayType("string", "0", "decimal"));

    DecimalArray1Array|CsvConversionError st3dda = fromCsvWithType([st3, st3], {}, DecimalArray1Array);
    test:assertTrue(st3dda is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3dda).message(), generateErrorMessageForInvalidValueForArrayType("string", "0", "decimal"));
}

@test:Config {enable}
function testFromCsvWithTypeFunctionWithTypeCompatibility() {
    var value = {i1, i2, s1, s2, b1, b2, n1, n2, f1, f2, d1, d2, j1: b1, a1: d1, j2: b2, a2: d2};
    var value2 = {i1, s1, b1, n1, f1, d1, j1: b1, a1: d1, s2, s3, j2: b2, a2: d2};
    var value3 = {i1, s1, b1, n1, f1, d1, j1: b1, a1: d1, s2, s3};

    CustomRecord27Array|CsvConversionError vcr27a = fromCsvWithType([value, value, value], {}, CustomRecord27Array);
    test:assertEquals(vcr27a , [
        {i1, s1, s2, b1, n1, f1, d1, j1: b1, a1: d1, defaultableField: "", nillableField: ()},
        {i1, s1, s2, b1, n1, f1, d1, j1: b1, a1: d1, defaultableField: "", nillableField: ()},
        {i1, s1, s2, b1, n1, f1, d1, j1: b1, a1: d1, defaultableField: "", nillableField: ()}
    ]);

    CustomTuple7Array|CsvConversionError v2ct7a = fromCsvWithType([value2, value2, value2], {}, CustomTuple7Array);
    test:assertTrue(v2ct7a is CsvConversionError);
    test:assertEquals((<CsvConversionError>v2ct7a).message(), generateErrorMessageForInvalidValueForArrayType("false", "10", "string"));

    CustomTuple7Array|CsvConversionError v3ct7a = fromCsvWithType([value3, value3, value3], {}, CustomTuple7Array);
    test:assertEquals(v3ct7a , [
        [i1, s1, b1, n1, f1, d1, b1, d1, s2, s3],
        [i1, s1, b1, n1, f1, d1, b1, d1, s2, s3],
        [i1, s1, b1, n1, f1, d1, b1, d1, s2, s3]
    ]);

    AnydataArray1Array|CsvConversionError v3anyd1a = fromCsvWithType([value3, value3, value3], {}, AnydataArray1Array);
    test:assertEquals(v3anyd1a , [
        [i1, s1, b1, n1, f1, d1, b1, d1, s2, s3],
        [i1, s1, b1, n1, f1, d1, b1, d1, s2, s3],
        [i1, s1, b1, n1, f1, d1, b1, d1, s2, s3]
    ]);

    AnydataMapArray|CsvConversionError vanydma = fromCsvWithType([value, value, value], {}, AnydataMapArray);
    test:assertEquals(vanydma , [
        value,
        value,
        value
    ]);

    JsonMapArray|CsvConversionError vjma = fromCsvWithType([value, value, value], {}, JsonMapArray);
    test:assertEquals(vjma , [
        value,
        value,
        value
    ]);

    record{|int...;|}[]|CsvConversionError irrma = fromCsvWithType([{a: 1}, {a: i1, b: i2}, {a: i1, b: i2, c: s1}]);
    test:assertEquals(irrma , [
        {a:1},
        {a: i1, b: i2},
        {a: i1, b: i2}
    ]);

    record{|decimal...;|}[]|CsvConversionError drra = fromCsvWithType([{a: d1}, {a: d2, b: d3}, {a: d4, b: f2, c: s1, d: f3}]);
    test:assertTrue(drra is record{|decimal...;|}[]);
    test:assertEquals(drra , [
        {a: d1},
        {a: d2, b: d3},
        {a: d4, b: -3.21d, d: <decimal>f3}
    ]);

    record{|string...;|}[]|CsvConversionError srra = fromCsvWithType([{a: "string"}, {c: 1, a: s1, b: s2}, {a: b1, b: s3, c: d1}]);
    test:assertEquals(srra , [
        {a: "string"},
        {a: s1, b: s2},
        {b: s3}
    ]);

    record{|float...;|}[]|CsvConversionError frra = fromCsvWithType([{a: 1.2, b: 1.2f}, {a: d2, b: d3}, {a: d4, b: f2, c: s1}]);
    test:assertEquals(frra , [
        {a: 1.2, b: 1.2},
        {a: <float>d2, b: <float>d3},
        {a: <float>d4, b: f2}
    ]);

    record{|float a; decimal b;|}[]|CsvConversionError fdc1a = fromCsvWithType([{a: d1, b: d2}, {a: f1, b: f2}, {a: d2, b: f2}, {a: f2, b: d2}]);
    test:assertEquals(fdc1a , [
        {a: <float>d1, b: d2}, 
        {a: f1, b: <decimal>f2}, 
        {a: <float>d2, b: <decimal>f2}, 
        {a: f2, b: d2}
    ]);

    record{|float a; decimal ...;|}[]|CsvConversionError fdc2a = fromCsvWithType([{a: d1, b: d2}, {a: f1, b: f2}, {a: d2, b: f2}, {a: f2, b: d2}]);
    test:assertEquals(fdc2a , [
        {a: <float>d1, b: d2}, 
        {a: f1, b: <decimal>f2}, 
        {a: <float>d2, b: <decimal>f2}, 
        {a: f2, b: d2}
    ]);

    record{|decimal b; float...;|}[]|CsvConversionError fdc3a = fromCsvWithType([{a: d1, b: d2}, {a: f1, b: f2}, {a: d2, b: f2}, {a: f2, b: d2}]);
    test:assertEquals(fdc3a , [
        {a: <float>d1, b: d2}, 
        {a: f1, b: <decimal>f2}, 
        {a: <float>d2, b: <decimal>f2}, 
        {a: f2, b: d2}
    ]);
}

// boolean enable = true;

// @test:Config {enable: !enable}
// function testTemp1() {
    // record{|float...;|}[]|CsvConversionError frra = fromCsvWithType([{a: d2, b: d3}]);
    // test:assertEquals(frra , [
    //     {a: 1.2, b: 1.2},
    //     {},
    //     {a: d4, b: f2}
    // ]);
// }
