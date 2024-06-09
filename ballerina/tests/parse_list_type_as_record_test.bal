import ballerina/test;

// boolean enable = true;

// @test:Config {enable: !enable}
// function debugTest() {
//     // record{decimal c; boolean d; int e; string f;}[]|CsvConversionError ct1br8 = parseListAsRecordType(
//     //     [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
//     //     ["f", "e", "d", "c", "b", "a"]);
//     // test:assertEquals(ct1br8, [
//     //     {a: (), b: <float>2.23, c: <decimal>0, d: true, e: 1, f: "a"},
//     //     {a: (), b: <float>0, c: <decimal>2.23, d: true, e: 1, f: "a"}
//     // ]);

//     record{int c;}[]|CsvConversionError ct1br8 = parseStringToRecord(string `c
//                                                                             1`, {});
//     test:assertEquals(ct1br8, [
//         {a: (), b: <float>2.23, c: <decimal>0, d: true, e: 1, f: "a"},
//         {a: (), b: <float>0, c: <decimal>2.23, d: true, e: 1, f: "a"}
//     ]);
// }

@test:Config {enable}
function testFromCsvWithTypeForTupleAndRecordAsExpectedType() {
    StringRecord1Array|CsvConversionError st1sr1 = parseListAsRecordType([st1, st1], (), {}, StringRecord1Array);
    test:assertTrue(st1sr1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1sr1).message(), generateErrorMessageForMissingRequiredField("s3"));

    StringRecord1Array|CsvConversionError st2sr1 = parseListAsRecordType([st2, st2], (), {}, StringRecord1Array);
    test:assertTrue(st2sr1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st2sr1).message(), generateErrorMessageForMissingRequiredField("s3"));

    StringRecord2Array|CsvConversionError st1sr2 = parseListAsRecordType([st1, st1], (), {}, StringRecord2Array);
    test:assertTrue(st1sr2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1sr2).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "data.csv:StringRecord2"));

    StringRecord2Array|CsvConversionError st2sr2 = parseListAsRecordType([st2, st2], (), {}, StringRecord2Array);
    test:assertTrue(st2sr2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st2sr2).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","data.csv:StringRecord2"));

    StringRecord9Array|CsvConversionError st1sr9 = parseListAsRecordType([st1, st1], (), {}, StringRecord9Array);
    test:assertTrue(st1sr9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1sr9).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "data.csv:StringRecord9"));

    StringRecord9Array|CsvConversionError st2sr9 = parseListAsRecordType([st2, st2], (), {}, StringRecord9Array);
    test:assertTrue(st2sr9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st2sr9).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","data.csv:StringRecord9"));

    StringRecord10Array|CsvConversionError st1sr10 = parseListAsRecordType([st1, st1], (), {}, StringRecord10Array);
    test:assertEquals(st1sr10, [
        {'1: "string", '2: ""},
        {'1: "string", '2: ""}
    ]);

    StringRecord10Array|CsvConversionError st2sr10 = parseListAsRecordType([st2, st2], (), {}, StringRecord10Array);
    test:assertEquals(st2sr10, [
        {'1: "string", '2: "", '3: "a", '4: ""},
        {'1: "string", '2: "", '3: "a", '4: ""}
    ]);

    StringRecord19Array|CsvConversionError st1sr19 = parseListAsRecordType([st1, st1], (), {}, StringRecord19Array);
    test:assertEquals(st1sr19, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord19Array|CsvConversionError st2sr19 = parseListAsRecordType([st2, st2], (), {}, StringRecord19Array);
    test:assertEquals(st2sr19, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord20Array|CsvConversionError st1sr20 = parseListAsRecordType([st1, st1], (), {}, StringRecord20Array);
    test:assertEquals(st1sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord20Array|CsvConversionError st2sr20 = parseListAsRecordType([st2, st2], (), {}, StringRecord20Array);
    test:assertEquals(st2sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord21Array|CsvConversionError st1sr21 = parseListAsRecordType([st1, st1], (), {}, StringRecord21Array);
    test:assertEquals(st1sr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord21Array|CsvConversionError st2sr21 = parseListAsRecordType([st2, st2], (), {}, StringRecord21Array);
    test:assertEquals(st2sr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord22Array|CsvConversionError st1sr22 = parseListAsRecordType([st1, st1], (), {}, StringRecord22Array);
    test:assertEquals(st1sr22, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord22Array|CsvConversionError st2sr22 = parseListAsRecordType([st2, st2], (), {}, StringRecord22Array);
    test:assertEquals(st2sr22, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord23Array|CsvConversionError st1sr23 = parseListAsRecordType([st1, st1], (), {}, StringRecord23Array);
    test:assertEquals(st1sr23, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord23Array|CsvConversionError st2sr23 = parseListAsRecordType([st2, st2], (), {}, StringRecord23Array);
    test:assertEquals(st2sr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord15Array|CsvConversionError st1cr15 = parseListAsRecordType([st1, st1], (), {}, CustomRecord15Array);
    test:assertEquals(st1cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord15Array|CsvConversionError st2cr15 = parseListAsRecordType([st2, st2], (), {}, CustomRecord15Array);
    test:assertEquals(st2cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord16Array|CsvConversionError st1cr16 = parseListAsRecordType([st1, st1], (), {}, CustomRecord16Array);
    test:assertTrue(st1cr16 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1cr16).message(), generateErrorMessageForMissingRequiredField("3"));

    CustomRecord16Array|CsvConversionError st2cr16 = parseListAsRecordType([st2, st2], (), {}, CustomRecord16Array);
    test:assertEquals(st2cr16, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord17Array|CsvConversionError st1cr17 = parseListAsRecordType([st1, st1], (), {}, CustomRecord17Array);
    test:assertEquals(st1cr17, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord17Array|CsvConversionError st2cr17 = parseListAsRecordType([st2, st2], (), {}, CustomRecord17Array);
    test:assertEquals(st2cr17, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord18Array|CsvConversionError st1cr18 = parseListAsRecordType([st1, st1], (), {}, CustomRecord18Array);
    test:assertTrue(st1cr18 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1cr18).message(), generateErrorMessageForMissingRequiredField("3"));

    CustomRecord18Array|CsvConversionError st2cr18 = parseListAsRecordType([st2, st2], (), {}, CustomRecord18Array);
    test:assertEquals(st2cr18, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord19Array|CsvConversionError st1cr19 = parseListAsRecordType([st1, st1], (), {}, CustomRecord19Array);
    test:assertEquals(st1cr19, [
        {'1: s1, '2: s2, '3: "", '4: ""},
        {'1: s1, '2: s2, '3: "", '4: ""}
    ]);

    CustomRecord19Array|CsvConversionError st2cr19 = parseListAsRecordType([st2, st2], (), {}, CustomRecord19Array);
    test:assertEquals(st2cr19, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord20Array|CsvConversionError st1cr20 = parseListAsRecordType([st1, st1], (), {}, CustomRecord20Array);
    test:assertEquals(st1cr20, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord20Array|CsvConversionError st2cr20 = parseListAsRecordType([st2, st2], (), {}, CustomRecord20Array);
    test:assertEquals(st2cr20, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord21Array|CsvConversionError st1cr21 = parseListAsRecordType([st1, st1], (), {}, CustomRecord21Array);
    test:assertEquals(st1cr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord21Array|CsvConversionError st2cr21 = parseListAsRecordType([st2, st2], (), {}, CustomRecord21Array);
    test:assertEquals(st2cr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord22Array|CsvConversionError st1cr22 = parseListAsRecordType([st1, st1], (), {}, CustomRecord22Array);
    test:assertEquals(st1cr22, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord22Array|CsvConversionError st2cr22 = parseListAsRecordType([st2, st2], (), {}, CustomRecord22Array);
    test:assertEquals(st2cr22, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord23Array|CsvConversionError st1cr23 = parseListAsRecordType([st1, st1], (), {}, CustomRecord23Array);
    test:assertEquals(st1cr23, [
        {"1": s1, "2": s2, a: ""},
        {"1": s1, "2": s2, a: ""}
    ]);

    CustomRecord23Array|CsvConversionError st2cr23 = parseListAsRecordType([st2, st2], (), {}, CustomRecord23Array);
    test:assertEquals(st2cr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""},
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""}
    ]);

    CustomRecord24Array|CsvConversionError st1cr24 = parseListAsRecordType([st1, st1], (), {}, CustomRecord24Array);
    test:assertEquals(st1cr24, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord24Array|CsvConversionError st2cr24 = parseListAsRecordType([st2, st2], (), {}, CustomRecord24Array);
    test:assertEquals(st2cr24, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord25Array|CsvConversionError st1cr25 = parseListAsRecordType([st1, st1], (), {}, CustomRecord25Array);
    test:assertTrue(st1cr25 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st1cr25).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "data.csv:CustomRecord25"));

    CustomRecord25Array|CsvConversionError st2cr25 = parseListAsRecordType([st2, st2], (), {}, CustomRecord25Array);
    test:assertTrue(st2cr25 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st2cr25).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","data.csv:CustomRecord25"));

    CustomRecord25Array|CsvConversionError st3cr25 = parseListAsRecordType([st3, st3], (), {}, CustomRecord25Array);
    test:assertTrue(st3cr25 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3cr25).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "data.csv:CustomRecord25"));

    CustomRecord25Array|CsvConversionError st4cr25 = parseListAsRecordType([st4, st4], (), {}, CustomRecord25Array);
    test:assertTrue(st4cr25 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st4cr25).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","data.csv:CustomRecord25"));

    CustomRecord26Array|CsvConversionError st1cr26 = parseListAsRecordType([st1, st1], (), {}, CustomRecord26Array);
    test:assertEquals(st1cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|CsvConversionError st2cr26 = parseListAsRecordType([st2, st2], (), {}, CustomRecord26Array);
    test:assertEquals(st2cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|CsvConversionError st3cr26 = parseListAsRecordType([st3, st3], (), {}, CustomRecord26Array);
    test:assertEquals(st3cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|CsvConversionError st4cr26 = parseListAsRecordType([st4, st4], (), {}, CustomRecord26Array);
    test:assertEquals(st4cr26 , [
        {'1: s1},
        {'1: s1}
    ]);
}

@test:Config {enable}
function testFromCsvWithTypeForTupleAndRecordAsExpectedType2() {
    StringRecord1Array|CsvConversionError st3sr1 = parseListAsRecordType([st3, st3], (), {}, StringRecord1Array);
    test:assertTrue(st3sr1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3sr1).message(), generateErrorMessageForMissingRequiredField("s3"));

    StringRecord1Array|CsvConversionError st4sr1 = parseListAsRecordType([st4, st4], (), {}, StringRecord1Array);
    test:assertTrue(st4sr1 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st4sr1).message(), generateErrorMessageForMissingRequiredField("s3"));

    StringRecord2Array|CsvConversionError st3sr2 = parseListAsRecordType([st3, st3], (), {}, StringRecord2Array);
    test:assertTrue(st3sr2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3sr2).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "data.csv:StringRecord2"));

    StringRecord2Array|CsvConversionError st4sr2 = parseListAsRecordType([st4, st4], (), {}, StringRecord2Array);
    test:assertTrue(st4sr2 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st4sr2).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","data.csv:StringRecord2"));

    StringRecord9Array|CsvConversionError st3sr9 = parseListAsRecordType([st3, st3], (), {}, StringRecord9Array);
    test:assertTrue(st3sr9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3sr9).message(), generateErrorMessageForMissingRequiredField("s1"));

    StringRecord9Array|CsvConversionError st4sr9 = parseListAsRecordType([st4, st4], (), {}, StringRecord9Array);
    test:assertTrue(st4sr9 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st4sr9).message(), generateErrorMessageForMissingRequiredField("s1"));

    StringRecord10Array|CsvConversionError st3sr10 = parseListAsRecordType([st3, st3], (), {}, StringRecord10Array);
    test:assertEquals(st3sr10, [
        {'1: "string", '2: ""},
        {'1: "string", '2: ""}
    ]);

    StringRecord10Array|CsvConversionError st4sr10 = parseListAsRecordType([st4, st4], (), {}, StringRecord10Array);
    test:assertEquals(st4sr10, [
        {'1: "string", '2: "", '3: "a", '4: ""},
        {'1: "string", '2: "", '3: "a", '4: ""}
    ]);

    StringRecord19Array|CsvConversionError st3sr19 = parseListAsRecordType([st3, st3], (), {}, StringRecord19Array);
    test:assertEquals(st3sr19, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord19Array|CsvConversionError st4sr19 = parseListAsRecordType([st4, st4], (), {}, StringRecord19Array);
    test:assertEquals(st4sr19, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord20Array|CsvConversionError st3sr20 = parseListAsRecordType([st3, st3], (), {}, StringRecord20Array);
    test:assertEquals(st3sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord20Array|CsvConversionError st4sr20 = parseListAsRecordType([st4, st4], (), {}, StringRecord20Array);
    test:assertEquals(st4sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord21Array|CsvConversionError st3sr21 = parseListAsRecordType([st3, st3], (), {}, StringRecord21Array);
    test:assertEquals(st3sr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord21Array|CsvConversionError st4sr21 = parseListAsRecordType([st4, st4], (), {}, StringRecord21Array);
    test:assertEquals(st4sr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord22Array|CsvConversionError st3sr22 = parseListAsRecordType([st3, st3], (), {}, StringRecord22Array);
    test:assertEquals(st3sr22, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord22Array|CsvConversionError st4sr22 = parseListAsRecordType([st4, st4], (), {}, StringRecord22Array);
    test:assertEquals(st4sr22, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord23Array|CsvConversionError st3sr23 = parseListAsRecordType([st3, st3], (), {}, StringRecord23Array);
    test:assertEquals(st3sr23, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord23Array|CsvConversionError st4sr23 = parseListAsRecordType([st4, st4], (), {}, StringRecord23Array);
    test:assertEquals(st4sr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord15Array|CsvConversionError st3cr15 = parseListAsRecordType([st3, st3], (), {}, CustomRecord15Array);
    test:assertEquals(st3cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord15Array|CsvConversionError st4cr15 = parseListAsRecordType([st4, st4], (), {}, CustomRecord15Array);
    test:assertEquals(st4cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord16Array|CsvConversionError st3cr16 = parseListAsRecordType([st3, st3], (), {}, CustomRecord16Array);
    test:assertTrue(st3cr16 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3cr16).message(), generateErrorMessageForMissingRequiredField("3"));

    CustomRecord16Array|CsvConversionError st4cr16 = parseListAsRecordType([st4, st4], (), {}, CustomRecord16Array);
    test:assertEquals(st4cr16, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord17Array|CsvConversionError st3cr17 = parseListAsRecordType([st3, st3], (), {}, CustomRecord17Array);
    test:assertEquals(st3cr17, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord17Array|CsvConversionError st4cr17 = parseListAsRecordType([st4, st4], (), {}, CustomRecord17Array);
    test:assertEquals(st4cr17, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord18Array|CsvConversionError st3cr18 = parseListAsRecordType([st3, st3], (), {}, CustomRecord18Array);
    test:assertTrue(st3cr18 is CsvConversionError);
    test:assertEquals((<CsvConversionError>st3cr18).message(), generateErrorMessageForMissingRequiredField("3"));

    CustomRecord18Array|CsvConversionError st4cr18 = parseListAsRecordType([st4, st4], (), {}, CustomRecord18Array);
    test:assertEquals(st4cr18, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord19Array|CsvConversionError st3cr19 = parseListAsRecordType([st3, st3], (), {}, CustomRecord19Array);
    test:assertEquals(st3cr19, [
        {'1: s1, '2: s2, '3: "", '4: ""},
        {'1: s1, '2: s2, '3: "", '4: ""}
    ]);

    CustomRecord19Array|CsvConversionError st4cr19 = parseListAsRecordType([st4, st4], (), {}, CustomRecord19Array);
    test:assertEquals(st4cr19, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord20Array|CsvConversionError st3cr20 = parseListAsRecordType([st3, st3], (), {}, CustomRecord20Array);
    test:assertEquals(st3cr20, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord20Array|CsvConversionError st4cr20 = parseListAsRecordType([st4, st4], (), {}, CustomRecord20Array);
    test:assertEquals(st4cr20, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord21Array|CsvConversionError st3cr21 = parseListAsRecordType([st3, st3], (), {}, CustomRecord21Array);
    test:assertEquals(st3cr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord21Array|CsvConversionError st4cr21 = parseListAsRecordType([st4, st4], (), {}, CustomRecord21Array);
    test:assertEquals(st4cr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord22Array|CsvConversionError st3cr22 = parseListAsRecordType([st3, st3], (), {}, CustomRecord22Array);
    test:assertEquals(st3cr22, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord22Array|CsvConversionError st4cr22 = parseListAsRecordType([st4, st4], (), {}, CustomRecord22Array);
    test:assertEquals(st4cr22, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord23Array|CsvConversionError st3cr23 = parseListAsRecordType([st3, st3], (), {}, CustomRecord23Array);
    test:assertEquals(st3cr23, [
        {"1": s1, "2": s2, a: ""},
        {"1": s1, "2": s2, a: ""}
    ]);

    CustomRecord23Array|CsvConversionError st4cr23 = parseListAsRecordType([st4, st4], (), {}, CustomRecord23Array);
    test:assertEquals(st4cr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""},
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""}
    ]);

    CustomRecord24Array|CsvConversionError st3cr24 = parseListAsRecordType([st3, st3], (), {}, CustomRecord24Array);
    test:assertEquals(st3cr24, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord24Array|CsvConversionError st4cr24 = parseListAsRecordType([st4, st4], (), {}, CustomRecord24Array);
    test:assertEquals(st4cr24, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);
}

@test:Config {enable: false}
function testFromCsvWithTypeForTupleAndRecordAsExpectedType3() {
    record{string a; boolean b; int c;}[]|CsvConversionError ct1br4 = parseListAsRecordType([["a", "1", "true"], ["a", "1", "true"]], ["a", "c", "b"], {});
    test:assertEquals(ct1br4, [
        {a: "a", b: true, c: 1},
        {a: "a", b: true, c: 1}
    ]);

    record{() a; float b; decimal c; boolean d; int e; string f;}[]|CsvConversionError ct1br6 = parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br6, [
        {a: (), b: <float>2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: <float>0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|decimal c; boolean d; int e; string f;|}[]|CsvConversionError ct1br7 = parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br7, [
        {c: <decimal>0, d: true, e: 1, f: "a"},
        {c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{decimal c; boolean d; int e; string f;}[]|CsvConversionError ct1br8 = parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br8, [
        {a: (), b: <float>2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: <float>0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);
}

@test:Config {enable}
function testFromCsvWithTypeForTupleAndMapAsExpectedType() {
    StringMapArray|CsvConversionError st1sma = parseListAsRecordType([st1, st1], (), {}, StringMapArray);
    test:assertEquals(st1sma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    StringMapArray|CsvConversionError st2sma = parseListAsRecordType([st2, st2], (), {}, StringMapArray);
    test:assertEquals(st2sma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringMapArray|CsvConversionError st3sma = parseListAsRecordType([st3, st3], (), {}, StringMapArray);
    test:assertEquals(st3sma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    StringMapArray|CsvConversionError st4sma = parseListAsRecordType([st4, st4], (), {}, StringMapArray);
    test:assertEquals(st4sma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NillableIntUnionStringMapArray|CsvConversionError st1niusma = parseListAsRecordType([st1, st1], (), {}, NillableIntUnionStringMapArray);
    test:assertEquals(st1niusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    NillableIntUnionStringMapArray|CsvConversionError st2niusma = parseListAsRecordType([st2, st2], (), {}, NillableIntUnionStringMapArray);
    test:assertEquals(st2niusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NillableIntUnionStringMapArray|CsvConversionError st3niusma = parseListAsRecordType([st3, st3], (), {}, NillableIntUnionStringMapArray);
    test:assertEquals(st3niusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    NillableIntUnionStringMapArray|CsvConversionError st4niusma = parseListAsRecordType([st4, st4], (), {}, NillableIntUnionStringMapArray);
    test:assertEquals(st4niusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    IntUnionStringMapArray|CsvConversionError st1iusma = parseListAsRecordType([st1, st1], (), {}, IntUnionStringMapArray);
    test:assertEquals(st1iusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    IntUnionStringMapArray|CsvConversionError st2iusma = parseListAsRecordType([st2, st2], (), {}, IntUnionStringMapArray);
    test:assertEquals(st2iusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    IntUnionStringMapArray|CsvConversionError st3iusma = parseListAsRecordType([st3, st3], (), {}, IntUnionStringMapArray);
    test:assertEquals(st3iusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    IntUnionStringMapArray|CsvConversionError st4iusma = parseListAsRecordType([st4, st4], (), {}, IntUnionStringMapArray);
    test:assertEquals(st4iusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    JsonMapArray|CsvConversionError st1jma = parseListAsRecordType([st1, st1], (), {}, JsonMapArray);
    test:assertEquals(st1jma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    JsonMapArray|CsvConversionError st2jma = parseListAsRecordType([st2, st2], (), {}, JsonMapArray);
    test:assertEquals(st2jma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    JsonMapArray|CsvConversionError st3jma = parseListAsRecordType([st3, st3], (), {}, JsonMapArray);
    test:assertEquals(st3jma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    JsonMapArray|CsvConversionError st4jma = parseListAsRecordType([st4, st4], (), {}, JsonMapArray);
    test:assertEquals(st4jma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    AnydataMapArray|CsvConversionError st1anydma = parseListAsRecordType([st1, st1], (), {}, AnydataMapArray);
    test:assertEquals(st1anydma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    AnydataMapArray|CsvConversionError st2anydma = parseListAsRecordType([st2, st2], (), {}, AnydataMapArray);
    test:assertEquals(st2anydma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    AnydataMapArray|CsvConversionError st3anydma = parseListAsRecordType([st3, st3], (), {}, AnydataMapArray);
    test:assertEquals(st3anydma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    AnydataMapArray|CsvConversionError st4anydma = parseListAsRecordType([st4, st4], (), {}, AnydataMapArray);
    test:assertEquals(st4anydma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomMapArray|CsvConversionError st1cma = parseListAsRecordType([st1, st1], (), {}, CustomMapArray);
    test:assertEquals(st1cma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    CustomMapArray|CsvConversionError st2cma = parseListAsRecordType([st2, st2], (), {}, CustomMapArray);
    test:assertEquals(st2cma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomMapArray|CsvConversionError st3cma = parseListAsRecordType([st3, st3], (), {}, CustomMapArray);
    test:assertEquals(st3cma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    CustomMapArray|CsvConversionError st4cma = parseListAsRecordType([st4, st4], (), {}, CustomMapArray);
    test:assertEquals(st4cma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NilMapArray|CsvConversionError st1nma = parseListAsRecordType([st1, st1], (), {}, NilMapArray);
    test:assertEquals(st1nma, ([
        {},
        {}
    ]));

    IntegerMapArray|CsvConversionError st2ima = parseListAsRecordType([st2, st2], (), {}, IntegerMapArray);
    test:assertEquals(st2ima, ([
        {},
        {}
    ]));

    DecimalMapArray|CsvConversionError st3dma = parseListAsRecordType([st3, st3], (), {}, DecimalMapArray);
    test:assertEquals(st3dma, ([
        {},
        {}
    ]));

    BooleanMapArray|CsvConversionError st4bma = parseListAsRecordType([st4, st4], (), {}, BooleanMapArray);
    test:assertEquals(st4bma, ([
        {},
        {}
    ]));
}
