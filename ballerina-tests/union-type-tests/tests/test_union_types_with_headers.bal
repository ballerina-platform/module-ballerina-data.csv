// import ballerina/data.csv;
// import ballerina/test;

// csv:TransformOptions op1 = {headersOrder: ["a", "b", "c", "d"], outputWithHeaders: false};
// csv:TransformOptions op2 = {headersOrder: ["a", "b", "c", "d"], outputWithHeaders: true};
// csv:TransformOptions op3 = {outputWithHeaders: true};
// csv:TransformOptions op4 = {headersOrder: ["a", "b"], outputWithHeaders: true};

// csv:ParseOptions op5 = {outputWithHeaders: true};

// csv:ParseListsOptions op6 = {outputWithHeaders: true};
// csv:ParseListsOptions op7 = {outputWithHeaders: true, headerRows: 1};
// csv:ParseListsOptions op8 = {outputWithHeaders: true, headerRows: 2};
// csv:ParseListsOptions op9 = {outputWithHeaders: true, headerRows: 2, customHeaders: ["a", "b", "c", "d"]};
// csv:ParseListsOptions op10 = {outputWithHeaders: true, headerRows: 1, customHeaders: ["a", "b", "c", "d"]};
// csv:ParseListsOptions op11 = {outputWithHeaders: true, customHeaders: ["a", "b", "c", "d"]};
// csv:ParseListsOptions op12 = {headerRows: 1, customHeaders: ["a", "b", "c", "d"]};
// csv:ParseListsOptions op13 = {customHeaders: ["a", "b", "c", "d"]};

// type UnionType1 string[][]|float[][];

// type UnionType2 float[][]|string[][];

// type UnionType3 (float|string)[][];

// type UnionType4 [string...][]|[boolean, string, string, string][];

// type UnionType5 [string, string, string, string][]|[string...][];

// type UnionType6 ([string...][]|[string, string, string, string])[];

// type UnionType7 string[][]|[string...][];

// type UnionType8 ([boolean...]|string[])[];

// type UnionType9 record {}[]|record {int d1;}[];

// type UnionType10 record {int d1;}[]|record {}[];

// type UnionType11 (record {int d1;}|record {})[];

// type UnionType12 map<string>[]|map<boolean>[];

// type UnionType13 map<boolean>[]|map<string>[];

// type UnionType14 (map<string>|map<boolean>)[];

// type UnionType15 (map<boolean>|map<string>)[];

// var csv1 = [["1", "2", "3", "4"], ["5", "6", "7", "8"], ["9", "10", "11", "12"], ["13", "14", "15", "16"]];
// var csv2 = [{a: 1, b: 2, c: 3, d: 4}, {a: 5, b: 6, c: 7, d: 8}, {a: 9, b: 10, c: 11, d: 12}, {a: 13, b: 14, c: 15, d: 16}];
// var csv3 = string `a,b,c,d
//                     1,2,3,4
//                     5,6,7,8
//                     9,10,11,12
//                     13,14,15,16`;

// var result1 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]];
// var result2 = [{a: 1, b: 2, c: 3, d: 4}, {a: 5, b: 6, c: 7, d: 8}, {a: 9, b: 10, c: 11, d: 12}, {a: 13, b: 14, c: 15, d: 16}];
// var result3 = [{a: "1", b: "2", c: "3", d: "4"}, {a: "5", b: "6", c: "7", d: "8"}, {a: "9", b: "10", c: "11", d: "12"}, {a: "13", b: "14", c: "15", d: "16"}];
// var result4 = [["1", "2", "3", "4"], ["5", "6", "7", "8"], ["9", "10", "11", "12"], ["13", "14", "15", "16"]];

// @test:Config
// function testParseStringWithMapWithOutputHeaders() {
//     UnionType9|csv:Error psu9 = csv:parseString(csv3);
//     test:assertEquals(psu9, result2);

//     psu9 = csv:parseString(csv3, op5);
//     test:assertEquals(psu9, result2);

//     UnionType10|csv:Error psu10 = csv:parseString(csv3);
//     test:assertEquals(psu10, result2);

//     psu10 = csv:parseString(csv3, op5);
//     test:assertEquals(psu10, result2);

//     UnionType11|csv:Error psu11 = csv:parseString(csv3);
//     test:assertEquals(psu11, result2);

//     psu11 = csv:parseString(csv3, op5);
//     test:assertEquals(psu11, result2);

//     UnionType12|csv:Error psu12 = csv:parseString(csv3);
//     test:assertEquals(psu12, result2);

//     psu12 = csv:parseString(csv3, op5);
//     test:assertEquals(psu12, result2);

//     UnionType13|csv:Error psu13 = csv:parseString(csv3);
//     test:assertEquals(psu13, result2);

//     psu13 = csv:parseString(csv3, op5);
//     test:assertEquals(psu13, result2);

//     UnionType14|csv:Error psu14 = csv:parseString(csv3);
//     test:assertEquals(psu14, result2);

//     psu14 = csv:parseString(csv3, op5);
//     test:assertEquals(psu14, result2);

//     UnionType15|csv:Error psu15 = csv:parseString(csv3);
//     test:assertEquals(psu15, result2);

//     psu15 = csv:parseString(csv3, op5);
//     test:assertEquals(psu15, result2);
// }

// @test:Config
// function testParseStringWithListWithOutputHeaders() {
//     UnionType1|csv:Error psu1 = csv:parseString(csv3);
//     test:assertEquals(psu1, result4);

//     psu1 = csv:parseString(csv3, op5);
//     test:assertEquals(psu1, result4);

//     UnionType2|csv:Error psu2 = csv:parseString(csv3);
//     test:assertEquals(psu2, result4);

//     psu2 = csv:parseString(csv3, op5);
//     test:assertEquals(psu2, result4);

//     UnionType3|csv:Error psu3 = csv:parseString(csv3);
//     test:assertEquals(psu3, result4);

//     psu3 = csv:parseString(csv3, op5);
//     test:assertEquals(psu3, result4);

//     UnionType4|csv:Error psu4 = csv:parseString(csv3);
//     test:assertEquals(psu4, result4);

//     psu4 = csv:parseString(csv3, op5);
//     test:assertEquals(psu4, result4);

//     UnionType5|csv:Error psu5 = csv:parseString(csv3);
//     test:assertEquals(psu5, result4);

//     psu5 = csv:parseString(csv3, op5);
//     test:assertEquals(psu5, result4);

//     UnionType6|csv:Error psu6 = csv:parseString(csv3);
//     test:assertEquals(psu6, result4);

//     psu6 = csv:parseString(csv3, op5);
//     test:assertEquals(psu6, result4);

//     UnionType7|csv:Error psu7 = csv:parseString(csv3);
//     test:assertEquals(psu7, result4);

//     psu7 = csv:parseString(csv3, op5);
//     test:assertEquals(psu7, result4);

//     UnionType8|csv:Error psu8 = csv:parseString(csv3);
//     test:assertEquals(psu8, result4);

//     psu8 = csv:parseString(csv3, op5);
//     test:assertEquals(psu8, result4);
// }
