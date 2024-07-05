import ballerina/test;

@test:Config
function testFromCsvWithTypeForMapAndRecordAsExpectedType() {
    BooleanRecord1Array|Error bm1br1 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord1Array);
    test:assertTrue(bm1br1 is Error);
    test:assertEquals((<Error>bm1br1).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord1Array|Error bm2br1 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord1Array);
    test:assertTrue(bm2br1 is Error);
    test:assertEquals((<Error>bm2br1).message(), generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord1Array|Error bm3br1 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord1Array);
    test:assertEquals(bm3br1, [
        {b1: true, b2: false, b3: (), b4: false, i1: 1},
        {b1: true, b2: false, b3: (), b4: false, i1: 1}
    ]);

    BooleanRecord1Array|Error bm4br1 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord1Array);
    test:assertTrue(bm4br1 is Error);
    test:assertEquals((<Error>bm4br1).message(), generateErrorMessageForMissingRequiredField("b2"));

    BooleanRecord1Array|Error bm5br1 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord1Array);
    test:assertEquals(bm5br1, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord2Array|Error bm1br2 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord2Array);
    test:assertTrue(bm1br2 is Error);
    test:assertEquals((<Error>bm1br2).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord2Array|Error bm2br2 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord2Array);
    test:assertTrue(bm2br2 is Error);
    test:assertEquals((<Error>bm2br2).message(), generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord2Array|Error bm3br2 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord2Array);
    test:assertEquals(bm3br2, [
        {b1: true, b2: false, b3: (), b4: false},
        {b1: true, b2: false, b3: (), b4: false}
    ]);

    BooleanRecord2Array|Error bm4br2 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord2Array);
    test:assertTrue(bm4br2 is Error);
    test:assertEquals((<Error>bm4br2).message(), generateErrorMessageForMissingRequiredField("b2"));

    BooleanRecord2Array|Error bm5br2 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord2Array);
    test:assertEquals(bm5br2, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord3Array|Error bm1br3 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord3Array);
    test:assertTrue(bm1br3 is Error);
    test:assertEquals((<Error>bm1br3).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord3Array|Error bm2br3 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord3Array);
    test:assertEquals(bm2br3, [
        {b1: true, b3: ()},
        {b1: true, b3: ()}
    ]);

    BooleanRecord3Array|Error bm3br3 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord3Array);
    test:assertEquals(bm3br3, [
        {b1: true, b3: ()},
        {b1: true, b3: ()}
    ]);

    BooleanRecord3Array|Error bm4br3 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord3Array);
    test:assertTrue(bm4br3 is Error);
    test:assertEquals((<Error>bm4br3).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord3Array|Error bm5br3 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord3Array);
    test:assertEquals(bm5br3, [{b1: true, b3: ()}, {b1: true, b3: ()}]);

    BooleanRecord4Array|Error bm1br4 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord4Array);
    test:assertTrue(bm1br4 is Error);
    test:assertEquals((<Error>bm1br4).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord4Array|Error bm2br4 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord4Array);
    test:assertEquals(bm2br4, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord4Array|Error bm3br4 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord4Array);
    test:assertEquals(bm3br4, [
        {b1: true, b2: false, b3: (), b4: false, i1: 1},
        {b1: true, b2: false, b3: (), b4: false, i1: 1}
    ]);

    BooleanRecord4Array|Error bm4br4 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord4Array);
    test:assertTrue(bm4br4 is Error);
    test:assertEquals((<Error>bm4br4).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord4Array|Error bm5br4 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord4Array);
    test:assertEquals(bm5br4, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord5Array|Error bm1br5 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord5Array);
    test:assertTrue(bm1br5 is Error);
    test:assertEquals((<Error>bm1br5).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord5Array|Error bm2br5 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord5Array);
    test:assertEquals(bm2br5, [
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, n1: (), n3: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, n1: (), n3: ()}
    ]);

    BooleanRecord5Array|Error bm3br5 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord5Array);
    test:assertEquals(bm3br5, [
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, i1: 1, b4: false},
        {b1: true, b3: (), defaultableField: "", nillableField: (), b2: false, i1: 1, b4: false}
    ]);

    BooleanRecord5Array|Error bm4br5 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord5Array);
    test:assertTrue(bm4br5 is Error);
    test:assertEquals((<Error>bm4br5).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord5Array|Error bm5br5 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord5Array);
    test:assertEquals(bm5br5, [
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|Error bm1br6 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord6Array);
    test:assertTrue(bm1br6 is Error);
    test:assertEquals((<Error>bm1br6).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord6Array|Error bm2br6 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord6Array);
    test:assertEquals(bm2br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|Error bm3br6 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord6Array);
    test:assertEquals(bm3br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|Error bm4br6 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord6Array);
    test:assertTrue(bm4br6 is Error);
    test:assertEquals((<Error>bm4br6).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord6Array|Error bm5br6 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord6Array);
    test:assertEquals(bm5br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord7Array|Error bm1br7 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord7Array);
    test:assertTrue(bm1br7 is Error);
    test:assertEquals((<Error>bm1br7).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord7Array|Error bm2br7 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord7Array);
    test:assertTrue(bm2br7 is Error);
    test:assertEquals((<Error>bm2br7).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord7Array|Error bm3br7 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord7Array);
    test:assertTrue(bm3br7 is Error);
    test:assertEquals((<Error>bm3br7).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord7Array|Error bm4br7 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord7Array);
    test:assertTrue(bm4br7 is Error);
    test:assertEquals((<Error>bm4br7).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord7Array|Error bm5br7 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord7Array);
    test:assertTrue(bm5br7 is Error);
    test:assertEquals((<Error>bm5br7).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|Error bm1br8 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord8Array);
    test:assertTrue(bm1br8 is Error);
    test:assertEquals((<Error>bm1br8).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord8Array|Error bm2br8 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord8Array);
    test:assertTrue(bm2br8 is Error);
    test:assertEquals((<Error>bm2br8).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|Error bm3br8 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord8Array);
    test:assertTrue(bm3br8 is Error);
    test:assertEquals((<Error>bm3br8).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|Error bm4br8 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord8Array);
    test:assertTrue(bm4br8 is Error);
    test:assertEquals((<Error>bm4br8).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord8Array|Error bm5br8 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord8Array);
    test:assertTrue(bm5br8 is Error);
    test:assertEquals((<Error>bm5br8).message(), generateErrorMessageForMissingRequiredField("requiredField"));
}

