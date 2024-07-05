import ballerina/test;
import ballerina/constraint;

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
    ConstrainedRec[]|Error cRec1 = parseStringToRecord(string `a,b
                4,abc
                3, cde`);
    test:assertEquals(cRec1, [{a: 4, b: "abc"}, {a: 3, b: "cde"}]);

    cRec1 = parseStringToRecord(string `a,b
                4,abc
                11, cde`);
    test:assertTrue(cRec1 is Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed") 
                    && (<error>cRec1).message().includes("maxValue"));

    cRec1 = parseStringToRecord(string `a,b
                4,abc
                5, "b"`, {});
    test:assertTrue(cRec1 is Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed") 
                    && (<error>cRec1).message().includes("minLength"));


    cRec1 = parseRecordAsRecordType([{"a": 4, "b": "abc"}, {"a": 3, "b": "cde"}], {});
    test:assertEquals(cRec1, [{a: 4, b: "abc"}, {a: 3, b: "cde"}]);

    cRec1 = parseRecordAsRecordType([{"a": 4, "b": "abc"}, {"a": 11, "b": "cde"}], {});
    test:assertTrue(cRec1 is Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed") 
                    && (<error>cRec1).message().includes("maxValue"));

    cRec1 = parseRecordAsRecordType([{"a": 4, "b": "abc"}, {"a": 5, "b": "b"}], {});
    test:assertTrue(cRec1 is Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed") 
                    && (<error>cRec1).message().includes("minLength"));

    cRec1 = parseListAsRecordType([["4", "abc"], ["3", "cde"]], ["a", "b"]);
    test:assertEquals(cRec1, [{a: 4, b: "abc"}, {a: 3, b: "cde"}]);

    cRec1 = parseListAsRecordType([["4", "abc"], ["11", "cde"]], ["a", "b"]);
    test:assertTrue(cRec1 is Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed") 
                    && (<error>cRec1).message().includes("maxValue"));

    cRec1 = parseListAsRecordType([["4", "abc"], ["5", "b"]], ["a", "b"]);
    test:assertTrue(cRec1 is Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed") 
                    && (<error>cRec1).message().includes("minLength"));
}