import ballerina/test;

@test:Config
function testFromCsvWithTypeForMapAndArrayAsExpectedType() {
    BooleanArrayArray|Error bm1ba = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, BooleanArrayArray);
    test:assertEquals(bm1ba, [
        [true, false],
        [true, false]
    ]);

    bm1ba = parseRecordAsListType([bm1, bm1], ["b2", "b1"], {}, BooleanArrayArray);
    test:assertEquals(bm1ba, [
        [false, true],
        [false, true]
    ]);

    BooleanArrayArray|Error bm2ba = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, BooleanArrayArray);
    test:assertTrue(bm2ba is Error);
    test:assertEquals((<Error>bm2ba).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanArrayArray|Error bm3ba = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, BooleanArrayArray);
    test:assertTrue(bm3ba is Error);
    test:assertEquals((<Error>bm3ba).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanArrayArray|Error bm4ba = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, BooleanArrayArray);
    test:assertTrue(bm4ba is Error);
    test:assertEquals((<Error>bm4ba).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanArrayArray|Error bm5ba = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, BooleanArrayArray);
    test:assertTrue(bm5ba is Error);
    test:assertEquals((<Error>bm5ba).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    NillableBooleanArrayArray|Error bm1nba = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, NillableBooleanArrayArray);
    test:assertEquals(bm1nba, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanArrayArray|Error bm2nba = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, NillableBooleanArrayArray);
    test:assertEquals(bm2nba, [
        [true, false, null, null, null],
        [true, false, null, null, null]
    ]);

    NillableBooleanArrayArray|Error bm3nba = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, NillableBooleanArrayArray);
    test:assertTrue(bm3nba is Error);
    test:assertEquals((<Error>bm3nba).message(), generateErrorMessageForInvalidValueForArrayType("1", "4", "boolean?"));

    NillableBooleanArrayArray|Error bm4nba = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, NillableBooleanArrayArray);
    test:assertEquals(bm4nba, [
        [(), ()],
        [(), ()]
    ]);

    NillableBooleanArrayArray|Error bm5nba = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, NillableBooleanArrayArray);
    test:assertEquals(bm5nba, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    bm5nba = parseRecordAsListType([bm5, bm5], ["b1", "b3", "b2", "b4"], {}, NillableBooleanArrayArray);
    test:assertEquals(bm5nba, [
        [true, (), false, true],
        [true, (), false, true]
    ]);

    bm5nba = parseRecordAsListType([bm5, bm5], ["b4", "b3", "b2", "b1"], {}, NillableBooleanArrayArray);
    test:assertEquals(bm5nba, [
        [true, (), false, true],
        [true, (), false, true]
    ]);

    NillableIntOrUnionBooleanArrayArray|Error bm1niouba = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm1niouba, [
        [true, false],
        [true, false]
    ]);

    NillableIntOrUnionBooleanArrayArray|Error bm2niouba = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm2niouba, [
        [true, false, null, null, null],
        [true, false, null, null, null]
    ]);

    NillableIntOrUnionBooleanArrayArray|Error bm3niouba = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm3niouba, [
        [true, false, null, false, 1],
        [true, false, null, false, 1]
    ]);

    NillableIntOrUnionBooleanArrayArray|Error bm4niouba = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm4niouba, [
        [(), ()],
        [(), ()]
    ]);

    NillableIntOrUnionBooleanArrayArray|Error bm5niouba = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, NillableIntOrUnionBooleanArrayArray);
    test:assertEquals(bm5niouba, [
        [true, false, (), true],
        [true, false, (), true]
    ]);
    
    JsonArray1Array|Error bm1ja = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, JsonArray1Array);
    test:assertEquals(bm1ja, [
        [true, false],
        [true, false]
    ]);

    JsonArray1Array|Error bm2ja = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, JsonArray1Array);
    test:assertEquals(bm2ja, [
        [true, false, null, null, null],
        [true, false, null, null, null]
    ]);

    JsonArray1Array|Error bm3ja = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, JsonArray1Array);
    test:assertEquals(bm3ja, [
        [true, false, null, false, 1],
        [true, false, null, false, 1]
    ]);

    JsonArray1Array|Error bm4ja = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, JsonArray1Array);
    test:assertEquals(bm4ja, [
        [(), ()],
        [(), ()]
    ]);

    JsonArray1Array|Error bm5ja = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, JsonArray1Array);
    test:assertEquals(bm5ja, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    AnydataArray1Array|Error bm1anyda = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, AnydataArray1Array);
    test:assertEquals(bm1anyda, [
        [true, false],
        [true, false]
    ]);

    AnydataArray1Array|Error bm2anyda = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, AnydataArray1Array);
    test:assertEquals(bm2anyda, [
        [true, false, null, null, null],
        [true, false, null, null, null]
    ]);

    AnydataArray1Array|Error bm3anyda = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, AnydataArray1Array);
    test:assertEquals(bm3anyda, [
        [true, false, null, false, 1],
        [true, false, null, false, 1]
    ]);

    AnydataArray1Array|Error bm4anyda = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, AnydataArray1Array);
    test:assertEquals(bm4anyda, [
        [(), ()],
        [(), ()]
    ]);

    AnydataArray1Array|Error bm5anyda = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, AnydataArray1Array);
    test:assertEquals(bm5anyda, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    StringArray1Array|Error bm1sa = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, StringArray1Array);
    test:assertTrue(bm1sa is Error);
    test:assertEquals((<Error>bm1sa).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringArray1Array|Error bm2sa = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, StringArray1Array);
    test:assertTrue(bm2sa is Error);
    test:assertEquals((<Error>bm2sa).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringArray1Array|Error bm3sa = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, StringArray1Array);
    test:assertTrue(bm3sa is Error);
    test:assertEquals((<Error>bm3sa).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringArray1Array|Error bm4sa = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, StringArray1Array);
    test:assertTrue(bm4sa is Error);
    test:assertEquals((<Error>bm4sa).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "string"));

    StringArray1Array|Error bm5sa = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, StringArray1Array);
    test:assertTrue(bm5sa is Error);
    test:assertEquals((<Error>bm5sa).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));
}

