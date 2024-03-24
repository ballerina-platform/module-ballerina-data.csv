import ballerina/test;

@test:Config{enable}
function testStartNumbers() {

}

@test:Config{enable} 
function testCustomHeaders() {

    // headers config parameter

    record {}[]|CsvConversionError v1 = fromCsvStringWithType(csvStringData1, config21);
    test:assertEquals(v1, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0, '6: ()},
        {'1: 1, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ]);

    CustomRecord28Array|CsvConversionError v2 = fromCsvStringWithType(csvStringData1, config21);
    test:assertEquals(v2, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: "1", '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: "1", '2: "string2", '3: false, '4: 0, '5: 0, '6: ()},
        {'1: "1", '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: "1", '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: ()},
        {'1: "1", '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ]);
    

    CustomRecord29Array|CsvConversionError v3 = fromCsvStringWithType(csvStringData1, config21);
    test:assertTrue(v3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>v3).message(), generateErrorMessageForInvalidCast("a", "int"));

    CustomRecord30Array|CsvConversionError v4 = fromCsvStringWithType(csvStringData1, config21);
    test:assertEquals(v4, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: "1", '2: "string1", '3: "true", '4: "2.234", '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: "false", '4: "0", '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: "0", '4: "1.23", '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: "1", '4: "-6.51", '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: "true", '4: "3", '5: "3", '6: "()"}
    ]);

    CustomRecord31Array|CsvConversionError v5 = fromCsvStringWithType(csvStringData1, config21);
    test:assertEquals(v5, [
        {'1: "a", '6: "f"},
        {'1: "1", '6: "()"},
        {'1: "1", '6: "null"},
        {'1: "1", '6: "()"},
        {'1: "1", '6: "()"},
        {'1: "1", '6: "()"}
    ]);
    

    CustomRecord32Array|CsvConversionError v6 = fromCsvStringWithType(csvStringData1, config21);
    test:assertTrue(v6 is CsvConversionError);
    test:assertEquals((<CsvConversionError>v3).message(), generateErrorMessageForInvalidCast("a", "int"));

    CustomRecord33Array|CsvConversionError v7 = fromCsvStringWithType(csvStringData1, config21);
    test:assertEquals(v7, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: "1", '2: "string1", '3: "true", '4: "2.234", '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: "false", '4: "0", '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: "0", '4: "1.23", '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: "1", '4: "-6.51", '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: "true", '4: "3", '5: "3", '6: "()"}
    ]);

    CustomRecord34Array|CsvConversionError v8 = fromCsvStringWithType(csvStringData1, config21);
    test:assertEquals(v8, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: "1", '2: "string1", '3: true, '4: 2.234, '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: false, '4: 0, '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: 0, '4: 1.23, '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: 1, '4: -6.51, '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: true, '4: 3, '5: "3", '6: "()"}
    ]);

    CustomRecord35Array|CsvConversionError v9 = fromCsvStringWithType(csvStringData1, config21);
    test:assertEquals(v9, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f", '9: ""},
        {'1: "1", '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: "()", '9: ""},
        {'1: "1", '2: "string2", '3: false, '4: 0, '5: 0, '6: "null", '9: ""},
        {'1: "1", '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: "()", '9: ""},
        {'1: "1", '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: "()", '9: ""},
        {'1: "1", '2: "string5", '3: true, '4: 3, '5: 3, '6: "()", '9: ""}
    ]);

    CustomRecord36Array|CsvConversionError v10 = fromCsvStringWithType(csvStringData1, config21);
    test:assertEquals(v10, [
        {'1: "a", '6: "f", '9: ""},
        {'1: "1", '6: "()", '9: ""},
        {'1: "1", '6: "null", '9: ""},
        {'1: "1", '6: "()", '9: ""},
        {'1: "1", '6: "()", '9: ""},
        {'1: "1", '6: "()", '9: ""}
    ]);

    CustomRecord37Array|CsvConversionError v11 = fromCsvStringWithType(csvStringData1, config21);
    test:assertEquals(v11, [
        {'1: "a", '5: "e", '6: "f"},
        {'1: "1", '5: "2.234", '6: "()"},
        {'1: "1", '5: "0", '6: "null"},
        {'1: "1", '5: "1.23", '6: "()"},
        {'1: "1", '5: "-6.51", '6: "()"},
        {'1: "1", '5: "3", '6: "()"}
    ]);

    CustomRecord38Array|CsvConversionError v12 = fromCsvStringWithType(csvStringData1, config21);
    test:assertEquals(v12, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: "1", '2: "string1", '3: "true", '4: "2.234", '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: "false", '4: "0", '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: "0", '4: "1.23", '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: "1", '4: "-6.51", '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: "true", '4: "3", '5: "3", '6: "()"}
    ]);

    CustomRecord39Array|CsvConversionError v13 = fromCsvStringWithType(csvStringData1, config21);
    test:assertEquals(v13, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: "1", '2: "string1", '3: "true", '4: "2.234", '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: "false", '4: "0", '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: "0", '4: "1.23", '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: "1", '4: "-6.51", '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: "true", '4: "3", '5: "3", '6: "()"}
    ]);

    CustomRecord40Array|CsvConversionError v14 = fromCsvStringWithType(csvStringData3, config21);
    test:assertEquals(v14, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: "2.234", '6: "()"},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: "0", '6: "null"},
        {'1: 1, '2: "string3", '3: 0, '4: 1.23, '5: "1.23", '6: "()"},
        {'1: 1, '2: "string4", '3: 1, '4: -6.51, '5: "-6.51", '6: "()"},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: "3", '6: "()"}
    ]);

    CustomRecord41Array|CsvConversionError v15 = fromCsvStringWithType(csvStringData2, config21);
    test:assertEquals(v15, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0, '6: null},
        {'1: 1, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ]);

    CustomRecord42Array|CsvConversionError v16 = fromCsvStringWithType(csvStringData6, config21);
    test:assertEquals(v16, <CustomRecord42[]>[
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0.0, '6: null},
        {'1: 1, '2: "string3", '3: false, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: true, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3.0, '6: ()}
    ]);

    CustomRecord43Array|CsvConversionError v17 = fromCsvStringWithType(csvStringData6, config21);
    test:assertEquals(v17, <CustomRecord43[]>[
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0.0, '6: null},
        {'1: 1, '2: "string3", '3: false, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: true, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3.0, '6: ()}
    ]);

    CustomRecord44Array|CsvConversionError v18 = fromCsvStringWithType(csvStringData6, config21);
    test:assertEquals(v18, <CustomRecord44[]>[
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0.0, '6: null},
        {'1: 1, '2: "string3", '3: false, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: true, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3.0, '6: ()}
    ]);

    CustomRecord45Array|CsvConversionError v19 = fromCsvStringWithType(csvStringData6, config21);
    test:assertTrue(v19 is CsvConversionError);
    test:assertEquals((<CsvConversionError>v19).message(), generateErrorMessageForMissingRequiredField("H1"));

    CustomRecord46Array|CsvConversionError v19_2 = fromCsvStringWithType(csvStringData6, config21);
    test:assertTrue(v19_2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>v19_2).message(), generateErrorMessageForMissingRequiredField("H1"));

    CustomRecord47Array|CsvConversionError v19_3 = fromCsvStringWithType(csvStringData6, config21);
    test:assertTrue(v19_3 is CsvConversionError);
    test:assertEquals((<CsvConversionError>v19_3).message(), generateErrorMessageForMissingRequiredField("H1"));

    CustomRecord56Array|CsvConversionError v19_4 = fromCsvStringWithType(csvStringData1, config21);
    test:assertEquals(v19_4, [
        {H1: "", H4: "", '1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {H1: "", H4: "", '1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {H1: "", H4: "", '1: 1, '2: "string2", '3: false, '4: 0, '5: 0, '6: null},
        {H1: "", H4: "", '1: 1, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {H1: "", H4: "", '1: 1, '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: ()},
        {H1: "", H4: "", '1: 1, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ]);

    // custom header config parameter

    CustomRecord46Array|CsvConversionError v20 = fromCsvStringWithType(csvStringData6, config22);
    test:assertEquals(v20, <CustomRecord46[]>[
        {H1: 1, H2: "string1", H3: true, H4: 2.234, H5: 2.234, H6: ()},
        {H1: 1, H2: "string2", H3: false, H4: 0, H5: 0.0, H6: null},
        {H1: 1, H2: "string3", H3: false, H4: 1.23, H5: 1.23, H6: ()},
        {H1: 1, H2: "string4", H3: true, H4: -6.51, H5: -6.51, H6: ()},
        {H1: 1, H2: "string5", H3: true, H4: 3, H5: 3.0, H6: ()}
    ]);

    CustomRecord46Array|CsvConversionError v20_2 = fromCsvStringWithType(csvStringData6, config22);
    test:assertEquals(v20_2, <CustomRecord46[]>[
        {H1: 1, H2: "string1", H3: true, H4: 2.234, H5: 2.234, H6: ()},
        {H1: 1, H2: "string2", H3: false, H4: 0, H5: 0.0, H6: null},
        {H1: 1, H2: "string3", H3: false, H4: 1.23, H5: 1.23, H6: ()},
        {H1: 1, H2: "string4", H3: true, H4: -6.51, H5: -6.51, H6: ()},
        {H1: 1, H2: "string5", H3: true, H4: 3, H5: 3.0, H6: ()}
    ]);

    CustomRecord47Array|CsvConversionError v21 = fromCsvStringWithType(csvStringData6, config22);
    test:assertEquals(v21, <CustomRecord47[]>[
        {H1: 1, H2: "string1", H3: true, H4: 2.234, H5: 2.234, H6: ()},
        {H1: 1, H2: "string2", H3: false, H4: 0, H5: 0.0, H6: null},
        {H1: 1, H2: "string3", H3: false, H4: 1.23, H5: 1.23, H6: ()},
        {H1: 1, H2: "string4", H3: true, H4: -6.51, H5: -6.51, H6: ()},
        {H1: 1, H2: "string5", H3: true, H4: 3, H5: 3.0, H6: ()}
    ]);

    CustomRecord48Array|CsvConversionError v22 = fromCsvStringWithType(csvStringData6, config22);
    test:assertEquals(v22, [
        {H1: "1", H2: "string1", H3: "true", H4: "2.234", H5: "2.234", H6: "()"},
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ]);

    CustomRecord48Array|CsvConversionError v22_2 = fromCsvStringWithType(csvStringData1, config22);
    test:assertEquals(v22_2, [
        {H1: "a", H2: "b", H3: "c", H4: "d", H5: "e", H6: "f"},
        {H1: "1", H2: "string1", H3: "true", H4: "2.234", H5: "2.234", H6: "()"},
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ]);

    CustomRecord49Array|CsvConversionError v23 = fromCsvStringWithType(csvStringData6, config22);
    test:assertEquals(v23, [
        {H1: "1", H2: "string1", H3: "true", H4: "2.234", H5: "2.234", H6: "()"},
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ]);

    CustomRecord50Array|CsvConversionError v24 = fromCsvStringWithType(csvStringData6, config22);
    test:assertEquals(v24, [
        {H1: 1, H4: 2.234, H2: "string1", H3: true, H5: 2.234, H6: ()},
        {H1: 1, H4: 0.0, H2: "string2", H3: false, H5: 0, H6: null},
        {H1: 1, H4: 1.23, H2: "string3", H3: 0, H5: 1.23, H6: ()},
        {H1: 1, H4: -6.51, H2: "string4", H3: 1, H5: -6.51, H6: ()},
        {H1: 1, H4: 3.0, H2: "string5", H3: true, H5: 3, H6: ()}
    ]);

    CustomRecord50Array|CsvConversionError v24_2 = fromCsvStringWithType(csvStringData1, config22);
    test:assertTrue(v24_2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>v24_2).message(), generateErrorMessageForInvalidCast("a", "int"));

    CustomRecord51Array|CsvConversionError v25 = fromCsvStringWithType(csvStringData6, config22);
    test:assertEquals(v25, [
        {H1: 1, H4: 2.234},
        {H1: 1, H4: 0.0},
        {H1: 1, H4: 1.23},
        {H1: 1, H4: -6.51},
        {H1: 1, H4: 3.0}
    ]);

    CustomRecord52Array|CsvConversionError v26 = fromCsvStringWithType(csvStringData6, config22);
    test:assertEquals(v26, [
        {H1: "1", H2: "string1", H3: "true", H4: "2.234", H5: "2.234", H6: "()"},
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ]);

    CustomRecord52Array|CsvConversionError v26_2 = fromCsvStringWithType(csvStringData1, config22);
    test:assertEquals(v26_2, [
        {H1: "a", H2: "b", H3: "c", H4: "d", H5: "e", H6: "f"},
        {H1: "1", H2: "string1", H3: "true", H4: "2.234", H5: "2.234", H6: "()"},
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ]);

    CustomRecord53Array|CsvConversionError v27 = fromCsvStringWithType(csvStringData6, config22);
    test:assertEquals(v27, <CustomRecord53[]>[
        {H1: 1, H4: 2.234, "H5": 2.234},
        {H1: 1, H4: 0.0, "H5": 0},
        {H1: 1, H4: 1.23, "H3": 0, "H5": 1.23},
        {H1: 1, H4: -6.51, "H3": 1, "H5": -6.51},
        {H1: 1, H4: 3.0, "H5": 3}
    ]);

    CustomRecord53Array|CsvConversionError v27_2 = fromCsvStringWithType(csvStringData1, config22);
    test:assertTrue(v27_2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>v27_2).message(), generateErrorMessageForInvalidCast("a", "int"));

    CustomRecord53Array|CsvConversionError v28 = fromCsvStringWithType(csvStringData1, config21);
    test:assertTrue(v28 is CsvConversionError);
    test:assertEquals((<CsvConversionError>v28).message(), generateErrorMessageForMissingRequiredField("H4"));

    CustomRecord53Array|CsvConversionError v28_2 = fromCsvStringWithType(csvStringData6, config21);
    test:assertTrue(v28_2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>v28_2).message(), generateErrorMessageForMissingRequiredField("H4"));

    CustomRecord54Array|CsvConversionError v29 = fromCsvStringWithType(csvStringData1, config22);
    test:assertTrue(v29 is CsvConversionError);
    test:assertEquals((<CsvConversionError>v29).message(), generateErrorMessageForMissingRequiredField("1"));

    CustomRecord54Array|CsvConversionError v29_2 = fromCsvStringWithType(csvStringData1, config22);
    test:assertTrue(v29_2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>v29_2).message(), generateErrorMessageForMissingRequiredField("1"));

    CustomRecord55Array|CsvConversionError v30 = fromCsvStringWithType(csvStringData6, config22);
    test:assertEquals(v30, [
        {H1: "1", H4: "2.234",'1: 10},
        {H1: "1", H4: "0", '1: 10},
        {H1: "1", H4: "1.23", '1: 10},
        {H1: "1", H4: "-6.51", '1: 10},
        {H1: "1", H4: "3", '1: 10}
    ]);

    CustomRecord55Array|CsvConversionError v30_2 = fromCsvStringWithType(csvStringData1, config21);
    test:assertTrue(v30_2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>v30_2).message(), generateErrorMessageForInvalidCast("a", "int"));
}

boolean enable = true;

@test:Config{enable: !enable}
function test() {
    CustomRecord46Array|CsvConversionError v20 = fromCsvStringWithType(csvStringData6, config22);
    test:assertEquals(v20, <CustomRecord46[]>[
        {H1: 1, H2: "string1", H3: true, H4: 2.234, H5: 2.234, H6: ()},
        {H1: 1, H2: "string2", H3: false, H4: 0, H5: 0.0, H6: null},
        {H1: 1, H2: "string3", H3: false, H4: 1.23, H5: 1.23, H6: ()},
        {H1: 1, H2: "string4", H3: true, H4: -6.51, H5: -6.51, H6: ()},
        {H1: 1, H2: "string5", H3: true, H4: 3, H5: 3.0, H6: ()}
    ]);
}
