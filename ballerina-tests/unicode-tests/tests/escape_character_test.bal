import ballerina/data.csv as csv;
import ballerina/test;

@test:Config
function testEscapedCharactres() returns error? {
    string csvString = string `a, b
                            quote\"\"quoted\"quote, 1
                            backslash\\backslash, 2
                            newline\nnewline, 3
                            tab\ttab, 5
                            unicode\u0061unicode, 6
                            slash\/slash, 9
                            quoted string \\'abc\\', 10`;
    
    record{string a; int b;}[]|csv:Error rec = csv:parseStringToRecord(csvString);
    test:assertEquals(rec, [
        {a: string `quote""quoted"quote`, b: 1},
        {a: string `backslash${"\\"}backslash`, b: 2},
        {a: string `newline${"\n"}newline`, b: 3},
        {a: string `tab${"\t"}tab`, b: 5},
        {a: string `unicodeaunicode`, b: 6},
        {a: string `slash/slash`, b: 9},
        {a: string `quoted string \'abc\'`, b: 10}
    ]);
}

@test:Config
function testEscapedCharactres2() returns error? {
    string csvString = string `a, b
                            backspace\bbackspace, 7`;
    
    record{string a; int b;}[]|csv:Error rec = csv:parseStringToRecord(csvString);
    test:assertTrue(rec is record{string a; int b;}[]);
}

@test:Config
function testEscapedCharactres3() returns error? {
    string csvString = string ` a c, b
                            carriage return\r carriage return, 4`;
    
    record{}[]|csv:Error rec = csv:parseStringToRecord(csvString);
    test:assertEquals(rec, [
        {"a c": string `carriage return${"\r"} carriage return`, b: 4}
    ]);
}

@test:Config
function testEscapedCharactres4() returns error? {
    string csvString = string `a, b
                            form feed\f form feed, 8`;
    
    record{string a; int b;}[]|csv:Error rec = csv:parseStringToRecord(csvString);
    test:assertTrue(rec is record {string a; int b;}[]);
    // TODO: Add tests after supports \f by Ballerina
}