@test:Config
function testFromCsvWithTypeForMapAndTupleAsExpectedType() {
    BooleanTuple1Array|Error bm1bt = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, BooleanTuple1Array);
    test:assertEquals(bm1bt, [
        [true, false, false, false],
        [true, false, false, false]
    ]);

    BooleanTuple1Array|Error bm2bt = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, BooleanTuple1Array);
    test:assertTrue(bm2bt is Error);
    test:assertEquals((<Error>bm2bt).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple1Array|Error bm3bt = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, BooleanTuple1Array);
    test:assertTrue(bm3bt is Error);
    test:assertEquals((<Error>bm3bt).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple1Array|Error bm4bt = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, BooleanTuple1Array);
    test:assertTrue(bm4bt is Error);
    test:assertEquals((<Error>bm4bt).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanTuple1Array|Error bm5bt = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, BooleanTuple1Array);
    test:assertTrue(bm5bt is Error);
    test:assertEquals((<Error>bm5bt).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple2Array|Error bm1b2t = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, BooleanTuple2Array);
    test:assertEquals(bm1b2t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|Error bm2b2t = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, BooleanTuple2Array);
    test:assertEquals(bm2b2t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|Error bm3b2t = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, BooleanTuple2Array);
    test:assertEquals(bm3b2t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple2Array|Error bm4b2t = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, BooleanTuple2Array);
    test:assertTrue(bm4b2t is Error);
    test:assertEquals((<Error>bm4b2t).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanTuple2Array|Error bm5b2t = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, BooleanTuple2Array);
    test:assertEquals(bm5b2t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple3Array|Error bm1b3t = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, BooleanTuple3Array);
    test:assertEquals(bm1b3t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple3Array|Error bm2b3t = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, BooleanTuple3Array);
    test:assertTrue(bm2b3t is Error);
    test:assertEquals((<Error>bm2b3t).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple3Array|Error bm3b3t = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, BooleanTuple3Array);
    test:assertTrue(bm3b3t is Error);
    test:assertEquals((<Error>bm3b3t).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple3Array|Error bm4b3t = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, BooleanTuple3Array);
    test:assertTrue(bm4b3t is Error);
    test:assertEquals((<Error>bm4b3t).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanTuple3Array|Error bm5b3t = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, BooleanTuple3Array);
    test:assertTrue(bm5b3t is Error);
    test:assertEquals((<Error>bm5b3t).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple4Array|Error bm1b4t = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, BooleanTuple4Array);
    test:assertEquals(bm1b4t, [
        [true, false],
        [true, false]
    ]);

    BooleanTuple4Array|Error bm2b4t = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, BooleanTuple4Array);
    test:assertTrue(bm2b4t is Error);
    test:assertEquals((<Error>bm2b4t).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple4Array|Error bm3b4t = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, BooleanTuple4Array);
    test:assertTrue(bm3b4t is Error);
    test:assertEquals((<Error>bm3b4t).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    BooleanTuple4Array|Error bm4b4t = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, BooleanTuple4Array);
    test:assertTrue(bm4b4t is Error);
    test:assertEquals((<Error>bm4b4t).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "boolean"));

    BooleanTuple4Array|Error bm5b4t = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, BooleanTuple4Array);
    test:assertTrue(bm5b4t is Error);
    test:assertEquals((<Error>bm5b4t).message(), generateErrorMessageForInvalidValueForArrayType("null", "2", "boolean"));

    NillableBooleanTuple5Array|Error bm1nbt = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, NillableBooleanTuple5Array);
    test:assertEquals(bm1nbt, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableBooleanTuple5Array|Error bm2nbt = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, NillableBooleanTuple5Array);
    test:assertEquals(bm2nbt, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableBooleanTuple5Array|Error bm3nbt = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, NillableBooleanTuple5Array);
    test:assertTrue(bm3nbt is Error);
    test:assertEquals((<Error>bm3nbt).message(), generateErrorMessageForInvalidValueForArrayType("1", "4", "boolean?"));

    NillableBooleanTuple5Array|Error bm4nbt = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, NillableBooleanTuple5Array);
    test:assertEquals(bm4nbt, [
        [(), (), (), (), ()],
        [(), (), (), (), ()]
    ]);

    NillableBooleanTuple5Array|Error bm5nbt = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, NillableBooleanTuple5Array);
    test:assertEquals(bm5nbt, [
        [true, false, (), true, ()],
        [true, false, (), true, ()]
    ]);

    NillableBooleanTuple6Array|Error bm1nb6t = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, NillableBooleanTuple6Array);
    test:assertEquals(bm1nb6t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|Error bm2nb6t = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, NillableBooleanTuple6Array);
    test:assertEquals(bm2nb6t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|Error bm3nb6t = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, NillableBooleanTuple6Array);
    test:assertEquals(bm3nb6t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple6Array|Error bm4nb6t = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, NillableBooleanTuple6Array);
    test:assertEquals(bm4nb6t, [
        [(), ()],
        [(), ()]
    ]);

    NillableBooleanTuple6Array|Error bm5nb6t = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, NillableBooleanTuple6Array);
    test:assertEquals(bm5nb6t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple7Array|Error bm1nb7t = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, NillableBooleanTuple7Array);
    test:assertEquals(bm1nb7t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple7Array|Error bm2nb7t = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, NillableBooleanTuple7Array);
    test:assertEquals(bm2nb7t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableBooleanTuple7Array|Error bm3nb7t = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, NillableBooleanTuple7Array);
    test:assertTrue(bm3nb7t is Error);
    test:assertEquals((<Error>bm3nb7t).message(), generateErrorMessageForInvalidValueForArrayType("1", "4", "boolean?"));

    NillableBooleanTuple7Array|Error bm4nb7t = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, NillableBooleanTuple7Array);
    test:assertEquals(bm4nb7t, [
        [(), ()],
        [(), ()]
    ]);

    NillableBooleanTuple7Array|Error bm5nb7t = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, NillableBooleanTuple7Array);
    test:assertEquals(bm5nb7t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);
}

