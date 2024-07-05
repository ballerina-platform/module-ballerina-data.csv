import ballerina/test;

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndTupleAsExpectedType() {
    BooleanTuple1Array|Error cbv1bt1 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt1, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple1Array|Error cbv2bt1 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt1, [
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple1Array|Error cbv3bt1 = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3bt1 is Error);
    test:assertEquals((<Error>cbv3bt1).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple1Array|Error cbv5bt1 = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt1 is Error);
    test:assertEquals((<Error>cbv5bt1).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanTuple1Array|Error cbv7bt1 = parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cbv7bt1 is Error);
    test:assertEquals((<Error>cbv7bt1).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple2Array|Error cbv1bt2 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt2, [
        [true, false],
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|Error cbv2bt2 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt2, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|Error cbv3bt2 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt2, [
        [true, false],
        [true, false],
        [true, true]
    ]);

    BooleanTuple2Array|Error cbv4bt2 = parseStringToList(csvStringWithBooleanValues4);
    test:assertTrue(cbv4bt2 is Error);
    test:assertEquals((<Error>cbv4bt2).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple3Array|Error cbv1bt3 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt3, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple3Array|Error cbv2bt3 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt3, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    BooleanTuple3Array|Error cbv3bt3 = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3bt3 is Error);
    test:assertEquals((<Error>cbv3bt3).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple3Array|Error cbv5bt3 = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt3 is Error);
    test:assertEquals((<Error>cbv5bt3).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanTuple3Array|Error cbv7bt3 = parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cbv7bt3 is Error);
    test:assertEquals((<Error>cbv7bt3).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|Error cbv1bt4 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt4, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    BooleanTuple4Array|Error cbv2bt4 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt4, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    BooleanTuple4Array|Error cbv3bt4 = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3bt4 is Error);
    test:assertEquals((<Error>cbv3bt4).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|Error cbv4bt4 = parseStringToList(csvStringWithBooleanValues4);
    test:assertTrue(cbv4bt4 is Error);
    test:assertEquals((<Error>cbv4bt4).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|Error cbv5bt4 = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt4 is Error);
    test:assertEquals((<Error>cbv5bt4).message(), generateErrorMessageForInvalidCast("2", "boolean"));

    BooleanTuple4Array|Error cbv6bt4 = parseStringToList(csvStringWithBooleanValues6);
    test:assertTrue(cbv6bt4 is Error);
    test:assertEquals((<Error>cbv6bt4).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    BooleanTuple4Array|Error cbv7bt4 = parseStringToList(csvStringWithBooleanValues7);
    test:assertTrue(cbv7bt4 is Error);
    test:assertEquals((<Error>cbv7bt4).message(), generateErrorMessageForInvalidCast("()", "boolean"));

    NillableBooleanTuple5Array|Error cbv1bt5 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt5, [
        [true, false, true, false, null],
        [true, false, true, false, null],
        [true, false, true, false, null]
    ]);

    NillableBooleanTuple5Array|Error cbv2bt5 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt5, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanTuple5Array|Error cbv3bt5 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt5, [
        [true, false, true, null, null],
        [true, false, (), null, null],
        [true, true, false, null, null]
    ]);

    NillableBooleanTuple5Array|Error cbv4bt5 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt5, [
        [true, (), (), false, null],
        [true, (), (), false, null]
    ]);

    NillableBooleanTuple5Array|Error cbv5bt5 = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt5 is Error);
    test:assertEquals((<Error>cbv5bt5).message(), generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanTuple5Array|Error cbv6bt5 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt5, [
        [(), (), null, null, null]
    ]);

    NillableBooleanTuple5Array|Error cbv7bt5 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt5, [
        [b1, b2, (), b4, null]
    ]);

    NillableBooleanTuple6Array|Error cbv1bt6 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt6, [
        [true, false],
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|Error cbv2bt6 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt6, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|Error cbv3bt6 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt6, [
        [true, false],
        [true, false],
        [true, true]
    ]);

    NillableBooleanTuple6Array|Error cbv4bt6 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt6, [
        [true, ()],
        [true, ()]
    ]);

    NillableBooleanTuple6Array|Error cbv6bt6 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt6, [
        [(), null]
    ]);

    NillableBooleanTuple6Array|Error cbv7bt6 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt6, [
        [b1, b2]
    ]);

    NillableBooleanTuple7Array|Error cbv1bt7 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt7, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableBooleanTuple7Array|Error cbv2bt7 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt7, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanTuple7Array|Error cbv3bt7 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt7, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableBooleanTuple7Array|Error cbv4bt7 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt7, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableBooleanTuple7Array|Error cbv5bt7 = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt7 is Error);
    test:assertEquals((<Error>cbv5bt7).message(), generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanTuple7Array|Error cbv6bt7 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt7, [
        [(), ()]
    ]);

    NillableBooleanTuple7Array|Error cbv7bt7 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt7, [
        [b1, b2, (), false]
    ]);

    NillableBooleanTuple8Array|Error cbv1bt8 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt8, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableBooleanTuple8Array|Error cbv2bt8 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt8, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableBooleanTuple8Array|Error cbv3bt8 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt8, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableBooleanTuple8Array|Error cbv4bt8 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt8, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableBooleanTuple8Array|Error cbv5bt8 = parseStringToList(csvStringWithBooleanValues5);
    test:assertTrue(cbv5bt8 is Error);
    test:assertEquals((<Error>cbv5bt8).message(), generateErrorMessageForInvalidCast("2", "boolean?"));

    NillableBooleanTuple8Array|Error cbv6bt8 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt8, [
        [(), ()]
    ]);

    NillableBooleanTuple8Array|Error cbv7bt8 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt8, [
        [b1, b2, (), false]
    ]);

    NillableIntBooleanTuple9Array|Error cbv1bt9 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1bt9, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    NillableIntBooleanTuple9Array|Error cbv2bt9 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2bt9, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    NillableIntBooleanTuple9Array|Error cbv3bt9 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3bt9, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    NillableIntBooleanTuple9Array|Error cbv4bt9 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4bt9, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    NillableIntBooleanTuple9Array|Error cbv5bt9 = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cbv5bt9, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    NillableIntBooleanTuple9Array|Error cbv6bt9 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6bt9, [
        [(), ()]
    ]);

    NillableIntBooleanTuple9Array|Error cbv7bt9 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7bt9, [
        [b1, b2, (), false]
    ]);

    NilTuple3Array|Error cbv1nt3 = parseStringToList(csvStringWithBooleanValues1);
    test:assertTrue(cbv1nt3 is Error);
    test:assertEquals((<Error>cbv1nt3).message(), generateErrorMessageForInvalidCast("true", "()"));

    NilTuple3Array|Error cbv3nt3 = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3nt3 is Error);
    test:assertEquals((<Error>cbv3nt3).message(), generateErrorMessageForInvalidCast("true", "()"));

    NilTuple3Array|Error cbv6nt3 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6nt3, [
        [(), ()]
    ]);

    AnydataTuple3Array|Error cbv1anyd3 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1anyd3, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    AnydataTuple3Array|Error cbv2anyd3 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2anyd3, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    AnydataTuple3Array|Error cbv3anyd3 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3anyd3, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    AnydataTuple3Array|Error cbv4anyd3 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4anyd3, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    AnydataTuple3Array|Error cbv5anyd3 = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cbv5anyd3, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    AnydataTuple3Array|Error cbv6anyd3 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6anyd3, [
        [(), ()]
    ]);

    AnydataTuple3Array|Error cbv7anyd3 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7anyd3, [
        [b1, b2, (), false]
    ]);
}

