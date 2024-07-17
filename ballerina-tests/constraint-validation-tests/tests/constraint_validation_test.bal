import ballerina/constraint;
import ballerina/data.csv as csv;
import ballerina/test;

type ConstrainedRec record {
    @constraint:Int {
        minValue: 3,
        maxValue: 10
    }
    int a?;
    @constraint:String {
        minLength: 2
    }
    string b;
};

@test:Config
function testConstraintWithRecords() returns error? {
    ConstrainedRec[]|csv:Error cRec1 = csv:parseStringToRecord(string `a,b
                4,abc
                3, cde`);
    test:assertEquals(cRec1, [{a: 4, b: "abc"}, {a: 3, b: "cde"}]);

    cRec1 = csv:parseStringToRecord(string `a,b
                4,abc
                11, cde`);
    test:assertTrue(cRec1 is csv:Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed")
                    && (<error>cRec1).message().includes("maxValue"));

    cRec1 = csv:parseStringToRecord(string `a,b
                4,abc
                5, "b"`, {});
    test:assertTrue(cRec1 is csv:Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed")
                    && (<error>cRec1).message().includes("minLength"));

    cRec1 = csv:parseRecordAsRecordType([{"a": 4, "b": "abc"}, {"a": 3, "b": "cde"}], {});
    test:assertEquals(cRec1, [{a: 4, b: "abc"}, {a: 3, b: "cde"}]);

    cRec1 = csv:parseRecordAsRecordType([{"a": 4, "b": "abc"}, {"a": 11, "b": "cde"}], {});
    test:assertTrue(cRec1 is csv:Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed")
                    && (<error>cRec1).message().includes("maxValue"));

    cRec1 = csv:parseRecordAsRecordType([{"a": 4, "b": "abc"}, {"a": 5, "b": "b"}], {});
    test:assertTrue(cRec1 is csv:Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed")
                    && (<error>cRec1).message().includes("minLength"));

    cRec1 = csv:parseListAsRecordType([["4", "abc"], ["3", "cde"]], ["a", "b"]);
    test:assertEquals(cRec1, [{a: 4, b: "abc"}, {a: 3, b: "cde"}]);

    cRec1 = csv:parseListAsRecordType([["4", "abc"], ["11", "cde"]], ["a", "b"]);
    test:assertTrue(cRec1 is csv:Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed")
                    && (<error>cRec1).message().includes("maxValue"));

    cRec1 = csv:parseListAsRecordType([["4", "abc"], ["5", "b"]], ["a", "b"]);
    test:assertTrue(cRec1 is csv:Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed")
                    && (<error>cRec1).message().includes("minLength"));
}
