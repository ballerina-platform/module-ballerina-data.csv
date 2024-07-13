import ballerina/csv_commons as common;
import ballerina/data.csv as csv;
import ballerina/test;

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType() {
    StringRecord1Array|csv:Error st1sr1 = csv:parseListAsRecordType([st1, st1], (), {}, StringRecord1Array);
    test:assertTrue(st1sr1 is csv:Error);
    test:assertEquals((<csv:Error>st1sr1).message(), common:generateErrorMessageForMissingRequiredField("s3"));

    StringRecord1Array|csv:Error st2sr1 = csv:parseListAsRecordType([st2, st2], (), {}, StringRecord1Array);
    test:assertTrue(st2sr1 is csv:Error);
    test:assertEquals((<csv:Error>st2sr1).message(), common:generateErrorMessageForMissingRequiredField("s3"));

    StringRecord2Array|csv:Error st1sr2 = csv:parseListAsRecordType([st1, st1], (), {}, StringRecord2Array);
    test:assertTrue(st1sr2 is csv:Error);
    test:assertEquals((<csv:Error>st1sr2).message(), common:generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "parse_list_types_tests:StringRecord2"));

    StringRecord2Array|csv:Error st2sr2 = csv:parseListAsRecordType([st2, st2], (), {}, StringRecord2Array);
    test:assertTrue(st2sr2 is csv:Error);
    test:assertEquals((<csv:Error>st2sr2).message(), common:generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","parse_list_types_tests:StringRecord2"));

    StringRecord9Array|csv:Error st1sr9 = csv:parseListAsRecordType([st1, st1], (), {}, StringRecord9Array);
    test:assertTrue(st1sr9 is csv:Error);
    test:assertEquals((<csv:Error>st1sr9).message(), common:generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "parse_list_types_tests:StringRecord9"));

    StringRecord9Array|csv:Error st2sr9 = csv:parseListAsRecordType([st2, st2], (), {}, StringRecord9Array);
    test:assertTrue(st2sr9 is csv:Error);
    test:assertEquals((<csv:Error>st2sr9).message(), common:generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","parse_list_types_tests:StringRecord9"));

    StringRecord10Array|csv:Error st1sr10 = csv:parseListAsRecordType([st1, st1], (), {}, StringRecord10Array);
    test:assertEquals(st1sr10, [
        {'1: "string", '2: ""},
        {'1: "string", '2: ""}
    ]);

    StringRecord10Array|csv:Error st2sr10 = csv:parseListAsRecordType([st2, st2], (), {}, StringRecord10Array);
    test:assertEquals(st2sr10, [
        {'1: "string", '2: "", '3: "a", '4: ""},
        {'1: "string", '2: "", '3: "a", '4: ""}
    ]);

    StringRecord19Array|csv:Error st1sr19 = csv:parseListAsRecordType([st1, st1], (), {}, StringRecord19Array);
    test:assertEquals(st1sr19, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord19Array|csv:Error st2sr19 = csv:parseListAsRecordType([st2, st2], (), {}, StringRecord19Array);
    test:assertEquals(st2sr19, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord20Array|csv:Error st1sr20 = csv:parseListAsRecordType([st1, st1], (), {}, StringRecord20Array);
    test:assertEquals(st1sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType2() {
    StringRecord20Array|csv:Error st2sr20 = csv:parseListAsRecordType([st2, st2], (), {}, StringRecord20Array);
    test:assertEquals(st2sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord21Array|csv:Error st1sr21 = csv:parseListAsRecordType([st1, st1], (), {}, StringRecord21Array);
    test:assertEquals(st1sr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord21Array|csv:Error st2sr21 = csv:parseListAsRecordType([st2, st2], (), {}, StringRecord21Array);
    test:assertEquals(st2sr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord22Array|csv:Error st1sr22 = csv:parseListAsRecordType([st1, st1], (), {}, StringRecord22Array);
    test:assertEquals(st1sr22, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord22Array|csv:Error st2sr22 = csv:parseListAsRecordType([st2, st2], (), {}, StringRecord22Array);
    test:assertEquals(st2sr22, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord23Array|csv:Error st1sr23 = csv:parseListAsRecordType([st1, st1], (), {}, StringRecord23Array);
    test:assertEquals(st1sr23, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord23Array|csv:Error st2sr23 = csv:parseListAsRecordType([st2, st2], (), {}, StringRecord23Array);
    test:assertEquals(st2sr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord15Array|csv:Error st1cr15 = csv:parseListAsRecordType([st1, st1], (), {}, CustomRecord15Array);
    test:assertEquals(st1cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord15Array|csv:Error st2cr15 = csv:parseListAsRecordType([st2, st2], (), {}, CustomRecord15Array);
    test:assertEquals(st2cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord16Array|csv:Error st1cr16 = csv:parseListAsRecordType([st1, st1], (), {}, CustomRecord16Array);
    test:assertTrue(st1cr16 is csv:Error);
    test:assertEquals((<csv:Error>st1cr16).message(), common:generateErrorMessageForMissingRequiredField("3"));

    CustomRecord16Array|csv:Error st2cr16 = csv:parseListAsRecordType([st2, st2], (), {}, CustomRecord16Array);
    test:assertEquals(st2cr16, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord17Array|csv:Error st1cr17 = csv:parseListAsRecordType([st1, st1], (), {}, CustomRecord17Array);
    test:assertEquals(st1cr17, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType3() {
    CustomRecord17Array|csv:Error st2cr17 = csv:parseListAsRecordType([st2, st2], (), {}, CustomRecord17Array);
    test:assertEquals(st2cr17, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord18Array|csv:Error st1cr18 = csv:parseListAsRecordType([st1, st1], (), {}, CustomRecord18Array);
    test:assertTrue(st1cr18 is csv:Error);
    test:assertEquals((<csv:Error>st1cr18).message(), common:generateErrorMessageForMissingRequiredField("3"));

    CustomRecord18Array|csv:Error st2cr18 = csv:parseListAsRecordType([st2, st2], (), {}, CustomRecord18Array);
    test:assertEquals(st2cr18, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord19Array|csv:Error st1cr19 = csv:parseListAsRecordType([st1, st1], (), {}, CustomRecord19Array);
    test:assertEquals(st1cr19, [
        {'1: s1, '2: s2, '3: "", '4: ""},
        {'1: s1, '2: s2, '3: "", '4: ""}
    ]);

    CustomRecord19Array|csv:Error st2cr19 = csv:parseListAsRecordType([st2, st2], (), {}, CustomRecord19Array);
    test:assertEquals(st2cr19, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord20Array|csv:Error st1cr20 = csv:parseListAsRecordType([st1, st1], (), {}, CustomRecord20Array);
    test:assertEquals(st1cr20, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord20Array|csv:Error st2cr20 = csv:parseListAsRecordType([st2, st2], (), {}, CustomRecord20Array);
    test:assertEquals(st2cr20, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord21Array|csv:Error st1cr21 = csv:parseListAsRecordType([st1, st1], (), {}, CustomRecord21Array);
    test:assertEquals(st1cr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord21Array|csv:Error st2cr21 = csv:parseListAsRecordType([st2, st2], (), {}, CustomRecord21Array);
    test:assertEquals(st2cr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord22Array|csv:Error st1cr22 = csv:parseListAsRecordType([st1, st1], (), {}, CustomRecord22Array);
    test:assertEquals(st1cr22, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType4() {
    CustomRecord22Array|csv:Error st2cr22 = csv:parseListAsRecordType([st2, st2], (), {}, CustomRecord22Array);
    test:assertEquals(st2cr22, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord23Array|csv:Error st1cr23 = csv:parseListAsRecordType([st1, st1], (), {}, CustomRecord23Array);
    test:assertEquals(st1cr23, [
        {"1": s1, "2": s2, a: ""},
        {"1": s1, "2": s2, a: ""}
    ]);

    CustomRecord23Array|csv:Error st2cr23 = csv:parseListAsRecordType([st2, st2], (), {}, CustomRecord23Array);
    test:assertEquals(st2cr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""},
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""}
    ]);

    CustomRecord24Array|csv:Error st1cr24 = csv:parseListAsRecordType([st1, st1], (), {}, CustomRecord24Array);
    test:assertEquals(st1cr24, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord24Array|csv:Error st2cr24 = csv:parseListAsRecordType([st2, st2], (), {}, CustomRecord24Array);
    test:assertEquals(st2cr24, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord25Array|csv:Error st1cr25 = csv:parseListAsRecordType([st1, st1], (), {}, CustomRecord25Array);
    test:assertTrue(st1cr25 is csv:Error);
    test:assertEquals((<csv:Error>st1cr25).message(), common:generateErrorMessageForInvalidFieldType("string", "1"));

    CustomRecord25Array|csv:Error st2cr25 = csv:parseListAsRecordType([st2, st2], (), {}, CustomRecord25Array);
    test:assertTrue(st2cr25 is csv:Error);
    test:assertEquals((<csv:Error>st2cr25).message(), common:generateErrorMessageForInvalidFieldType("string", "1"));

    CustomRecord25Array|csv:Error st3cr25 = csv:parseListAsRecordType([st3, st3], (), {}, CustomRecord25Array);
    test:assertTrue(st3cr25 is csv:Error);
    test:assertEquals((<csv:Error>st3cr25).message(), common:generateErrorMessageForInvalidFieldType("string", "1"));

    CustomRecord25Array|csv:Error st4cr25 = csv:parseListAsRecordType([st4, st4], (), {}, CustomRecord25Array);
    test:assertTrue(st4cr25 is csv:Error);
    test:assertEquals((<csv:Error>st4cr25).message(), common:generateErrorMessageForInvalidFieldType("string", "1"));

    CustomRecord26Array|csv:Error st1cr26 = csv:parseListAsRecordType([st1, st1], (), {}, CustomRecord26Array);
    test:assertEquals(st1cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|csv:Error st2cr26 = csv:parseListAsRecordType([st2, st2], (), {}, CustomRecord26Array);
    test:assertEquals(st2cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|csv:Error st3cr26 = csv:parseListAsRecordType([st3, st3], (), {}, CustomRecord26Array);
    test:assertEquals(st3cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|csv:Error st4cr26 = csv:parseListAsRecordType([st4, st4], (), {}, CustomRecord26Array);
    test:assertEquals(st4cr26 , [
        {'1: s1},
        {'1: s1}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType5() {
    StringRecord1Array|csv:Error st3sr1 = csv:parseListAsRecordType([st3, st3], (), {}, StringRecord1Array);
    test:assertTrue(st3sr1 is csv:Error);
    test:assertEquals((<csv:Error>st3sr1).message(), common:generateErrorMessageForMissingRequiredField("s3"));

    StringRecord1Array|csv:Error st4sr1 = csv:parseListAsRecordType([st4, st4], (), {}, StringRecord1Array);
    test:assertTrue(st4sr1 is csv:Error);
    test:assertEquals((<csv:Error>st4sr1).message(), common:generateErrorMessageForMissingRequiredField("s3"));

    StringRecord2Array|csv:Error st3sr2 = csv:parseListAsRecordType([st3, st3], (), {}, StringRecord2Array);
    test:assertTrue(st3sr2 is csv:Error);
    test:assertEquals((<csv:Error>st3sr2).message(), common:generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "parse_list_types_tests:StringRecord2"));

    StringRecord2Array|csv:Error st4sr2 = csv:parseListAsRecordType([st4, st4], (), {}, StringRecord2Array);
    test:assertTrue(st4sr2 is csv:Error);
    test:assertEquals((<csv:Error>st4sr2).message(), common:generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","parse_list_types_tests:StringRecord2"));

    StringRecord9Array|csv:Error st3sr9 = csv:parseListAsRecordType([st3, st3], (), {}, StringRecord9Array);
    test:assertTrue(st3sr9 is csv:Error);
    test:assertEquals((<csv:Error>st3sr9).message(), common:generateErrorMessageForMissingRequiredField("s1"));

    StringRecord9Array|csv:Error st4sr9 = csv:parseListAsRecordType([st4, st4], (), {}, StringRecord9Array);
    test:assertTrue(st4sr9 is csv:Error);
    test:assertEquals((<csv:Error>st4sr9).message(), common:generateErrorMessageForMissingRequiredField("s1"));

    StringRecord10Array|csv:Error st3sr10 = csv:parseListAsRecordType([st3, st3], (), {}, StringRecord10Array);
    test:assertEquals(st3sr10, [
        {'1: "string", '2: ""},
        {'1: "string", '2: ""}
    ]);

    StringRecord10Array|csv:Error st4sr10 = csv:parseListAsRecordType([st4, st4], (), {}, StringRecord10Array);
    test:assertEquals(st4sr10, [
        {'1: "string", '2: "", '3: "a", '4: ""},
        {'1: "string", '2: "", '3: "a", '4: ""}
    ]);

    StringRecord19Array|csv:Error st3sr19 = csv:parseListAsRecordType([st3, st3], (), {}, StringRecord19Array);
    test:assertEquals(st3sr19, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord19Array|csv:Error st4sr19 = csv:parseListAsRecordType([st4, st4], (), {}, StringRecord19Array);
    test:assertEquals(st4sr19, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord20Array|csv:Error st3sr20 = csv:parseListAsRecordType([st3, st3], (), {}, StringRecord20Array);
    test:assertEquals(st3sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord20Array|csv:Error st4sr20 = csv:parseListAsRecordType([st4, st4], (), {}, StringRecord20Array);
    test:assertEquals(st4sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord21Array|csv:Error st3sr21 = csv:parseListAsRecordType([st3, st3], (), {}, StringRecord21Array);
    test:assertEquals(st3sr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord21Array|csv:Error st4sr21 = csv:parseListAsRecordType([st4, st4], (), {}, StringRecord21Array);
    test:assertEquals(st4sr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord22Array|csv:Error st3sr22 = csv:parseListAsRecordType([st3, st3], (), {}, StringRecord22Array);
    test:assertEquals(st3sr22, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord22Array|csv:Error st4sr22 = csv:parseListAsRecordType([st4, st4], (), {}, StringRecord22Array);
    test:assertEquals(st4sr22, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord23Array|csv:Error st3sr23 = csv:parseListAsRecordType([st3, st3], (), {}, StringRecord23Array);
    test:assertEquals(st3sr23, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord23Array|csv:Error st4sr23 = csv:parseListAsRecordType([st4, st4], (), {}, StringRecord23Array);
    test:assertEquals(st4sr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord15Array|csv:Error st3cr15 = csv:parseListAsRecordType([st3, st3], (), {}, CustomRecord15Array);
    test:assertEquals(st3cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType6() {
    CustomRecord15Array|csv:Error st4cr15 = csv:parseListAsRecordType([st4, st4], (), {}, CustomRecord15Array);
    test:assertEquals(st4cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord16Array|csv:Error st3cr16 = csv:parseListAsRecordType([st3, st3], (), {}, CustomRecord16Array);
    test:assertTrue(st3cr16 is csv:Error);
    test:assertEquals((<csv:Error>st3cr16).message(), common:generateErrorMessageForMissingRequiredField("3"));

    CustomRecord16Array|csv:Error st4cr16 = csv:parseListAsRecordType([st4, st4], (), {}, CustomRecord16Array);
    test:assertEquals(st4cr16, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord17Array|csv:Error st3cr17 = csv:parseListAsRecordType([st3, st3], (), {}, CustomRecord17Array);
    test:assertEquals(st3cr17, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord17Array|csv:Error st4cr17 = csv:parseListAsRecordType([st4, st4], (), {}, CustomRecord17Array);
    test:assertEquals(st4cr17, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord18Array|csv:Error st3cr18 = csv:parseListAsRecordType([st3, st3], (), {}, CustomRecord18Array);
    test:assertTrue(st3cr18 is csv:Error);
    test:assertEquals((<csv:Error>st3cr18).message(), common:generateErrorMessageForMissingRequiredField("3"));

    CustomRecord18Array|csv:Error st4cr18 = csv:parseListAsRecordType([st4, st4], (), {}, CustomRecord18Array);
    test:assertEquals(st4cr18, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord19Array|csv:Error st3cr19 = csv:parseListAsRecordType([st3, st3], (), {}, CustomRecord19Array);
    test:assertEquals(st3cr19, [
        {'1: s1, '2: s2, '3: "", '4: ""},
        {'1: s1, '2: s2, '3: "", '4: ""}
    ]);

    CustomRecord19Array|csv:Error st4cr19 = csv:parseListAsRecordType([st4, st4], (), {}, CustomRecord19Array);
    test:assertEquals(st4cr19, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord20Array|csv:Error st3cr20 = csv:parseListAsRecordType([st3, st3], (), {}, CustomRecord20Array);
    test:assertEquals(st3cr20, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord20Array|csv:Error st4cr20 = csv:parseListAsRecordType([st4, st4], (), {}, CustomRecord20Array);
    test:assertEquals(st4cr20, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord21Array|csv:Error st3cr21 = csv:parseListAsRecordType([st3, st3], (), {}, CustomRecord21Array);
    test:assertEquals(st3cr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord21Array|csv:Error st4cr21 = csv:parseListAsRecordType([st4, st4], (), {}, CustomRecord21Array);
    test:assertEquals(st4cr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord22Array|csv:Error st3cr22 = csv:parseListAsRecordType([st3, st3], (), {}, CustomRecord22Array);
    test:assertEquals(st3cr22, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord22Array|csv:Error st4cr22 = csv:parseListAsRecordType([st4, st4], (), {}, CustomRecord22Array);
    test:assertEquals(st4cr22, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord23Array|csv:Error st3cr23 = csv:parseListAsRecordType([st3, st3], (), {}, CustomRecord23Array);
    test:assertEquals(st3cr23, [
        {"1": s1, "2": s2, a: ""},
        {"1": s1, "2": s2, a: ""}
    ]);

    CustomRecord23Array|csv:Error st4cr23 = csv:parseListAsRecordType([st4, st4], (), {}, CustomRecord23Array);
    test:assertEquals(st4cr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""},
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""}
    ]);

    CustomRecord24Array|csv:Error st3cr24 = csv:parseListAsRecordType([st3, st3], (), {}, CustomRecord24Array);
    test:assertEquals(st3cr24, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord24Array|csv:Error st4cr24 = csv:parseListAsRecordType([st4, st4], (), {}, CustomRecord24Array);
    test:assertEquals(st4cr24, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType7() {
    record{string a; boolean b; int c;}[]|csv:Error ct1br4 = csv:parseListAsRecordType([["a", "1", "true"], ["a", "1", "true"]], ["a", "c", "b"], {});
    test:assertEquals(ct1br4, [
        {a: "a", b: true, c: 1},
        {a: "a", b: true, c: 1}
    ]);

    record{() a; float b; decimal c; boolean d; int e; string f;}[]|csv:Error ct1br6 = csv:parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br6, [
        {a: (), b: <float>2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: <float>0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|decimal c; boolean d; int e; string f;|}[]|csv:Error ct1br7 = csv:parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br7, [
        {c: <decimal>0, d: true, e: 1, f: "a"},
        {c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{decimal c; boolean d; int e; string f;}[]|csv:Error ct1br8 = csv:parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br8, [
        {a: (), b: 2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: 0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|int|() a; float b; decimal? c; boolean d; int e; string f; string...;|}[]|csv:Error ct1br9 = csv:parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br9, [
        {a: (), b: <float>2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: <float>0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|int|() a; float b; decimal? c; string|boolean d; int|string e; string f; string...;|}[]|csv:Error ct1br9_2 = csv:parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br9_2, [
        {a: (), b: <float>2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: <float>0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType8() {
    record{|decimal c; boolean|string d; int e; string f; string...;|}[]|csv:Error ct1br10 = csv:parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br10, [
        {a: "null", b: "2.23", c: <decimal>0, d: true, e: 1, f: "a"},
        {a: "()", b: "0", c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|decimal? c; boolean d; int? e; string f; ()...;|}[]|csv:Error ct1br11 = csv:parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br11, [
        {a: (), c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|()...;|}[]|csv:Error ct1br12 = csv:parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br12, [
        {a: ()},
        {a: ()}
    ]);

    record{|string?...;|}[]|csv:Error ct1br13 = csv:parseListAsRecordType(
        [["a", "1"], ["a", "1"]], 
        ["f", "e"]);
    test:assertEquals(ct1br13, [
        {e: "1", f: "a"},
        {e: "1", f: "a"}
    ]);

    record{|boolean...;|}[]|csv:Error ct1br14 = csv:parseListAsRecordType(
        [["2.23", "null"], ["7", "()"]], 
        ["b", "a"]);
    test:assertEquals(ct1br14, [
        {},
        {}
    ]);

    map<int?>[]|csv:Error ct1br15 = csv:parseListAsRecordType(
        [["2", "()"], ["2", "1"], ["()", "2"]], 
        ["f", "e"]);
    test:assertEquals(ct1br15, [
        {e: (), f: 2},
        {e: 1, f: 2},
        {e: 2, f: ()}
    ]);

    record{|boolean...;|}[]|csv:Error ct1br16 = csv:parseListAsRecordType(
        [["2.23", "null"], ["7", "()"]], 
        ["b", "a"]);
    test:assertEquals(ct1br16, [
        {},
        {}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndMapAsExpectedType() {
    StringMapArray|csv:Error st1sma = csv:parseListAsRecordType([st1, st1], (), {}, StringMapArray);
    test:assertEquals(st1sma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    StringMapArray|csv:Error st2sma = csv:parseListAsRecordType([st2, st2], (), {}, StringMapArray);
    test:assertEquals(st2sma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringMapArray|csv:Error st3sma = csv:parseListAsRecordType([st3, st3], (), {}, StringMapArray);
    test:assertEquals(st3sma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    StringMapArray|csv:Error st4sma = csv:parseListAsRecordType([st4, st4], (), {}, StringMapArray);
    test:assertEquals(st4sma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NillableIntUnionStringMapArray|csv:Error st1niusma = csv:parseListAsRecordType([st1, st1], (), {}, NillableIntUnionStringMapArray);
    test:assertEquals(st1niusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    NillableIntUnionStringMapArray|csv:Error st2niusma = csv:parseListAsRecordType([st2, st2], (), {}, NillableIntUnionStringMapArray);
    test:assertEquals(st2niusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NillableIntUnionStringMapArray|csv:Error st3niusma = csv:parseListAsRecordType([st3, st3], (), {}, NillableIntUnionStringMapArray);
    test:assertEquals(st3niusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    NillableIntUnionStringMapArray|csv:Error st4niusma = csv:parseListAsRecordType([st4, st4], (), {}, NillableIntUnionStringMapArray);
    test:assertEquals(st4niusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    IntUnionStringMapArray|csv:Error st1iusma = csv:parseListAsRecordType([st1, st1], (), {}, IntUnionStringMapArray);
    test:assertEquals(st1iusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    IntUnionStringMapArray|csv:Error st2iusma = csv:parseListAsRecordType([st2, st2], (), {}, IntUnionStringMapArray);
    test:assertEquals(st2iusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    IntUnionStringMapArray|csv:Error st3iusma = csv:parseListAsRecordType([st3, st3], (), {}, IntUnionStringMapArray);
    test:assertEquals(st3iusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    IntUnionStringMapArray|csv:Error st4iusma = csv:parseListAsRecordType([st4, st4], (), {}, IntUnionStringMapArray);
    test:assertEquals(st4iusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    JsonMapArray|csv:Error st1jma = csv:parseListAsRecordType([st1, st1], (), {}, JsonMapArray);
    test:assertEquals(st1jma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndMapAsExpectedType2() {
    JsonMapArray|csv:Error st2jma = csv:parseListAsRecordType([st2, st2], (), {}, JsonMapArray);
    test:assertEquals(st2jma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    JsonMapArray|csv:Error st3jma = csv:parseListAsRecordType([st3, st3], (), {}, JsonMapArray);
    test:assertEquals(st3jma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    JsonMapArray|csv:Error st4jma = csv:parseListAsRecordType([st4, st4], (), {}, JsonMapArray);
    test:assertEquals(st4jma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    AnydataMapArray|csv:Error st1anydma = csv:parseListAsRecordType([st1, st1], (), {}, AnydataMapArray);
    test:assertEquals(st1anydma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    AnydataMapArray|csv:Error st2anydma = csv:parseListAsRecordType([st2, st2], (), {}, AnydataMapArray);
    test:assertEquals(st2anydma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    AnydataMapArray|csv:Error st3anydma = csv:parseListAsRecordType([st3, st3], (), {}, AnydataMapArray);
    test:assertEquals(st3anydma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    AnydataMapArray|csv:Error st4anydma = csv:parseListAsRecordType([st4, st4], (), {}, AnydataMapArray);
    test:assertEquals(st4anydma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomMapArray|csv:Error st1cma = csv:parseListAsRecordType([st1, st1], (), {}, CustomMapArray);
    test:assertEquals(st1cma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    CustomMapArray|csv:Error st2cma = csv:parseListAsRecordType([st2, st2], (), {}, CustomMapArray);
    test:assertEquals(st2cma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomMapArray|csv:Error st3cma = csv:parseListAsRecordType([st3, st3], (), {}, CustomMapArray);
    test:assertEquals(st3cma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    CustomMapArray|csv:Error st4cma = csv:parseListAsRecordType([st4, st4], (), {}, CustomMapArray);
    test:assertEquals(st4cma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NilMapArray|csv:Error st1nma = csv:parseListAsRecordType([st1, st1], (), {}, NilMapArray);
    test:assertEquals(st1nma, ([
        {},
        {}
    ]));

    IntegerMapArray|csv:Error st2ima = csv:parseListAsRecordType([st2, st2], (), {}, IntegerMapArray);
    test:assertEquals(st2ima, ([
        {},
        {}
    ]));

    DecimalMapArray|csv:Error st3dma = csv:parseListAsRecordType([st3, st3], (), {}, DecimalMapArray);
    test:assertEquals(st3dma, ([
        {},
        {}
    ]));

    BooleanMapArray|csv:Error st4bma = csv:parseListAsRecordType([st4, st4], (), {}, BooleanMapArray);
    test:assertEquals(st4bma, ([
        {},
        {}
    ]));
}