@test:Config
function testFromCsvWithTypeForMapAndTupleAsExpectedType2() {
    NillableBooleanTuple8Array|Error bm1nb8t = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, NillableBooleanTuple8Array);
    test:assertEquals(bm1nb8t, [
        [true, false],
        [true, false]
    ]);

    NillableBooleanTuple8Array|Error bm2nb8t = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, NillableBooleanTuple8Array);
    test:assertEquals(bm2nb8t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableBooleanTuple8Array|Error bm3nb8t = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, NillableBooleanTuple8Array);
    test:assertTrue(bm3nb8t is Error);
    test:assertEquals((<Error>bm3nb8t).message(), generateErrorMessageForInvalidValueForArrayType("1", "4", "boolean?"));

    NillableBooleanTuple8Array|Error bm4nb8t = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, NillableBooleanTuple8Array);
    test:assertEquals(bm4nb8t, [
        [(), ()],
        [(), ()]
    ]);

    NillableBooleanTuple8Array|Error bm5nb8t = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, NillableBooleanTuple8Array);
    test:assertEquals(bm5nb8t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    NillableIntBooleanTuple9Array|Error bm1nb9t = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm1nb9t, [
        [true, false],
        [true, false]
    ]);

    NillableIntBooleanTuple9Array|Error bm2nb9t = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm2nb9t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    NillableIntBooleanTuple9Array|Error bm3nb9t = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm3nb9t, [
        [true, false, (), false, 1],
        [true, false, (), false, 1]
    ]);

    NillableIntBooleanTuple9Array|Error bm4nb9t = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm4nb9t, [
        [(), ()],
        [(), ()]
    ]);

    NillableIntBooleanTuple9Array|Error bm5nb9t = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, NillableIntBooleanTuple9Array);
    test:assertEquals(bm5nb9t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    NilTuple3Array|Error bm1n3t = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, NilTuple3Array);
    test:assertTrue(bm1n3t is Error);
    test:assertEquals((<Error>bm1n3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "()"));

    NilTuple3Array|Error bm2n3t = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, NilTuple3Array);
    test:assertTrue(bm2n3t is Error);
    test:assertEquals((<Error>bm2n3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "()"));

    NilTuple3Array|Error bm3n3t = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, NilTuple3Array);
    test:assertTrue(bm3n3t is Error);
    test:assertEquals((<Error>bm3n3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "()"));

    NilTuple3Array|Error bm4n3t = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, NilTuple3Array);
    test:assertEquals(bm4n3t, [
        [(), ()],
        [(), ()]
    ]);

    NilTuple3Array|Error bm5n3t = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, NilTuple3Array);
    test:assertTrue(bm5n3t is Error);
    test:assertEquals((<Error>bm5n3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "()"));
}

