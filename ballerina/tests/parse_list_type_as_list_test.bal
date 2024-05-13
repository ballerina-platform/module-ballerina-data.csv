import ballerina/test;

// boolean enable = true;

// // @test:Config {enable: !enable}
// // function debugTest() {
// //     BooleanRecord1Array|CsvConversionError csvb4br1 = parseStringToRecord(csvStringWithBooleanValues4, {});
// //     test:assertEquals(csvb4br1, [
// //         {b1: true, b2: "()", b3: (), b4: false},
// //         {b1: true, b2: "()", b3: (), b4: false}
// //     ]);
// // }

@test:Config {enable}
function testFromCsvWithTypeForTupleAndTupleAsExpectedType() {
    StringTuple1Array|CsvConversionError st1st1 = parseListAsListType([st1, st1], {}, StringTuple1Array);
    test:assertEquals(st1st1, [
        [s1, s2, "", ""],
        [s1, s2, "", ""]
    ]);

    StringTuple1Array|CsvConversionError st2st1 = parseListAsListType([st2, st2], {}, StringTuple1Array);
    test:assertEquals(st2st1, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);
    StringTuple1Array|CsvConversionError st3st1 = parseListAsListType([st3, st3], {}, StringTuple1Array);
    test:assertEquals(st3st1, [
        [s1, s2, "", ""],
        [s1, s2, "", ""]
    ]);

    StringTuple1Array|CsvConversionError st4st1 = parseListAsListType([st4, st4], {}, StringTuple1Array);
    test:assertEquals(st4st1, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    StringTuple2Array|CsvConversionError st1st2 = parseListAsListType([st1, st1], {}, StringTuple2Array);
    test:assertEquals(st1st2, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple2Array|CsvConversionError st2st2 = parseListAsListType([st2, st2], {}, StringTuple2Array);
    test:assertEquals(st2st2, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple2Array|CsvConversionError st3st2 = parseListAsListType([st3, st3], {}, StringTuple2Array);
    test:assertEquals(st3st2, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple2Array|CsvConversionError st4st2 = parseListAsListType([st4, st4], {}, StringTuple2Array);
    test:assertEquals(st4st2, [
        [s1, s2],
        [s1, s2]
    ]);    

    StringTuple3Array|CsvConversionError st1st3 = parseListAsListType([st1, st1], {}, StringTuple3Array);
    test:assertEquals(st1st3, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple3Array|CsvConversionError st2st3 = parseListAsListType([st2, st2], {}, StringTuple3Array);
    test:assertEquals(st2st3, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    StringTuple3Array|CsvConversionError st3st3 = parseListAsListType([st3, st3], {}, StringTuple3Array);
    test:assertEquals(st3st3, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple3Array|CsvConversionError st4st3 = parseListAsListType([st4, st4], {}, StringTuple3Array);
    test:assertEquals(st4st3, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    StringTuple4Array|CsvConversionError st1st4 = parseListAsListType([st1, st1], {}, StringTuple4Array);
    test:assertEquals(st1st4, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple4Array|CsvConversionError st2st4 = parseListAsListType([st2, st2], {}, StringTuple4Array);
    test:assertEquals(st2st4, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    StringTuple4Array|CsvConversionError st3st4 = parseListAsListType([st3, st3], {}, StringTuple4Array);
    test:assertEquals(st3st4, [
        [s1, s2],
        [s1, s2]
    ]);

    StringTuple4Array|CsvConversionError st4st4 = parseListAsListType([st4, st4], {}, StringTuple4Array);
    test:assertEquals(st4st4, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    AnydataTuple3Array|CsvConversionError st1anydt3 = parseListAsListType([st1, st1], {}, AnydataTuple3Array);
    test:assertEquals(st1anydt3, [
        [s1, s2],
        [s1, s2]
    ]);

    AnydataTuple3Array|CsvConversionError st2anydt3 = parseListAsListType([st2, st2], {}, AnydataTuple3Array);
    test:assertEquals(st2anydt3, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    AnydataTuple3Array|CsvConversionError st3anydt3 = parseListAsListType([st3, st3], {}, AnydataTuple3Array);
    test:assertEquals(st3anydt3, [
        [s1, s2],
        [s1, s2]
    ]);

    AnydataTuple3Array|CsvConversionError st4anydt3 = parseListAsListType([st4, st4], {}, AnydataTuple3Array);
    test:assertEquals(st4anydt3, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    JsonTuple3Array|CsvConversionError st1jt3 = parseListAsListType([st1, st1], {}, JsonTuple3Array);
    test:assertEquals(st1jt3, [
        [s1, s2],
        [s1, s2]
    ]);

    JsonTuple3Array|CsvConversionError st2jt3 = parseListAsListType([st2, st2], {}, JsonTuple3Array);
    test:assertEquals(st2jt3, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    JsonTuple3Array|CsvConversionError st3jt3 = parseListAsListType([st3, st3], {}, JsonTuple3Array);
    test:assertEquals(st3jt3, [
        [s1, s2],
        [s1, s2]
    ]);

    JsonTuple3Array|CsvConversionError st4jt3 = parseListAsListType([st4, st4], {}, JsonTuple3Array);
    test:assertEquals(st4jt3, [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    DecimalTuple4Array|CsvConversionError st1dta = parseListAsListType([st1, st1], {}, DecimalTuple4Array);
    test:assertTrue(st1dta is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1dta).message(), generateErrorMessageForInvalidValueForArrayType("string", "0", "decimal"));

    IntegerTuple3Array|CsvConversionError st2bta = parseListAsListType([st2, st2], {}, IntegerTuple3Array);
    test:assertTrue(st2bta is CsvConversionError);
    test:assertEquals((<CsvConversionError>st2bta).message(), generateErrorMessageForInvalidValueForArrayType("string", "0", "int"));

    NilTuple3Array|CsvConversionError st3nta = parseListAsListType([st3, st3], {}, NilTuple3Array);
    test:assertTrue(st3nta is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3nta).message(), generateErrorMessageForInvalidValueForArrayType("string", "0", "()"));

    BooleanTuple4Array|CsvConversionError st4bta = parseListAsListType([st4, st4], {}, BooleanTuple4Array);
    test:assertTrue(st4bta is CsvConversionError);
    test:assertEquals((<CsvConversionError>st4bta).message(), generateErrorMessageForInvalidValueForArrayType("string", "0", "boolean"));
}


@test:Config {enable}
function testFromCsvWithTypeForTupleAndArrayAsExpectedType() {
    StringArrayArray|CsvConversionError st1saa = parseListAsListType([st1, st1], {}, StringArrayArray);
    test:assertEquals(st1saa , [
        [s1, s2],
        [s1, s2]
    ]);

    StringArrayArray|CsvConversionError st2saa = parseListAsListType([st2, st2], {}, StringArrayArray);
    test:assertEquals(st2saa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    StringArrayArray|CsvConversionError st3saa = parseListAsListType([st3, st3], {}, StringArrayArray);
    test:assertEquals(st3saa , [
        [s1, s2],
        [s1, s2]
    ]);

    StringArrayArray|CsvConversionError st4saa = parseListAsListType([st4, st4], {}, StringArrayArray);
    test:assertEquals(st4saa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    NillableStringArrayArray|CsvConversionError st1nsaa = parseListAsListType([st1, st1], {}, NillableStringArrayArray);
    test:assertEquals(st1nsaa , [
        [s1, s2],
        [s1, s2]
    ]);

    NillableStringArrayArray|CsvConversionError st2nsaa = parseListAsListType([st2, st2], {}, NillableStringArrayArray);
    test:assertEquals(st2nsaa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    NillableStringArrayArray|CsvConversionError st3nsaa = parseListAsListType([st3, st3], {}, NillableStringArrayArray);
    test:assertEquals(st3nsaa , [
        [s1, s2],
        [s1, s2]
    ]);

    NillableStringArrayArray|CsvConversionError st4nsaa = parseListAsListType([st4, st4], {}, NillableStringArrayArray);
    test:assertEquals(st4nsaa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    NillableIntOrUnionStringArrayArray|CsvConversionError st1nsuiaa = parseListAsListType([st1, st1], {}, NillableIntOrUnionStringArrayArray);
    test:assertEquals(st1nsuiaa , [
        [s1, s2],
        [s1, s2]
    ]);

    NillableIntOrUnionStringArrayArray|CsvConversionError st2nsuiaa = parseListAsListType([st2, st2], {}, NillableIntOrUnionStringArrayArray);
    test:assertEquals(st2nsuiaa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    NillableIntOrUnionStringArrayArray|CsvConversionError st3nsuiaa = parseListAsListType([st3, st3], {}, NillableIntOrUnionStringArrayArray);
    test:assertEquals(st3nsuiaa , [
        [s1, s2],
        [s1, s2]
    ]);

    NillableIntOrUnionStringArrayArray|CsvConversionError st4nsuiaa = parseListAsListType([st4, st4], {}, NillableIntOrUnionStringArrayArray);
    test:assertEquals(st4nsuiaa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    StringArray2Array|CsvConversionError st1saa2 = parseListAsListType([st1, st1], {}, StringArray2Array);
    test:assertEquals(st1saa2 , [
        [s1, s2],
        [s1, s2]
    ]);

    StringArray2Array|CsvConversionError st2saa2 = parseListAsListType([st2, st2], {}, StringArray2Array);
    test:assertEquals(st2saa2 , [
        [s1, s2],
        [s1, s2]
    ]);

    StringArray2Array|CsvConversionError st3saa2 = parseListAsListType([st3, st3], {}, StringArray2Array);
    test:assertEquals(st3saa2 , [
        [s1, s2],
        [s1, s2]
    ]);

    StringArray2Array|CsvConversionError st4saa2 = parseListAsListType([st4, st4], {}, StringArray2Array);
    test:assertEquals(st4saa2 , [
        [s1, s2],
        [s1, s2]
    ]);

    JsonArray1Array|CsvConversionError st1jaa = parseListAsListType([st1, st1], {}, JsonArray1Array);
    test:assertEquals(st1jaa , [
        [s1, s2],
        [s1, s2]
    ]);

    JsonArray1Array|CsvConversionError st2jaa = parseListAsListType([st2, st2], {}, JsonArray1Array);
    test:assertEquals(st2jaa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    JsonArray1Array|CsvConversionError st3jaa = parseListAsListType([st3, st3], {}, JsonArray1Array);
    test:assertEquals(st3jaa , [
        [s1, s2],
        [s1, s2]
    ]);

    JsonArray1Array|CsvConversionError st4jaa = parseListAsListType([st4, st4], {}, JsonArray1Array);
    test:assertEquals(st4jaa , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    AnydataArray1Array|CsvConversionError st1anyda = parseListAsListType([st1, st1], {}, AnydataArray1Array);
    test:assertEquals(st1anyda , [
        [s1, s2],
        [s1, s2]
    ]);

    AnydataArray1Array|CsvConversionError st2anyda = parseListAsListType([st2, st2], {}, AnydataArray1Array);
    test:assertEquals(st2anyda , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    AnydataArray1Array|CsvConversionError st3anyda = parseListAsListType([st3, st3], {}, AnydataArray1Array);
    test:assertEquals(st3anyda , [
        [s1, s2],
        [s1, s2]
    ]);

    AnydataArray1Array|CsvConversionError st4anyda = parseListAsListType([st4, st4], {}, AnydataArray1Array);
    test:assertEquals(st4anyda , [
        [s1, s2, s3, s2],
        [s1, s2, s3, s2]
    ]);

    DecimalArray1Array|CsvConversionError st1dda = parseListAsListType([st1, st1], {}, DecimalArray1Array);
    test:assertTrue(st1dda is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1dda).message(), generateErrorMessageForInvalidValueForArrayType("string", "0", "decimal"));

    DecimalArray1Array|CsvConversionError st3dda = parseListAsListType([st3, st3], {}, DecimalArray1Array);
    test:assertTrue(st3dda is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3dda).message(), generateErrorMessageForInvalidValueForArrayType("string", "0", "decimal"));
}
