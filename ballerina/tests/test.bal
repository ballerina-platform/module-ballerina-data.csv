import ballerina/test;
import ballerina/io;

type A map<string>[];
type A2 map<int>[];

type B record{|int a; int b;|}[];
type B2 record{|string a; string b;|}[];
type B3 record{}[];
type B4 record{string '1; string '2; string '3;}[];
type B5 record{string '1;}[];
type B6 record{string name;}[];

type C string[][];
type C2 string[][];

type D [int, int][];
type D2 [string, string][];

map<string>[] a = [{"a": "1", "b": "2"}, {"a": "1", "b": "2"}];
map<int>[] a2 = [{"a": 1, "b": 2}, {"a": 1, "b": 2}];

record {|int a; int b; int c;|}[] b = [{a: 1, b: 2, c: 3}, {a: 1, b: 2, c: 3}]; 
record {|string a; string b;|}[] b2 = [{a: "1", b: "2"}, {a: "1", b: "2"}];

string[][] c = [["1", "2", "3"], ["1", "2", "3"]];
string[][] c2 = [["1", "2", "3"], ["1", "2", "3"]];
int[][] c3 = [[1, 2], [1, 2]];
int[][] c4 = [[1, 2, 3], [1, 2, 3]];

[string, string][] d = [["1", "2"], ["1", "2"]];
[string, string][] d2 = [["1", "2"], ["1", "2"]];

@test:Config{enable: true }
public function testA() returns error? {
    A aa = check fromCsvWithType(a, {}, A);
    test:assertEquals(aa, a);

    A2 aa2 = check fromCsvWithType(a2, {}, A2);
    test:assertEquals(aa2, a2);

    B bb = check fromCsvWithType(b, {}, B);
    test:assertEquals(bb, [{a: 1, b: 2}, {a: 1, b: 2}]);

    B2 bb2 = check fromCsvWithType(b2, {}, B2);
    test:assertEquals(bb2, b2);

    C cc = check fromCsvWithType(c, {}, C);
    test:assertEquals(cc, c);

    C2 cc2 = check fromCsvWithType(c2, {}, C2);
    test:assertEquals(cc2, c2);

    B2 ab2 = check fromCsvWithType(a, {}, B2);
    test:assertEquals(ab2, a);

    C ac = check fromCsvWithType(a, {}, C);
    test:assertEquals(ac, [["1", "2"], ["1", "2"]]);

    A ba = check fromCsvWithType(b, {}, A);
    test:assertEquals(ba, [{a: "1", b: "2", c: "3"}, {a: "1", b: "2", c: "3"}]);

    A2 ba2 = check fromCsvWithType(b, {}, A2);
    test:assertEquals(ba2, [{a: 1, b: 2, c: 3}, {a: 1, b: 2, c: 3}]);

    C bc = check fromCsvWithType(b, {}, C);
    test:assertEquals(bc, [["1", "2", "3"], ["1", "2", "3"]]);

    C2 bc2 = check fromCsvWithType(b2, {}, C2);
    test:assertEquals(bc2, [["1", "2"], ["1", "2"]]);

    A ca = check fromCsvWithType(c, {}, A);
    test:assertEquals(ca, [{"1": "1", "2": "2", "3": "3"}, {"1": "1", "2": "2", "3": "3"}]);
    
    // B2 cb2 = check fromCsvWithType(c, {}, B2);
    // test:assertEquals(cb2, [{"1": "1", "2": "2", "3": "3"}, {"1": "1", "2": "2", "3": "3"}]);

    B3 cb3 = check fromCsvWithType(c, {}, B3);
    test:assertEquals(cb3, [{"1": "1", "2": "2", "3": "3"}, {"1": "1", "2": "2", "3": "3"}]);

    B4 cb4 = check fromCsvWithType(c, {}, B4);
    test:assertEquals(cb4, [{"1": "1", "2": "2", "3": "3"}, {"1": "1", "2": "2", "3": "3"}]);

    B5 cb5 = check fromCsvWithType(c, {}, B5);
    test:assertEquals(cb5, [{"1": "1", "2": "2", "3": "3"}, {"1": "1", "2": "2", "3": "3"}]);

    // B6 cb6 = check fromCsvWithType(c, {}, B6);
    // test:assertEquals(cb6, [{"1": "1", "2": "2", "3": "3"}, {"1": "1", "2": "2", "3": "3"}]);

    D2 ad2 = check fromCsvWithType(a, {}, D2);
    test:assertEquals(ad2, <D2>[["1", "2"], ["1", "2"]]);

    D a2d = check fromCsvWithType(a2, {}, D);
    test:assertEquals(a2d, [[1, 2], [1, 2]]);

    D2 a2d2 = check fromCsvWithType(a2, {}, D2);
    test:assertEquals(a2d2, [["1", "2"], ["1", "2"]]);

    // D dd = check fromCsvWithType(d, {}, D);
    // test:assertEquals(dd, d);

    D2 dd2 = check fromCsvWithType(d2, {}, D2);
    test:assertEquals(dd2, d2);

    D bd = check fromCsvWithType(b, {}, D);
    test:assertEquals(bd, [[1, 2], [1, 2]]);

    D2 bd2 = check fromCsvWithType(b2, {}, D2);
    test:assertEquals(bd2, [["1", "2"], ["1", "2"]]);

    D2 cd2 = check fromCsvWithType(c, {}, D2);
    test:assertEquals(cd2, [["1", "2"], ["1", "2"]]);

    A d2a = check fromCsvWithType(d2, {}, A);
    test:assertEquals(d2a, [{"1": "1", "2": "2"}, {"1": "1", "2": "2"}]);

    // B2 d2b2 = check fromCsvWithType(d2, {}, B2);
    // test:assertEquals(d2b2, [{"1": "1", "2": "2"}, {"1": "1", "2": "2"}]);

    C d2c = check fromCsvWithType(d2, {}, C);
    test:assertEquals(d2c, [["1", "2"], ["1", "2"]]);
}

@test:Config{enable: true }
function testB() returns error? {
    // B2 d2b2 = check fromCsvWithType(d2, {}, B2);
    // test:assertEquals(d2b2, [{"1": "1", "2": "2"}, {"1": "1", "2": "2"}]);

    // D2 ad2 = check fromCsvWithType(a, {}, D2);
    // test:assertEquals(ad2, <D2>[["1", "2"], ["1", "2"]]);

    // D2 bd2 = check fromCsvWithType(b2, {}, D2);
    // test:assertEquals(bd2, [["1", "2"], ["1", "2"]]);

    // D2 cd2 = check fromCsvWithType(c, {}, D2);
    // test:assertEquals(cd2, [["1", "2"], ["1", "2"]]);

    //     A d2a = check fromCsvWithType(d2, {}, A);
    // test:assertEquals(d2a, [{"1": "1", "2": "2"}, {"1": "1", "2": "2"}]);

    // B2 d2b2 = check fromCsvWithType(d2, {}, B2);
    // test:assertEquals(d2b2, [{"1": "1", "2": "2"}, {"1": "1", "2": "2"}]);

    // C d2c = check fromCsvWithType(d2, {}, C);
    // test:assertEquals(d2c, [["1", "2"], ["1", "2"]]);
}

    // D a2d = check fromCsvWithType(a2, {}, D);
    // test:assertEquals(a2d, [[1, 2], [1, 2]]);

    // D2 a2d2 = check fromCsvWithType(a2, {}, D2);
    // test:assertEquals(a2d2, [["1", "2"], ["1", "2"]]);

    // D dd = check fromCsvWithType(d, {}, D);
    // test:assertEquals(dd, d);

    // D2 dd2 = check fromCsvWithType(d2, {}, D2);
    // test:assertEquals(dd2, d2);

    // D bd = check fromCsvWithType(b, {}, D);
    // test:assertEquals(bd, [[1, 2], [1, 2]]);

    // D2 bd2 = check fromCsvWithType(b2, {}, D2);
    // test:assertEquals(bd2, [["1", "2"], ["1", "2"]]);

    // D2 cd2 = check fromCsvWithType(c, {}, D2);
    // test:assertEquals(cd2, [["1", "2"], ["1", "2"]]);

    //     A d2a = check fromCsvWithType(d2, {}, A);
    // test:assertEquals(d2a, [{"1": "1", "2": "2"}, {"1": "1", "2": "2"}]);

    // B2 d2b2 = check fromCsvWithType(d2, {}, B2);
    // test:assertEquals(d2b2, [{"1": "1", "2": "2"}, {"1": "1", "2": "2"}]);

    // C d2c = check fromCsvWithType(d2, {}, C);
    // test:assertEquals(d2c, [["1", "2"], ["1", "2"]]);

type AA record{}[];
type BB record {int a; int b; int c;}[];
// type BBB record {string a; string b; string c;}[];
type CC map<string>[];
type DD map<int>[];
type EE map<anydata>[];
type FF int[][];
type GG string[][];
type HH anydata[][];
type II [int, int, int][];
type JJ [string, string, string][];
type KK [string, int, string][];
type LL record {string a; int b; string c;}[];
type MM record {|string a; int b; string c;|}[];
type NN record {|int b; string c;|}[];
type OO record {string a; string c;}[];
type PP int[2][];
type QQ string[2][];
type RR anydata[2][];
type SS [int, int][];
type TT [string, string][];
type UU [anydata, anydata][];
type VV [int, string][];
type WW int[][2];
type XX string[][2];
type YY anydata[][2];

@test:Config{ enable: true }
function test() returns CsvConversionError? {
    string a = check io:fileReadString("a.txt");

    AA aa = check fromCsvStringWithType(a, {}, AA);
    test:assertEquals(aa, [{a: 1, b: 2, c: 3}, {a: 4, b: 5, c: 6}]);
    io:println(aa);

    BB bb = check fromCsvStringWithType(a, {}, BB);
    test:assertEquals(bb, [{a: 1, b: 2, c: 3}, {a: 4, b: 5, c: 6}]);
    io:println(bb);

    CC cc = check fromCsvStringWithType(a, {}, CC);
    test:assertEquals(cc, [{a: "1", b: "2", c: "3"}, {a: "4", b: "5", c: "6"}]);
    io:println(cc);

    DD dd = check fromCsvStringWithType(a, {}, DD);
    test:assertEquals(dd, [{a: 1, b: 2, c: 3}, {a: 4, b: 5, c: 6}]);
    io:println(dd);

    EE ee = check fromCsvStringWithType(a, {}, EE);
    test:assertEquals(ee, [{a: 1, b: 2, c: 3}, {a: 4, b: 5, c: 6}]);
    io:println(ee);

    FF ff = check fromCsvStringWithType(a, {}, FF);
    test:assertEquals(ff, [[1, 2, 3], [4, 5, 6]]);
    io:println(ff);

    GG gg = check fromCsvStringWithType(a, {}, GG);
    test:assertEquals(gg, [["1", "2", "3"], ["4", "5", "6"]]);
    io:println(gg);

    HH hh = check fromCsvStringWithType(a, {}, HH);
    test:assertEquals(hh, [[1, 2, 3], [4, 5, 6]]);
    io:println(hh);

    II ii = check fromCsvStringWithType(a, {}, II);
    test:assertEquals(ii, [[1, 2, 3], [4, 5, 6]]);
    io:println(ii);

    JJ jj = check fromCsvStringWithType(a, {}, JJ);
    test:assertEquals(jj, [["1", "2", "3"], ["4", "5", "6"]]);
    io:println(jj);

    KK kk = check fromCsvStringWithType(a, {}, KK);
    test:assertEquals(kk, [["1", 2, "3"], ["4", 5, "6"]]);
    io:println(kk);

    LL ll = check fromCsvStringWithType(a, {}, LL);
    test:assertEquals(ll, [{a: "1", b: 2, c: "3"}, {a: "4", b: 5, c: "6"}]);
    io:println(ll);

    MM mm = check fromCsvStringWithType(a, {}, MM);
    test:assertEquals(mm, [{a: "1", b: 2, c: "3"}, {a: "4", b: 5, c: "6"}]);
    io:println(mm);

    NN nn = check fromCsvStringWithType(a, {}, NN);
    test:assertEquals(nn, [{b: 2, c: "3"}, {b: 5, c: "6"}]);
    io:println(nn);

    OO oo = check fromCsvStringWithType(a, {}, OO);
    test:assertEquals(oo, [{a: "1", b: 2, c: "3"}, {a: "4", b: 5, c: "6"}]);
    io:println(oo);

    PP pp = check fromCsvStringWithType(a, {}, PP);
    test:assertEquals(pp, [[1,2,3], [4,5,6]]);
    io:println(pp);

    QQ qq = check fromCsvStringWithType(a, {}, QQ);
    test:assertEquals(qq, [["1","2","3"],["4","5","6"]]);
    io:println(qq);

    RR rr = check fromCsvStringWithType(a, {}, RR);
    test:assertEquals(rr, [[1,2,3],[4,5,6]]);
    io:println(rr);

    SS ss = check fromCsvStringWithType(a, {}, SS);
    test:assertEquals(ss, [[1, 2],[4, 5]]);
    io:println(ss);

    TT tt = check fromCsvStringWithType(a, {}, TT);
    test:assertEquals(tt, [["1", "2"],["4", "5"]]);
    io:println(tt);

    UU uu = check fromCsvStringWithType(a, {}, UU);
    test:assertEquals(uu, [[1, 2],[4, 5]]);
    io:println(uu);

    VV vv = check fromCsvStringWithType(a, {}, VV);
    test:assertEquals(vv, [[1,"2"],[4,"5"]]);
    io:println(vv);

    WW ww = check fromCsvStringWithType(a, {}, WW);
    test:assertEquals(ww, [[1,2],[4,5]]);
    io:println(ww);

    XX xx = check fromCsvStringWithType(a, {}, XX);
    test:assertEquals(xx, [["1","2"],["4","5"]]);
    io:println(xx);

    YY yy = check fromCsvStringWithType(a, {}, YY);
    test:assertEquals(yy, [[1,2],[4,5]]);
    io:println(yy);
}

// ===========================================================================================

// errors expected

// EE ee2 = check fromCsvStringWithType(a, {}, EE);
//     test:assertEquals(ee2, [{a: "1", b: "2", c: "3"}, {a: "4", b: "5", c: "6"}]);
//     io:println(ee2);
// BBB bbb = check fromCsvStringWithType(a, {}, BBB);
//     test:assertEquals(bbb, [{a: 1, b: 2, c: 3}, {a: 4, b: 5, c: 6}]);
//     io:println(bbb);

// ===========================================================================================

// NEED TO check 

// OO oo = check fromCsvStringWithType(a, {}, MM);
//     test:assertEquals(oo, [{a: "1", b: 2, c: "3"}, {a: "4", b: 5, c: "6"}]);
//     io:println(oo);

type AAA string[][];

@test:Config{ enable: true }
function testC() returns error? {
    anydata[][] a = [[1, 2], [2, 3], [2, 3]];
    record{}[] b = [{"a": 1, "b": 2}, {"a": 1, "b": 2}, {"a": 1, "b": 2}];
    map<anydata>[] c = [{"a": 1, "b": 2}, {"a": 1, "b": 2}, {"a": 1, "b": 2}];

    io:println(toCsvString(a));
    io:println(toCsvString(b));
    io:println(toCsvString(c));
}