@test:Config
function testFromCsvWithTypeForMapAndArrayAsExpectedType2() {

    AnydataTuple3Array|Error bm1anyd3t = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, AnydataTuple3Array);
    test:assertEquals(bm1anyd3t, [
        [true, false],
        [true, false]
    ]);

    AnydataTuple3Array|Error bm2anyd3t = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, AnydataTuple3Array);
    test:assertEquals(bm2anyd3t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    AnydataTuple3Array|Error bm3anyd3t = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, AnydataTuple3Array);
    test:assertEquals(bm3anyd3t, [
        [true, false, (), false, 1],
        [true, false, (), false, 1]
    ]);

    AnydataTuple3Array|Error bm4anyd3t = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, AnydataTuple3Array);
    test:assertEquals(bm4anyd3t, [
        [(), ()],
        [(), ()]
    ]);

    AnydataTuple3Array|Error bm5anyd3t = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, AnydataTuple3Array);
    test:assertEquals(bm5anyd3t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    JsonTuple3Array|Error bm1j3t = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, JsonTuple3Array);
    test:assertEquals(bm1j3t, [
        [true, false],
        [true, false]
    ]);

    JsonTuple3Array|Error bm2j3t = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, JsonTuple3Array);
    test:assertEquals(bm2j3t, [
        [true, false, (), (), ()],
        [true, false, (), (), ()]
    ]);

    JsonTuple3Array|Error bm3j3t = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, JsonTuple3Array);
    test:assertEquals(bm3j3t, [
        [true, false, (), false, 1],
        [true, false, (), false, 1]
    ]);

    JsonTuple3Array|Error bm4j3t = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, JsonTuple3Array);
    test:assertEquals(bm4j3t, [
        [(), ()],
        [(), ()]
    ]);

    JsonTuple3Array|Error bm5j3t = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, JsonTuple3Array);
    test:assertEquals(bm5j3t, [
        [true, false, (), true],
        [true, false, (), true]
    ]);

    StringTuple3Array|Error bm1s3t = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {}, StringTuple3Array);
    test:assertTrue(bm1s3t is Error);
    test:assertEquals((<Error>bm1s3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringTuple3Array|Error bm2s3t = parseRecordAsListType([bm2, bm2], ["b1", "b2", "b3", "n1", "n3"], {}, StringTuple3Array);
    test:assertTrue(bm2s3t is Error);
    test:assertEquals((<Error>bm2s3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringTuple3Array|Error bm3s3t = parseRecordAsListType([bm3, bm3], ["b1", "b2", "b3", "b4", "i1"], {}, StringTuple3Array);
    test:assertTrue(bm3s3t is Error);
    test:assertEquals((<Error>bm3s3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));

    StringTuple3Array|Error bm4s3t = parseRecordAsListType([bm4, bm4], ["n1", "n3"], {}, StringTuple3Array);
    test:assertTrue(bm4s3t is Error);
    test:assertEquals((<Error>bm4s3t).message(), generateErrorMessageForInvalidValueForArrayType("null", "0", "string"));

    StringTuple3Array|Error bm5s3t = parseRecordAsListType([bm5, bm5], ["b1", "b2", "b3", "b4"], {}, StringTuple3Array);
    test:assertTrue(bm5s3t is Error);
    test:assertEquals((<Error>bm5s3t).message(), generateErrorMessageForInvalidValueForArrayType("true", "0", "string"));
}
