import ballerina/test;

@test:Config
function testIntersectionExpectedTypes() returns error? {
    (int[] & readonly)[]|Error a = parseStringToList(string `a,b
                                                                            1,2
                                                                            4,5`);
    test:assertTrue(a is (int[] & readonly)[]);                                                                       
    test:assertEquals(a, [[1, 2], [4, 5]]);

    ([string, string])[] & readonly|Error a2 = parseStringToList(string `a,b
                                                                            a,a
                                                                            c,c`);
    test:assertTrue(a2 is [string, string][] & readonly);                                                                    
    test:assertEquals(a2, [["a", "a"], ["c", "c"]]);

    (record{int a; string b;} & readonly)[]|Error a3 = parseStringToRecord(string `a,b
                                                                            1,2
                                                                            4,5`);
    test:assertTrue(a3 is (record{int a; string b;} & readonly)[]);                                                                        
    test:assertEquals(a3, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    record{|string...;|}[] & readonly|Error a4 = parseStringToRecord(string `a,b
                                                                            a,a
                                                                            c,c`);
    test:assertTrue(a4 is record{|string...;|}[] & readonly);
    test:assertEquals(a4, [{a: "a", b: "a"}, {a: "c", b: "c"}]);

    ([int] & readonly)[]|Error a5 = parseStringToList(string `a,b
                                                                            1,2
                                                                            4,5`);
    test:assertTrue(a5 is ([int] & readonly)[]);
    test:assertEquals(a5, [[1], [4]]);

    ([string, string])[] & readonly|Error a6 = parseStringToList(string `a,b
                                                                            a,a
                                                                            c,c`);
    test:assertTrue(a6 is [string, string][] & readonly);
    test:assertEquals(a6, [["a", "a"], ["c", "c"]]);

    (record{int a; string b;} & readonly)[]|Error a7 = parseStringToRecord(string `a,b
                                                                            1,2
                                                                            4,5`);
    test:assertTrue(a7 is record{int a; string b;}[] & readonly);
    test:assertEquals(a7, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    map<string>[] & readonly|Error a8 = parseStringToRecord(string `a,b
                                                                            a,a
                                                                            c,c`);
    test:assertTrue(a8 is map<string>[] & readonly);
    test:assertEquals(a8, [{a: "a", b: "a"}, {a: "c", b: "c"}]);

    (((int[] & readonly)|([string, string] & readonly)) & readonly)[]|Error a9 = parseStringToList(string `a,b
                                                                            1,2
                                                                            a,a`);
    test:assertTrue(a9 is (((int[] & readonly)|([string, string] & readonly)) & readonly)[]);
    test:assertEquals(a9, [[1, 2], ["a", "a"]]);

    ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[] 
                                    & readonly|Error a10 = parseStringToRecord(string `a,b
                                                                            a,a
                                                                            1,2`);
    test:assertTrue(a10 is ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[] & readonly);
    test:assertEquals(a10, [{a: "a", b: "a"}, {a: "1", b: "2"}]);
}

@test:Config
function testIntersectionExpectedTypes2() returns error? {
    (int[] & readonly)[]|Error a = parseRecordAsListType([{"a": 1, "b": 2}, {"a": 4, "b": 5}], ["a", "b"], {});
    test:assertTrue(a is (int[] & readonly)[]);                                                                       
    test:assertEquals(a, [[1, 2], [4, 5]]);

    ([string, string])[] & readonly|Error a2 = parseRecordAsListType([{"a": "a", "b": "a"}, {"a": "c", "b": "c"}], ["a", "b"], {});
    test:assertTrue(a2 is [string, string][] & readonly);                                                                    
    test:assertEquals(a2, [["a", "a"], ["c", "c"]]);

    (record{int a; string b;} & readonly)[]|Error a3 = parseRecordAsRecordType([{"a": 1, "b": "2"}, {"a": 4, "b": "5"}], {});
    test:assertTrue(a3 is (record{int a; string b;} & readonly)[]);                                                                        
    test:assertEquals(a3, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    record{|string...;|}[] & readonly|Error a4 = parseRecordAsRecordType([{"a": "a", "b": "a"}, {"a": "c", "b": "c"}], {});
    test:assertTrue(a4 is record{|string...;|}[] & readonly);
    test:assertEquals(a4, [{a: "a", b: "a"}, {a: "c", b: "c"}]);

    ([int] & readonly)[]|Error a5 = parseRecordAsListType([{"a": 1, "b": 2}, {"a": 4, "b": 5}], ["a", "b"], {});
    test:assertTrue(a5 is ([int] & readonly)[]);
    test:assertEquals(a5, [[1], [4]]);

    ([string, string])[] & readonly|Error a6 = parseRecordAsListType([{"a": "a", "b": "a"}, {"a": "c", "b": "c"}], ["a", "b"], {});
    test:assertTrue(a6 is [string, string][] & readonly);
    test:assertEquals(a6, [["a", "a"], ["c", "c"]]);

    (record{int a; string b;} & readonly)[]|Error a7 = parseRecordAsRecordType([{"a": 1, "b": "2"}, {"a": 4, "b": "5"}], {});
    test:assertTrue(a7 is record{int a; string b;}[] & readonly);
    test:assertEquals(a7, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    map<string>[] & readonly|Error a8 = parseRecordAsRecordType([{"a": "a", "b": "a"}, {"a": "c", "b": "c"}], {});
    test:assertTrue(a8 is map<string>[] & readonly);
    test:assertEquals(a8, [{a: "a", b: "a"}, {a: "c", b: "c"}]);

    (((int[] & readonly)|([string, string] & readonly)) & readonly)[]|Error a9 = parseRecordAsListType([{"a": 1, "b": 2}, {"a": "a", "b": "b"}], ["a", "b"], {});
    test:assertTrue(a9 is (((int[] & readonly)|([string, string] & readonly)) & readonly)[]);
    test:assertEquals(a9, [[1, 2], ["a", "b"]]);

    ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[] 
                                    & readonly|Error a10 = parseRecordAsRecordType([{"a": "a", "b": "a"}, {"a": 1, "b": 2}], {});
    test:assertTrue(a10 is ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[] & readonly);
    test:assertEquals(a10, [{a: "a", b: "a"}, {a: 1, b: 2}]);
}

@test:Config
function testIntersectionExpectedTypes3() returns error? {
    (int[] & readonly)[]|Error a = parseListAsListType([["1", "2"], ["4", "5"]], {});
    test:assertTrue(a is (int[] & readonly)[]);                                                                       
    test:assertEquals(a, [[1, 2], [4, 5]]);

    ([string, string])[] & readonly|Error a2 = parseListAsListType([["a", "a"], ["c", "c"]], {});
    test:assertTrue(a2 is [string, string][] & readonly);                                                                    
    test:assertEquals(a2, [["a", "a"], ["c", "c"]]);

    (record{int a; string b;} & readonly)[]|Error a3 = parseListAsRecordType([["1", "2"], ["4", "5"]], ["a", "b"], {});
    test:assertTrue(a3 is (record{int a; string b;} & readonly)[]);                                                                        
    test:assertEquals(a3, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    record{|string...;|}[] & readonly|Error a4 = parseListAsRecordType([["a", "a"], ["c", "c"]], ["a", "b"], {});
    test:assertTrue(a4 is record{|string...;|}[] & readonly);
    test:assertEquals(a4, [{a: "a", b: "a"}, {a: "c", b: "c"}]);

    ([int] & readonly)[]|Error a5 = parseListAsListType([["1", "2"], ["4", "5"]], {});
    test:assertTrue(a5 is ([int] & readonly)[]);
    test:assertEquals(a5, [[1], [4]]);

    ([string, string])[] & readonly|Error a6 = parseListAsListType([["a", "a"], ["c", "c"]], {});
    test:assertTrue(a6 is [string, string][] & readonly);
    test:assertEquals(a6, [["a", "a"], ["c", "c"]]);

    (record{int a; string b;} & readonly)[]|Error a7 = parseListAsRecordType([["1", "2"], ["4", "5"]], ["a", "b"], {});
    test:assertTrue(a7 is record{int a; string b;}[] & readonly);
    test:assertEquals(a7, [{a: 1, b: "2"}, {a: 4, b: "5"}]);

    map<string>[] & readonly|Error a8 = parseListAsRecordType([["a", "a"], ["c", "c"]], ["a", "b"], {});
    test:assertTrue(a8 is map<string>[] & readonly);
    test:assertEquals(a8, [{a: "a", b: "a"}, {a: "c", b: "c"}]);

    (((int[] & readonly)|([string, string] & readonly)) & readonly)[]|Error a9 = parseListAsListType([["1", "2"], ["a", "b"]], {});
    test:assertTrue(a9 is (((int[] & readonly)|([string, string] & readonly)) & readonly)[]);
    test:assertEquals(a9, [[1, 2], ["a", "b"]]);

    ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[] 
                                    & readonly|Error a10 = parseListAsRecordType([["a", "a"], ["1", "2"]], ["a", "b"], {});
    test:assertTrue(a10 is ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[] & readonly);
    test:assertEquals(a10, [{a: "a", b: "a"}, {a: "1", b: "2"}]);

    ((record {int a; int b;} & readonly)|(record {string a; string b;} & readonly))[] 
                                    & readonly|Error a11 = parseListAsRecordType([["a", "a"], ["1", "2"]], ["a", "b"], {});
    test:assertTrue(a11 is ((record {string a; string b;} & readonly)|(record {int a; int b;} & readonly))[] & readonly);
    test:assertEquals(a11, [{a: "a", b: "a"}, {a: 1, b: 2}]);
}
