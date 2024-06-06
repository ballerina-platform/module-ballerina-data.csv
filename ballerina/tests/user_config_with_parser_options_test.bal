import ballerina/test;

boolean enable = true;

@test:Config {enable: !enable}
function debugTest() returns error? {
    record{}[]|CsvConversionError bm1br = parseListAsRecordType([["a", "1", "true"], []], ["a", "b"], {});
    test:assertEquals(bm1br, [
        [true, false],
        [true, false]
    ]);
}

@test:Config {enable}
function testFromCsvStringWithParserOptions() {
    [int, string, boolean, decimal, float, string][]|CsvConversionError csv1op3 = parseStringToList(csvStringData1, option3);
    test:assertEquals(csv1op3, [
        [3, "string3", false, <decimal>1.23, <float>1.23, "()"],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, "()"],
        [5, "string5", true, <decimal>3, <float>3.0, "()"]
    ]);

    record{int a; string b; boolean c;decimal d; float e; string f;}[]|CsvConversionError csv1op3_2 = parseStringToRecord(csvStringData1, ptOption1);
    test:assertEquals(csv1op3_2, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: "()"},
        {a: 3, b: "string3", c: false, d: <decimal>1.23, e: <float>1.23, f: "()"},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: "()"}
    ]);

    record{int a; string b; boolean c;decimal d; float e; string f;}[]|CsvConversionError csv1op3_3 = parseStringToRecord(csvStringData1, ptOption2);
    test:assertEquals(csv1op3_3, [
        {a: 1, b: "string1", c: true, d: <decimal>2.234, e: <float>2.234, f: "()"},
        {a: 5, b: "string5", c: true, d: <decimal>3, e: <float>3.0, f: "()"}
    ]);

    [int, string, boolean, decimal, float, string][]|CsvConversionError csv2op4 = parseStringToList(csvStringData2, option4);
    test:assertEquals(csv2op4, []);

    record{}[]|CsvConversionError csv2op4_2 = parseStringToRecord(csvStringData2, ptOption3);
    test:assertEquals(csv2op4_2, []);

    record{}[]|CsvConversionError csv2op4_3 = parseStringToRecord(csvStringData2, ptOption4);
    test:assertEquals(csv2op4_3, [
        {a: 1, b: "string1", c: true, d: 2.234, e: 2.234, f: "()"},
        {a: 3, b: "string3", c: 0, d: 1.23, e: 1.23, f: "()"},
        {a: 5, b: "string5", c: true, d: 3, e: 3, f: "()"}
    ]);

    [int, string, boolean, decimal, float, string][]|CsvConversionError csv3op3 = parseStringToList(csvStringData3, option3);
    test:assertEquals(csv3op3, [
        [3, "string3", false, <decimal>1.23, <float>1.23, "()"],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, "()"],
        [5, "string5", true, <decimal>3, <float>3.0, "()"]
    ]);

    record{}[]|CsvConversionError csv3op3_2 = parseStringToRecord(csvStringData3, ptOption1);
    test:assertEquals(csv3op3_2, [
        {a: 1, b: "string1", c: true, d: 2.234, e: 2.234, f: "()"},
        {a: 3, b: "string3", c: 0, d: 1.23, e: 1.23, f: "()"},
        {a: 5, b: "string5", c: true, d: 3, e: 3, f: "()"}
    ]);

    record{}[]|CsvConversionError csv3op3_3 = parseStringToRecord(csvStringData3, ptOption2);
    test:assertEquals(csv3op3_3, [
        {a: 1, b: "string1", c: true, d: 2.234, e: 2.234, f: "()"},
        {a: 5, b: "string5", c: true, d: 3, e: 3, f: "()"}
    ]);

    record{}[]|CsvConversionError csv3op3_4 = parseStringToRecord(csvStringData3, {header: 9, skipLines: "2-10"});
    test:assertEquals(csv3op3_4, [
        {'4: 5, string4: "string5", '1: true, "-6.51": 3, "()": null}
    ]);
}

