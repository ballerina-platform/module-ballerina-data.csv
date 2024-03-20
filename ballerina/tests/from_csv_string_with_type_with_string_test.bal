import ballerina/test;

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndRecordAsExpectedType() {
    BooleanRecord1Array|CsvConversionError csvb1br1 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br1, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord1Array|CsvConversionError csvb2br1 = fromCsvStringWithType(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br1, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord1Array|CsvConversionError csvb3br1 = fromCsvStringWithType(csvStringWithBooleanValues3, {});
    test:assertTrue(csvb3br1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb3br1).message(), generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord1Array|CsvConversionError csvb4br1 = fromCsvStringWithType(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br1, [
        {b1: true, b2: "()", b3: (), b4: false},
        {b1: true, b2: "()", b3: (), b4: false}
    ]);

    BooleanRecord1Array|CsvConversionError csvb5br1 = fromCsvStringWithType(csvStringWithBooleanValues5, {});
    test:assertTrue(csvb5br1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb5br1).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanRecord1Array|CsvConversionError csvb6br1 = fromCsvStringWithType(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb6br1).message(), generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord1Array|CsvConversionError csvb7br1 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br1, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord2Array|CsvConversionError csvb1br2 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br2, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord2Array|CsvConversionError csvb2br2 = fromCsvStringWithType(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br2, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord2Array|CsvConversionError csvb3br2 = fromCsvStringWithType(csvStringWithBooleanValues3, {});
    test:assertTrue(csvb3br2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb3br2).message(), generateErrorMessageForMissingRequiredField("b4"));

    BooleanRecord2Array|CsvConversionError csvb4br2 = fromCsvStringWithType(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br2, [
        {b1: true, b2: "()", b3: (), b4: false},
        {b1: true, b2: "()", b3: (), b4: false}
    ]);

    BooleanRecord2Array|CsvConversionError csvb5br2 = fromCsvStringWithType(csvStringWithBooleanValues5, {});
    test:assertTrue(csvb5br2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb5br2).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanRecord2Array|CsvConversionError csvb7br2 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br2, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord3Array|CsvConversionError csvb1br3 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br3, [
        {b1: true, b3: true},
        {b1: true, b3: true},
        {b1: true, b3: true}
    ]);

    BooleanRecord3Array|CsvConversionError csvb2br3 = fromCsvStringWithType(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br3, [
        {b1: true, b3: true},
        {b1: true, b3: true}
    ]);

    BooleanRecord3Array|CsvConversionError csvb3br3 = fromCsvStringWithType(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br3, [
        {b1: true, b3: true},
        {b1: true, b3: ()},
        {b1: true, b3: false}
    ]);

    BooleanRecord3Array|CsvConversionError csvb4br3 = fromCsvStringWithType(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br3, [
        {b1: true, b3: ()},
        {b1: true, b3: ()}
    ]);

    BooleanRecord3Array|CsvConversionError csvb5br3 = fromCsvStringWithType(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br3, [
        {b1: true, b3: true},
        {b1: true, b3: true}
    ]);

    BooleanRecord3Array|CsvConversionError csvb7br3 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br3, [
        {b1, b3: ()}
    ]);

    BooleanRecord4Array|CsvConversionError csvb1br4 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br4, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord4Array|CsvConversionError csvb2br4 = fromCsvStringWithType(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br4, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord4Array|CsvConversionError csvb3br4 = fromCsvStringWithType(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br4, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: ()},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanRecord4Array|CsvConversionError csvb4br4 = fromCsvStringWithType(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br4, [
        {b1: true, b2: (), b3: (), b4: 0},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    BooleanRecord4Array|CsvConversionError csvb5br4 = fromCsvStringWithType(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br4, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    BooleanRecord4Array|CsvConversionError csvb7br4 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br4, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord5Array|CsvConversionError csvb1br5 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br5, [
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|CsvConversionError csvb2br5 = fromCsvStringWithType(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br5, [
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|CsvConversionError csvb3br5 = fromCsvStringWithType(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br5, [
        {b1: true, b2: false, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b2: true, b3: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|CsvConversionError csvb4br5 = fromCsvStringWithType(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br5, [
        {b1: true, b2: (), b3: (), b4: 0, defaultableField: "", nillableField: ()},
        {b1: true, b2: (), b3: (), b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|CsvConversionError csvb5br5 = fromCsvStringWithType(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br5, [
        {b1: true, b2: false, b3: true, b4: 2, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: 3, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord5Array|CsvConversionError csvb7br5 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br5, [
        {b1, b2, b3: (), b4, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError csvb1br6 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br6, [
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError csvb2br6 = fromCsvStringWithType(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br6, [
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError csvb3br6 = fromCsvStringWithType(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br6, [
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError csvb4br6 = fromCsvStringWithType(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br6, [
        {b1: true, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError csvb5br6 = fromCsvStringWithType(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br6, [
        {b1: true, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b3: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord6Array|CsvConversionError csvb7br6 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br6, [
        {b1, b3: (), defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord7Array|CsvConversionError csvb1br7 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertTrue(csvb1br7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb1br7).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord8Array|CsvConversionError csvb1br8 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertTrue(csvb1br8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb1br8).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord9Array|CsvConversionError csvb1br9 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br9, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord9Array|CsvConversionError csvb2br9 = fromCsvStringWithType(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br9, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord9Array|CsvConversionError csvb3br9 = fromCsvStringWithType(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br9, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: ()},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanRecord9Array|CsvConversionError csvb4br9 = fromCsvStringWithType(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br9, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    BooleanRecord9Array|CsvConversionError csvb5br9 = fromCsvStringWithType(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br9, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    BooleanRecord9Array|CsvConversionError csvb6br9 = fromCsvStringWithType(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb6br9).message(), generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord9Array|CsvConversionError csvb7br9 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br9, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord10Array|CsvConversionError csvb1br10 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br10, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord10Array|CsvConversionError csvb2br10 = fromCsvStringWithType(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br10, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord10Array|CsvConversionError csvb3br10 = fromCsvStringWithType(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br10, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanRecord10Array|CsvConversionError csvb4br10 = fromCsvStringWithType(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br10, [
        {b1: true, b4: false},
        {b1: true, b4: false}
    ]);

    BooleanRecord10Array|CsvConversionError csvb5br10 = fromCsvStringWithType(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br10, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    BooleanRecord10Array|CsvConversionError csvb6br10 = fromCsvStringWithType(csvStringWithBooleanValues6, {});
    test:assertEquals(csvb6br10, [
        {}
    ]);

    BooleanRecord10Array|CsvConversionError csvb7br10 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br10, [
        {b1, b2, b4}
    ]);

    BooleanRecord11Array|CsvConversionError csvb1br11 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br11, [
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|CsvConversionError csvb2br11 = fromCsvStringWithType(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br11, [
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|CsvConversionError csvb3br11 = fromCsvStringWithType(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br11, [
        {b1: true, b2: false, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: (), defaultableField: "", nillableField: ()},
        {b1: true, b2: true, b3: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|CsvConversionError csvb4br11 = fromCsvStringWithType(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br11, [
        {b1: true, b2: (), b3: (), b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: (), b3: (), b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|CsvConversionError csvb5br11 = fromCsvStringWithType(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br11, [
        {b1: true, b2: false, b3: true, b4: "2", defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: "3", defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord11Array|CsvConversionError csvb6br11 = fromCsvStringWithType(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br11 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb6br11).message(), generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord11Array|CsvConversionError csvb7br11 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br11, [
        {b1, b2, b3, b4, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord12Array|CsvConversionError csvb1br12 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertTrue(csvb1br12 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb1br12).message(), generateErrorMessageForMissingRequiredField("requiredField"));

    BooleanRecord13Array|CsvConversionError csvb1br13 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br13, [
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|CsvConversionError csvb2br13 = fromCsvStringWithType(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br13, [
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: false, b5: true, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|CsvConversionError csvb3br13 = fromCsvStringWithType(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br13, [
        {b1: true, b2: false, b3: true, defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: "()", defaultableField: "", nillableField: ()},
        {b1: true, b2: true, b3: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|CsvConversionError csvb4br13 = fromCsvStringWithType(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br13, [
        {b1: true, b2: "()", b3: "()", b4: false, defaultableField: "", nillableField: ()},
        {b1: true, b2: "()", b3: "null", b4: false, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|CsvConversionError csvb5br13 = fromCsvStringWithType(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br13, [
        {b1: true, b2: false, b3: true, b4: "2", defaultableField: "", nillableField: ()},
        {b1: true, b2: false, b3: true, b4: "3", defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|CsvConversionError csvb6br13 = fromCsvStringWithType(csvStringWithBooleanValues6, {});
    test:assertEquals(csvb6br13, [
        {b2: "()", b3: "()", defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord13Array|CsvConversionError csvb7br13 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br13, [
        {b1, b2, b3: "()", b4, defaultableField: "", nillableField: ()}
    ]);

    BooleanRecord14Array|CsvConversionError csvb7br14 = fromCsvStringWithType(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb7br14 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb7br14).message(), generateErrorMessageForMissingRequiredField("requiredField"));
}

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndRecordAsExpectedType2() {
    BooleanRecord15Array|CsvConversionError csvb1br15 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertTrue(csvb1br15 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb1br15).message(), generateErrorMessageForInvalidCast("true", "int"));

    BooleanRecord15Array|CsvConversionError csvb6br15 = fromCsvStringWithType(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br15 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb6br15).message(), generateErrorMessageForMissingRequiredField("b1"));

    BooleanRecord15Array|CsvConversionError csvb7br15 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertTrue(csvb7br15 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb7br15).message(), generateErrorMessageForInvalidCast("true", "int"));

    BooleanRecord16Array|CsvConversionError csvb1br16 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br16, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanRecord16Array|CsvConversionError csvb2br16 = fromCsvStringWithType(csvStringWithBooleanValues2, {});
    test:assertEquals(csvb2br16, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanRecord16Array|CsvConversionError csvb3br16 = fromCsvStringWithType(csvStringWithBooleanValues3, {});
    test:assertEquals(csvb3br16, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: ()},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanRecord16Array|CsvConversionError csvb4br16 = fromCsvStringWithType(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br16, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    BooleanRecord16Array|CsvConversionError csvb5br16 = fromCsvStringWithType(csvStringWithBooleanValues5, {});
    test:assertEquals(csvb5br16, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    BooleanRecord16Array|CsvConversionError csvb6br16 = fromCsvStringWithType(csvStringWithBooleanValues6, {});
    test:assertEquals(csvb6br16, [
        {b2: (), b3: ()}
    ]);

    BooleanRecord16Array|CsvConversionError csvb7br16 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br16, [
        {b1, b2, b3: (), b4}
    ]);

    BooleanRecord17Array|CsvConversionError csvb1br17 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br17, [{}, {}, {}]);

    BooleanRecord17Array|CsvConversionError csvb4br17 = fromCsvStringWithType(csvStringWithBooleanValues4, {});
    test:assertEquals(csvb4br17, [{b4: 0}, {b1: 1}]);

    BooleanRecord17Array|CsvConversionError csvb6br17 = fromCsvStringWithType(csvStringWithBooleanValues6, {});
    test:assertEquals(csvb6br17, [{}]);

    BooleanRecord17Array|CsvConversionError csvb7br17 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br17, [{}]);

    BooleanRecord18Array|CsvConversionError csvb1br18 = fromCsvStringWithType(csvStringWithBooleanValues1, {});
    test:assertEquals(csvb1br18, [{b2: false}, {b2: false}, {b2: false}]);

    BooleanRecord18Array|CsvConversionError csvb4br18 = fromCsvStringWithType(csvStringWithBooleanValues4, {});
    test:assertTrue(csvb4br18 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb4br18).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanRecord18Array|CsvConversionError csvb6br18 = fromCsvStringWithType(csvStringWithBooleanValues6, {});
    test:assertTrue(csvb6br18 is CsvConversionError);
    test:assertEquals((<CsvConversionError>csvb6br18).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanRecord18Array|CsvConversionError csvb7br18 = fromCsvStringWithType(csvStringWithBooleanValues7, {});
    test:assertEquals(csvb7br18, [{b2, b3: ()}]);
}

// @test:Config {enable}
// function testFromCsvStringWithTypeForStringAndMapAsExpectedType() {

// }

// @test:Config {enable}
// function testFromCsvStringWithTypeForStringAndArrayAsExpectedType() {

// }

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndTupleAsExpectedType() {
    BooleanTuple1Array|CsvConversionError bm1bt = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(bm1bt, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);
}

@test:Config {enable}
function testFromCsvStringWithTypeFunctionWithTypeCompatibility() {
    string value = string `
        i1,i2,s1,s2,  b1,b2,n1,n2,f1,f2, d1,d2,j1,a1,j2,a2
        ${i1},${i2},${s1},${s2},${b1},${b2},(),(),${f1}, ${f2},${d1},${d2},${b1},${d1},${b2},${d2}
        ${i1},${i2},${s1},${s2},${b1},${b2},(),(),  ${f1},${f2},${d1},${d2},${b1},${d1},${b2},${d2}
    `;
    string value2 = string `
        i1, s1, b1, n1, f1, d1, j1, a1, s2, s3, j2, a2
        ${i1}, ${s1},${b1}, null,${f1}, ${d1},${b1}, ${d1},${s2}, ${s3},${b2}, ${d2}
    `;
    string value3 = string `
        i1, s1, b1, n1, f1, d1, j1, a1, s2, s3
        ${i1}, ${s1},${b1}, null,${f1}, ${d1},${b1}, ${d1},${s2}, ${s3}
    `;

    CustomRecord27Array|CsvConversionError vcr27a = fromCsvStringWithType(value, {}, CustomRecord27Array);
    test:assertEquals(vcr27a, [
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"},
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"}
    ]);

    CustomRecord27Array|CsvConversionError v2cr27a = fromCsvStringWithType(value2, {}, CustomRecord27Array);
    test:assertEquals(v2cr27a, [
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, s2, j2: "false", a2: "-3.21", s3}
    ]);

    CustomRecord27Array|CsvConversionError v3cr27a = fromCsvStringWithType(value3, {});
    test:assertEquals(v3cr27a, [
        {i1, s1, b1, n1, f1, d1, a1: 2.234, j1: b1, defaultableField: "", nillableField: null, s2, s3}
    ]);

    record{|int...;|}[]|CsvConversionError irrma = fromCsvStringWithType(string `
                                                                            a, b, c
                                                                            1, a, 2.3
                                                                            1, -2, true
                                                                            hello, -2, hello`);
    test:assertEquals(irrma , [
        {a:1},
        {a: i1, b: i2},
        {b: i2}
    ]);

    record{|decimal...;|}[]|CsvConversionError drra = fromCsvStringWithType(string `a, b,     c
                                                                            2.234, invalid , 1
                                                                            ${f2}, 0, 2.3d
                                                                            invalid, ${d2}, ${f3}`);
    test:assertTrue(drra is record{|decimal...;|}[]);
    test:assertEquals(drra , [
        {a: d1, c: <decimal> 1.0},
        {a: <decimal>f2, b: d3},
        {b: -3.21d, c: <decimal>f3}
    ]);

    record{|string...;|}[]|CsvConversionError srra = fromCsvStringWithType(string `
                                                                            a, b, c
                                                                            1, a, 2.3
                                                                            1, -2, true
                                                                            hello, -2, hello`);
    test:assertTrue(srra is record{|string...;|}[]);
    test:assertEquals(srra , [
        {a: "1", b: "a", c: "2.3"},
        {a: "1", b: "-2", c: "true"},
        {a: "hello", b: "-2", c: "hello"}
    ]);

    record{|float...;|}[]|CsvConversionError frra = fromCsvStringWithType(string `a, b,     c
                                                                            1.2, invalid , 1
                                                                            ${d2}, ${d3}, true
                                                                            ${d4}, ${f2}, 0.0`);
    test:assertEquals(frra , [
        {a: 1.2, c: 1.0},
        {a: <float>d2, b: <float>d3},
        {a: <float>d4, b: f2, c: 0.0}
    ]);

    record{float a; decimal b; string c;}[]|CsvConversionError mrra = fromCsvStringWithType(string `a, b,c
                                                                            1.23, 1.23, 1.23
                                                                            0,0,0
                                                                            0.0,0.0,0.0
                                                                            -1.2,-1.2,-1.2`);
    test:assertEquals(mrra, [
        {a: <float>1.23, b: <decimal>1.23, c: "1.23"},
        {a: <float>0, b: <decimal>0, c: "0"},
        {a: <float>0, b: <decimal>0, c: "0.0"},
        {a: <float>-1.2, b: <decimal>-1.2, c: "-1.2"}
    ]);

    record{|float a; decimal b; string c; int d;|}[]|CsvConversionError m2rra = fromCsvStringWithType(string `a, b,c,d
                                                                            1, 1, 1,1
                                                                            0,0,0,0
                                                                            -1,-1,-1,-1`);
    test:assertEquals(m2rra, [
        {a: <float>1, b: <decimal>1, c: "1", d: 1},
        {a: <float>0, b: <decimal>0, c: "0", d: 0},
        {a: <float>-1, b: <decimal>-1, c: "-1", d: -1}
    ]);

    record{int d;}[]|CsvConversionError m3rra = fromCsvStringWithType(string `a, b,c,d
                                                                            1.2, abc, true,1.0`);
    test:assertTrue(m3rra is CsvConversionError);
    test:assertEquals((<CsvConversionError>m3rra).message(), generateErrorMessageForInvalidCast("1.0", "int")); 

    record{int b; boolean a;}[]|CsvConversionError m4rra = fromCsvStringWithType(string `a, b
                                                                            1, 1
                                                                            0,0`);
    test:assertEquals(m4rra, [
        {a: true, b: 1},
        {a: false, b:0}
    ]);                                                               
}

boolean enable = true;

@test:Config {enable: !enable}
function test() {
    BooleanRecord13Array|CsvConversionError csvb6br13 = fromCsvStringWithType(csvStringWithBooleanValues6, {});
    test:assertEquals(csvb6br13, [
        {b2: "()", b3: "()", defaultableField: "", nillableField: ()},
        {b2: "()", b3: "()", defaultableField: "", nillableField: ()}
    ]);
}
