import ballerina/data.csv;
import ballerina/test;

csv:TransformOptions op1 = {headersOrder: ["a", "b", "c", "d"], outputWithHeaders: false};
csv:TransformOptions op2 = {headersOrder: ["a", "b", "c", "d"], outputWithHeaders: true};
csv:TransformOptions op3 = {outputWithHeaders: true};
csv:TransformOptions op4 = {headersOrder: ["a", "b"], outputWithHeaders: true};

csv:ParseOptions op5 = {outputWithHeaders: true};

csv:ParseListsOptions op6 = {outputWithHeaders: true};
csv:ParseListsOptions op7 = {outputWithHeaders: true, headerRows: 1};
csv:ParseListsOptions op8 = {outputWithHeaders: true, headerRows: 2};
csv:ParseListsOptions op9 = {outputWithHeaders: true, headerRows: 2, customHeaders: ["a", "b", "c", "d"]};
csv:ParseListsOptions op10 = {outputWithHeaders: true, headerRows: 1, customHeaders: ["a", "b", "c", "d"]};
csv:ParseListsOptions op11 = {outputWithHeaders: true, customHeaders: ["a", "b", "c", "d"]};
csv:ParseListsOptions op12 = {headerRows: 1, customHeaders: ["a", "b", "c", "d"]};
csv:ParseListsOptions op13 = {customHeaders: ["a", "b", "c", "d"]};

type UnionType1 boolean[][]|string[][];

type UnionType2 ([boolean...]|[string, string...])[];

type UnionType3 record {int d1;}[]|record {}[];

type UnionType4 (map<string>|map<int>)[];

string[][] csv1 = [["1", "2", "3", "4"], ["5", "6", "7", "8"], ["9", "10", "11", "12"], ["13", "14", "15", "16"]];
var csv2 = [{a: 1, b: 2, c: 3, d: 4}, {a: 5, b: 6, c: 7, d: 8}, {a: 9, b: 10, c: 11, d: 12}, {a: 13, b: 14, c: 15, d: 16}];
var csv3 = string `a,b,c,d
                    1,2,3,4
                    5,6,7,8
                    9,10,11,12
                    13,14,15,16`;
var csv4 = [{a: "1", b: "2", c: "3", d: "4"}, {a: "5", b: "6", c: "7", d: "8"}, {a: "9", b: "10", c: "11", d: "12"}, {a: "13", b: "14", c: "15", d: "16"}];

var result1 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]];
var result2 = [{a: 1, b: 2, c: 3, d: 4}, {a: 5, b: 6, c: 7, d: 8}, {a: 9, b: 10, c: 11, d: 12}, {a: 13, b: 14, c: 15, d: 16}];
var result3 = [{a: "1", b: "2", c: "3", d: "4"}, {a: "5", b: "6", c: "7", d: "8"}, {a: "9", b: "10", c: "11", d: "12"}, {a: "13", b: "14", c: "15", d: "16"}];
var result4 = [["1", "2", "3", "4"], ["5", "6", "7", "8"], ["9", "10", "11", "12"], ["13", "14", "15", "16"]];
var result5 = [["a", "b", "c", "d"], [1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]];
var result6 = [["a", "b", "c", "d"], ["1", "2", "3", "4"], ["5", "6", "7", "8"], ["9", "10", "11", "12"], ["13", "14", "15", "16"]];
var result7 = [{'1: 1, '2: 2, '3: 3, '4: 4}, {'1: 5, '2: 6, '3: 7, '4: 8}, {'1: 9, '2: 10, '3: 11, '4: 12}, {'1: 13, '2: 14, '3: 15, '4: 16}];
var result8 = [{'1: "1", '2: "2", '3: "3", '4: "4"}, {'1: "5", '2: "6", '3: "7", '4: "8"}, {'1: "9", '2: "10", '3: "11", '4: "12"}, {'1: "13", '2: "14", '3: "15", '4: "16"}];

@test:Config
function testParseStringWithMapWithOutputHeaders() {
    UnionType3|csv:Error psu3 = csv:parseString(csv3);
    test:assertEquals(psu3, result2);

    psu3 = csv:parseString(csv3, op5);
    test:assertEquals(psu3, result2);

    UnionType4|csv:Error psu4 = csv:parseString(csv3);
    test:assertEquals(psu4, result3);

    psu4 = csv:parseString(csv3, op5);
    test:assertEquals(psu4, result3);
}

