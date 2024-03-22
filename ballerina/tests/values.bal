boolean b1 = true;
false b2 = false;
boolean? b3 = ();
boolean|int b4 = false;

() n1 = ();
int? n2 = ();
() n3 = null;

int i1 = 1;
int i2 = -2;
int i3 = int:MAX_VALUE;
int i4 = int:MIN_VALUE;
int i5 = 0;
2 i6 = 2;
int? i7 = ();
int|string i8 = 100;

float f1 = 2.234;
float f2 = -3.21f;
float f3 = 0;
float f4 = float:Infinity;
float f5 = -float:Infinity;
float f6 = float:NaN;
2.3f f7 = 2.3;
float? f8 = ();
float|decimal f9 = 1.21;

decimal d1 = 2.234;
decimal d2 = -3.21d;
decimal d3 = 0;
2.3d d4 = 2.3;
decimal? d5 = ();
decimal|int d6 = 1.21;

string s1 = "string";
string s2 = "";
string:Char s3 = "a";

map<boolean> bm1 = {b1, b2};
map<boolean?> bm2 = {b1, b2, b3, n1, n3};
map<boolean|int?> bm3 = {b1, b2, b3, b4, i1};
map<()> bm4 = {n1, n3};
map<boolean?> bm5 = {b1, b2, b3, b4:true};

map<int> m5 = {i1, i2, i3, i4, i5, i6};
map<float> m6 = {f1, f2, f3, f4,  f5, f6, f7};
map<decimal> m7 = {d1, d2, d3, d4};
map<decimal|float> m8 = {d1, f1, f9, f10: 1.23};
map<string> m9 = {s1, s2, s3};
map<anydata> m10 = {b1, b2, b3, b4,  n1, n2, n3, i1, i2, i3, i4, i5, i6, i7, i8, f1, f2, f3, f4, f5, f6, f7, f8};
map<json> m11 = {b1, b2, b3, b4,  n1, n2, n3, i1, i2, i3, i4, i5, i6, i7, i8, f1, f2, f3, f4, f5, f6, f7, f8};

boolean[] arr1 = [b1, b2];
boolean?[] arr2 = [b1, b2, b3, n1, n3];
(boolean|int?)[] arr3 = [b1, b2, b3, b4, i1];
()[] arr4 = [n1, n3];
int[] arr5 = [i1, i2, i3, i4, i5, i6];
float[] arr6 = [f1, f2, f3, f4, f5, f6, f7];
decimal[] arr7 = [d1, d2, d3, d4];
(decimal|float)[] arr8 = [d1, f1, f9, 1.23];
string[] arr9 = [s1, s2, s3];
anydata[] arr10 = [b1, b2, b3, b4,  n1, n2, n3, i1, i2, i3, i4, i5, i6, i7, i8, f1, f2, f3, f4, f5, f6, f7, f8];
json[] arr11 = [b1, b2, b3, b4,  n1, n2, n3, i1, i2, i3, i4, i5, i6, i7, i8, f1, f2, f3, f4, f5, f6, f7, f8];

[boolean, boolean] bt1 = [b1, b2];
[boolean, boolean, boolean, boolean] bt2 = [b1, b2, b1, b2];
[boolean?, boolean?, boolean?, boolean?, boolean?] bt3 = [b1, b2, b3, n1, n3];
[boolean|int?, boolean|int?, boolean|int?, boolean|int?, boolean|int?] bt4 = [b1, b2, b3, b4, i1];
[boolean...] bt5 = [b1, b2];

[string, string] st1 = [s1, s2];
[string, string, string, string] st2 = [s1, s2, s3, s2];
[string...] st3 = [s1, s2];
[string, string, string...] st4 = [s1, s2, s3, s2];

[string?, string?, string?, string?, string?] st5 = [s1, s2, s3, n1, n3];
[string|int?, string|int?, string|int?, string|int?, string|int?] st6 = [s1, s2, s3, n1, i1];
[string?...] st7 = [s1, s2];
[string...] st8 = [];
[string, string, string] st9 = [s1, s2, s3];

