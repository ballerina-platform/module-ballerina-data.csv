import ballerina/test;

// boolean enable = true;

// @test:Config {enable: !enable}
// function debugTest() {
//     BooleanRecord1Array|CsvConversionError csvb4br1 = parseStringToRecord(csvStringWithBooleanValues4, {});
//     test:assertEquals(csvb4br1, [
//         {b1: true, b2: "()", b3: (), b4: false},
//         {b1: true, b2: "()", b3: (), b4: false}
//     ]);
// }

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndRecordAsExpectedType() {
    BooleanRecord1Array|CsvConversionError csvb1br1 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br1, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord1Array|CsvConversionError csvb2br1 = parseStringToRecord(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br1, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord1Array|CsvConversionError csvb3br1 = parseStringToRecord(csvStringWithBooleanValues3, {});
    test:assertTrue(csvb3br1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb3br1).message(), generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord1Array|CsvConversionError csvb4br1 = parseStringToRecord(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br1, [
        {b1: true, b2: "()", b3: (), b4: false},
        {b1: true, b2: "()", b3: (), b4: false}
    ]);

    BooleanRecord1Array|CsvConversionError csvb5br1 = parseStringToRecord(csvStringWithBooleanValues5, {});
    test:assertTrue(csvb5br1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb5br1).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanRecord1Array|CsvConversionError csvb6br1 = parseStringToRecord(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb6br1).message(), generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord1Array|CsvConversionError csvb7br1 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br1, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord2Array|CsvConversionError csvb1br2 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br2, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord2Array|CsvConversionError csvb2br2 = parseStringToRecord(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br2, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord2Array|CsvConversionError csvb3br2 = parseStringToRecord(csvStringWithBooleanValues3, {});
    test:assertTrue(csvb3br2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb3br2).message(), generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord2Array|CsvConversionError csvb4br2 = parseStringToRecord(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br2, [
        {b1: true, b2: "()", b3: (), b4: false},
        {b1: true, b2: "()", b3: (), b4: false}
    ]);

    BooleanRecord2Array|CsvConversionError csvb5br2 = parseStringToRecord(csvStringWithBooleanValues5, {});
    test:assertTrue(csvb5br2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb5br2).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanRecord2Array|CsvConversionError csvb7br2 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br2, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord3Array|CsvConversionError csvb1br3 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br3, [
        {b1: true, b3: true},
        {b1: true, b3: true},
        {b1: true, b3: true}
    ]);

    BooleanRecord3Array|CsvConversionError csvb2br3 = parseStringToRecord(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br3, [
        {b1: true, b3: true},
        {b1: true, b3: true}
    ]);

    BooleanRecord3Array|CsvConversionError csvb3br3 = parseStringToRecord(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br3, [
        {b1: true, b3: true},
        {b1: true, b3: ()},
        {b1: true, b3: false}
    ]);

    BooleanRecord3Array|CsvConversionError csvb4br3 = parseStringToRecord(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br3, [
        {b1: true, b3: ()},
        {b1: true, b3: ()}
    ]);

    BooleanRecord3Array|CsvConversionError csvb5br3 = parseStringToRecord(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br3, [
        {b1: true, b3: true},
        {b1: true, b3: true}
    ]);

    BooleanRecord3Array|CsvConversionError csvb7br3 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br3, [
        {b1, b3: ()}
    ]);

    BooleanRecord4Array|CsvConversionError csvb1br4 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br4, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord4Array|CsvConversionError csvb2br4 = parseStringToRecord(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br4, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord4Array|CsvConversionError csvb3br4 = parseStringToRecord(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br4, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: ()},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanRecord4Array|CsvConversionError csvb4br4 = parseStringToRecord(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br4, [
        {b1: true, b2: (), b3: (), b4: 0},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    BooleanRecord4Array|CsvConversionError csvb5br4 = parseStringToRecord(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br4, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    BooleanRecord4Array|CsvConversionError csvb7br4 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br4, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord5Array|CsvConversionError csvb1br5 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br5, [
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|CsvConversionError csvb2br5 = parseStringToRecord(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br5, [
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|CsvConversionError csvb3br5 = parseStringToRecord(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br5, [
        {b1: true, b2: false, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b2: true, b3: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|CsvConversionError csvb4br5 = parseStringToRecord(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br5, [
        {b1: true, b2: (), b3: (), b4: 0, defaultableField: "", nillableField: ()},
        {b1: true, b2: (), b3: (), b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|CsvConversionError csvb5br5 = parseStringToRecord(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br5, [
        {b1: true, b2: false, b3: true, b4: 2, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: 3, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|CsvConversionError csvb7br5 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br5, [
        {b1, b2, b3: (), b4, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError csvb1br6 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br6, [
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError csvb2br6 = parseStringToRecord(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br6, [
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError csvb3br6 = parseStringToRecord(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br6, [
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError csvb4br6 = parseStringToRecord(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError csvb5br6 = parseStringToRecord(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br6, [
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError csvb7br6 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br6, [
        {b1, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord7Array|CsvConversionError csvb1br7 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertTrue(csvb1br7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb1br7).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|CsvConversionError csvb1br8 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertTrue(csvb1br8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb1br8).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord9Array|CsvConversionError csvb1br9 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br9, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord9Array|CsvConversionError csvb2br9 = parseStringToRecord(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br9, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord9Array|CsvConversionError csvb3br9 = parseStringToRecord(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br9, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: ()},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanRecord9Array|CsvConversionError csvb4br9 = parseStringToRecord(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br9, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    BooleanRecord9Array|CsvConversionError csvb5br9 = parseStringToRecord(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br9, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    BooleanRecord9Array|CsvConversionError csvb6br9 = parseStringToRecord(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb6br9).message(), generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord9Array|CsvConversionError csvb7br9 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br9, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord10Array|CsvConversionError csvb1br10 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br10, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord10Array|CsvConversionError csvb2br10 = parseStringToRecord(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br10, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord10Array|CsvConversionError csvb3br10 = parseStringToRecord(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br10, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanRecord10Array|CsvConversionError csvb4br10 = parseStringToRecord(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br10, [
        {b1: true, b4: false},
        {b1: true, b4: false}
    ]);

    BooleanRecord10Array|CsvConversionError csvb5br10 = parseStringToRecord(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br10, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    BooleanRecord10Array|CsvConversionError csvb6br10 = parseStringToRecord(csvStringWithBooleanValues6, {});
    test:assertEquals(csvb6br10, [
        {}
    ]);

    BooleanRecord10Array|CsvConversionError csvb7br10 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br10, [
        {b1, b2, b4}
    ]);

    BooleanRecord11Array|CsvConversionError csvb1br11 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br11, [
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|CsvConversionError csvb2br11 = parseStringToRecord(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br11, [
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|CsvConversionError csvb3br11 = parseStringToRecord(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br11, [
        {b1: true, b2: false, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b2: true, b3: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|CsvConversionError csvb4br11 = parseStringToRecord(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br11, [
        {b1: true, b2: (), b3: (), b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: (), b3: (), b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|CsvConversionError csvb5br11 = parseStringToRecord(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br11, [
        {b1: true, b2: false, b3: true, b4: "2", defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: "3", defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|CsvConversionError csvb6br11 = parseStringToRecord(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br11 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb6br11).message(), generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord11Array|CsvConversionError csvb7br11 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br11, [
        {b1, b2, b3, b4, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord12Array|CsvConversionError csvb1br12 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertTrue(csvb1br12 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb1br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord13Array|CsvConversionError csvb1br13 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br13, [
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|CsvConversionError csvb2br13 = parseStringToRecord(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br13, [
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|CsvConversionError csvb3br13 = parseStringToRecord(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br13, [
        {b1: true, b2: false, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: "()", defaultableField: "", nillableField: ()},
        {b1: true, b2: true, b3: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|CsvConversionError csvb4br13 = parseStringToRecord(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br13, [
        {b1: true, b2: "()", b3: "()", b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: "()", b3: "null", b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|CsvConversionError csvb5br13 = parseStringToRecord(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br13, [
        {b1: true, b2: false, b3: true, b4: "2", defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: "3", defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|CsvConversionError csvb6br13 = parseStringToRecord(csvStringWithBooleanValues6, {});
    test:assertEquals(csvb6br13, [
        {b2: "()", b3: "()", defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|CsvConversionError csvb7br13 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br13, [
        {b1, b2, b3: "()", b4, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord14Array|CsvConversionError csvb7br14 = parseStringToRecord(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb7br14 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb7br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));
}

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndRecordAsExpectedType2() {
    BooleanRecord15Array|CsvConversionError csvb1br15 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertTrue(csvb1br15 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb1br15).message(), generateErrorMessageForInvalidCast("true", "int"));

    BooleanRecord15Array|CsvConversionError csvb6br15 = parseStringToRecord(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br15 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb6br15).message(), generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord15Array|CsvConversionError csvb7br15 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertTrue(csvb7br15 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb7br15).message(), generateErrorMessageForInvalidCast("true", "int"));

    BooleanRecord16Array|CsvConversionError csvb1br16 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br16, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord16Array|CsvConversionError csvb2br16 = parseStringToRecord(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br16, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord16Array|CsvConversionError csvb3br16 = parseStringToRecord(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br16, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: ()},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanRecord16Array|CsvConversionError csvb4br16 = parseStringToRecord(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br16, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    BooleanRecord16Array|CsvConversionError csvb5br16 = parseStringToRecord(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br16, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    BooleanRecord16Array|CsvConversionError csvb6br16 = parseStringToRecord(csvStringWithBooleanValues6, {});
    test:assertEquals(csvb6br16, [
        {b2: (), b3: ()}
    ]);

    BooleanRecord16Array|CsvConversionError csvb7br16 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br16, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord17Array|CsvConversionError csvb1br17 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br17, [{}, {}, {}]);

    BooleanRecord17Array|CsvConversionError csvb4br17 = parseStringToRecord(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br17, [{b4: 0}, {b1: 1}]);

    BooleanRecord17Array|CsvConversionError csvb6br17 = parseStringToRecord(csvStringWithBooleanValues6, {});
    test:assertEquals(csvb6br17, [{}]);

    BooleanRecord17Array|CsvConversionError csvb7br17 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br17, [{}]);

    BooleanRecord18Array|CsvConversionError csvb1br18 = parseStringToRecord(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br18, [{b2: false}, {b2: false}, {b2: false}]);

    BooleanRecord18Array|CsvConversionError csvb4br18 = parseStringToRecord(csvStringWithBooleanValues4, {});
    test:assertTrue(csvb4br18 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb4br18).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanRecord18Array|CsvConversionError csvb6br18 = parseStringToRecord(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br18 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb6br18).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanRecord18Array|CsvConversionError csvb7br18 = parseStringToRecord(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br18, [{b2, b3: ()}]);
}
