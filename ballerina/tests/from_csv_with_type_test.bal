import ballerina/test;

// @test:Config
// function testFromCsvWithTypeForMapAndMapAsExpextedType() {

// }

// @test:Config
// function testFromCsvWithTypeForRecordAndRecordAsExpextedType() {

// }

// @test:Config
// function testFromCsvWithTypeForMapAndArrayAsExpextedType() {

// }

// @test:Config
// function testFromCsvWithTypeForMapAndTupleAsExpextedType() {

// }

// @test:Config
// function testFromCsvWithTypeForRecordAndMapAsExpextedType() {

// }

boolean enable = true;

@test:Config {enable}
function testFromCsvWithTypeForMapAndRecordAsExpextedType() {
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
function testFromCsvWithTypeForMapAndRecordAsExpextedType2() {
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

@test:Config {enable: !enable}
function test() {
    BooleanMapArray|CsvConversionError bm2bma = fromCsvWithType([bm2, bm2], {}, BooleanMapArray);
    test:assertEquals(bm2bma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);
}

@test:Config {enable}
function testFromCsvWithTypeForMapAndMapAsExpextedType() {
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

    // NillableBooleanMapArray|CsvConversionError bm1br15 = fromCsvWithType([bm1, bm1], {}, NillableBooleanMapArray);
    // test:assertEquals(bm1br15, [
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null},
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null}
    // ]);

    // NillableIntUnionBooleanMapArray|CsvConversionError bm1br15 = fromCsvWithType([bm1, bm1], {}, NillableIntUnionBooleanMapArray);
    // test:assertEquals(bm1br15, [
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null},
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null}
    // ]);

    // IntUnionBooleanMapArray|CsvConversionError bm1br15 = fromCsvWithType([bm1, bm1], {}, IntUnionBooleanMapArray);
    // test:assertEquals(bm1br15, [
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null},
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null}
    // ]);

    // NilMapArray|CsvConversionError bm1br15 = fromCsvWithType([bm1, bm1], {}, NilMapArray);
    // test:assertEquals(bm1br15, [
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null},
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null}
    // ]);

    // JsonMapArray|CsvConversionError bm1br15 = fromCsvWithType([bm1, bm1], {}, JsonMapArray);
    // test:assertEquals(bm1br15, [
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null},
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null}
    // ]);

    // AnydataMapArray|CsvConversionError bm1br15 = fromCsvWithType([bm1, bm1], {}, AnydataMapArray);
    // test:assertEquals(bm1br15, [
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null},
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null}
    // ]);

    // CustomMapArray|CsvConversionError bm1br15 = fromCsvWithType([bm1, bm1], {}, CustomMapArray);
    // test:assertEquals(bm1br15, [
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null},
    //     {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null}
    // ]);
}

function generateErrorMessageForMissingRequiredField(string 'field) returns string {
    return string `no matching header value is found for the required field '${'field}'`;
}

function generateErrorMessageForInvalidCast(string value, string 'type) returns string {
    return string `value '${value}' cannot be cast into '${'type}'`;
}

function generateErrorMessageForInvalidFieldType(string value, string 'key) returns string {
    return string `no mapping type found for value '${value}' in key '${'key}'`;
}

// @test:Config
// function testFromCsvWithTypeForRecordAndArrayAsExpextedType() {

// }

// @test:Config
// function testFromCsvWithTypeForRecordAndTupleAsExpextedType() {

// }

// @test:Config
// function testFromCsvWithTypeForArrayAndMapAsExpextedType() {

// }

// @test:Config
// function testFromCsvWithTypeForArrayAndRecordAsExpextedType() {

// }

// @test:Config
// function testFromCsvWithTypeForArrayAndArrayAsExpextedType() {

// }

// @test:Config
// function testFromCsvWithTypeForArrayAndTupleAsExpextedType() {

// }

// @test:Config
// function testFromCsvWithTypeForTupleAndMapAsExpextedType() {

// }

// @test:Config
// function testFromCsvWithTypeForTupleAndRecordAsExpextedType() {

// }

// @test:Config
// function testFromCsvWithTypeForTupleAndArrayAsExpextedType() {

// }

// @test:Config
// function testFromCsvWithTypeForTupleAndTupleAsExpextedType() {

// }