@test:Config
function testFromCsvWithTypeForMapAndRecordAsExpectedType2() {
    BooleanRecord9Array|Error bm1br9 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord9Array);
    test:assertTrue(bm1br9 is Error);
    test:assertEquals((<Error>bm1br9).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord9Array|Error bm2br9 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord9Array);
    test:assertEquals(bm2br9, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord9Array|Error bm3br9 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord9Array);
    test:assertEquals(bm3br9, [
        {b1: true, b2: false, b3: (), b4: false},
        {b1: true, b2: false, b3: (), b4: false}
    ]);

    BooleanRecord9Array|Error bm4br9 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord9Array);
    test:assertTrue(bm4br9 is Error);
    test:assertEquals((<Error>bm4br9).message(), generateErrorMessageForMissingRequiredField("b3"));

    BooleanRecord9Array|Error bm5br9 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord9Array);
    test:assertEquals(bm5br9, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    BooleanRecord10Array|Error bm1br10 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord10Array);
    test:assertEquals(bm1br10, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanRecord10Array|Error bm2br10 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord10Array);
    test:assertEquals(bm2br10, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanRecord10Array|Error bm3br10 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord10Array);
    test:assertEquals(bm3br10, [
        {b1: true, b2: false, b4: false},
        {b1: true, b2: false, b4: false}
    ]);

    BooleanRecord10Array|Error bm4br10 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord10Array);
    test:assertEquals(bm4br10, [
        {},
        {}
    ]);

    BooleanRecord10Array|Error bm5br10 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord10Array);
    test:assertEquals(bm5br10, [
        {b1: true, b2: false, b4: true},
        {b1: true, b2: false, b4: true}
    ]);

    BooleanRecord11Array|Error bm1br11 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord11Array);
    test:assertEquals(bm1br11, [
        {b1: true, b2: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord11Array|Error bm2br11 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord11Array);
    test:assertEquals(bm2br11, [
        {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null},
        {b1: true, b2: false, b3: (), n1: (), n3: (), defaultableField: "", nillableField :null}
    ]);

    BooleanRecord11Array|Error bm3br11 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord11Array);
    test:assertEquals(bm3br11, [
        {b1: true, b2: false, b3: (), b4: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b3: (), b4: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord11Array|Error bm4br11 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord11Array);
    test:assertTrue(bm4br11 is Error);
    test:assertEquals((<Error>bm4br11).message(), generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord11Array|Error bm5br11 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord11Array);
    test:assertEquals(bm5br11, [
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b3: (), b4: true, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord12Array|Error bm1br12 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord12Array);
    test:assertTrue(bm1br12 is Error);
    test:assertEquals((<Error>bm1br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|Error bm2br12 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord12Array);
    test:assertTrue(bm2br12 is Error);
    test:assertEquals((<Error>bm2br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|Error bm3br12 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord12Array);
    test:assertTrue(bm3br12 is Error);
    test:assertEquals((<Error>bm3br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|Error bm4br12 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord12Array);
    test:assertTrue(bm4br12 is Error);
    test:assertEquals((<Error>bm4br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord12Array|Error bm5br12 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord12Array);
    test:assertTrue(bm5br12 is Error);
    test:assertEquals((<Error>bm5br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord13Array|Error bm1br13 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord13Array);
    test:assertEquals(bm1br13, [
        {b1: true, b2: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|Error bm2br13 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord13Array);
    test:assertEquals(bm2br13, [
        {b1: true, b2: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|Error bm3br13 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord13Array);
    test:assertEquals(bm3br13, [
        {b1: true, b2: false, b4: false, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b4: false, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|Error bm4br13 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord13Array);
    test:assertEquals(bm4br13, [
        {defaultableField: "", nillableField :null},
        {defaultableField: "", nillableField :null}
    ]);

    BooleanRecord13Array|Error bm5br13 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord13Array);
    test:assertEquals(bm5br13, [
        {b1: true, b2: false, b4: true, defaultableField: "", nillableField :null},
        {b1: true, b2: false, b4: true, defaultableField: "", nillableField :null}
    ]);

    BooleanRecord14Array|Error bm1br14 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord14Array);
    test:assertTrue(bm1br14 is Error);
    test:assertEquals((<Error>bm1br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|Error bm2br14 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord14Array);
    test:assertTrue(bm2br14 is Error);
    test:assertEquals((<Error>bm2br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|Error bm3br14 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord14Array);
    test:assertTrue(bm3br14 is Error);
    test:assertEquals((<Error>bm3br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|Error bm4br14 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord14Array);
    test:assertTrue(bm4br14 is Error);
    test:assertEquals((<Error>bm4br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord14Array|Error bm5br14 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord14Array);
    test:assertTrue(bm5br14 is Error);
    test:assertEquals((<Error>bm5br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord15Array|Error bm1br15 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord15Array);
    test:assertTrue(bm1br15 is Error);
    test:assertEquals((<Error>bm1br15).message(), generateErrorMessageForInvalidFieldType("true", "b1"));

    BooleanRecord15Array|Error bm3br15 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord15Array);
    test:assertTrue(bm3br15 is Error);
    test:assertEquals((<Error>bm3br15).message(), generateErrorMessageForInvalidFieldType("true", "b1"));

    BooleanRecord15Array|Error bm4br15 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord15Array);
    test:assertTrue(bm4br15 is Error);
    test:assertEquals((<Error>bm4br15).message(), generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord16Array|Error bm1br16 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord16Array);
    test:assertEquals(bm1br16, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanRecord16Array|Error bm2br16 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord16Array);
    test:assertEquals(bm2br16, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord16Array|Error bm3br16 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord16Array);
    test:assertEquals(bm3br16, [
        {b1: true, b2: false, b4: false, b3: ()},
        {b1: true, b2: false, b4: false, b3: ()}
    ]);

    BooleanRecord16Array|Error bm4br16 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord16Array);
    test:assertEquals(bm4br16, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    BooleanRecord16Array|Error bm5br16 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord16Array);
    test:assertEquals(bm5br16, [
        {b1: true, b2: false, b4: true, b3: ()},
        {b1: true, b2: false, b4: true, b3: ()}
    ]);

    BooleanRecord17Array|Error bm1br17 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord17Array);
    test:assertEquals(bm1br17, [
        {},
        {}
    ]);

    BooleanRecord17Array|Error bm2br17 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord17Array);
    test:assertEquals(bm2br17, [
        {},
        {}
    ]);

    BooleanRecord17Array|Error bm3br17 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord17Array);
    test:assertEquals(bm3br17, [
        {i1: 1},
        {i1: 1}
    ]);

    BooleanRecord17Array|Error bm4br17 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord17Array);
    test:assertEquals(bm4br17, [
        {},
        {}
    ]);

    BooleanRecord17Array|Error bm5br17 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord17Array);
    test:assertEquals(bm5br17, [
        {},
        {}
    ]);

    BooleanRecord18Array|Error bm1br18 = parseRecordAsRecordType([bm1, bm1], {}, BooleanRecord18Array);
    test:assertEquals(bm1br18, [
        {b2: false},
        {b2: false}
    ]);

    BooleanRecord18Array|Error bm2br18 = parseRecordAsRecordType([bm2, bm2], {}, BooleanRecord18Array);
    test:assertEquals(bm2br18, [
        {b2: false, b3: (), n1: (), n3: ()},
        {b2: false, b3: (), n1: (), n3: ()}
    ]);

    BooleanRecord18Array|Error bm3br18 = parseRecordAsRecordType([bm3, bm3], {}, BooleanRecord18Array);
    test:assertEquals(bm3br18, [
        {b2: false, b3: (), i1: 1},
        {b2: false, b3: (), i1: 1}
    ]);

    BooleanRecord18Array|Error bm4br18 = parseRecordAsRecordType([bm4, bm4], {}, BooleanRecord18Array);
    test:assertTrue(bm4br18 is Error);
    test:assertEquals((<Error>bm4br18).message(), generateErrorMessageForMissingRequiredField("b2"));

    BooleanRecord18Array|Error bm5br18 = parseRecordAsRecordType([bm5, bm5], {}, BooleanRecord18Array);
    test:assertEquals(bm5br18, [
        {b2: false, b3: ()},
        {b2: false, b3: ()}
    ]);
}

@test:Config
function testFromCsvWithTypeForMapAndMapAsExpectedType() {
    BooleanMapArray|Error bm1bma = parseRecordAsRecordType([bm1, bm1], {}, BooleanMapArray);
    test:assertEquals(bm1bma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanMapArray|Error bm2bma = parseRecordAsRecordType([bm2, bm2], {}, BooleanMapArray);
    test:assertEquals(bm2bma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    BooleanMapArray|Error bm3bma = parseRecordAsRecordType([bm3, bm3], {}, BooleanMapArray);
    test:assertEquals(bm3bma, [
        {b1: true, b2: false, b4: false},
        {b1: true, b2: false, b4: false}
    ]);

    BooleanMapArray|Error bm4bma = parseRecordAsRecordType([bm4, bm4], {}, BooleanMapArray);
    test:assertEquals(bm4bma, [
        {},
        {}
    ]);

    BooleanMapArray|Error bm5bma = parseRecordAsRecordType([bm5, bm5], {}, BooleanMapArray);
    test:assertEquals(bm5bma, [
        {b1: true, b2: false, b4: true},
        {b1: true, b2: false, b4: true}
    ]);

    NillableBooleanMapArray|Error bm1nbma = parseRecordAsRecordType([bm1, bm1], {}, NillableBooleanMapArray);
    test:assertEquals(bm1nbma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    NillableBooleanMapArray|Error bm2nbma = parseRecordAsRecordType([bm2, bm2], {}, NillableBooleanMapArray);
    test:assertEquals(bm2nbma, [
        {b1: true, b2: false, b3:(), n1: (), n3: ()},
        {b1: true, b2: false, b3:(), n1: (), n3: ()}
    ]);

    NillableBooleanMapArray|Error bm3nbma = parseRecordAsRecordType([bm3, bm3], {}, NillableBooleanMapArray);
    test:assertEquals(bm3nbma, [
        {b1: true, b2: false, b3:(), b4: false},
        {b1: true, b2: false, b3:(), b4: false}
    ]);

    NillableBooleanMapArray|Error bm4nbma = parseRecordAsRecordType([bm4, bm4], {}, NillableBooleanMapArray);
    test:assertEquals(bm4nbma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    NillableBooleanMapArray|Error bm5nbma = parseRecordAsRecordType([bm5, bm5], {}, NillableBooleanMapArray);
    test:assertEquals(bm5nbma, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    NillableIntUnionBooleanMapArray|Error bm1niubma = parseRecordAsRecordType([bm1, bm1], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm1niubma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    NillableIntUnionBooleanMapArray|Error bm2niubma = parseRecordAsRecordType([bm2, bm2], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm2niubma, [
        {b1: true, b2: false, b3:(), n1: (), n3: ()},
        {b1: true, b2: false, b3:(), n1: (), n3: ()}
    ]);

    NillableIntUnionBooleanMapArray|Error bm3niubma = parseRecordAsRecordType([bm3, bm3], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm3niubma, [
        {b1: true, b2: false, b3:(), b4: false, i1: 1},
        {b1: true, b2: false, b3:(), b4: false, i1: 1}
    ]);

    NillableIntUnionBooleanMapArray|Error bm4niubma = parseRecordAsRecordType([bm4, bm4], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm4niubma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    NillableIntUnionBooleanMapArray|Error bm5niubma = parseRecordAsRecordType([bm5, bm5], {}, NillableIntUnionBooleanMapArray);
    test:assertEquals(bm5niubma, [
        {b1: true, b2: false, b3: (), b4: true},
        {b1: true, b2: false, b3: (), b4: true}
    ]);

    IntUnionBooleanMapArray|Error bm1iubma = parseRecordAsRecordType([bm1, bm1], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm1iubma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    IntUnionBooleanMapArray|Error bm2iubma = parseRecordAsRecordType([bm2, bm2], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm2iubma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    IntUnionBooleanMapArray|Error bm3iubma = parseRecordAsRecordType([bm3, bm3], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm3iubma, [
        {b1: true, b2: false, b4: false, i1: 1},
        {b1: true, b2: false, b4: false, i1: 1}
    ]);

    IntUnionBooleanMapArray|Error bm4iubma = parseRecordAsRecordType([bm4, bm4], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm4iubma, [
        {},
        {}
    ]);

    IntUnionBooleanMapArray|Error bm5iubma = parseRecordAsRecordType([bm5, bm5], {}, IntUnionBooleanMapArray);
    test:assertEquals(bm5iubma, [
        {b1: true, b2: false, b4: true},
        {b1: true, b2: false, b4: true}
    ]);

    NilMapArray|Error bm1nma = parseRecordAsRecordType([bm1, bm1], {}, NilMapArray);
    test:assertEquals(bm1nma, [
        {},
        {}
    ]);

    NilMapArray|Error bm2nma = parseRecordAsRecordType([bm2, bm2], {}, NilMapArray);
    test:assertEquals(bm2nma, [
        {n1: (), n3: (), b3: ()},
        {n1: (), n3: (), b3: ()}
    ]);

    NilMapArray|Error bm3nma = parseRecordAsRecordType([bm3, bm3], {}, NilMapArray);
    test:assertEquals(bm3nma, [
        {b3: ()},
        {b3: ()}
    ]);

    NilMapArray|Error bm4nma = parseRecordAsRecordType([bm4, bm4], {}, NilMapArray);
    test:assertEquals(bm4nma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);
    NilMapArray|Error bm5nma = parseRecordAsRecordType([bm5, bm5], {}, NilMapArray);
    test:assertEquals(bm5nma, [
        {b3: ()},
        {b3: ()}
    ]);

    JsonMapArray|Error bm1jma = parseRecordAsRecordType([bm1, bm1], {}, JsonMapArray);
    test:assertEquals(bm1jma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    JsonMapArray|Error bm2jma = parseRecordAsRecordType([bm2, bm2], {}, JsonMapArray);
    test:assertEquals(bm2jma, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    JsonMapArray|Error bm3jma = parseRecordAsRecordType([bm3, bm3], {}, JsonMapArray);
    test:assertEquals(bm3jma, [
        {b1: true, b2: false, b4: false, b3: (), i1: 1},
        {b1: true, b2: false, b4: false, b3: (), i1: 1}
    ]);

    JsonMapArray|Error bm4jma = parseRecordAsRecordType([bm4, bm4], {}, JsonMapArray);
    test:assertEquals(bm4jma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    JsonMapArray|Error bm5jma = parseRecordAsRecordType([bm5, bm5], {}, JsonMapArray);
    test:assertEquals(bm5jma, [
        {b1: true, b2: false, b4: true, b3: ()},
        {b1: true, b2: false, b4: true, b3: ()}
    ]);

    AnydataMapArray|Error bm1anydma = parseRecordAsRecordType([bm1, bm1], {}, AnydataMapArray);
    test:assertEquals(bm1anydma, [
        {b1: true, b2: false},
        {b1: true, b2: false}
    ]);

    AnydataMapArray|Error bm2anydma = parseRecordAsRecordType([bm2, bm2], {}, AnydataMapArray);
    test:assertEquals(bm2anydma, [
        {b1: true, b2: false, b3: (), n1: (), n3: ()},
        {b1: true, b2: false, b3: (), n1: (), n3: ()}
    ]);

    AnydataMapArray|Error bm3anydma = parseRecordAsRecordType([bm3, bm3], {}, AnydataMapArray);
    test:assertEquals(bm3anydma, [
        {b1: true, b2: false, b4: false, b3: (), i1: 1},
        {b1: true, b2: false, b4: false, b3: (), i1: 1}
    ]);

    AnydataMapArray|Error bm4anydma = parseRecordAsRecordType([bm4, bm4], {}, AnydataMapArray);
    test:assertEquals(bm4anydma, [
        {n1: (), n3: ()},
        {n1: (), n3: ()}
    ]);

    AnydataMapArray|Error bm5anydma = parseRecordAsRecordType([bm5, bm5], {}, AnydataMapArray);
    test:assertEquals(bm5anydma, [
        {b1: true, b2: false, b4: true, b3: ()},
        {b1: true, b2: false, b4: true, b3: ()}
    ]);

    CustomMapArray|Error bm1cma = parseRecordAsRecordType([bm1, bm1], {}, CustomMapArray);
    test:assertEquals(bm1cma, [
        {},
        {}
    ]);

    CustomMapArray|Error bm2cma = parseRecordAsRecordType([bm2, bm2], {}, CustomMapArray);
    test:assertEquals(bm2cma, [
        {},
        {}
    ]);

    CustomMapArray|Error bm3cma = parseRecordAsRecordType([bm3, bm3], {}, CustomMapArray);
    test:assertEquals(bm3cma, [
        {i1: 1},
        {i1: 1}
    ]);

    CustomMapArray|Error bm4cma = parseRecordAsRecordType([bm4, bm4], {}, CustomMapArray);
    test:assertEquals(bm4cma, [
        {},
        {}
    ]);

    CustomMapArray|Error bm5cma = parseRecordAsRecordType([bm5, bm5], {}, CustomMapArray);
    test:assertEquals(bm5cma, [
        {},
        {}
    ]);

    StringMapArray|Error bm1sma = parseRecordAsRecordType([bm1, bm1], {}, StringMapArray);
    test:assertEquals(bm1sma, [
        {},
        {}
    ]);

    StringMapArray|Error bm2sma = parseRecordAsRecordType([bm2, bm2], {}, StringMapArray);
    test:assertEquals(bm2sma, [
        {},
        {}
    ]);

    StringMapArray|Error bm3sma = parseRecordAsRecordType([bm3, bm3], {}, StringMapArray);
    test:assertEquals(bm3sma, [
        {},
        {}
    ]);

    StringMapArray|Error bm4sma = parseRecordAsRecordType([bm4, bm4], {}, StringMapArray);
    test:assertEquals(bm4sma, [
        {},
        {}
    ]);

    StringMapArray|Error bm5sma = parseRecordAsRecordType([bm5, bm5], {}, StringMapArray);
    test:assertEquals(bm5sma, [
        {},
        {}
    ]);
}