@test:Config
function testParseStringWithListWithOutputHeaders() {
    UnionType1|csv:Error psu1 = csv:parseString(csv3);
    test:assertEquals(psu1, result4);

    psu1 = csv:parseString(csv3, op5);
    test:assertEquals(psu1, result6);

    UnionType2|csv:Error psu2 = csv:parseString(csv3);
    test:assertEquals(psu2, result4);

    psu2 = csv:parseString(csv3, op5);
    test:assertEquals(psu2, result6);
}

@test:Config
function testTransformWithMapWithOutputHeaders() {
    UnionType3|csv:Error psu3 = csv:transform(csv2);
    test:assertEquals(psu3, result2);

    psu3 = csv:transform(csv2, op1);
    test:assertEquals(psu3, result2);

    psu3 = csv:transform(csv2, op2);
    test:assertEquals(psu3, result2);

    psu3 = csv:transform(csv2, op3);
    test:assertEquals(psu3, result2);

    psu3 = csv:transform(csv2, op4);
    test:assertEquals(psu3, result2);

    UnionType4|csv:Error psu4 = csv:transform(csv4);
    test:assertEquals(psu4, result3);

    psu4 = csv:transform(csv4, op1);
    test:assertEquals(psu4, result3);

    psu4 = csv:transform(csv4, op2);
    test:assertEquals(psu4, result3);

    psu4 = csv:transform(csv4, op3);
    test:assertEquals(psu4, result3);

    psu4 = csv:transform(csv4, op4);
    test:assertEquals(psu4, result3);
}

@test:Config
function testTransformWithListWithOutputHeaders() {
    UnionType1|csv:Error psu1 = csv:transform(csv4);
    test:assertEquals(psu1, result4);

    psu1 = csv:transform(csv4, op1);
    test:assertEquals(psu1, result4);

    psu1 = csv:transform(csv4, op2);
    test:assertEquals(psu1, result6);

    psu1 = csv:transform(csv4, op3);
    test:assertEquals(psu1, result6);

    UnionType2|csv:Error psu2 = csv:transform(csv4);
    test:assertEquals(psu2, result4);

    psu2 = csv:transform(csv4, op1);
    test:assertEquals(psu2, result4);

    psu2 = csv:transform(csv4, op2);
    test:assertEquals(psu2, result6);

    psu2 = csv:transform(csv4, op3);
    test:assertEquals(psu2, result6);
}

@test:Config
function testParseListWithMapWithOutputHeaders() {
    UnionType3|csv:Error psu3 = csv:parseLists(csv1);
    test:assertEquals(psu3, result7);

    psu3 = csv:parseLists(csv1, op6);
    test:assertEquals(psu3, result7);

    psu3 = csv:parseLists(csv1, op7);
    test:assertEquals(psu3, [{"1": 5, "2": 6, "3": 7, "4": 8}, {"1": 9, "2": 10, "3": 11, "4": 12}, {"1": 13, "2": 14, "3": 15, "4": 16}]);

    psu3 = csv:parseLists(csv1, op9);
    test:assertEquals(psu3, [{"a": 9, "b": 10, "c": 11, "d": 12}, {"a": 13, "b": 14, "c": 15, "d": 16}]);

    UnionType4|csv:Error psu4 = csv:parseLists(csv1);
    test:assertEquals(psu4, result8);

    psu4 = csv:parseLists(csv1, op6);
    test:assertEquals(psu4, result8);

    psu4 = csv:parseLists(csv1, op7);
    test:assertEquals(psu4, [{"1": "5", "2": "6", "3": "7", "4": "8"}, {"1": "9", "2": "10", "3": "11", "4": "12"}, {"1": "13", "2": "14", "3": "15", "4": "16"}]);

    psu4 = csv:parseLists(csv1, op9);
    test:assertEquals(psu4, [{"a": "9", "b": "10", "c": "11", "d": "12"}, {"a": "13", "b": "14", "c": "15", "d": "16"}]);
}

