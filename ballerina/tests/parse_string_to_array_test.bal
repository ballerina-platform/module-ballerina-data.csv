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
function testFromCsvStringWithTypeForStringAndArrayAsExpectedType() {
    BooleanArrayArray|CsvConversionError cv1baa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1baa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanArrayArray|CsvConversionError cv2baa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2baa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    BooleanArrayArray|CsvConversionError cv3baa = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cv3baa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv3baa).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|CsvConversionError cv4baa = parseStringToList(csvStringWithBooleanValues4);
    test:assertTrue(cv4baa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv4baa).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|CsvConversionError cv5baa = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cv5baa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv5baa).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanArrayArray|CsvConversionError cv6baa = parseStringToList(csvStringWithBooleanValues6);
    test:assertTrue(cv6baa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv6baa).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|CsvConversionError cv7baa = parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cv7baa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv7baa).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    NillableBooleanArrayArray|CsvConversionError cv1nbaa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1nbaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableBooleanArrayArray|CsvConversionError cv2nbaa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2nbaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanArrayArray|CsvConversionError cv3nbaa = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3nbaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableBooleanArrayArray|CsvConversionError cv4nbaa = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4nbaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableBooleanArrayArray|CsvConversionError cv5nbaa = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cv5nbaa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv5nbaa).message(), generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanArrayArray|CsvConversionError cv6nbaa = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6nbaa, [
        [(), ()]
    ]);

    NillableBooleanArrayArray|CsvConversionError cv7nbaa = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7nbaa, [
        [b1, b2, (), b4]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv1niubaa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1niubaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv2niubaa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2niubaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv3niubaa = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3niubaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv4niubaa = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4niubaa, [
        [true, (), (), 0],
        [1, (), (), false]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv5niubaa = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5niubaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv6niubaa = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6niubaa, [
        [(), ()]
    ]);

    NillableIntOrUnionBooleanArrayArray|CsvConversionError cv7niubaa = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7niubaa, [
        [b1, b2, (), b4]
    ]);

    StringArray1Array|CsvConversionError cv1saa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1saa, [
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"]
    ]);

    StringArray1Array|CsvConversionError cv2saa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2saa, [
        ["true", "false", "true", "false", "true"],
        ["true", "false", "true", "false", "true"]
    ]);

    StringArray1Array|CsvConversionError cv3saa = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3saa, [
        ["true", "false", "true"],
        ["TRUE", "FALSE", "()"],
        ["true", "true", "FALSE"]
    ]);

    StringArray1Array|CsvConversionError cv4saa = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4saa, [
        ["true", "()", "()", "0"],
        ["1", "()", "null", "false"]
    ]);

    StringArray1Array|CsvConversionError cv5saa = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5saa, [
        ["true", "false", "true", "2"],
        ["true", "false", "true", "3"]
    ]);

    StringArray1Array|CsvConversionError cv6saa = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6saa, [
        ["()", "()"]
    ]);

    StringArray1Array|CsvConversionError cv7saa = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7saa, [
        ["true", "false", "()", "false"]
    ]);

    StringArray2Array|CsvConversionError cv1s2aa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1s2aa, [
        ["true", "false"],
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|CsvConversionError cv2s2aa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2s2aa, [
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|CsvConversionError cv3s2aa = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3s2aa, [
        ["true", "false"],
        ["TRUE", "FALSE"],
        ["true", "true"]
    ]);

    StringArray2Array|CsvConversionError cv4s2aa = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4s2aa, [
        ["true", "()"],
        ["1", "()"]
    ]);

    StringArray2Array|CsvConversionError cv5s2aa = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5s2aa, [
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|CsvConversionError cv6s2aa = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6s2aa, [
        ["()", "()"]
    ]);

    StringArray2Array|CsvConversionError cv7s2aa = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7s2aa, [
        ["true", "false"]
    ]);

    JsonArray1Array|CsvConversionError cv1jaa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1jaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    JsonArray1Array|CsvConversionError cv2jaa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2jaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    JsonArray1Array|CsvConversionError cv3jaa = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3jaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    JsonArray1Array|CsvConversionError cv4jaa = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4jaa, [
        [true, (), (), 0],
        [1, (), (), false]
    ]);

    JsonArray1Array|CsvConversionError cv5jaa = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5jaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    JsonArray1Array|CsvConversionError cv6jaa = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6jaa, [
        [(), ()]
    ]);

    JsonArray1Array|CsvConversionError cv7jaa = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7jaa, [
        [b1, b2, (), b4]
    ]);

    AnydataArray1Array|CsvConversionError cv1anydaa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1anydaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    AnydataArray1Array|CsvConversionError cv2anydaa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2anydaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    AnydataArray1Array|CsvConversionError cv3anydaa = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3anydaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    AnydataArray1Array|CsvConversionError cv4anydaa = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4anydaa, [
        [true, (), (), 0],
        [1, (), (), false]
    ]);

    AnydataArray1Array|CsvConversionError cv5anydaa = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5anydaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    AnydataArray1Array|CsvConversionError cv6anydaa = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6anydaa, [
        [(), ()]
    ]);

    AnydataArray1Array|CsvConversionError cv7anydaa = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7anydaa, [
        [b1, b2, (), b4]
    ]);

    DecimalArray1Array|CsvConversionError cv1daa = parseStringToList(csvStringWithBooleanValues1);
    test:assertTrue(cv1daa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv1daa).message(), generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalArray1Array|CsvConversionError cv3daa = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cv3daa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv3daa).message(), generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalArray1Array|CsvConversionError cv6daa = parseStringToList(csvStringWithBooleanValues6);
    test:assertTrue(cv6daa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv6daa).message(), generateErrorMessageForInvalidCast("()", "decimal"));

    DecimalArray1Array|CsvConversionError cv7daa = parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cv7daa is CsvConversionError);
    test:assertEquals((<CsvConversionError>cv7daa).message(), generateErrorMessageForInvalidCast("true", "decimal"));
}
