import ballerina/data.csv;
import ballerina/test;

type Book1 record {
    ()|string name;
    ()|string author;
    ()|string year;
};

@test:Config
function testEmptyStringWithNilConfig() {
    string csvString1 = string `name,author,year
                                ,b,c
                                a,,c
                                a,b,`;

    Book1[]|error books1 = csv:parseString(csvString1, {nilValue: ""});
    test:assertEquals(books1, [
        {name: null, author: "b", year: "c"},
        {name: "a", author: null, year: "c"},
        {name: "a", author: "b", year: null}
    ]);

    Book1[]|error books2 = csv:parseString(csvString1);
    test:assertEquals(books2, [
        {name: "", author: "b", year: "c"},
        {name: "a", author: "", year: "c"},
        {name: "a", author: "b", year: ""}
    ]);

    (boolean|()|string|int)[][]|error arrbooks1 = csv:parseString(csvString1, {nilValue: ""});
    test:assertEquals(arrbooks1, [
        [null, "b", "c"],
        ["a", null, "c"],
        ["a", "b", null]
    ]);

    (boolean|()|string|int)[][2]|error arrbooks2 = csv:parseString(csvString1, {nilValue: ""});
    test:assertEquals(arrbooks2, [
        [null, "b"],
        ["a", null],
        ["a", "b"]
    ]);

    (boolean|()|string|int)[][]|error arrbooks3 = csv:parseString(csvString1);
    test:assertEquals(arrbooks3, [
        ["", "b", "c"],
        ["a", "", "c"],
        ["a", "b", ""]
    ]);

    (boolean|()|string|int)[][2]|error arrbooks4 = csv:parseString(csvString1);
    test:assertEquals(arrbooks4, [
        ["", "b"],
        ["a", ""],
        ["a", "b"]
    ]);
}
