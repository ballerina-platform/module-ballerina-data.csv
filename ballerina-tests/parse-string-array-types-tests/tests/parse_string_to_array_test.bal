import ballerina/csv_commons as common;
import ballerina/data.csv as csv;
import ballerina/test;

@test:Config
function testFromCsvStringWithTypeForStringAndArrayAsExpectedType() {
    BooleanArrayArray|csv:Error cv1baa = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1baa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanArrayArray|csv:Error cv2baa = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2baa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    BooleanArrayArray|csv:Error cv3baa = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cv3baa is csv:Error);
    test:assertEquals((<csv:Error>cv3baa).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|csv:Error cv4baa = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertTrue(cv4baa is csv:Error);
    test:assertEquals((<csv:Error>cv4baa).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|csv:Error cv5baa = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cv5baa is csv:Error);
    test:assertEquals((<csv:Error>cv5baa).message(), common:generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanArrayArray|csv:Error cv6baa = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertTrue(cv6baa is csv:Error);
    test:assertEquals((<csv:Error>cv6baa).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanArrayArray|csv:Error cv7baa = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cv7baa is csv:Error);
    test:assertEquals((<csv:Error>cv7baa).message(), common:generateErrorMessageForInvalidCast("()", "boolean"));

    NillableBooleanArrayArray|csv:Error cv1nbaa = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1nbaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableBooleanArrayArray|csv:Error cv2nbaa = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2nbaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanArrayArray|csv:Error cv3nbaa = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3nbaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableBooleanArrayArray|csv:Error cv4nbaa = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4nbaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableBooleanArrayArray|csv:Error cv5nbaa = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cv5nbaa is csv:Error);
    test:assertEquals((<csv:Error>cv5nbaa).message(), common:generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanArrayArray|csv:Error cv6nbaa = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6nbaa, [
        [(), ()]
    ]);

    NillableBooleanArrayArray|csv:Error cv7nbaa = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7nbaa, [
        [b1, b2, (), b4]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error cv1niubaa = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1niubaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error cv2niubaa = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2niubaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error cv3niubaa = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3niubaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error cv4niubaa = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4niubaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error cv5niubaa = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5niubaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);
}

@test:Config
function testFromCsvStringWithTypeForStringAndArrayAsExpectedType2() {
    NillableIntOrUnionBooleanArrayArray|csv:Error cv6niubaa = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6niubaa, [
        [(), ()]
    ]);

    NillableIntOrUnionBooleanArrayArray|csv:Error cv7niubaa = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7niubaa, [
        [b1, b2, (), b4]
    ]);

    StringArray1Array|csv:Error cv1saa = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1saa, [
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"]
    ]);

    StringArray1Array|csv:Error cv2saa = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2saa, [
        ["true", "false", "true", "false", "true"],
        ["true", "false", "true", "false", "true"]
    ]);

    StringArray1Array|csv:Error cv3saa = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3saa, [
        ["true", "false", "true"],
        ["TRUE", "FALSE", "()"],
        ["true", "true", "FALSE"]
    ]);

    StringArray1Array|csv:Error cv4saa = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4saa, [
        ["true", "()", "()", "false"],
        ["true", "()", "null", "false"]
    ]);

    StringArray1Array|csv:Error cv5saa = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5saa, [
        ["true", "false", "true", "2"],
        ["true", "false", "true", "3"]
    ]);

    StringArray1Array|csv:Error cv6saa = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6saa, [
        ["()", "()"]
    ]);

    StringArray1Array|csv:Error cv7saa = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7saa, [
        ["true", "false", "()", "false"]
    ]);

    StringArray2Array|csv:Error cv1s2aa = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1s2aa, [
        ["true", "false"],
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|csv:Error cv2s2aa = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2s2aa, [
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|csv:Error cv3s2aa = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3s2aa, [
        ["true", "false"],
        ["TRUE", "FALSE"],
        ["true", "true"]
    ]);

    StringArray2Array|csv:Error cv4s2aa = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4s2aa, [
        ["true", "()"],
        ["true", "()"]
    ]);

    StringArray2Array|csv:Error cv5s2aa = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5s2aa, [
        ["true", "false"],
        ["true", "false"]
    ]);

    StringArray2Array|csv:Error cv6s2aa = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6s2aa, [
        ["()", "()"]
    ]);

    StringArray2Array|csv:Error cv7s2aa = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7s2aa, [
        ["true", "false"]
    ]);

    JsonArray1Array|csv:Error cv1jaa = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1jaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);
}

@test:Config
function testFromCsvStringWithTypeForStringAndArrayAsExpectedType3() {
    JsonArray1Array|csv:Error cv2jaa = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2jaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    JsonArray1Array|csv:Error cv3jaa = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3jaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    JsonArray1Array|csv:Error cv4jaa = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4jaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    JsonArray1Array|csv:Error cv5jaa = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5jaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    JsonArray1Array|csv:Error cv6jaa = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6jaa, [
        [(), ()]
    ]);

    JsonArray1Array|csv:Error cv7jaa = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7jaa, [
        [b1, b2, (), b4]
    ]);

    AnydataArray1Array|csv:Error cv1anydaa = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cv1anydaa, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    AnydataArray1Array|csv:Error cv2anydaa = csv:parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cv2anydaa, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    AnydataArray1Array|csv:Error cv3anydaa = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cv3anydaa, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    AnydataArray1Array|csv:Error cv4anydaa = csv:parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cv4anydaa, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    AnydataArray1Array|csv:Error cv5anydaa = csv:parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cv5anydaa, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    AnydataArray1Array|csv:Error cv6anydaa = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cv6anydaa, [
        [(), ()]
    ]);

    AnydataArray1Array|csv:Error cv7anydaa = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cv7anydaa, [
        [b1, b2, (), b4]
    ]);

    DecimalArray1Array|csv:Error cv1daa = csv:parseStringToList(csvStringWithBooleanValues1);
    test:assertTrue(cv1daa is csv:Error);
    test:assertEquals((<csv:Error>cv1daa).message(), common:generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalArray1Array|csv:Error cv3daa = csv:parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cv3daa is csv:Error);
    test:assertEquals((<csv:Error>cv3daa).message(), common:generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalArray1Array|csv:Error cv6daa = csv:parseStringToList(csvStringWithBooleanValues6);
    test:assertTrue(cv6daa is csv:Error);
    test:assertEquals((<csv:Error>cv6daa).message(), common:generateErrorMessageForInvalidCast("()", "decimal"));

    DecimalArray1Array|csv:Error cv7daa = csv:parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cv7daa is csv:Error);
    test:assertEquals((<csv:Error>cv7daa).message(), common:generateErrorMessageForInvalidCast("true", "decimal"));
}