@test:Config {enable}
function testFromCsvStringWithTypeForStringAndTupleAsExpectedType2() {
    JsonTuple3Array|Error cbv1j3 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1j3, [
        [true, false, true, false],
        [true, false, true, false],
        [true, false, true, false]
    ]);

    JsonTuple3Array|Error cbv2j3 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2j3, [
        [true, false, true, false, true],
        [true, false, true, false, true]
    ]);

    JsonTuple3Array|Error cbv3j3 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3j3, [
        [true, false, true],
        [true, false, ()],
        [true, true, false]
    ]);

    JsonTuple3Array|Error cbv4j3 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4j3, [
        [true, (), (), false],
        [true, (), (), false]
    ]);

    JsonTuple3Array|Error cbv5j3 = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cbv5j3, [
        [true, false, true, 2],
        [true, false, true, 3]
    ]);

    JsonTuple3Array|Error cbv6j3 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6j3, [
        [(), ()]
    ]);

    JsonTuple3Array|Error cbv7j3 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7j3, [
        [b1, b2, (), false]
    ]);

    StringTuple3Array|Error cbv1s3 = parseStringToList(csvStringWithBooleanValues1);
    test:assertEquals(cbv1s3, [
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"],
        ["true", "false", "true", "false"]
    ]);

    StringTuple3Array|Error cbv2s3 = parseStringToList(csvStringWithBooleanValues2);
    test:assertEquals(cbv2s3, [
        ["true", "false", "true", "false", "true"],
        ["true", "false", "true", "false", "true"]
    ]);

    StringTuple3Array|Error cbv3s3 = parseStringToList(csvStringWithBooleanValues3);
    test:assertEquals(cbv3s3, [
        ["true", "false", "true"],
        ["TRUE", "FALSE", "()"],
        ["true", "true", "FALSE"]
    ]);

    StringTuple3Array|Error cbv4s3 = parseStringToList(csvStringWithBooleanValues4);
    test:assertEquals(cbv4s3, [
        ["true", "()", "()", "false"],
        ["true", "()", "null", "false"]
    ]);

    StringTuple3Array|Error cbv5s3 = parseStringToList(csvStringWithBooleanValues5);
    test:assertEquals(cbv5s3, [
        ["true", "false", "true", "2"],
        ["true", "false", "true", "3"]
    ]);

    StringTuple3Array|Error cbv6s3 = parseStringToList(csvStringWithBooleanValues6);
    test:assertEquals(cbv6s3, [
        ["()", "()"]
    ]);

    StringTuple3Array|Error cbv7s3 = parseStringToList(csvStringWithBooleanValues7);
    test:assertEquals(cbv7s3, [
        ["true", "false", "()", "false"]
    ]);

    DecimalTuple3Array|Error cbv1dt3 = parseStringToList(csvStringWithBooleanValues1);
    test:assertTrue(cbv1dt3 is Error);
    test:assertEquals((<Error>cbv1dt3).message(), generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalTuple3Array|Error cbv3dt3 = parseStringToList(csvStringWithBooleanValues3);
    test:assertTrue(cbv3dt3 is Error);
    test:assertEquals((<Error>cbv3dt3).message(), generateErrorMessageForInvalidCast("true", "decimal"));

    DecimalTuple3Array|Error cbv6dt3 = parseStringToList(csvStringWithBooleanValues6);
    test:assertTrue(cbv6dt3 is Error);
    test:assertEquals((<Error>cbv6dt3).message(), generateErrorMessageForInvalidCast("()", "decimal"));
}