@test:Config {enable}
function testFromCsvStringWithHeaderLessParserOptions() {
    [int, string, boolean, decimal, float, ()][]|CsvConversionError csv1op6 = parseStringToList(csvStringData1, option6);
    test:assertTrue(csv1op6 is CsvConversionError);
    test:assertEquals((<error> csv1op6).message(), generateErrorMessageForInvalidCast("null", "()"));

    record{}[]|CsvConversionError csv1op5_2 = parseStringToRecord(csvStringData1, ptOption5);
    test:assertEquals(csv1op5_2, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 3, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 5, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ]);

    record{}[]|CsvConversionError csv1op6_2 = parseStringToRecord(csvStringData1, {header: false, skipLines: [3, 5]});
    test:assertEquals(csv1op6_2, [
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 3, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 5, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ]);

    record{}[]|CsvConversionError csv3op6_2 = parseStringToRecord(csvStringData3, {header: false, skipLines: [1, 3, 5, -1 , 100, 100]});
    test:assertEquals(csv3op6_2, [
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 3, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 5, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ]);

    record{}[]|CsvConversionError csv4op6_2 = parseStringToRecord(csvStringData4, {header: false, skipLines: [2, 4, -1 , 100, 100]});
    test:assertEquals(csv4op6_2, [
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 3, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 5, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ]);

    record{}[]|CsvConversionError csv5op6_2 = parseStringToRecord(csvStringData5, {header: false, skipLines: [2, 4, -1 , 100, 100]});
    test:assertEquals(csv5op6_2, [
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 3, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 5, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ]);

    record{}[]|CsvConversionError csv6op6_2 = parseStringToRecord(csvStringData6, {header: false, skipLines: [2, 4, -1 , 100, 100]});
    test:assertEquals(csv6op6_2, [
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 3, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 5, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ]);

    record{}[]|CsvConversionError csv2op6_2 = parseStringToRecord(csvStringData2, {header: false, skipLines: [5, 7]});
    test:assertEquals(csv2op6_2, [
        {'1: "hello", '2: "hello", '3: (), '4: 12, '5: true, '6: 12.34},
        {'1: "//comment"},
        {'1: "a", '2: "b", '3: "c", '4: "d", '5: "e", '6: "f"},
        {'1: 1, '2: "string1", '3: true, '4: 2.234, '5: 2.234, '6: ()},
        {'1: 3, '2: "string3", '3: 0, '4: 1.23, '5: 1.23, '6: ()},
        {'1: 5, '2: "string5", '3: true, '4: 3, '5: 3, '6: ()}
    ]);
}

@test:Config {enable}
function testHeaderOption() {
    record{}[]|CsvConversionError csv2cop1 = parseStringToRecord(csvStringData2, {header: 4});
    test:assertEquals(csv2cop1, [
        {a: 1, b: "string1", c: true, d: 2.234, e: 2.234, f: ()},
        {a: 2, b: "string2", c: false, d: 0, e: 0, f: ()},
        {a: 3, b: "string3", c: 0, d: 1.23, e: 1.23, f: ()},
        {a: 4, b: "string4", c: 1, d: -6.51, e: -6.51, f: ()},
        {a: 5, b: "string5", c: true, d: 3, e: 3, f: ()}
    ]);

    record{}[]|CsvConversionError csv2cop2 = parseStringToRecord(csvStringData2, {header: 100});
    test:assertEquals(csv2cop2, []);

    record{}[]|CsvConversionError csv2cop3 = parseStringToRecord(csvStringData2, {header: 11});
    test:assertEquals(csv2cop3, []);

    record{}[]|CsvConversionError csv2cop4 = parseStringToRecord(csvStringData2, {header: 10});
    test:assertEquals(csv2cop4, [{'4: 5, string4: "string5", '1: true, "-6.51": 3, "()": ()}]);
}

@test:Config {enable}
function testCustomHeaderOption() {

}