[(), ()] tup4 = [n1, n3];
[int, int, int, int, int, int] tup5 = [i1, i2, i3, i4, i5, i6];
[float, float, float, float, float, float, float] tup6 = [f1, f2, f3, f4, f5, f6, f7];
[decimal, decimal, decimal, decimal] tup7 = [d1, d2, d3, d4];
[decimal|float, decimal|float, decimal|float, decimal|float] tup8 = [d1, f1, f9, 1.23];
[string, string, string] tup9 = [s1, s2, s3];
[anydata, anydata, anydata, anydata, anydata, anydata, anydata, anydata, 
    anydata, anydata, anydata, anydata, anydata, anydata, anydata, anydata, 
    anydata, anydata, anydata, anydata, anydata, anydata, anydata] tup10 = [b1, b2, b3, b4, 
        n1, n2, n3, i1, i2, i3, i4, i5, i6, i7, i8, f1, f2, f3, f4, f5, f6, f7, f8];
[json, json, json, json, json, json, json, json, json, json, json, json, 
    json, json, json, json, json, json, json, json, json, json, json] tup11 = 
        [b1, b2, b3, b4,  n1, n2, n3, i1, i2, i3, i4, i5, i6, i7, i8, f1, 
            f2, f3, f4, f5, f6, f7, f8];
[string, string, int, int, boolean, boolean, (), (), decimal, decimal, float, float] tup12 = [
    s1, s2, i1, i2, b1, b2, n1, n3, d1, d2, f1, f2
];

[boolean, boolean...] restTup1 = [b1, b2];
[boolean?, boolean?, boolean?...] restTup2 = [b1, b2, b3, n1, n3];
[boolean|int?...] restTup3 = [b1, b2, b3, b4, i1];
[(), ()...] restTup4 = [n1, n3];
[int...] restTup5 = [i1, i2, i3, i4, i5, i6];
[float...] restTup6 = [f1, f2, f3, f4, f5, f6, f7];
[decimal...] restTup7 = [d1, d2, d3, d4];
[decimal|float, decimal|float...] restTup8 = [d1, f1, f9, 1.23];
[string...] restTup9 = [s1, s2, s3];
[anydata...] restTup10 = [b1, b2, b3, b4,  n1, n2, n3, i1, i2, i3, i4, i5, i6, i7, i8, f1, f2, f3, f4, f5, f6, f7, f8];
[json, json, json...] restTup11 = [b1, b2, b3, b4,  n1, n2, n3, i1, i2, i3, i4, i5, i6, i7, i8, f1, f2, f3, f4, f5, f6, f7, f8];
[string, string, int, int, boolean, boolean, (), (), decimal, decimal, float, float...] restTup12 = [
    s1, s2, i1, i2, b1, b2, n1, n3, d1, d2, f1, f2, f2, f2
];

var booleanRecordArray = [
    {b1, b2, b3, b4}, {b1, b2, b3, b4}
];

var booleanRecordArray2 = [
    {},{}
];

string csvStringWithBooleanValues1 = string `
b1,b2,b3,b4
true,false,true,false 
true,false, true,false
true,false,true,false
`;

string csvStringWithBooleanValues2 = string `
b1,b2,b3,b4,b5
true,false, true,false,true
true,false, true,false,true`;

string csvStringWithBooleanValues3 = string `
        b1,b2,b3
${" "}${"\t"}
true, false,true
${" "}
    TRUE, FALSE,()
${" "}

true, true,FALSE
 
`;

string csvStringWithBooleanValues4 = string `
      b1,b2,b3,b4
    true,(), (),0
 1,(), null,false

`;

string csvStringWithBooleanValues5 = string `
b1,b2,b3,b4

true,false,true,2

true,false,true,3
`;

string csvStringWithBooleanValues6 = string `
b2,b3
(),()

`;

string csvStringWithBooleanValues7 = string `
b1,b2,b3,b4
${b1},${b2},(),${b4}
`;
