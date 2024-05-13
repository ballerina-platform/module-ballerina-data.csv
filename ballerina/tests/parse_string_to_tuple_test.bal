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
function testFromCsvStringWithTypeForStringAndTupleAsExpectedType() {
    BooleanTuple1Array|CsvConversionError cbv1bt1 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt1, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple1Array|CsvConversionError cbv2bt1 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt1, [
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple1Array|CsvConversionError cbv3bt1 = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3bt1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv3bt1).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple1Array|CsvConversionError cbv5bt1 = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv5bt1).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanTuple1Array|CsvConversionError cbv7bt1 = parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cbv7bt1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv7bt1).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple2Array|CsvConversionError cbv1bt2 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt2, [
        [true, false],
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|CsvConversionError cbv2bt2 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt2, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|CsvConversionError cbv3bt2 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt2, [
        [true, false],
        [true, false],
        [true, true]
    ]);

    BooleanTuple2Array|CsvConversionError cbv4bt2 = parseStringToList(csvStringWithBooleanValues4);
    test:assertTrue(cbv4bt2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv4bt2).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple3Array|CsvConversionError cbv1bt3 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt3, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple3Array|CsvConversionError cbv2bt3 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt3, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    BooleanTuple3Array|CsvConversionError cbv3bt3 = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3bt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv3bt3).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple3Array|CsvConversionError cbv5bt3 = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv5bt3).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanTuple3Array|CsvConversionError cbv7bt3 = parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cbv7bt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv7bt3).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|CsvConversionError cbv1bt4 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt4, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple4Array|CsvConversionError cbv2bt4 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt4, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    BooleanTuple4Array|CsvConversionError cbv3bt4 = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3bt4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv3bt4).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|CsvConversionError cbv4bt4 = parseStringToList(csvStringWithBooleanValues4);
    test:assertTrue(cbv4bt4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv4bt4).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|CsvConversionError cbv5bt4 = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv5bt4).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanTuple4Array|CsvConversionError cbv6bt4 = parseStringToList(csvStringWithBooleanValues6);
    test:assertTrue(cbv6bt4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv6bt4).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|CsvConversionError cbv7bt4 = parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cbv7bt4 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv7bt4).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    NillableBooleanTuple5Array|CsvConversionError cbv1bt5 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt5, [
        [true, false, true, false, null],
        [true, false, true, false, null],
        [true, false, true, false, null]
    ]);

    NillableBooleanTuple5Array|CsvConversionError cbv2bt5 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt5, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanTuple5Array|CsvConversionError cbv3bt5 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt5, [
        [true, false, true, null, null],
        [true, false, (), null, null],
        [true, true, false, null, null]
    ]);

    NillableBooleanTuple5Array|CsvConversionError cbv4bt5 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt5, [
        [true, (), (), false, null],
        [true, (), (), false, null]
    ]);

    NillableBooleanTuple5Array|CsvConversionError cbv5bt5 = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt5 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv5bt5).message(), generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanTuple5Array|CsvConversionError cbv6bt5 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt5, [
        [(), (), null, null, null]
    ]);

    NillableBooleanTuple5Array|CsvConversionError cbv7bt5 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt5, [
        [b1, b2, (), b4, null]
    ]);

    NillableBooleanTuple6Array|CsvConversionError cbv1bt6 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt6, [
        [true, false],
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|CsvConversionError cbv2bt6 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt6, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|CsvConversionError cbv3bt6 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt6, [
        [true, false],
        [true, false],
        [true, true]
    ]);

    NillableBooleanTuple6Array|CsvConversionError cbv4bt6 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt6, [
        [true, ()],
        [true, ()]
    ]);

    NillableBooleanTuple6Array|CsvConversionError cbv6bt6 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt6, [
        [(), null]
    ]);

    NillableBooleanTuple6Array|CsvConversionError cbv7bt6 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt6, [
        [b1, b2]
    ]);

    NillableBooleanTuple7Array|CsvConversionError cbv1bt7 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt7, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableBooleanTuple7Array|CsvConversionError cbv2bt7 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt7, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanTuple7Array|CsvConversionError cbv3bt7 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt7, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableBooleanTuple7Array|CsvConversionError cbv4bt7 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt7, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableBooleanTuple7Array|CsvConversionError cbv5bt7 = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt7 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv5bt7).message(), generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanTuple7Array|CsvConversionError cbv6bt7 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt7, [
        [(), ()]
    ]);

    NillableBooleanTuple7Array|CsvConversionError cbv7bt7 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt7, [
        [b1, b2, (), false]
    ]);

    NillableBooleanTuple8Array|CsvConversionError cbv1bt8 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt8, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableBooleanTuple8Array|CsvConversionError cbv2bt8 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt8, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanTuple8Array|CsvConversionError cbv3bt8 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt8, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableBooleanTuple8Array|CsvConversionError cbv4bt8 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt8, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableBooleanTuple8Array|CsvConversionError cbv5bt8 = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt8 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv5bt8).message(), generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanTuple8Array|CsvConversionError cbv6bt8 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt8, [
        [(), ()]
    ]);

    NillableBooleanTuple8Array|CsvConversionError cbv7bt8 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt8, [
        [b1, b2, (), false]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv1bt9 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt9, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv2bt9 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt9, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv3bt9 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt9, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv4bt9 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt9, [
        [true, (), (), 0],
        [1, (), (), false]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv5bt9 = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cbv5bt9, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv6bt9 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt9, [
        [(), ()]
    ]);

    NillableIntBooleanTuple9Array|CsvConversionError cbv7bt9 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt9, [
        [b1, b2, (), false]
    ]);

    NilTuple3Array|CsvConversionError cbv1nt3 = parseStringToList(csvStringWithBooleanValues1);
    test:assertTrue(cbv1nt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv1nt3).message(), generateErrorMessageForInvalidCast("true", "()"));

    NilTuple3Array|CsvConversionError cbv3nt3 = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3nt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv3nt3).message(), generateErrorMessageForInvalidCast("true", "()"));

    NilTuple3Array|CsvConversionError cbv6nt3 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6nt3, [
        [(), ()]
    ]);

    AnydataTuple3Array|CsvConversionError cbv1anyd3 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1anyd3, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    AnydataTuple3Array|CsvConversionError cbv2anyd3 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2anyd3, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    AnydataTuple3Array|CsvConversionError cbv3anyd3 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3anyd3, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    AnydataTuple3Array|CsvConversionError cbv4anyd3 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4anyd3, [
        [true, (), (), 0],
        [1, (), (), false]
    ]);

    AnydataTuple3Array|CsvConversionError cbv5anyd3 = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cbv5anyd3, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    AnydataTuple3Array|CsvConversionError cbv6anyd3 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6anyd3, [
        [(), ()]
    ]);

    AnydataTuple3Array|CsvConversionError cbv7anyd3 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7anyd3, [
        [b1, b2, (), false]
    ]);
}

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndTupleAsExpectedType2() {
    JsonTuple3Array|CsvConversionError cbv1j3 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1j3, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    JsonTuple3Array|CsvConversionError cbv2j3 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2j3, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    JsonTuple3Array|CsvConversionError cbv3j3 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3j3, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    JsonTuple3Array|CsvConversionError cbv4j3 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4j3, [
        [true, (), (), 0],
        [1, (), (), false]
    ]);

    JsonTuple3Array|CsvConversionError cbv5j3 = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cbv5j3, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    JsonTuple3Array|CsvConversionError cbv6j3 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6j3, [
        [(), ()]
    ]);

    JsonTuple3Array|CsvConversionError cbv7j3 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7j3, [
        [b1, b2, (), false]
    ]);

    StringTuple3Array|CsvConversionError cbv1s3 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1s3, [
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"]
    ]);

    StringTuple3Array|CsvConversionError cbv2s3 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2s3, [
        ["true", "false", "true", "false", "true"],
        ["true", "false", "true", "false", "true"]
    ]);

    StringTuple3Array|CsvConversionError cbv3s3 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3s3, [
        ["true", "false", "true"],
        ["TRUE", "FALSE", "()"],
        ["true", "true", "FALSE"]
    ]);

    StringTuple3Array|CsvConversionError cbv4s3 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4s3, [
        ["true", "()", "()", "0"],
        ["1", "()", "null", "false"]
    ]);

    StringTuple3Array|CsvConversionError cbv5s3 = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cbv5s3, [
        ["true", "false", "true", "2"],
        ["true", "false", "true", "3"]
    ]);

    StringTuple3Array|CsvConversionError cbv6s3 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6s3, [
        ["()", "()"]
    ]);

    StringTuple3Array|CsvConversionError cbv7s3 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7s3, [
        ["true", "false", "()", "false"]
    ]);

    DecimalTuple3Array|CsvConversionError cbv1dt3 = parseStringToList(csvStringWithBooleanValues1);
    test:assertTrue(cbv1dt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv1dt3).message(), generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalTuple3Array|CsvConversionError cbv3dt3 = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3dt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv3dt3).message(), generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalTuple3Array|CsvConversionError cbv6dt3 = parseStringToList(csvStringWithBooleanValues6);
    test:assertTrue(cbv6dt3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>cbv6dt3).message(), generateErrorMessageForInvalidCast("()", "decimal"));
}