@test:Config {enable}
function testNullConfigOption() {
    string csvValue1 = string `a
                                ()`;
    string csvValue2 = string `a 
                                null`;
    string csvValue3 = string `c, a 
                            true, e`;
    string csvValue4 = string `a 
                                Null`;
    string csvValue5 = string `b, a
                                bN/Aa,N/A`;

    record{() a;}[]|CsvConversionError cn = parseStringToRecord(csvValue1, {nilValue: ()});
    test:assertEquals(cn, [{a: ()}]);

    cn = parseStringToRecord(csvValue2, {nilValue: ()});
    test:assertEquals(cn, [{a: ()}]);

    cn = parseStringToRecord(csvValue3, {nilValue: ()});
    test:assertTrue(cn is CsvConversionError);
    test:assertEquals((<error> cn).message(), generateErrorMessageForInvalidCast("e", "()"));

    cn = parseStringToRecord(csvValue4, {nilValue: ()});
    test:assertEquals(cn, [{a: ()}]);
    
    cn = parseStringToRecord(csvValue1, {nilValue: null});
    test:assertEquals(cn, [{a: ()}]);

    cn = parseStringToRecord(csvValue2, {nilValue: null});
    test:assertEquals(cn, [{a: ()}]);

    cn = parseStringToRecord(csvValue3, {nilValue: null});
    test:assertTrue(cn is CsvConversionError);
    test:assertEquals((<error> cn).message(), generateErrorMessageForInvalidCast("e", "()"));

    cn = parseStringToRecord(csvValue4, {nilValue: null});
    test:assertEquals(cn, [{a: ()}]);

    cn = parseStringToRecord(csvValue1, {nilValue: "()"});
    test:assertEquals(cn, [{a: ()}]);

    cn = parseStringToRecord(csvValue2, {nilValue: "()"});
    test:assertTrue(cn is CsvConversionError);
    test:assertEquals((<error> cn).message(), generateErrorMessageForInvalidCast("null", "()"));

    cn = parseStringToRecord(csvValue3, {nilValue: "()"});
    test:assertTrue(cn is CsvConversionError);
    test:assertEquals((<error> cn).message(), generateErrorMessageForInvalidCast("e", "()"));

    cn = parseStringToRecord(csvValue4, {nilValue: "()"});
    test:assertTrue(cn is CsvConversionError);
    test:assertEquals((<error> cn).message(), generateErrorMessageForInvalidCast("Null", "()"));

    cn = parseStringToRecord(csvValue5, {nilValue: "N/A"});
    test:assertEquals(cn, [{b: "bN/Aa", a: ()}]);

    cn = parseStringToRecord(csvValue2, {nilValue: "null"});
    test:assertEquals(cn, [{a: ()}]);

    cn = parseStringToRecord(csvValue4, {nilValue: "null"});
    test:assertTrue(cn is CsvConversionError);
    test:assertEquals((<error> cn).message(), generateErrorMessageForInvalidCast("Null", "()"));

    cn = parseStringToRecord(csvValue1, {nilValue: "null"});
    test:assertTrue(cn is CsvConversionError);
    test:assertEquals((<error> cn).message(), generateErrorMessageForInvalidCast("()", "()"));
}

@test:Config {enable}
function testCommentConfigOption() {
    string csvValue1 = string `a
                                1`;
    string csvValue2 = string `a # comment
                                1`;
    string csvValue3 = string `a #, c 
                            1#, e`;
    string csvValue4 = string `a 
                        # comment
                                1`;
    string csvValue5 = string `a, b
                                1,2
                                # comment`;
    string csvValue6 = string `a, b
                                1,2 # comment
                                # comment`;
    string csvValue7 = string `a, b
                                1#,2 comment
                                # comment`;
    string csvValue8 = string `a#, b
                                1, 2 # comment
                                # comment`;
    string csvValue9 = string `a,# b
                                1 ,#2 # comment
                                # comment`;

    record{int a;}[]|CsvConversionError cn;
    
    cn = parseStringToRecord(csvValue1);
    test:assertEquals(cn, [{a: 1}]);

    cn = parseStringToRecord(csvValue2);
    test:assertEquals(cn, [{a: 1}]);

    cn = parseStringToRecord(csvValue3);
    test:assertEquals(cn, [{a: 1}]);

    cn = parseStringToRecord(csvValue4);
    test:assertEquals(cn, [{a: 1}]);

    cn = parseStringToRecord(csvValue5);
    test:assertEquals(cn, [{a: 1, b: 2}]);

    cn = parseStringToRecord(csvValue6);
    test:assertEquals(cn, [{a: 1, b: 2}]);

    cn = parseStringToRecord(csvValue7);
    test:assertEquals(cn, [{a: 1}]);

    record {|int a; int b;|}[]|CsvConversionError cn2 = parseStringToRecord(csvValue7, {header: 0});
    test:assertEquals(cn2, [{a: 1, b: 0}]);

    cn = parseStringToRecord(csvValue8);
    test:assertTrue(cn is CsvConversionError);
    // TODO:Fix
    // test:assertEquals((<error> cn).message(), generateErrorMessageForInvalidCast("1, 2", "int"));

    cn = parseStringToRecord(csvValue9);
    test:assertEquals(cn, [{a: 1}]);
}

