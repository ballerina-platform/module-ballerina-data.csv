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

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndArrayAsExpectedType() {
    BooleanArrayArray|CsvConversionError cv1baa = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cv1baa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanArrayArray|CsvConversionError cv2baa = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cv2baa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    BooleanArrayArray|CsvConversionError cv3baa = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertTrue(cv3baa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv3baa).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|CsvConversionError cv4baa = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertTrue(cv4baa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv4baa).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|CsvConversionError cv5baa = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertTrue(cv5baa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv5baa).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanArrayArray|CsvConversionError cv6baa = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertTrue(cv6baa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv6baa).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|CsvConversionError cv7baa = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertTrue(cv7baa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv7baa).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    NillableBooleanArrayArray|CsvConversionError cv1nbaa = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cv1nbaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableBooleanArrayArray|CsvConversionError cv2nbaa = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cv2nbaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanArrayArray|CsvConversionError cv3nbaa = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cv3nbaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableBooleanArrayArray|CsvConversionError cv4nbaa = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cv4nbaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableBooleanArrayArray|CsvConversionError cv5nbaa = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertTrue(cv5nbaa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv5nbaa).message(), generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanArrayArray|CsvConversionError cv6nbaa = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cv6nbaa, [
        [(), ()]
    ]);

    NillableBooleanArrayArray|CsvConversionError cv7nbaa = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cv7nbaa, [
        [b1, b2, (), b4]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv1niubaa = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cv1niubaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv2niubaa = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cv2niubaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv3niubaa = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cv3niubaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv4niubaa = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cv4niubaa, [
        [true, (), (), 0],
        [1, (), (), false]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv5niubaa = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(cv5niubaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv6niubaa = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cv6niubaa, [
        [(), ()]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv7niubaa = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cv7niubaa, [
        [b1, b2, (), b4]
    ]);

    StringArray1Array|CsvConversionError cv1saa = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cv1saa, [
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"]
    ]);

    StringArray1Array|CsvConversionError cv2saa = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cv2saa, [
        ["true", "false", "true", "false", "true"],
        ["true", "false", "true", "false", "true"]
    ]);

    StringArray1Array|CsvConversionError cv3saa = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cv3saa, [
        ["true", "false", "true"],
        ["TRUE", "FALSE", "()"],
        ["true", "true", "FALSE"]
    ]);

    StringArray1Array|CsvConversionError cv4saa = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cv4saa, [
        ["true", "()", "()", "0"],
        ["1", "()", "null", "false"]
    ]);

    StringArray1Array|CsvConversionError cv5saa = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(cv5saa, [
        ["true", "false", "true", "2"],
        ["true", "false", "true", "3"]
    ]);

    StringArray1Array|CsvConversionError cv6saa = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cv6saa, [
        ["()", "()"]
    ]);

    StringArray1Array|CsvConversionError cv7saa = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cv7saa, [
        ["true", "false", "()", "false"]
    ]);

    StringArray2Array|CsvConversionError cv1s2aa = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cv1s2aa, [
        ["true", "false"],
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|CsvConversionError cv2s2aa = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cv2s2aa, [
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|CsvConversionError cv3s2aa = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cv3s2aa, [
        ["true", "false"],
        ["TRUE", "FALSE"],
        ["true", "true"]
    ]);

    StringArray2Array|CsvConversionError cv4s2aa = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cv4s2aa, [
        ["true", "()"],
        ["1", "()"]
    ]);

    StringArray2Array|CsvConversionError cv5s2aa = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(cv5s2aa, [
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|CsvConversionError cv6s2aa = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cv6s2aa, [
        ["()", "()"]
    ]);

    StringArray2Array|CsvConversionError cv7s2aa = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cv7s2aa, [
        ["true", "false"]
    ]);

    JsonArray1Array|CsvConversionError cv1jaa = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cv1jaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    JsonArray1Array|CsvConversionError cv2jaa = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cv2jaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    JsonArray1Array|CsvConversionError cv3jaa = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cv3jaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    JsonArray1Array|CsvConversionError cv4jaa = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cv4jaa, [
        [true, (), (), 0],
        [1, (), (), false]
    ]);

    JsonArray1Array|CsvConversionError cv5jaa = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(cv5jaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    JsonArray1Array|CsvConversionError cv6jaa = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cv6jaa, [
        [(), ()]
    ]);

    JsonArray1Array|CsvConversionError cv7jaa = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cv7jaa, [
        [b1, b2, (), b4]
    ]);

    AnydataArray1Array|CsvConversionError cv1anydaa = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cv1anydaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    AnydataArray1Array|CsvConversionError cv2anydaa = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cv2anydaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    AnydataArray1Array|CsvConversionError cv3anydaa = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cv3anydaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    AnydataArray1Array|CsvConversionError cv4anydaa = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cv4anydaa, [
        [true, (), (), 0],
        [1, (), (), false]
    ]);

    AnydataArray1Array|CsvConversionError cv5anydaa = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(cv5anydaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    AnydataArray1Array|CsvConversionError cv6anydaa = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cv6anydaa, [
        [(), ()]
    ]);

    AnydataArray1Array|CsvConversionError cv7anydaa = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cv7anydaa, [
        [b1, b2, (), b4]
    ]);

    DecimalArray1Array|CsvConversionError cv1daa = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertTrue(cv1daa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv1daa).message(), generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalArray1Array|CsvConversionError cv3daa = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertTrue(cv3daa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv3daa).message(), generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalArray1Array|CsvConversionError cv6daa = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertTrue(cv6daa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv6daa).message(), generateErrorMessageForInvalidCast("()", "decimal"));

    DecimalArray1Array|CsvConversionError cv7daa = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertTrue(cv7daa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv7daa).message(), generateErrorMessageForInvalidCast("true", "decimal"));
}

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndTupleAsExpectedType() {
    BooleanTuple1Array|CsvConversionError cbv1bt1 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt1, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple1Array|CsvConversionError cbv2bt1 = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt1, [
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple1Array|CsvConversionError cbv3bt1 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertTrue(cbv3bt1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv3bt1).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple1Array|CsvConversionError cbv5bt1 = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv5bt1).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanTuple1Array|CsvConversionError cbv7bt1 = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertTrue(cbv7bt1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv7bt1).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple2Array|CsvConversionError cbv1bt2 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt2, [
        [true, false],
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|CsvConversionError cbv2bt2 = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt2, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|CsvConversionError cbv3bt2 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt2, [
        [true, false],
        [true, false],
        [true, true]
    ]);

    BooleanTuple2Array|CsvConversionError cbv4bt2 = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertTrue(cbv4bt2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv4bt2).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple3Array|CsvConversionError cbv1bt3 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt3, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple3Array|CsvConversionError cbv2bt3 = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt3, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    BooleanTuple3Array|CsvConversionError cbv3bt3 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertTrue(cbv3bt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv3bt3).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple3Array|CsvConversionError cbv5bt3 = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv5bt3).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanTuple3Array|CsvConversionError cbv7bt3 = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertTrue(cbv7bt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv7bt3).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|CsvConversionError cbv1bt4 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt4, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple4Array|CsvConversionError cbv2bt4 = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt4, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    BooleanTuple4Array|CsvConversionError cbv3bt4 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertTrue(cbv3bt4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv3bt4).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|CsvConversionError cbv4bt4 = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertTrue(cbv4bt4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv4bt4).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|CsvConversionError cbv5bt4 = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv5bt4).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanTuple4Array|CsvConversionError cbv6bt4 = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertTrue(cbv6bt4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv6bt4).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|CsvConversionError cbv7bt4 = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertTrue(cbv7bt4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv7bt4).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    NillableBooleanTuple5Array|CsvConversionError cbv1bt5 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt5, [
        [true, false, true, false, null],
        [true, false, true, false, null],
        [true, false, true, false, null]
    ]);

    NillableBooleanTuple5Array|CsvConversionError cbv2bt5 = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt5, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanTuple5Array|CsvConversionError cbv3bt5 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt5, [
        [true, false, true, null, null],
        [true, false, (), null, null],
        [true, true, false, null, null]
    ]);

    NillableBooleanTuple5Array|CsvConversionError cbv4bt5 = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt5, [
        [true, (), (), false, null],
        [true, (), (), false, null]
    ]);

    NillableBooleanTuple5Array|CsvConversionError cbv5bt5 = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt5 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv5bt5).message(), generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanTuple5Array|CsvConversionError cbv6bt5 = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt5, [
        [(), (), null, null, null]
    ]);

    NillableBooleanTuple5Array|CsvConversionError cbv7bt5 = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt5, [
        [b1, b2, (), b4, null]
    ]);

    NillableBooleanTuple6Array|CsvConversionError cbv1bt6 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt6, [
        [true, false],
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|CsvConversionError cbv2bt6 = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt6, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|CsvConversionError cbv3bt6 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt6, [
        [true, false],
        [true, false],
        [true, true]
    ]);

    NillableBooleanTuple6Array|CsvConversionError cbv4bt6 = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt6, [
        [true, ()],
        [true, ()]
    ]);

    NillableBooleanTuple6Array|CsvConversionError cbv6bt6 = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt6, [
        [(), null]
    ]);

    NillableBooleanTuple6Array|CsvConversionError cbv7bt6 = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt6, [
        [b1, b2]
    ]);

    NillableBooleanTuple7Array|CsvConversionError cbv1bt7 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt7, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableBooleanTuple7Array|CsvConversionError cbv2bt7 = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt7, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanTuple7Array|CsvConversionError cbv3bt7 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt7, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableBooleanTuple7Array|CsvConversionError cbv4bt7 = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt7, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableBooleanTuple7Array|CsvConversionError cbv5bt7 = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv5bt7).message(), generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanTuple7Array|CsvConversionError cbv6bt7 = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt7, [
        [(), ()]
    ]);

    NillableBooleanTuple7Array|CsvConversionError cbv7bt7 = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt7, [
        [b1, b2, (), false]
    ]);

    NillableBooleanTuple8Array|CsvConversionError cbv1bt8 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt8, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableBooleanTuple8Array|CsvConversionError cbv2bt8 = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt8, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanTuple8Array|CsvConversionError cbv3bt8 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt8, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableBooleanTuple8Array|CsvConversionError cbv4bt8 = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt8, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableBooleanTuple8Array|CsvConversionError cbv5bt8 = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv5bt8).message(), generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanTuple8Array|CsvConversionError cbv6bt8 = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt8, [
        [(), ()]
    ]);

    NillableBooleanTuple8Array|CsvConversionError cbv7bt8 = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt8, [
        [b1, b2, (), false]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv1bt9 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt9, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv2bt9 = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt9, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv3bt9 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt9, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv4bt9 = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt9, [
        [true, (), (), 0],
        [1, (), (), false]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv5bt9 = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(cbv5bt9, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv6bt9 = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt9, [
        [(), ()]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv7bt9 = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt9, [
        [b1, b2, (), false]
    ]);

    NilTuple3Array|CsvConversionError cbv1nt3 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertTrue(cbv1nt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv1nt3).message(), generateErrorMessageForInvalidCast("true", "()"));

    NilTuple3Array|CsvConversionError cbv3nt3 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertTrue(cbv3nt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv3nt3).message(), generateErrorMessageForInvalidCast("true", "()"));

    NilTuple3Array|CsvConversionError cbv6nt3 = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cbv6nt3, [
        [(), ()]
    ]);

    AnydataTuple3Array|CsvConversionError cbv1anyd3 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cbv1anyd3, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    AnydataTuple3Array|CsvConversionError cbv2anyd3 = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cbv2anyd3, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    AnydataTuple3Array|CsvConversionError cbv3anyd3 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cbv3anyd3, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    AnydataTuple3Array|CsvConversionError cbv4anyd3 = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cbv4anyd3, [
        [true, (), (), 0],
        [1, (), (), false]
    ]);

    AnydataTuple3Array|CsvConversionError cbv5anyd3 = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(cbv5anyd3, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    AnydataTuple3Array|CsvConversionError cbv6anyd3 = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cbv6anyd3, [
        [(), ()]
    ]);

    AnydataTuple3Array|CsvConversionError cbv7anyd3 = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cbv7anyd3, [
        [b1, b2, (), false]
    ]);
}

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndTupleAsExpectedType2() {
    JsonTuple3Array|CsvConversionError cbv1j3 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cbv1j3, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    JsonTuple3Array|CsvConversionError cbv2j3 = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cbv2j3, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    JsonTuple3Array|CsvConversionError cbv3j3 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cbv3j3, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    JsonTuple3Array|CsvConversionError cbv4j3 = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cbv4j3, [
        [true, (), (), 0],
        [1, (), (), false]
    ]);

    JsonTuple3Array|CsvConversionError cbv5j3 = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(cbv5j3, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    JsonTuple3Array|CsvConversionError cbv6j3 = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cbv6j3, [
        [(), ()]
    ]);

    JsonTuple3Array|CsvConversionError cbv7j3 = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cbv7j3, [
        [b1, b2, (), false]
    ]);

    StringTuple3Array|CsvConversionError cbv1s3 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(cbv1s3, [
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"]
    ]);

    StringTuple3Array|CsvConversionError cbv2s3 = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(cbv2s3, [
        ["true", "false", "true", "false", "true"],
        ["true", "false", "true", "false", "true"]
    ]);

    StringTuple3Array|CsvConversionError cbv3s3 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(cbv3s3, [
        ["true", "false", "true"],
        ["TRUE", "FALSE", "()"],
        ["true", "true", "FALSE"]
    ]);

    StringTuple3Array|CsvConversionError cbv4s3 = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(cbv4s3, [
        ["true", "()", "()", "0"],
        ["1", "()", "null", "false"]
    ]);

    StringTuple3Array|CsvConversionError cbv5s3 = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(cbv5s3, [
        ["true", "false", "true", "2"],
        ["true", "false", "true", "3"]
    ]);

    StringTuple3Array|CsvConversionError cbv6s3 = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(cbv6s3, [
        ["()", "()"]
    ]);

    StringTuple3Array|CsvConversionError cbv7s3 = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(cbv7s3, [
        ["true", "false", "()", "false"]
    ]);

    DecimalTuple3Array|CsvConversionError cbv1dt3 = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertTrue(cbv1dt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv1dt3).message(), generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalTuple3Array|CsvConversionError cbv3dt3 = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertTrue(cbv3dt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv3dt3).message(), generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalTuple3Array|CsvConversionError cbv6dt3 = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertTrue(cbv6dt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv6dt3).message(), generateErrorMessageForInvalidCast("()", "decimal"));
}

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndMapAsExpectedType() {
    BooleanMapArray|CsvConversionError bv1bma = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(bv1bma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    BooleanMapArray|CsvConversionError bv2bma = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(bv2bma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    BooleanMapArray|CsvConversionError bv3bma = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(bv3bma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false},
        {b1: true, b2: true, b3: false}
    ]);

    BooleanMapArray|CsvConversionError bv4bma = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(bv4bma, [
        {b1: true, b4: false},
        {b1: true, b4: false}
    ]);

    BooleanMapArray|CsvConversionError bv5bma = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(bv5bma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    BooleanMapArray|CsvConversionError bv6bma = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(bv6bma, [
        {}
    ]);

    BooleanMapArray|CsvConversionError bv7bma = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(bv7bma, [
        {b1, b2, b4}
    ]);

    NillableBooleanMapArray|CsvConversionError bv1bnbma = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(bv1bnbma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    NillableBooleanMapArray|CsvConversionError bv2bnbma = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(bv2bnbma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    NillableBooleanMapArray|CsvConversionError bv3bnbma = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(bv3bnbma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    NillableBooleanMapArray|CsvConversionError bv4bnbma = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(bv4bnbma, [
        {b1: true, b2: (), b3: (), b4: false},
        {b1: true, b2: (), b3: (), b4: false}
    ]);

    NillableBooleanMapArray|CsvConversionError bv5bnbma = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(bv5bnbma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: true}
    ]);

    NillableBooleanMapArray|CsvConversionError bv6bnbma = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(bv6bnbma, [
        {b2: (), b3: ()}
    ]);

    NillableBooleanMapArray|CsvConversionError bv7bnbma = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(bv7bnbma, [
        {b1, b2, b3, b4}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv1bniubma = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(bv1bniubma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv2bniubma = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(bv2bniubma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv3bniubma = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(bv3bniubma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv4bniubma = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(bv4bniubma, [
        {b1: true, b2: (), b3: (), b4: 0},
        {b1: 1, b2: (), b3: (), b4: false}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv5bniubma = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(bv5bniubma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv6bniubma = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(bv6bniubma, [
        {b2: (), b3: ()}
    ]);

    NillableIntUnionBooleanMapArray|CsvConversionError bv7bniubma = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(bv7bniubma, [
        {b1, b2, b3, b4}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv1biubma = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(bv1biubma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv2biubma = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(bv2biubma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv3biubma = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(bv3biubma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false},
        {b1: true, b2: true, b3: false}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv4biubma = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(bv4biubma, [
        {b1: true, b4: 0},
        {b1: 1, b4: false}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv5biubma = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(bv5biubma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv6biubma = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(bv6biubma, [
        {}
    ]);

    IntUnionBooleanMapArray|CsvConversionError bv7biubma = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(bv7biubma, [
        {b1, b2, b4}
    ]);

    NilMapArray|CsvConversionError bv1bnma = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(bv1bnma, [
        {},
        {},
        {}
    ]);

    NilMapArray|CsvConversionError bv2bnma = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(bv2bnma, [
        {},
        {}
    ]);

    NilMapArray|CsvConversionError bv3bnma = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(bv3bnma, [
        {},
        {b3: ()},
        {}
    ]);

    NilMapArray|CsvConversionError bv4bnma = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(bv4bnma, [
        {b2: (), b3: ()},
        {b2: (), b3: ()}
    ]);

    NilMapArray|CsvConversionError bv5bnma = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(bv5bnma, [
        {},
        {}
    ]);

    NilMapArray|CsvConversionError bv6bnma = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(bv6bnma, [
        {b2: (), b3: ()}
    ]);

    NilMapArray|CsvConversionError bv7bnma = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(bv7bnma, [
        {b3}
    ]);

    JsonMapArray|CsvConversionError bv1bjma = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(bv1bjma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    JsonMapArray|CsvConversionError bv2bjma = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(bv2bjma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    JsonMapArray|CsvConversionError bv3bjma = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(bv3bjma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    JsonMapArray|CsvConversionError bv4bjma = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(bv4bjma, [
        {b1: true, b2: (), b3: (), b4: 0},
        {b1: 1, b2: (), b3: (), b4: false}
    ]);

    JsonMapArray|CsvConversionError bv5bjma = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(bv5bjma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    JsonMapArray|CsvConversionError bv6bjma = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(bv6bjma, [
        {b2: (), b3: ()}
    ]);

    JsonMapArray|CsvConversionError bv7bjma = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(bv7bjma, [
        {b1, b2, b3, b4}
    ]);

    AnydataMapArray|CsvConversionError bv1banydma = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(bv1banydma, [
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false},
        {b1: true, b2: false, b3: true, b4: false}
    ]);

    AnydataMapArray|CsvConversionError bv2banydma = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(bv2banydma, [
        {b1: true, b2: false, b3: true, b4: false, b5: true},
        {b1: true, b2: false, b3: true, b4: false, b5: true}
    ]);

    AnydataMapArray|CsvConversionError bv3banydma = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(bv3banydma, [
        {b1: true, b2: false, b3: true},
        {b1: true, b2: false, b3: null},
        {b1: true, b2: true, b3: false}
    ]);

    AnydataMapArray|CsvConversionError bv4banydma = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(bv4banydma, [
        {b1: true, b2: (), b3: (), b4: 0},
        {b1: 1, b2: (), b3: (), b4: false}
    ]);

    AnydataMapArray|CsvConversionError bv5banydma = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(bv5banydma, [
        {b1: true, b2: false, b3: true, b4: 2},
        {b1: true, b2: false, b3: true, b4: 3}
    ]);

    AnydataMapArray|CsvConversionError bv6banydma = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(bv6banydma, [
        {b2: (), b3: ()}
    ]);

    AnydataMapArray|CsvConversionError bv7banydma = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(bv7banydma, [
        {b1, b2, b3, b4}
    ]);

    CustomMapArray|CsvConversionError bv1bcma = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(bv1bcma, [
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"}
    ]);

    CustomMapArray|CsvConversionError bv2bcma = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(bv2bcma, [
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"},
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"}
    ]);

    CustomMapArray|CsvConversionError bv3bcma = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(bv3bcma, [
        {b1: "true", b2: "false", b3: "true"},
        {b1: "TRUE", b2: "FALSE", b3: "()"},
        {b1: "true", b2: "true", b3: "FALSE"}
    ]);

    CustomMapArray|CsvConversionError bv4bcma = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(bv4bcma, [
        {b1: "true", b2: "()", b3: "()", b4: 0},
        {b1: 1, b2: "()", b3: "null", b4: "false"}
    ]);

    CustomMapArray|CsvConversionError bv5bcma = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(bv5bcma, [
        {b1: "true", b2: "false", b3: "true", b4: 2},
        {b1: "true", b2: "false", b3: "true", b4: 3}
    ]);

    CustomMapArray|CsvConversionError bv6bcma = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(bv6bcma, [
        {b2: "()", b3: "()"}
    ]);

    CustomMapArray|CsvConversionError bv7bcma = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(bv7bcma, [
        {b1: "true", b2: "false", b3: "()", b4: "false"}
    ]);

    StringMapArray|CsvConversionError bv1bsma = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(bv1bsma, [
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"},
        {b1: "true", b2: "false", b3: "true", b4: "false"}
    ]);

    StringMapArray|CsvConversionError bv2bsma = fromCsvStringWithType(csvStringWithBooleanValues2);
    test:assertEquals(bv2bsma, [
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"},
        {b1: "true", b2: "false", b3: "true", b4: "false", b5: "true"}
    ]);

    StringMapArray|CsvConversionError bv3bsma = fromCsvStringWithType(csvStringWithBooleanValues3);
    test:assertEquals(bv3bsma, [
        {b1: "true", b2: "false", b3: "true"},
        {b1: "TRUE", b2: "FALSE", b3: "()"},
        {b1: "true", b2: "true", b3: "FALSE"}
    ]);

    StringMapArray|CsvConversionError bv4bsma = fromCsvStringWithType(csvStringWithBooleanValues4);
    test:assertEquals(bv4bsma, [
        {b1: "true", b2: "()", b3: "()", b4: "0"},
        {b1: "1", b2: "()", b3: "null", b4: "false"}
    ]);

    StringMapArray|CsvConversionError bv5bsma = fromCsvStringWithType(csvStringWithBooleanValues5);
    test:assertEquals(bv5bsma, [
        {b1: "true", b2: "false", b3: "true", b4: "2"},
        {b1: "true", b2: "false", b3: "true", b4: "3"}
    ]);

    StringMapArray|CsvConversionError bv6bsma = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(bv6bsma, [
        {b2: "()", b3: "()"}
    ]);

    StringMapArray|CsvConversionError bv7bsma = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(bv7bsma, [
        {b1: "true", b2: "false", b3: "()", b4: "false"}
    ]);

    DecimalMapArray|CsvConversionError bv1dsma = fromCsvStringWithType(csvStringWithBooleanValues1);
    test:assertEquals(bv1dsma, [
        {},
        {},
        {}
    ]);
    DecimalMapArray|CsvConversionError bv6dsma = fromCsvStringWithType(csvStringWithBooleanValues6);
    test:assertEquals(bv6dsma, [
        {}
    ]);

    DecimalMapArray|CsvConversionError bv7dsma = fromCsvStringWithType(csvStringWithBooleanValues7);
    test:assertEquals(bv7dsma, [
        {}
    ]);
}

@test:Config {enable}
function testFromCsvStringWithTypeCompatibility() {
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

    AnydataArray1Array|CsvConversionError v3anyd1a = fromCsvStringWithType(value);
    test:assertEquals(v3anyd1a, [
        [i1, i2, s1, s2, b1, b2, n1, n2, 2.234, -3.21, 2.234, -3.21, b1, 2.234, b2, -3.21],
        [i1, i2, s1, s2, b1, b2, n1, n2, 2.234, -3.21, 2.234, -3.21, b1, 2.234, b2, -3.21]
    ]);

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

    AnydataMapArray|CsvConversionError vanydma = fromCsvStringWithType(value);
    test:assertEquals(vanydma, [
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21},
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21}
    ]);

    JsonMapArray|CsvConversionError vjma = fromCsvStringWithType(value);
    test:assertEquals(vjma, <JsonMapArray>[
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21},
        {i1, i2, s1, s2, b1, b2, n1, n2, f1: 2.234, f2: -3.21, d1: 2.234, d2: -3.21, j1: b1, a1: 2.234, j2: false, a2: -3.21}
    ]);

    StringMapArray|CsvConversionError vsma = fromCsvStringWithType(value);
    test:assertEquals(vsma, <JsonMapArray>[
        {i1: "1", s1: "string", b1: "true", n1: "()", f1: "2.234", d1: "2.234", a1: "2.234", j1: "true", i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"},
        {i1: "1", s1: "string", b1: "true", n1: "()", f1: "2.234", d1: "2.234", a1: "2.234", j1: "true", i2: "-2", s2: "", b2: "false", n2: "()", f2: "-3.21", d2: "-3.21", j2: "false", a2: "-3.21"}
    ]);

    CustomTuple7Array|CsvConversionError v2ct7a = fromCsvStringWithType(value2);
    test:assertEquals(v2ct7a, <CustomTuple7[]>[
        [i1, s1, b1, n1, 2.234, 2.234, b1, 2.234, s2, s3, "false", "-3.21"]
    ]);

    CustomTuple7Array|CsvConversionError v3ct7a = fromCsvStringWithType(value3);
    test:assertEquals(v3ct7a, <CustomTuple7[]>[
        [i1, s1, b1, n1, 2.234, 2.234, b1, 2.234, s2, s3]
    ]);

    // CustomTuple8Array|CsvConversionError v2ct8a = fromCsvStringWithType(value2);
    // test:assertTrue(v2ct8a is CsvConversionError);
    // test:assertEquals((<CsvConversionError>v2ct8a).message(), generateErrorMessageForInvalidValueForArrayType("false", "10", "int"));

    [float, decimal, string][]|CsvConversionError mrrta = fromCsvStringWithType(string `a, b,c
                                                                            1.23, 1.23, 1.23
                                                                            0,0,0
                                                                            0.0,0.0,0.0
                                                                            -1.2,-1.2,-1.2`);
    test:assertEquals(mrrta, [
        [<float>1.23, <decimal>1.23, "1.23"],
        [<float>0, <decimal>0, "0"],
        [<float>0, <decimal>0, "0.0"],
        [<float>-1.2, <decimal>-1.2, "-1.2"]
    ]);

    [float, decimal, string, int][]|CsvConversionError m2rrta = fromCsvStringWithType(string `a, b,c,d
                                                                            1, 1, 1,1
                                                                            0,0,0,0
                                                                            -1,-1,-1,-1`);
    test:assertEquals(m2rrta, [
        [<float>1, <decimal>1, "1", 1],
        [<float>0, <decimal>0, "0", 0],
        [<float>-1, <decimal>-1, "-1", -1]
    ]);

    [int...][]|CsvConversionError m3rrta = fromCsvStringWithType(string `a, b,c,d
                                                                            1.2, abc, true,1.0`);
    test:assertTrue(m3rrta is CsvConversionError);
    test:assertEquals((<CsvConversionError>m3rrta).message(), generateErrorMessageForInvalidCast("1.2", "int"));

    [boolean, int][]|CsvConversionError m4rrta = fromCsvStringWithType(string `a, b
                                                                            1, 1
                                                                            0,0`);
    test:assertEquals(m4rrta, [
        [true, 1],
        [false, 0]
    ]);

    record {|int...;|}[]|CsvConversionError irrma = fromCsvStringWithType(string `
                                                                            a, b, c
                                                                            1, a, 2.3
                                                                            1, -2, true
                                                                            hello, -2, hello`);
    test:assertEquals(irrma, [
        {a: 1},
        {a: i1, b: i2},
        {b: i2}
    ]);

    record {|()...;|}[]|CsvConversionError nrrma = fromCsvStringWithType(string `
                                                                            a, b, c
                                                                            1, a, ()
                                                                            1, null, ()
                                                                            hello, -2, hello`);
    test:assertEquals(nrrma, [
        {c: ()},
        {b: (), c: ()},
        {}
    ]);

    record {|decimal...;|}[]|CsvConversionError drra = fromCsvStringWithType(string `a, b,     c
                                                                            2.234, invalid , 1
                                                                            ${f2}, 0, 2.3d
                                                                            invalid, ${d2}, ${f3}`);
    test:assertTrue(drra is record {|decimal...;|}[]);
    test:assertEquals(drra, [
        {a: d1, c: <decimal>1.0},
        {a: <decimal>f2, b: d3},
        {b: -3.21d, c: <decimal>f3}
    ]);

    record {|string...;|}[]|CsvConversionError srra = fromCsvStringWithType(string `
                                                                            a, b, c
                                                                            1, a, 2.3
                                                                            1, -2, true
                                                                            hello, -2, hello`);
    test:assertTrue(srra is record {|string...;|}[]);
    test:assertEquals(srra, [
        {a: "1", b: "a", c: "2.3"},
        {a: "1", b: "-2", c: "true"},
        {a: "hello", b: "-2", c: "hello"}
    ]);

    record {|float...;|}[]|CsvConversionError frra = fromCsvStringWithType(string `a, b,     c
                                                                            1.2, invalid , 1
                                                                            ${d2}, ${d3}, true
                                                                            ${d4}, ${f2}, 0.0`);
    test:assertEquals(frra, [
        {a: 1.2, c: 1.0},
        {a: <float>d2, b: <float>d3},
        {a: <float>d4, b: f2, c: 0.0}
    ]);

    record {float a; decimal b; string c;}[]|CsvConversionError mrra = fromCsvStringWithType(string `a, b,c
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

    record {|float a; decimal b; string c; int d;|}[]|CsvConversionError m2rra = fromCsvStringWithType(string `a, b,c,d
                                                                            1, 1, 1,1
                                                                            0,0,0,0
                                                                            -1,-1,-1,-1`);
    test:assertEquals(m2rra, [
        {a: <float>1, b: <decimal>1, c: "1", d: 1},
        {a: <float>0, b: <decimal>0, c: "0", d: 0},
        {a: <float>-1, b: <decimal>-1, c: "-1", d: -1}
    ]);

    record {int d;}[]|CsvConversionError m3rra = fromCsvStringWithType(string `a, b,c,d
                                                                            1.2, abc, true,1.0`);
    test:assertTrue(m3rra is CsvConversionError);
    test:assertEquals((<CsvConversionError>m3rra).message(), generateErrorMessageForInvalidCast("1.0", "int"));

    record {int b; boolean a;}[]|CsvConversionError m4rra = fromCsvStringWithType(string `a, b
                                                                            1, 1
                                                                            0,0`);
    test:assertEquals(m4rra, [
        {a: true, b: 1},
        {a: false, b: 0}
    ]);
}

// boolean enable = true;

// @test:Config {enable: !enable}
// function test() {
//     NillableBooleanTuple5|CsvConversionError cbv1bt5 = fromCsvStringWithType(csvStringWithBooleanValues1);
//     test:assertEquals(cbv1bt5, [
//         [true, false, true, false],
//         [true, false, true, false],
//         [true, false, true, false]
//     ]);
// }
