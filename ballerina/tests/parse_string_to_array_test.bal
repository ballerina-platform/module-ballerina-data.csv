import ballerina/test;

// boolean enable = true;

// @test:Config {enable: !enable}
// function debugTest() {
//     BooleanRecord1Array|Error csvb4br1 = parseStringToRecord(csvStringWithBooleanValues4, {});
//     test:assertEquals(csvb4br1, [
//         {b1: true, b2: "()", b3: (), b4: false},
//         {b1: true, b2: "()", b3: (), b4: false}
//     ]);
// }

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndArrayAsExpectedType() {
    BooleanArrayArray|Error cv1baa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1baa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanArrayArray|Error cv2baa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2baa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    BooleanArrayArray|Error cv3baa = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cv3baa is Error);
    test:assertEquals((<Error>cv3baa).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|Error cv4baa = parseStringToList(csvStringWithBooleanValues4);
    test:assertTrue(cv4baa is Error);
    test:assertEquals((<Error>cv4baa).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|Error cv5baa = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cv5baa is Error);
    test:assertEquals((<Error>cv5baa).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanArrayArray|Error cv6baa = parseStringToList(csvStringWithBooleanValues6);
    test:assertTrue(cv6baa is Error);
    test:assertEquals((<Error>cv6baa).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|Error cv7baa = parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cv7baa is Error);
    test:assertEquals((<Error>cv7baa).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    NillableBooleanArrayArray|Error cv1nbaa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1nbaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableBooleanArrayArray|Error cv2nbaa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2nbaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanArrayArray|Error cv3nbaa = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3nbaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableBooleanArrayArray|Error cv4nbaa = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4nbaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableBooleanArrayArray|Error cv5nbaa = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cv5nbaa is Error);
    test:assertEquals((<Error>cv5nbaa).message(), generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanArrayArray|Error cv6nbaa = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6nbaa, [
        [(), ()]
    ]);

    NillableBooleanArrayArray|Error cv7nbaa = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7nbaa, [
        [b1, b2, (), b4]
    ]);

    NillableIntOrUnionBooleanArrayArray|Error cv1niubaa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1niubaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableIntOrUnionBooleanArrayArray|Error cv2niubaa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2niubaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableIntOrUnionBooleanArrayArray|Error cv3niubaa = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3niubaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableIntOrUnionBooleanArrayArray|Error cv4niubaa = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4niubaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableIntOrUnionBooleanArrayArray|Error cv5niubaa = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5niubaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    NillableIntOrUnionBooleanArrayArray|Error cv6niubaa = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6niubaa, [
        [(), ()]
    ]);

    NillableIntOrUnionBooleanArrayArray|Error cv7niubaa = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7niubaa, [
        [b1, b2, (), b4]
    ]);

    StringArray1Array|Error cv1saa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1saa, [
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"]
    ]);

    StringArray1Array|Error cv2saa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2saa, [
        ["true", "false", "true", "false", "true"],
        ["true", "false", "true", "false", "true"]
    ]);

    StringArray1Array|Error cv3saa = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3saa, [
        ["true", "false", "true"],
        ["TRUE", "FALSE", "()"],
        ["true", "true", "FALSE"]
    ]);

    StringArray1Array|Error cv4saa = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4saa, [
        ["true", "()", "()", "false"],
        ["true", "()", "null", "false"]
    ]);

    StringArray1Array|Error cv5saa = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5saa, [
        ["true", "false", "true", "2"],
        ["true", "false", "true", "3"]
    ]);

    StringArray1Array|Error cv6saa = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6saa, [
        ["()", "()"]
    ]);

    StringArray1Array|Error cv7saa = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7saa, [
        ["true", "false", "()", "false"]
    ]);

    StringArray2Array|Error cv1s2aa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1s2aa, [
        ["true", "false"],
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|Error cv2s2aa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2s2aa, [
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|Error cv3s2aa = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3s2aa, [
        ["true", "false"],
        ["TRUE", "FALSE"],
        ["true", "true"]
    ]);

    StringArray2Array|Error cv4s2aa = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4s2aa, [
        ["true", "()"],
        ["true", "()"]
    ]);

    StringArray2Array|Error cv5s2aa = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5s2aa, [
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|Error cv6s2aa = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6s2aa, [
        ["()", "()"]
    ]);

    StringArray2Array|Error cv7s2aa = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7s2aa, [
        ["true", "false"]
    ]);

    JsonArray1Array|Error cv1jaa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1jaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    JsonArray1Array|Error cv2jaa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2jaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    JsonArray1Array|Error cv3jaa = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3jaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    JsonArray1Array|Error cv4jaa = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4jaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    JsonArray1Array|Error cv5jaa = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5jaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    JsonArray1Array|Error cv6jaa = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6jaa, [
        [(), ()]
    ]);

    JsonArray1Array|Error cv7jaa = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7jaa, [
        [b1, b2, (), b4]
    ]);

    AnydataArray1Array|Error cv1anydaa = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1anydaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    AnydataArray1Array|Error cv2anydaa = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2anydaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    AnydataArray1Array|Error cv3anydaa = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3anydaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    AnydataArray1Array|Error cv4anydaa = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4anydaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    AnydataArray1Array|Error cv5anydaa = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5anydaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    AnydataArray1Array|Error cv6anydaa = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6anydaa, [
        [(), ()]
    ]);

    AnydataArray1Array|Error cv7anydaa = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7anydaa, [
        [b1, b2, (), b4]
    ]);

    DecimalArray1Array|Error cv1daa = parseStringToList(csvStringWithBooleanValues1);
    test:assertTrue(cv1daa is Error);
    test:assertEquals((<Error>cv1daa).message(), generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalArray1Array|Error cv3daa = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cv3daa is Error);
    test:assertEquals((<Error>cv3daa).message(), generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalArray1Array|Error cv6daa = parseStringToList(csvStringWithBooleanValues6);
    test:assertTrue(cv6daa is Error);
    test:assertEquals((<Error>cv6daa).message(), generateErrorMessageForInvalidCast("()", "decimal"));

    DecimalArray1Array|Error cv7daa = parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cv7daa is Error);
    test:assertEquals((<Error>cv7daa).message(), generateErrorMessageForInvalidCast("true", "decimal"));
}