@test:Config {enable}
function testCommentConfigOption2() {
    string csvValue1 = string `a
                                1`;
    string csvValue2 = string `a & comment
                                1`;
    string csvValue3 = string `a &, c 
                            1&, e`;
    string csvValue4 = string `a 
                        
                        
                        
                        & comment
                                1`;
    string csvValue5 = string `a&, b
                                1, 2 & comment
                                
                                
                                & comment`;
    string csvValue6 = string `
    
    a,& b
                                1 ,&2 & comment

                                & comment`;

    record{int a; int b;}[]|CsvConversionError cn;
    record{int c;}[]|CsvConversionError cn2;

    cn = parseStringToRecord(csvValue1, {comment: "&"});
    test:assertTrue(cn is CsvConversionError);
    test:assertEquals((<error> cn).message(), generateErrorMessageForMissingRequiredField("b"));

    cn = parseStringToRecord(csvValue2, {comment: "&"});
    test:assertTrue(cn is CsvConversionError);
    test:assertEquals((<error> cn).message(), generateErrorMessageForMissingRequiredField("b"));

    cn = parseStringToRecord(csvValue3, {comment: "&"});
    test:assertTrue(cn is CsvConversionError);
    test:assertEquals((<error> cn).message(), generateErrorMessageForMissingRequiredField("b"));

    cn = parseStringToRecord(csvValue4, {comment: "&"});
    test:assertTrue(cn is CsvConversionError);
    test:assertEquals((<error> cn).message(), generateErrorMessageForMissingRequiredField("b"));

    cn = parseStringToRecord(csvValue5, {comment: "&"});
    test:assertTrue(cn is CsvConversionError);
    // TODO: Fix
    // test:assertEquals((<error> cn).message(), generateErrorMessageForMissingRequiredField("b"));

    cn = parseStringToRecord(csvValue6, {comment: "&", header: 2});
    test:assertTrue(cn is CsvConversionError);
    test:assertEquals((<error> cn).message(), generateErrorMessageForMissingRequiredField("b"));

    cn2 = parseStringToRecord(csvValue1, {comment: "&"});
    test:assertTrue(cn2 is CsvConversionError);
    test:assertEquals((<error> cn2).message(), generateErrorMessageForMissingRequiredField("c"));

    cn2 = parseStringToRecord(csvValue2, {comment: "&"});
    test:assertTrue(cn2 is CsvConversionError);
    test:assertEquals((<error> cn2).message(), generateErrorMessageForMissingRequiredField("c"));

    cn2 = parseStringToRecord(csvValue3, {comment: "&"});
    test:assertTrue(cn2 is CsvConversionError);
    test:assertEquals((<error> cn2).message(), generateErrorMessageForMissingRequiredField("c"));

    cn2 = parseStringToRecord(csvValue4, {comment: "&"});
    test:assertTrue(cn2 is CsvConversionError);
    test:assertEquals((<error> cn2).message(), generateErrorMessageForMissingRequiredField("c"));

    cn2 = parseStringToRecord(csvValue5, {comment: "&"});
    test:assertTrue(cn2 is CsvConversionError);
    // TODO: Fix
    // test:assertEquals((<error> cn2).message(), generateErrorMessageForMissingRequiredField("c"));

    cn2 = parseStringToRecord(csvValue6, {header: 2, comment: "&"});
    test:assertTrue(cn2 is CsvConversionError);
    test:assertEquals((<error> cn2).message(), generateErrorMessageForMissingRequiredField("c"));
}

