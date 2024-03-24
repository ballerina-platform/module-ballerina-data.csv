import ballerina/test;

@test:Config{enable}
function testStartNumbers() {
    
}

@test:Config{enable} 
function testCustomHeaders() {
    testHeaderConfigWithFalseValue();
    testSkipHeaderConfigWithFalseValue({skipHeaders: true});
    testHeaderConfigWithFalseValue(config34);
    testCustomHeadersPresentConfigs();
    testCustomHeadersWithFalseHeadersPresentConfigs();
    testCustomHeadersWithFalseHeadersPresentConfigs(config36);
    testCustomHeadersPresentConfigs(config24);
}

function testCustomHeadersWithFalseHeadersPresentConfigs(FromCSVConfig config = config23) {
    CustomRecord46Array|CsvConversionError v20 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v20, <CustomRecord46[]>[
        {H1: 1, H2: "string1", H3: true, H4: 2.234, H5: 2.234, H6: ()},
        {H1: 1, H2: "string2", H3: false, H4: 0, H5: 0.0, H6: null},
        {H1: 1, H2: "string3", H3: false, H4: 1.23, H5: 1.23, H6: ()},
        {H1: 1, H2: "string4", H3: true, H4: -6.51, H5: -6.51, H6: ()},
        {H1: 1, H2: "string5", H3: true, H4: 3, H5: 3.0, H6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord46Array|CsvConversionError v20_2 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v20_2, <CustomRecord46[]>[
        {H1: 1, H2: "string1", H3: true, H4: 2.234, H5: 2.234, H6: ()},
        {H1: 1, H2: "string2", H3: false, H4: 0, H5: 0.0, H6: null},
        {H1: 1, H2: "string3", H3: false, H4: 1.23, H5: 1.23, H6: ()},
        {H1: 1, H2: "string4", H3: true, H4: -6.51, H5: -6.51, H6: ()},
        {H1: 1, H2: "string5", H3: true, H4: 3, H5: 3.0, H6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord47Array|CsvConversionError v21 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v21, <CustomRecord47[]>[
        {H1: 1, H2: "string1", H3: true, H4: 2.234, H5: 2.234, H6: ()},
        {H1: 1, H2: "string2", H3: false, H4: 0, H5: 0.0, H6: null},
        {H1: 1, H2: "string3", H3: false, H4: 1.23, H5: 1.23, H6: ()},
        {H1: 1, H2: "string4", H3: true, H4: -6.51, H5: -6.51, H6: ()},
        {H1: 1, H2: "string5", H3: true, H4: 3, H5: 3.0, H6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord48Array|CsvConversionError v22 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v22, [
        {H1: "1", H2: "string1", H3: "true", H4: "2.234", H5: "2.234", H6: "()"},
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord48Array|CsvConversionError v22_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v22_2, [
        {H1: "a", H2: "b", H3: "c", H4: "d", H5: "e", H6: "f"},
        {H1: "1", H2: "string1", H3: "true", H4: "2.234", H5: "2.234", H6: "()"},
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord49Array|CsvConversionError v23 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v23, [
        {H1: "1", H2: "string1", H3: "true", H4: "2.234", H5: "2.234", H6: "()"},
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord50Array|CsvConversionError v24 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v24, [
        {H1: 1, H4: 2.234, H2: "string1", H3: true, H5: 2.234, H6: ()},
        {H1: 1, H4: 0.0, H2: "string2", H3: false, H5: 0, H6: null},
        {H1: 1, H4: 1.23, H2: "string3", H3: 0, H5: 1.23, H6: ()},
        {H1: 1, H4: -6.51, H2: "string4", H3: 1, H5: -6.51, H6: ()},
        {H1: 1, H4: 3.0, H2: "string5", H3: true, H5: 3, H6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord50Array|CsvConversionError v24_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v24_2 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v24_2).message(), generateErrorMessageForInvalidCast("a", "int"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord51Array|CsvConversionError v25 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v25, [
        {H1: 1, H4: 2.234},
        {H1: 1, H4: 0.0},
        {H1: 1, H4: 1.23},
        {H1: 1, H4: -6.51},
        {H1: 1, H4: 3.0}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord52Array|CsvConversionError v26 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v26, [
        {H1: "1", H2: "string1", H3: "true", H4: "2.234", H5: "2.234", H6: "()"},
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord52Array|CsvConversionError v26_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v26_2, [
        {H1: "a", H2: "b", H3: "c", H4: "d", H5: "e", H6: "f"},
        {H1: "1", H2: "string1", H3: "true", H4: "2.234", H5: "2.234", H6: "()"},
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord53Array|CsvConversionError v27 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v27, <CustomRecord53[]>[
        {H1: 1, H4: 2.234, "H5": 2.234},
        {H1: 1, H4: 0.0, "H5": 0},
        {H1: 1, H4: 1.23, "H3": 0, "H5": 1.23},
        {H1: 1, H4: -6.51, "H3": 1, "H5": -6.51},
        {H1: 1, H4: 3.0, "H5": 3}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord53Array|CsvConversionError v27_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v27_2 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v27_2).message(), generateErrorMessageForInvalidCast("a", "int"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord54Array|CsvConversionError v29 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v29 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v29).message(), generateErrorMessageForMissingRequiredField("1"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord54Array|CsvConversionError v29_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v29_2 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v29_2).message(), generateErrorMessageForMissingRequiredField("1"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord55Array|CsvConversionError v30 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v30, [
        {H1: "1", H4: "2.234",'1: 10},
        {H1: "1", H4: "0", '1: 10},
        {H1: "1", H4: "1.23", '1: 10},
        {H1: "1", H4: "-6.51", '1: 10},
        {H1: "1", H4: "3", '1: 10}
    ], string `Test failed for config ${config.toBalString()}`);
}

function testCustomHeadersPresentConfigs(FromCSVConfig config = config22) {
    CustomRecord46Array|CsvConversionError v20 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v20, <CustomRecord46[]>[
        {H1: 1, H2: "string2", H3: false, H4: 0, H5: 0.0, H6: null},
        {H1: 1, H2: "string3", H3: false, H4: 1.23, H5: 1.23, H6: ()},
        {H1: 1, H2: "string4", H3: true, H4: -6.51, H5: -6.51, H6: ()},
        {H1: 1, H2: "string5", H3: true, H4: 3, H5: 3.0, H6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord46Array|CsvConversionError v20_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v20_2, <CustomRecord46[]>[
        {H1: 1, H2: "string1", H3: true, H4: 2.234, H5: 2.234, H6: ()},
        {H1: 1, H2: "string2", H3: false, H4: 0, H5: 0.0, H6: null},
        {H1: 1, H2: "string3", H3: false, H4: 1.23, H5: 1.23, H6: ()},
        {H1: 1, H2: "string4", H3: true, H4: -6.51, H5: -6.51, H6: ()},
        {H1: 1, H2: "string5", H3: true, H4: 3, H5: 3.0, H6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord47Array|CsvConversionError v21 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v21, <CustomRecord47[]>[
        {H1: 1, H2: "string2", H3: false, H4: 0, H5: 0.0, H6: null},
        {H1: 1, H2: "string3", H3: false, H4: 1.23, H5: 1.23, H6: ()},
        {H1: 1, H2: "string4", H3: true, H4: -6.51, H5: -6.51, H6: ()},
        {H1: 1, H2: "string5", H3: true, H4: 3, H5: 3.0, H6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord47Array|CsvConversionError v21_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v21_2, <CustomRecord47[]>[
        {H1: 1, H2: "string1", H3: true, H4: 2.234, H5: 2.234, H6: ()},
        {H1: 1, H2: "string2", H3: false, H4: 0, H5: 0.0, H6: null},
        {H1: 1, H2: "string3", H3: false, H4: 1.23, H5: 1.23, H6: ()},
        {H1: 1, H2: "string4", H3: true, H4: -6.51, H5: -6.51, H6: ()},
        {H1: 1, H2: "string5", H3: true, H4: 3, H5: 3.0, H6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord48Array|CsvConversionError v22 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v22, [
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord48Array|CsvConversionError v22_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v22_2, [
        {H1: "1", H2: "string1", H3: "true", H4: "2.234", H5: "2.234", H6: "()"},
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord49Array|CsvConversionError v23 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v23, [
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord49Array|CsvConversionError v23_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v23_2, [
        {H1: "1", H2: "string1", H3: "true", H4: "2.234", H5: "2.234", H6: "()"},
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord50Array|CsvConversionError v24 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v24, [
        {H1: 1, H4: 0.0, H2: "string2", H3: false, H5: 0, H6: null},
        {H1: 1, H4: 1.23, H2: "string3", H3: 0, H5: 1.23, H6: ()},
        {H1: 1, H4: -6.51, H2: "string4", H3: 1, H5: -6.51, H6: ()},
        {H1: 1, H4: 3.0, H2: "string5", H3: true, H5: 3, H6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord50Array|CsvConversionError v24_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v24_2, [
        {H1: 1, H4: 2.234, H2: "string1", H3: true, H5: 2.234, H6: ()},
        {H1: 1, H4: 0.0, H2: "string2", H3: false, H5: 0, H6: null},
        {H1: 1, H4: 1.23, H2: "string3", H3: 0, H5: 1.23, H6: ()},
        {H1: 1, H4: -6.51, H2: "string4", H3: 1, H5: -6.51, H6: ()},
        {H1: 1, H4: 3.0, H2: "string5", H3: true, H5: 3, H6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    record{() H1;}[]|CsvConversionError v24_3 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v24_3 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v24_3).message(), generateErrorMessageForInvalidCast("1", "()"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord51Array|CsvConversionError v25 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v25, [
        {H1: 1, H4: 0.0},
        {H1: 1, H4: 1.23},
        {H1: 1, H4: -6.51},
        {H1: 1, H4: 3.0}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord52Array|CsvConversionError v26 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v26, [
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord52Array|CsvConversionError v26_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v26_2, [
        {H1: "1", H2: "string1", H3: "true", H4: "2.234", H5: "2.234", H6: "()"},
        {H1: "1", H2: "string2", H3: "false", H4: "0", H5: "0", H6: "null"},
        {H1: "1", H2: "string3", H3: "0", H4: "1.23", H5: "1.23", H6: "()"},
        {H1: "1", H2: "string4", H3: "1", H4: "-6.51", H5: "-6.51", H6: "()"},
        {H1: "1", H2: "string5", H3: "true", H4: "3", H5: "3", H6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord53Array|CsvConversionError v27 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v27, <CustomRecord53[]>[
        {H1: 1, H4: 0.0, "H5": 0},
        {H1: 1, H4: 1.23, "H3": 0, "H5": 1.23},
        {H1: 1, H4: -6.51, "H3": 1, "H5": -6.51},
        {H1: 1, H4: 3.0, "H5": 3}
    ], string `Test failed for config ${config.toBalString()}`);

    record{() H1;}[]|CsvConversionError v27_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v27_2 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v27_2).message(), generateErrorMessageForInvalidCast("1", "()"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord54Array|CsvConversionError v29 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v29 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v29).message(), generateErrorMessageForMissingRequiredField("1"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord54Array|CsvConversionError v29_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v29_2 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v29_2).message(), generateErrorMessageForMissingRequiredField("1"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord55Array|CsvConversionError v30 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v30, [
        {H1: "1", H4: "0", '1: 10},
        {H1: "1", H4: "1.23", '1: 10},
        {H1: "1", H4: "-6.51", '1: 10},
        {H1: "1", H4: "3", '1: 10}
    ], string `Test failed for config ${config.toBalString()}`);
}

function testSkipHeaderConfigWithFalseValue(FromCSVConfig config) {
    record {}[]|CsvConversionError v1 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v1, [
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0, '6: ()},
        {'1: 1, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord28Array|CsvConversionError v2 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v2, [
        {'1: "1", '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: "1", '2: "string2", '3: false, '4: 0, '5: 0, '6: ()},
        {'1: "1", '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: "1", '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: ()},
        {'1: "1", '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);
    

    CustomRecord29Array|CsvConversionError v3 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v3, [
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0, '6: ()},
        {'1: 1, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord30Array|CsvConversionError v4 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v4, [
        {'1: "1", '2: "string1", '3: "true", '4: "2.234", '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: "false", '4: "0", '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: "0", '4: "1.23", '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: "1", '4: "-6.51", '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: "true", '4: "3", '5: "3", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord31Array|CsvConversionError v5 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v5, [
        {'1: "1", '6: "()"},
        {'1: "1", '6: "null"},
        {'1: "1", '6: "()"},
        {'1: "1", '6: "()"},
        {'1: "1", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);
    
    record{() '1;}[]|CsvConversionError v6 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v6 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v6).message(), generateErrorMessageForInvalidCast("1", "()"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord33Array|CsvConversionError v7 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v7, [
        {'1: "1", '2: "string1", '3: "true", '4: "2.234", '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: "false", '4: "0", '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: "0", '4: "1.23", '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: "1", '4: "-6.51", '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: "true", '4: "3", '5: "3", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord34Array|CsvConversionError v8 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v8, [
        {'1: "1", '2: "string1", '3: true, '4: 2.234, '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: false, '4: 0, '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: 0, '4: 1.23, '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: 1, '4: -6.51, '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: true, '4: 3, '5: "3", '6: "()"}
    ]);

    CustomRecord35Array|CsvConversionError v9 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v9, [
        {'1: "1", '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: "()", '9: ""},
        {'1: "1", '2: "string2", '3: false, '4: 0, '5: 0, '6: "null", '9: ""},
        {'1: "1", '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: "()", '9: ""},
        {'1: "1", '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: "()", '9: ""},
        {'1: "1", '2: "string5", '3: true, '4: 3, '5: 3, '6: "()", '9: ""}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord36Array|CsvConversionError v10 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v10, [
        {'1: "1", '6: "()", '9: ""},
        {'1: "1", '6: "null", '9: ""},
        {'1: "1", '6: "()", '9: ""},
        {'1: "1", '6: "()", '9: ""},
        {'1: "1", '6: "()", '9: ""}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord37Array|CsvConversionError v11 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v11, [
        {'1: "1", '5: "2.234", '6: "()"},
        {'1: "1", '5: "0", '6: "null"},
        {'1: "1", '5: "1.23", '6: "()"},
        {'1: "1", '5: "-6.51", '6: "()"},
        {'1: "1", '5: "3", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord38Array|CsvConversionError v12 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v12, [
        {'1: "1", '2: "string1", '3: "true", '4: "2.234", '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: "false", '4: "0", '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: "0", '4: "1.23", '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: "1", '4: "-6.51", '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: "true", '4: "3", '5: "3", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord39Array|CsvConversionError v13 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v13, [
        {'1: "1", '2: "string1", '3: "true", '4: "2.234", '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: "false", '4: "0", '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: "0", '4: "1.23", '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: "1", '4: "-6.51", '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: "true", '4: "3", '5: "3", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord40Array|CsvConversionError v14 = fromCsvStringWithType(csvStringData3, config);
    test:assertEquals(v14, [
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: "2.234", '6: "()"},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: "0", '6: "null"},
        {'1: 1, '2: "string3", '3: 0, '4: 1.23, '5: "1.23", '6: "()"},
        {'1: 1, '2: "string4", '3: 1, '4: -6.51, '5: "-6.51", '6: "()"},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: "3", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord41Array|CsvConversionError v15 = fromCsvStringWithType(csvStringData2, config);
    test:assertEquals(v15, [
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0, '6: null},
        {'1: 1, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord42Array|CsvConversionError v16 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v16, <CustomRecord42[]>[
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0.0, '6: null},
        {'1: 1, '2: "string3", '3: false, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: true, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3.0, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord43Array|CsvConversionError v17 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v17, <CustomRecord43[]>[
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0.0, '6: null},
        {'1: 1, '2: "string3", '3: false, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: true, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3.0, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord44Array|CsvConversionError v18 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v18, <CustomRecord44[]>[
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0.0, '6: null},
        {'1: 1, '2: "string3", '3: false, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: true, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3.0, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord45Array|CsvConversionError v19 = fromCsvStringWithType(csvStringData6, config);
    test:assertTrue(v19 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v19).message(), generateErrorMessageForMissingRequiredField("H1"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord46Array|CsvConversionError v19_2 = fromCsvStringWithType(csvStringData6, config);
    test:assertTrue(v19_2 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v19_2).message(), generateErrorMessageForMissingRequiredField("H1"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord47Array|CsvConversionError v19_3 = fromCsvStringWithType(csvStringData6, config);
    test:assertTrue(v19_3 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v19_3).message(), generateErrorMessageForMissingRequiredField("H1"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord49Array|CsvConversionError v19_4 = fromCsvStringWithType(csvStringData6, config);
    test:assertTrue(v19_4 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v19_4).message(), generateErrorMessageForMissingRequiredField("H1"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord56Array|CsvConversionError v19_5 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v19_5, [
        {H1: "", H4: "", '1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {H1: "", H4: "", '1: 1, '2: "string2", '3: false, '4: 0, '5: 0, '6: null},
        {H1: "", H4: "", '1: 1, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {H1: "", H4: "", '1: 1, '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: ()},
        {H1: "", H4: "", '1: 1, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    record {string H1 = ""; string H4 = ""; int '2 = 10;}[]|CsvConversionError v30_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v30_2 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v30_2).message(), generateErrorMessageForInvalidCast("string1", "int"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord53Array|CsvConversionError v28 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v28 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v28).message(), generateErrorMessageForMissingRequiredField("H4"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord53Array|CsvConversionError v28_2 = fromCsvStringWithType(csvStringData6, config);
    test:assertTrue(v28_2 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v28_2).message(), generateErrorMessageForMissingRequiredField("H4"), string `Test failed for config ${config.toBalString()}`);
}

function testHeaderConfigWithFalseValue(FromCSVConfig config = config21) {
    record {}[]|CsvConversionError v1 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v1, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0, '6: ()},
        {'1: 1, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord28Array|CsvConversionError v2 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v2, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: "1", '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: "1", '2: "string2", '3: false, '4: 0, '5: 0, '6: ()},
        {'1: "1", '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: "1", '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: ()},
        {'1: "1", '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);
    

    CustomRecord29Array|CsvConversionError v3 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v3 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v3).message(), generateErrorMessageForInvalidCast("a", "int"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord30Array|CsvConversionError v4 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v4, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: "1", '2: "string1", '3: "true", '4: "2.234", '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: "false", '4: "0", '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: "0", '4: "1.23", '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: "1", '4: "-6.51", '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: "true", '4: "3", '5: "3", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord31Array|CsvConversionError v5 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v5, [
        {'1: "a", '6: "f"},
        {'1: "1", '6: "()"},
        {'1: "1", '6: "null"},
        {'1: "1", '6: "()"},
        {'1: "1", '6: "()"},
        {'1: "1", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);
    
    CustomRecord32Array|CsvConversionError v6 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v6 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v6).message(), generateErrorMessageForInvalidCast("a", "int"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord33Array|CsvConversionError v7 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v7, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: "1", '2: "string1", '3: "true", '4: "2.234", '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: "false", '4: "0", '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: "0", '4: "1.23", '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: "1", '4: "-6.51", '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: "true", '4: "3", '5: "3", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord34Array|CsvConversionError v8 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v8, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: "1", '2: "string1", '3: true, '4: 2.234, '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: false, '4: 0, '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: 0, '4: 1.23, '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: 1, '4: -6.51, '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: true, '4: 3, '5: "3", '6: "()"}
    ]);

    CustomRecord35Array|CsvConversionError v9 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v9, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f", '9: ""},
        {'1: "1", '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: "()", '9: ""},
        {'1: "1", '2: "string2", '3: false, '4: 0, '5: 0, '6: "null", '9: ""},
        {'1: "1", '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: "()", '9: ""},
        {'1: "1", '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: "()", '9: ""},
        {'1: "1", '2: "string5", '3: true, '4: 3, '5: 3, '6: "()", '9: ""}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord36Array|CsvConversionError v10 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v10, [
        {'1: "a", '6: "f", '9: ""},
        {'1: "1", '6: "()", '9: ""},
        {'1: "1", '6: "null", '9: ""},
        {'1: "1", '6: "()", '9: ""},
        {'1: "1", '6: "()", '9: ""},
        {'1: "1", '6: "()", '9: ""}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord37Array|CsvConversionError v11 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v11, [
        {'1: "a", '5: "e", '6: "f"},
        {'1: "1", '5: "2.234", '6: "()"},
        {'1: "1", '5: "0", '6: "null"},
        {'1: "1", '5: "1.23", '6: "()"},
        {'1: "1", '5: "-6.51", '6: "()"},
        {'1: "1", '5: "3", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord38Array|CsvConversionError v12 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v12, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: "1", '2: "string1", '3: "true", '4: "2.234", '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: "false", '4: "0", '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: "0", '4: "1.23", '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: "1", '4: "-6.51", '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: "true", '4: "3", '5: "3", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord39Array|CsvConversionError v13 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v13, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: "1", '2: "string1", '3: "true", '4: "2.234", '5: "2.234", '6: "()"},
        {'1: "1", '2: "string2", '3: "false", '4: "0", '5: "0", '6: "null"},
        {'1: "1", '2: "string3", '3: "0", '4: "1.23", '5: "1.23", '6: "()"},
        {'1: "1", '2: "string4", '3: "1", '4: "-6.51", '5: "-6.51", '6: "()"},
        {'1: "1", '2: "string5", '3: "true", '4: "3", '5: "3", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord40Array|CsvConversionError v14 = fromCsvStringWithType(csvStringData3, config);
    test:assertEquals(v14, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: "2.234", '6: "()"},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: "0", '6: "null"},
        {'1: 1, '2: "string3", '3: 0, '4: 1.23, '5: "1.23", '6: "()"},
        {'1: 1, '2: "string4", '3: 1, '4: -6.51, '5: "-6.51", '6: "()"},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: "3", '6: "()"}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord41Array|CsvConversionError v15 = fromCsvStringWithType(csvStringData2, config);
    test:assertEquals(v15, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0, '6: null},
        {'1: 1, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord42Array|CsvConversionError v16 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v16, <CustomRecord42[]>[
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0.0, '6: null},
        {'1: 1, '2: "string3", '3: false, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: true, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3.0, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord43Array|CsvConversionError v17 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v17, <CustomRecord43[]>[
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0.0, '6: null},
        {'1: 1, '2: "string3", '3: false, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: true, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3.0, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord44Array|CsvConversionError v18 = fromCsvStringWithType(csvStringData6, config);
    test:assertEquals(v18, <CustomRecord44[]>[
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 1, '2: "string2", '3: false, '4: 0, '5: 0.0, '6: null},
        {'1: 1, '2: "string3", '3: false, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 1, '2: "string4", '3: true, '4: -6.51, '5: -6.51, '6: ()},
        {'1: 1, '2: "string5", '3: true, '4: 3, '5: 3.0, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord45Array|CsvConversionError v19 = fromCsvStringWithType(csvStringData6, config);
    test:assertTrue(v19 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v19).message(), generateErrorMessageForMissingRequiredField("H1"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord46Array|CsvConversionError v19_2 = fromCsvStringWithType(csvStringData6, config);
    test:assertTrue(v19_2 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v19_2).message(), generateErrorMessageForMissingRequiredField("H1"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord47Array|CsvConversionError v19_3 = fromCsvStringWithType(csvStringData6, config);
    test:assertTrue(v19_3 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v19_3).message(), generateErrorMessageForMissingRequiredField("H1"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord49Array|CsvConversionError v19_4 = fromCsvStringWithType(csvStringData6, config);
    test:assertTrue(v19_4 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v19_4).message(), generateErrorMessageForMissingRequiredField("H1"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord56Array|CsvConversionError v19_5 = fromCsvStringWithType(csvStringData1, config);
    test:assertEquals(v19_5, [
        {H1: "", H4: "", '1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {H1: "", H4: "", '1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {H1: "", H4: "", '1: 1, '2: "string2", '3: false, '4: 0, '5: 0, '6: null},
        {H1: "", H4: "", '1: 1, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {H1: "", H4: "", '1: 1, '2: "string4", '3: 1, '4: -6.51, '5: -6.51, '6: ()},
        {H1: "", H4: "", '1: 1, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ], string `Test failed for config ${config.toBalString()}`);

    CustomRecord55Array|CsvConversionError v30_2 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v30_2 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v30_2).message(), generateErrorMessageForInvalidCast("a", "int"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord53Array|CsvConversionError v28 = fromCsvStringWithType(csvStringData1, config);
    test:assertTrue(v28 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v28).message(), generateErrorMessageForMissingRequiredField("H4"), string `Test failed for config ${config.toBalString()}`);

    CustomRecord53Array|CsvConversionError v28_2 = fromCsvStringWithType(csvStringData6, config);
    test:assertTrue(v28_2 is CsvConversionError, string `Test failed for config ${config.toBalString()}`);
    test:assertEquals((<CsvConversionError>v28_2).message(), generateErrorMessageForMissingRequiredField("H4"), string `Test failed for config ${config.toBalString()}`);
}

boolean enable = true;

@test:Config{enable: !enable}
function test() {
    CustomRecord46Array|CsvConversionError v20 = fromCsvStringWithType(csvStringData6, config23);
    test:assertEquals(v20, <CustomRecord46[]>[
        {H1: 1, H2: "string1", H3: true, H4: 2.234, H5: 2.234, H6: ()},
        {H1: 1, H2: "string2", H3: false, H4: 0, H5: 0.0, H6: null},
        {H1: 1, H2: "string3", H3: false, H4: 1.23, H5: 1.23, H6: ()},
        {H1: 1, H2: "string4", H3: true, H4: -6.51, H5: -6.51, H6: ()},
        {H1: 1, H2: "string5", H3: true, H4: 3, H5: 3.0, H6: ()}
    ]);
}