@test:Config
function testParseListWithListWithOutputHeaders() {
    UnionType1|csv:Error psu1 = csv:parseLists(csv1);
    test:assertEquals(psu1, result4);

    psu1 = csv:parseLists(csv1, op6);
    test:assertEquals(psu1, result4);

    psu1 = csv:parseLists(csv1, op7);
    test:assertEquals(psu1, result4);

    psu1 = csv:parseLists(csv1, op9);
    test:assertEquals(psu1, [["a","b","c","d"],["9","10","11","12"],["13","14","15","16"]]);

    UnionType2|csv:Error psu2 = csv:parseLists(csv1);
    test:assertEquals(psu2, result4);

    psu2 = csv:parseLists(csv1, op6);
    test:assertEquals(psu2, result4);

    psu2 = csv:parseLists(csv1, op7);
    test:assertEquals(psu2, result4);

    psu2 = csv:parseLists(csv1, op9);
    test:assertEquals(psu2, [["a","b","c","d"],["9","10","11","12"],["13","14","15","16"]]);
}

@test:Config
function testParseListWithMapWithOutputHeaders2() {
    UnionType3|csv:Error psu3 = csv:parseLists(csv1);
    test:assertEquals(psu3, result7);

    psu3 = csv:parseLists(csv1, op10);
    test:assertEquals(psu3, [{"a":5,"b":6,"c":7,"d":8},{"a":9,"b":10,"c":11,"d":12},{"a":13,"b":14,"c":15,"d":16}]);

    psu3 = csv:parseLists(csv1, op11);
    test:assertEquals(psu3, result2);

    psu3 = csv:parseLists(csv1, op12);
    test:assertEquals(psu3, [{"a":5,"b":6,"c":7,"d":8},{"a":9,"b":10,"c":11,"d":12},{"a":13,"b":14,"c":15,"d":16}]);

    psu3 = csv:parseLists(csv1, op13);
    test:assertEquals(psu3, result2);

    UnionType4|csv:Error psu4 = csv:parseLists(csv1);
    test:assertEquals(psu4, result8);

    psu4 = csv:parseLists(csv1, op10);
    test:assertEquals(psu4, [{a: "5", b: "6", c: "7", d: "8"}, {a: "9", b: "10", c: "11", d: "12"}, {a: "13", b: "14", c: "15", d: "16"}]);

    psu4 = csv:parseLists(csv1, op11);
    test:assertEquals(psu4, result3);

    psu4 = csv:parseLists(csv1, op12);
    test:assertEquals(psu4, [{a: "5", b: "6", c: "7", d: "8"}, {a: "9", b: "10", c: "11", d: "12"}, {a: "13", b: "14", c: "15", d: "16"}]);

    psu4 = csv:parseLists(csv1, op13);
    test:assertEquals(psu4, result3);
}

@test:Config
function testParseListWithListWithOutputHeaders2() {
    UnionType1|csv:Error psu1 = csv:parseLists(csv1);
    test:assertEquals(psu1, result4);

    psu1 = csv:parseLists(csv1, op10);
    test:assertEquals(psu1, [["a","b","c","d"],["5","6","7","8"],["9","10","11","12"],["13","14","15","16"]]);

    psu1 = csv:parseLists(csv1, op11);
    test:assertEquals(psu1, result6);

    psu1 = csv:parseLists(csv1, op12);
    test:assertEquals(psu1, [["5","6","7","8"],["9","10","11","12"],["13","14","15","16"]]);

    psu1 = csv:parseLists(csv1, op13);
    test:assertEquals(psu1, result4);

    UnionType2|csv:Error psu2 = csv:parseLists(csv1);
    test:assertEquals(psu2, result4);

    psu2 = csv:parseLists(csv1, op10);
    test:assertEquals(psu2, [["a","b","c","d"],["5","6","7","8"],["9","10","11","12"],["13","14","15","16"]]);

    psu2 = csv:parseLists(csv1, op11);
    test:assertEquals(psu2, [["a","b","c","d"], ["1", "2", "3", "4"],["5","6","7","8"],["9","10","11","12"],["13","14","15","16"]]);

    psu2 = csv:parseLists(csv1, op12);
    test:assertEquals(psu2, [["5","6","7","8"],["9","10","11","12"],["13","14","15","16"]]);

    psu2 = csv:parseLists(csv1, op13);
    test:assertEquals(psu2, [["1", "2", "3", "4"],["5","6","7","8"],["9","10","11","12"],["13","14","15","16"]]);
}