@test:Config {enable}
function testSkipLineParserOption() {
    [int, string, boolean, decimal, float, ()][]|CsvConversionError csv1cp = parseStringToList(csvStringData1, {skipLines: [], header: 1});
    test:assertEquals(csv1cp, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [2, "string2", false, <decimal>0, <float>0, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    csv1cp = parseStringToList(csvStringData1, {skipLines: [0], header: 1});
    test:assertEquals(csv1cp, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [2, "string2", false, <decimal>0, <float>0, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    csv1cp = parseStringToList(csvStringData1, {skipLines: [0, 4, 10], header: 1});
    test:assertEquals(csv1cp, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [2, "string2", false, <decimal>0, <float>0, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    csv1cp = parseStringToList(csvStringData1, {skipLines: [1, 2, 3, 4, 5], header: 1});
    test:assertEquals(csv1cp, [
    ]);

    csv1cp = parseStringToList(csvStringData1, {skipLines: "1-5", header: 1});
    test:assertEquals(csv1cp, [
    ]);

    csv1cp = parseStringToList(csvStringData1, {skipLines: [4, 2], header: 1});
    test:assertEquals(csv1cp, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    csv1cp = parseStringToList(csvStringData1, {skipLines: "2-4", header: 1});
    test:assertEquals(csv1cp, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    csv1cp = parseStringToList(csvStringData1, {skipLines: [4, 2, -1], header: 1});
    test:assertEquals(csv1cp, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    csv1cp = parseStringToList(csvStringData1, {skipLines: [4, -1, 2], header: 1});
    test:assertEquals(csv1cp, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    csv1cp = parseStringToList(csvStringData1, {skipLines: [5, 4, 3, 2, 1], header: 1});
    test:assertEquals(csv1cp, [
    ]);

    csv1cp = parseStringToList(csvStringData1, {skipLines: [10], header: 1});
    test:assertEquals(csv1cp, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [2, "string2", false, <decimal>0, <float>0, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    csv1cp = parseStringToList(csvStringData1, {skipLines: [-2], header: 1});
    test:assertEquals(csv1cp, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [2, "string2", false, <decimal>0, <float>0, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    csv1cp = parseStringToList(csvStringData1, {skipLines: [-2, 0, 2], header: 1});
    test:assertEquals(csv1cp, [
        [1, "string1", true, <decimal>2.234, <float>2.234, ()],
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);

    csv1cp = parseStringToList(csvStringData1, {skipLines: "0-2", header: 1});
    test:assertEquals(csv1cp, [
        [3, "string3", false, <decimal>1.23, <float>1.23, ()],
        [4, "string4", true, <decimal>-6.51, <float>-6.51, ()],
        [5, "string5", true, <decimal>3, <float>3.0, ()]
    ]);
}

@test:Config {enable}
function testCustomHeaderParserOption() {
// parseListAsRecordType
    anydata[][]|CsvConversionError bm1ba = parseRecordAsListType([bm1, bm1], ["b1", "b2"], {});
    test:assertEquals(bm1ba, [
        [true, false],
        [true, false]
    ]);

    anydata[][]|CsvConversionError bm1ba2 = parseRecordAsListType([bm1, bm1], ["b2", "b1"], {});
    test:assertEquals(bm1ba2, [
        [false, true],
        [false, true]
    ]);

    anydata[][]|CsvConversionError bm2ba = parseRecordAsListType([bm2, bm2], ["b1", "n1", "b2", "n2", "b3"], {});
    test:assertTrue(bm2ba is CsvConversionError);
    test:assertEquals((<error> bm2ba).message(), generateErrorMessageForInvalidCustomHeader("n2"));

    anydata[][]|CsvConversionError bm3ba = parseRecordAsListType([bm3, bm3], ["b1", "b4", "b2", "n2", "i1"], {});
    test:assertTrue(bm3ba is CsvConversionError);
    test:assertEquals((<error> bm3ba).message(), generateErrorMessageForInvalidCustomHeader("n2"));

    anydata[][]|CsvConversionError bm3ba2 = parseRecordAsListType([bm3, bm3], ["b1", "b3", "b4", "b2", "i2"], {});
    test:assertTrue(bm3ba2 is CsvConversionError);
    test:assertEquals((<error> bm3ba2).message(), generateErrorMessageForInvalidCustomHeader("i2"));

    // TODO: Fix this
    // [boolean, boolean][]|CsvConversionError bm3ba3 = parseRecordAsListType([bm3, bm3], ["b1", "b4"], {});
    // test:assertEquals(bm3ba3, [
    //     [b1, b4],
    //     [b1, b4]
    // ]);

    [boolean...][]|CsvConversionError bm3ba4 = parseRecordAsListType([bm3, bm3], ["n2"], {});
    test:assertTrue(bm3ba4 is CsvConversionError);
    test:assertEquals((<error> bm3ba4).message(), "Invalid length for the header names");

    [boolean...][]|CsvConversionError bm3ba5 = parseRecordAsListType([bm3, bm3], [], {});
    test:assertTrue(bm3ba5 is CsvConversionError);
    test:assertEquals((<error> bm3ba5).message(), "Invalid length for the header names");

    record{}[]|CsvConversionError bm1br = parseListAsRecordType([["a", "1", "true"], []], ["a", "b"], {});
    test:assertTrue(bm1br is CsvConversionError);
    test:assertEquals((<error> bm1br).message(), "Invalid length for the custom headers");

    record{}[]|CsvConversionError bm1br2 = parseListAsRecordType([["a", "1", "true"], []], ["a", "b"], {});
    test:assertTrue(bm1br2 is CsvConversionError);
    test:assertEquals((<error> bm1br2).message(), "Invalid length for the custom headers");
}
