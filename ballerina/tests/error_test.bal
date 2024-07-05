import ballerina/test;

// boolean enable = true;

// @test:Config {enable: !enable}
// function debugTest() returns  error? {
//     record{}[]|Error csv1op4_3 = parseStringToRecord(csvStringData2, ptOption4);
//     test:assertEquals(csv1op4_3, [
//         {a: 1, b: "string1", c: true, d: 2.234, e: 2.234, f: "()"},
//         {a: 3, b: "string3", c: 0, d: 1.23, e: 1.23, f: "()"},
//         {a: 5, b: "string5", c: true, d: 3, e: 3, f: "()"}
//     ]);
// }

function errorTest() returns  error? {
    // check

    record{}[]|Error csv3op3_4 = parseStringToRecord(csvStringData3, {header: 11});
    test:assertEquals(csv3op3_4, []);

    csv3op3_4 = parseStringToRecord(csvStringData3, {header: 3});
    test:assertEquals(csv3op3_4, []);
    
}
