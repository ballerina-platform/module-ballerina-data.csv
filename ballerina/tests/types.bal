type BooleanRecord1 record {
    boolean b1;
    boolean|string b2;
    boolean|string? b3;
    boolean b4;
};

type BooleanRecord2 record {|
    boolean b1;
    boolean|string b2;
    boolean|string? b3;
    boolean b4;
|};

type BooleanRecord3 record {|
    boolean b1;
    boolean? b3;
|};

type BooleanRecord4 record {
    boolean b1;
    boolean? b3;
};

type BooleanRecord5 record {
    boolean b1;
    boolean? b3;
    string defaultableField = "";
    string? nillableField = ();
};

type BooleanRecord6 record {|
    boolean b1;
    boolean? b3;
    string defaultableField = "";
    string? nillableField = ();
|};

type BooleanRecord7 record {
    boolean b1;
    boolean? b3;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
};

type BooleanRecord8 record {|
    boolean b1;
    boolean? b3;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
|};

type BooleanRecord9 record {|
    boolean b1;
    boolean? b3;
    boolean?...;
|};

type BooleanRecord10 record {|
    boolean...;
|};

type BooleanRecord11 record {|
    boolean b1;
    string defaultableField = "";
    string? nillableField = ();
    boolean?|string...;
|};

type BooleanRecord12 record {|
    boolean b1;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
    boolean...;
|};

type BooleanRecord13 record {|
    string defaultableField = "";
    string? nillableField = ();
    string|boolean...;
|};

type BooleanRecord14 record {|
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
    boolean...;
|};

type BooleanRecord15 record {|
    int b1;
    string defaultableField = "";
    string? nillableField = ();
    boolean?...;
|};

type BooleanRecord16 record {|
    boolean?...;
|};

type BooleanRecord17 record {|
    int...;
|};

type BooleanRecord18 record {|
    boolean b2;
    int?...;
|};

type NilRecord1 record {
    () n1;
    () n2;
    () n3;
};

type NilRecord2 record {|
    () n1;
    () n2;
    () n3;
|};

type NilRecord3 record {|
    () n1;
    () n4;
|};

type NilRecord4 record {
    () n1;
    () n4;
};

type NilRecord5 record {
    () n1;
    () n4;
    string defaultableField = "";
    string? nillableField = ();
};

type NilRecord6 record {|
    () n1;
    () n4;
    string defaultableField = "";
    string? nillableField = ();
|};

type NilRecord7 record {
    () n1;
    () n4;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
};

type NilRecord8 record {|
    () n1;
    () n4;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
|};

type NilRecord9 record {|
    () n1;
    () n2;
    ()...;
|};

type NilRecord10 record {|
    ()...;
|};

type NilRecord11 record {|
    () n1;
    string defaultableField = "";
    string? nillableField = ();
    ()...;
|};

type NilRecord12 record {|
    () n1;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
    ()...;
|};

type NilRecord13 record {|
    string defaultableField = "";
    string? nillableField = ();
    ()...;
|};

type NilRecord14 record {|
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
    ()...;
|};

type IntegerRecord1 record {
    int i1;
    int i2;
    int i3;
    int? i4;
    int? i5;
    int i6;
    int i7;
    int? i8;
};

type IntegerRecord2 record {|
    int i1;
    int? i2;
    int i3;
    int i4;
    int? i5;
    int i6;
    int i7;
    int? i8;
|};

type IntegerRecord3 record {|
    int i1;
    int i4;
    int i6;
|};

type IntegerRecord4 record {
    int i1;
    int i4;
    int i6;
};

type IntegerRecord5 record {
    int i1;
    int i4;
    int i6;
    string defaultableField = "";
    string? nillableField = ();
};

type IntegerRecord6 record {|
    int i1;
    int i4;
    int i6;
    string defaultableField = "";
    string? nillableField = ();
|};

type IntegerRecord7 record {
    int i1;
    int i4;
    int i6;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
};

type IntegerRecord8 record {|
    int i1;
    int i4;
    int i6;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
|};

type IntegerRecord9 record {|
    int i1;
    int i2;
    int...;
|};

type IntegerRecord10 record {|
    int...;
|};

type IntegerRecord11 record {|
    int i1;
    string defaultableField = "";
    string? nillableField = ();
    int...;
|};

type IntegerRecord12 record {|
    int i1;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
    int...;
|};

type IntegerRecord13 record {|
    string defaultableField = "";
    string? nillableField = ();
    int...;
|};

type IntegerRecord14 record {|
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
    int...;
|};

type FloatRecord1 record {
    float f1;
    float f2;
    float f3;
    float f4;
    float f5;
    float f6;
    float f7;
    float f8;
};

type FloatRecord2 record {|
    float f1;
    float f2;
    float f3;
    float f4;
    float f5;
    float f6;
    float f7;
    float f8;
|};

type FloatRecord3 record {|
    float f1;
    float f4;
    float f7;
|};

type FloatRecord4 record {
    float f1;
    float f4;
    float f7;
};

type FloatRecord5 record {
    float f1;
    float f4;
    float f7;
    string defaultableField = "";
    string? nillableField = ();
};

type FloatRecord6 record {|
    float f1;
    float f4;
    float f7;
    string defaultableField = "";
    string? nillableField = ();
|};

type FloatRecord7 record {
    float f1;
    float f4;
    float f7;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
};

type FloatRecord8 record {|
    float f1;
    float f4;
    float f7;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
|};

type FloatRecord9 record {|
    float f1;
    float f2;
    float...;
|};

type FloatRecord10 record {|
    float...;
|};

type FloatRecord11 record {|
    float f1;
    string defaultableField = "";
    string? nillableField = ();
    float...;
|};

type FloatRecord12 record {|
    float f1;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
    float...;
|};

type FloatRecord13 record {|
    string defaultableField = "";
    string? nillableField = ();
    float...;
|};

type FloatRecord14 record {|
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
    float...;
|};

type DecimalRecord1 record {
    decimal d1;
    decimal d2;
    decimal d3;
    decimal d4;
    decimal d5;
    decimal d6;
    decimal d7;
    decimal d8;
};

type DecimalRecord2 record {|
    decimal d1;
    decimal d2;
    decimal d3;
    decimal d4;
    decimal d5;
    decimal d6;
    decimal d7;
    decimal d8;
|};

type DecimalRecord3 record {|
    decimal d1;
    decimal d4;
    decimal d7;
|};

type DecimalRecord4 record {
    decimal d1;
    decimal d4;
    decimal d7;
};

type DecimalRecord5 record {
    decimal d1;
    decimal d4;
    decimal d7;
    string defaultableField = "";
    string? nillableField = ();
};

type DecimalRecord6 record {|
    decimal d1;
    decimal d4;
    decimal d7;
    string defaultableField = "";
    string? nillableField = ();
|};

type DecimalRecord7 record {
    decimal d1;
    decimal d4;
    decimal d7;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
};

type DecimalRecord8 record {|
    decimal d1;
    decimal d4;
    decimal d7;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
|};

type DecimalRecord9 record {|
    decimal d1;
    decimal d2;
    decimal...;
|};

type DecimalRecord10 record {|
    decimal...;
|};

type DecimalRecord11 record {|
    decimal d1;
    string defaultableField = "";
    string? nillableField = ();
    decimal...;
|};

type DecimalRecord12 record {|
    decimal d1;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
    decimal...;
|};

type DecimalRecord13 record {|
    string defaultableField = "";
    string? nillableField = ();
    decimal...;
|};

type DecimalRecord14 record {|
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
    decimal...;
|};

type StringRecord1 record {
    string s1;
    string s2;
    string s3;
};

type StringRecord2 record {|
    string s1;
    string s2;
    string s3;
|};

type StringRecord3 record {|
    string s1;
    string s4;
|};

type StringRecord4 record {
    string s1;
    string s4;
};

type StringRecord5 record {
    string s1;
    string s4;
    string defaultableField = "";
    string? nillableField = ();
};

type StringRecord6 record {|
    string s1;
    string s4;
    string defaultableField = "";
    string? nillableField = ();
|};

type StringRecord7 record {
    string s1;
    string s4;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
};

type StringRecord8 record {|
    string s1;
    string s4;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
|};

type StringRecord9 record {|
    string s1;
    string s2;
    string...;
|};

type StringRecord10 record {|
    string...;
|};

type StringRecord11 record {|
    string s1;
    string defaultableField = "";
    string? nillableField = ();
    string...;
|};

type StringRecord12 record {|
    string d1;
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
    string...;
|};

type StringRecord13 record {|
    string defaultableField = "";
    string? nillableField = ();
    string...;
|};

type StringRecord14 record {|
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
    string...;
|};

type StringRecord15 record {|
    string defaultableField = "";
    string? nillableField = ();
    string requiredField;
    string...;
|};

type StringRecord16 record {|
    string?...;
|};

type StringRecord17 record {|
    int...;
|};

type StringRecord18 record {|
    string b2;
    int?...;
|};

type StringRecord19 record {
    string s1 = "";
    string s2 = "";
};

type StringRecord20 record {|
    string s1 = "";
    string s2 = "";
|};

type StringRecord21 record {
};

type StringRecord22 record {|
    string s1 = "";
    string s2 = "";
    json...;
|};

type StringRecord23 record {|
    json...;
|};

type JsonRecord1 record {
    json j1;
    json j2;
    json j3;
};

type JsonRecord2 record {|
    json j1;
    json j2;
    json j3;
|};

type JsonRecord3 record {|
    json j1;
    json j4;
|};

type JsonRecord4 record {
    json j1;
    json j4;
};

type JsonRecord5 record {
    json j1;
    json j4;
    json defaultableField = "";
    json? nillableField = ();
};

type JsonRecord6 record {|
    json j1;
    json j4;
    json defaultableField = "";
    json? nillableField = ();
|};

type JsonRecord7 record {
    json j1;
    json j4;
    json defaultableField = "";
    json? nillableField = ();
    json requiredField;
};

type JsonRecord8 record {|
    json j1;
    json j4;
    json defaultableField = "";
    json? nillableField = ();
    json requiredField;
|};

type JsonRecord9 record {|
    json j1;
    json j2;
    json...;
|};

type JsonRecord10 record {|
    json...;
|};

type JsonRecord11 record {|
    json j1;
    json defaultableField = "";
    json? nillableField = ();
    json...;
|};

type JsonRecord12 record {|
    json j1;
    json defaultableField = "";
    json? nillableField = ();
    json requiredField;
    json...;
|};

type JsonRecord13 record {|
    json defaultableField = "";
    json? nillableField = ();
    json...;
|};

type JsonRecord14 record {|
    json defaultableField = "";
    json? nillableField = ();
    json requiredField;
    json...;
|};

type AnydataRecord1 record {
    anydata anydata1;
    anydata anydata2;
    anydata anydata3;
};

type AnydataRecord2 record {|
    anydata anydata1;
    anydata anydata2;
    anydata anydata3;
|};

type AnydataRecord3 record {|
    anydata anydata1;
    anydata anydata4;
|};

type AnydataRecord4 record {
    anydata anydata1;
    anydata anydata4;
};

type AnydataRecord5 record {
    anydata anydata1;
    anydata anydata4;
    anydata defaultableField = "";
    anydata? nillableField = ();
};

type AnydataRecord6 record {|
    anydata anydata1;
    anydata anydata4;
    anydata defaultableField = "";
    anydata? nillableField = ();
|};

type AnydataRecord7 record {
    anydata anydata1;
    anydata anydata4;
    anydata defaultableField = "";
    anydata? nillableField = ();
    anydata requiredField;
};

type AnydataRecord8 record {|
    anydata anydata1;
    anydata anydata4;
    anydata defaultableField = "";
    anydata? nillableField = ();
    anydata requiredField;
|};

type AnydataRecord9 record {|
    anydata anydata1;
    anydata anydata2;
    anydata...;
|};

type AnydataRecord10 record {|
    anydata...;
|};

type AnydataRecord11 record {|
    anydata anydata1;
    anydata defaultableField = "";
    anydata? nillableField = ();
    anydata...;
|};

type AnydataRecord12 record {|
    anydata anydata1;
    anydata defaultableField = "";
    anydata? nillableField = ();
    anydata requiredField;
    anydata...;
|};

type AnydataRecord13 record {|
    anydata defaultableField = "";
    anydata? nillableField = ();
    anydata...;
|};

type AnydataRecord14 record {|
    anydata defaultableField = "";
    anydata? nillableField = ();
    anydata requiredField;
    anydata...;
|};

type CustomRecord1 record {
    int i1;
    int i2;
    string s1;
    string s2;
    boolean b1;
    boolean b2;
    () n1;
    () n2;
    float f1;
    float f2;
    decimal d1;
    decimal d2;
};

type CustomRecord2 record {|
    int i1;
    int i2;
    string s1;
    string s2;
    boolean b1;
    boolean b2;
    () n1;
    () n2;
    float f1;
    float f2;
    decimal d1;
    decimal d2;
|};

type CustomRecord3 record {|
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
|};

type CustomRecord4 record {
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
};

type CustomRecord5 record {
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
    string defaultableField = "";
    string? nillableField = ();
};

type CustomRecord6 record {|
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
    anydata defaultableField = "";
    anydata? nillableField = ();
|};

type CustomRecord7 record {
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
    anydata defaultableField = "";
    anydata? nillableField = ();
    anydata requiredField;
};

type CustomRecord8 record {|
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
    anydata defaultableField = "";
    anydata? nillableField = ();
    anydata requiredField;
|};

type CustomRecord9 record {|
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
    string...;
|};

type CustomRecord10 record {|
    string...;
|};

type CustomRecord11 record {|
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
    anydata defaultableField = "";
    anydata? nillableField = ();
    string...;
|};

type CustomRecord12 record {|
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
    anydata defaultableField = "";
    anydata? nillableField = ();
    anydata requiredField;
    string...;
|};

type CustomRecord13 record {|
    anydata defaultableField = "";
    anydata? nillableField = ();
    string...;
|};

type CustomRecord14 record {|
    anydata defaultableField = "";
    anydata? nillableField = ();
    anydata requiredField;
    string...;
|};

type CustomRecord15 record {|
    string '1;
    string '2;
|};

type CustomRecord16 record {|
    string '1;
    string '2;
    string '3;
    string '4;
|};

type CustomRecord17 record {
    string '1;
    string '2;
};

type CustomRecord18 record {
    string '1;
    string '2;
    string '3;
    string '4;
};

type CustomRecord19 record {
    string '1;
    string '2;
    string '3 = "";
    string '4 = "";
};

type CustomRecord20 record {
    string '1;
};

type CustomRecord21 record {|
    string '1;
    json...;
|};

type CustomRecord22 record {|
    string '1;
    string...;
|};

type CustomRecord23 record {|
    string '1;
    string a = "";
    string...;
|};

type CustomRecord24 record {|
    string '1;
    string '2 = "";
    string...;
|};

type CustomRecord25 record {|
    int '1;
    string...;
|};

type CustomRecord26 record {|
    string '1;
    int...;
|};

type CustomRecord27 record {|
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
    anydata a1;
    json j1;
    anydata defaultableField = "";
    anydata? nillableField = ();
    string...;
|};

type CustomRecord28 record {
    string '1;
};

type CustomRecord29 record {
    int '1;
};

type CustomRecord30 record {|
    string '1;
    string '2;
    string '3;
    string '4;
    string '5;
    string '6;
|};

type CustomRecord31 record {|
    string '1;
    string '6;
|};

type CustomRecord32 record {|
    int '1;
|};

type CustomRecord33 record {|
    string '1;
    string '2;
    string '3;
    string '4;
    string '5;
    string '6;
|};

type CustomRecord34 record {
    string '1;
    string '6;
    string '5 = "";
};

type CustomRecord35 record {
    string '1;
    string '6;
    string '9 = "";
};

type CustomRecord36 record {|
    string '1;
    string '6;
    string '9 = "";
|};

type CustomRecord37 record {|
    string '1;
    string '6;
    string '5 = "";
|};

type CustomRecord38 record {|
    string '1;
    string '2;
    string '3;
    string '4;
    string '5;
    string '6;
    string ...;
|};

type CustomRecord39 record {|
    string '1;
    string '2;
    string '3;
    string '4;
    string '5;
    string '6;
    json ...;
|};

type CustomRecord40 record {|
    string '5;
    string '6;
    json ...;
|};

type CustomRecord41 record {|
    json ...;
|};

type CustomRecord42 record {|
    int '1;
    string '2;
    boolean '3;
    decimal '4;
    float '5;
    () '6;
|};

type CustomRecord43 record {
    int '1;
    string '2;
    boolean '3;
    decimal '4;
    float '5;
    () '6;
};

type CustomRecord44 record {|
    int '1;
    string '2;
    boolean '3;
    decimal '4;
    float '5;
    () '6;
    string ...;
|};

type CustomRecord45 record {|
    int H1;
    string H2;
    boolean H3;
    decimal H4;
    float H5;
    () H6;
|};

type CustomRecord46 record {
    int H1;
    string H2;
    boolean H3;
    decimal H4;
    float H5;
    () H6;
};

type CustomRecord47 record {|
    int H1;
    string H2;
    boolean H3;
    decimal H4;
    float H5;
    () H6;
    string ...;
|};

type CustomRecord48 record {
    string H1;
    string H2;
    string H3;
    string H4;
    string H5;
    string H6;
};

type CustomRecord49 record {|
    string H1;
    string H2;
    string H3;
    string H4;
    string H5;
    string H6;
|};

type CustomRecord50 record {
    int H1;
    float H4;
};

type CustomRecord51 record {|
    int H1;
    float H4;
|};

type CustomRecord52 record {|
    string H1;
    string H4;
    string ...;
|};

type CustomRecord53 record {|
    int H1;
    float H4;
    decimal ...;
|};

type CustomRecord54 record {|
    string H1 = "";
    string H4;
    string '1;
|};

type CustomRecord55 record {|
    string H1 = "";
    string H4 = "";
    int '1 = 10;
|};

type CustomRecord56 record {
    string H1 = "";
    string H4 = "";
    anydata '1 = 10;
};

type BooleanTuple1 [boolean, boolean, boolean, boolean];

type BooleanTuple2 [boolean, boolean];

type BooleanTuple3 [boolean, boolean...];

type BooleanTuple4 [boolean...];

type NillableBooleanTuple5 [boolean?, boolean?, boolean?, boolean?, boolean?];

type NillableBooleanTuple6 [boolean?, boolean?];

type NillableBooleanTuple7 [boolean?, boolean?, boolean?...];

type NillableBooleanTuple8 [boolean?...];

type NillableIntBooleanTuple9 [int|boolean?, int|boolean?...];

type NilTuple1 [(), (), ()];

type NilTuple2 [(), ()];

type NilTuple3 [(), ()...];

type NilTuple4 [()...];

type IntegerTuple1 [int, int, int, int, int, int];

type IntegerTuple2 [int, int];

type IntegerTuple3 [int, int...];

type IntegerTuple4 [int...];

type FloatTuple1 [float, float, float, float, float, float, float];

type FloatTuple2 [float, float];

type FloatTuple3 [float, float...];

type FloatTuple4 [float...];

type DecimalTuple1 [decimal, decimal, decimal, decimal];

type DecimalTuple2 [decimal, decimal];

type DecimalTuple3 [decimal, decimal...];

type DecimalTuple4 [decimal...];

type StringTuple1 [string, string, string, string];

type StringTuple2 [string, string];

type StringTuple3 [string, string...];

type StringTuple4 [string...];

type AnydataTuple1 [anydata, anydata, anydata, anydata, anydata,
    anydata, anydata, anydata, anydata, anydata, anydata, anydata,
    anydata, anydata, anydata, anydata, anydata, anydata, anydata,
    anydata, anydata, anydata, anydata];

type AnydataTuple2 [anydata, anydata];

type AnydataTuple3 [anydata, anydata...];

type AnydataTuple4 [anydata...];

type JsonTuple1 [json, json, json, json, json, json, json, json,
    json, json, json, json, json, json, json, json, json, json,
    json, json, json, json, json];

type JsonTuple2 [json, json];

type JsonTuple3 [json, json...];

type JsonTuple4 [json...];

type CustomTuple1 [string, int, decimal, float, (), boolean, anydata, json, string, int, decimal, float, (), boolean, anydata, json];

type CustomTuple2 [string, int, decimal, float, (), boolean, anydata, json];

type CustomTuple3 [string, int, decimal, float, (), boolean, anydata, json, string...];

type CustomTuple4 [string...];

type CustomTuple5 [string, int, decimal, float, (), boolean, anydata, json, anydata...];

type CustomTuple6 [anydata...];

type CustomTuple7 [int, string, boolean, (), float, decimal, json, anydata, string...];

type CustomTuple8 [int, string, boolean, (), float, decimal, json, anydata, int...];

type IntegerArray1 int[];

type IntegerArray2 int[2];

type IntegerArray3 int[];

type IntegerArray4 int[2];

type IntegerArray5 int[3];

type IntegerArray6 int[4];

type StringArray string[];

type NillableStringArray string?[];

type NillableIntOrUnionStringArray (int|string?)[];

type StringArray1 string[];

type StringArray2 string[2];

type StringArray3 string[];

type StringArray4 string[2];

type StringArray5 string[3];

type StringArray6 string[4];

type FloatArray1 float[];

type FloatArray2 float[2];

type FloatArray3 float[];

type FloatArray4 float[2];

type FloatArray5 float[3];

type FloatArray6 float[4];

type DecimalArray1 decimal[];

type DecimalArray2 decimal[2];

type DecimalArray3 decimal[];

type DecimalArray4 decimal[2];

type DecimalArray5 decimal[3];

type DecimalArray6 decimal[4];

type BooleanArray boolean[];

type NillableBooleanArray boolean?[];

type NillableIntOrUnionBooleanArray (int|boolean?)[];

type BooleanArray2 boolean[2];

type BooleanArray3 boolean[3];

type BooleanArray4 boolean[];

type BooleanArray5 boolean[2];

type BooleanArray6 boolean[4];

type NilArray1 ()[];

type NilArray2 ()[2];

type NilArray3 ()[];

type NilArray4 ()[2];

type NilArray5 ()[3];

type NilArray6 ()[4];

type JsonArray1 json[];

type JsonArray2 json[2];

type JsonArray3 json[];

type JsonArray4 json[2];

type JsonArray5 json[3];

type JsonArray6 json[4];

type AnydataArray1 anydata[];

type AnydataArray2 anydata[2];

type AnydataArray3 anydata[];

type AnydataArray4 anydata[2];

type AnydataArray5 anydata[3];

type AnydataArray6 anydata[4];

type CustomArray1 CustomTuple2[];

type CustomArray2 CustomTuple2[2];

type CustomArray3 CustomTuple2[];

type CustomArray4 CustomTuple2[2];

type CustomArray5 CustomTuple2[3];

type CustomArray6 CustomTuple2[4];

type IntegerMap map<int>;

type StringMap map<string>;

type NillableIntUnionStringMap map<string|int?>;

type IntUnionStringMap map<int|string>;

type DecimalMap map<decimal>;

type FloatMap map<float>;

type BooleanMap map<boolean>;

type NillableBooleanMap map<boolean?>;

type NillableIntUnionBooleanMap map<boolean|int?>;

type IntUnionBooleanMap map<int|boolean>;

type NilMap map<()>;

type JsonMap map<json>;

type AnydataMap map<anydata>;

type CustomMap map<int|string>;

type BooleanRecord1Array BooleanRecord1[];

type ClosedBooleanRecord1Array BooleanRecord1[3];

type BooleanRecord2Array BooleanRecord2[];

type ClosedBooleanRecord2Array BooleanRecord2[3];

type BooleanRecord3Array BooleanRecord3[];

type ClosedBooleanRecord3Array BooleanRecord3[3];

type BooleanRecord4Array BooleanRecord4[];

type ClosedBooleanRecord4Array BooleanRecord4[3];

type BooleanRecord5Array BooleanRecord5[];

type ClosedBooleanRecord5Array BooleanRecord5[3];

type BooleanRecord6Array BooleanRecord6[];

type ClosedBooleanRecord6Array BooleanRecord6[3];

type BooleanRecord7Array BooleanRecord7[];

type ClosedBooleanRecord7Array BooleanRecord7[3];

type BooleanRecord8Array BooleanRecord8[];

type ClosedBooleanRecord8Array BooleanRecord8[3];

type BooleanRecord9Array BooleanRecord9[];

type ClosedBooleanRecord9Array BooleanRecord9[3];

type BooleanRecord10Array BooleanRecord10[];

type ClosedBooleanRecord10Array BooleanRecord10[3];

type BooleanRecord11Array BooleanRecord11[];

type ClosedBooleanRecord11Array BooleanRecord11[3];

type BooleanRecord12Array BooleanRecord12[];

type ClosedBooleanRecord12Array BooleanRecord12[3];

type BooleanRecord13Array BooleanRecord13[];

type ClosedBooleanRecord13Array BooleanRecord13[3];

type BooleanRecord14Array BooleanRecord14[];

type ClosedBooleanRecord14Array BooleanRecord14[3];

type BooleanRecord15Array BooleanRecord15[];

type ClosedBooleanRecord15Array BooleanRecord15[3];

type BooleanRecord16Array BooleanRecord16[];

type ClosedBooleanRecord16Array BooleanRecord16[3];

type BooleanRecord17Array BooleanRecord17[];

type ClosedBooleanRecord17Array BooleanRecord17[3];

type BooleanRecord18Array BooleanRecord18[];

type ClosedBooleanRecord18Array BooleanRecord18[3];

type NilRecord1Array NilRecord1[];

type ClosedNilRecord1Array NilRecord1[3];

type NilRecord2Array NilRecord2[];

type ClosedNilRecord2Array NilRecord2[3];

type NilRecord3Array NilRecord3[];

type ClosedNilRecord3Array NilRecord3[3];

type NilRecord4Array NilRecord4[];

type ClosedNilRecord4Array NilRecord4[3];

type NilRecord5Array NilRecord5[];

type ClosedNilRecord5Array NilRecord5[3];

type NilRecord6Array NilRecord6[];

type ClosedNilRecord6Array NilRecord6[3];

type NilRecord7Array NilRecord7[];

type ClosedNilRecord7Array NilRecord7[3];

type NilRecord8Array NilRecord8[];

type ClosedNilRecord8Array NilRecord8[3];

type NilRecord9Array NilRecord9[];

type ClosedNilRecord9Array NilRecord9[3];

type NilRecord10Array NilRecord10[];

type ClosedNilRecord10Array NilRecord10[3];

type NilRecord11Array NilRecord11[];

type ClosedNilRecord11Array NilRecord11[3];

type NilRecord12Array NilRecord12[];

type ClosedNilRecord12Array NilRecord12[3];

type NilRecord13Array NilRecord13[];

type ClosedNilRecord13Array NilRecord13[3];

type NilRecord14Array NilRecord14[];

type ClosedNilRecord14Array NilRecord14[3];

type IntegerRecord1Array IntegerRecord1[];

type ClosedIntegerRecord1Array IntegerRecord1[3];

type IntegerRecord2Array IntegerRecord2[];

type ClosedIntegerRecord2Array IntegerRecord2[3];

type IntegerRecord3Array IntegerRecord3[];

type ClosedIntegerRecord3Array IntegerRecord3[3];

type IntegerRecord4Array IntegerRecord4[];

type ClosedIntegerRecord4Array IntegerRecord4[3];

type IntegerRecord5Array IntegerRecord5[];

type ClosedIntegerRecord5Array IntegerRecord5[3];

type IntegerRecord6Array IntegerRecord6[];

type ClosedIntegerRecord6Array IntegerRecord6[3];

type IntegerRecord7Array IntegerRecord7[];

type ClosedIntegerRecord7Array IntegerRecord7[3];

type IntegerRecord8Array IntegerRecord8[];

type ClosedIntegerRecord8Array IntegerRecord8[3];

type IntegerRecord9Array IntegerRecord9[];

type ClosedIntegerRecord9Array IntegerRecord9[3];

type IntegerRecord10Array IntegerRecord10[];

type ClosedIntegerRecord10Array IntegerRecord10[3];

type IntegerRecord11Array IntegerRecord11[];

type ClosedIntegerRecord11Array IntegerRecord11[3];

type IntegerRecord12Array IntegerRecord12[];

type ClosedIntegerRecord12Array IntegerRecord12[3];

type IntegerRecord13Array IntegerRecord13[];

type ClosedIntegerRecord13Array IntegerRecord13[3];

type IntegerRecord14Array IntegerRecord14[];

type ClosedIntegerRecord14Array IntegerRecord14[3];

type FloatRecord1Array FloatRecord1[];

type ClosedFloatRecord1Array FloatRecord1[3];

type FloatRecord2Array FloatRecord2[];

type ClosedFloatRecord2Array FloatRecord2[3];

type FloatRecord3Array FloatRecord3[];

type ClosedFloatRecord3Array FloatRecord3[3];

type FloatRecord4Array FloatRecord4[];

type ClosedFloatRecord4Array FloatRecord4[3];

type FloatRecord5Array FloatRecord5[];

type ClosedFloatRecord5Array FloatRecord5[3];

type FloatRecord6Array FloatRecord6[];

type ClosedFloatRecord6Array FloatRecord6[3];

type FloatRecord7Array FloatRecord7[];

type ClosedFloatRecord7Array FloatRecord7[3];

type FloatRecord8Array FloatRecord8[];

type ClosedFloatRecord8Array FloatRecord8[3];

type FloatRecord9Array FloatRecord9[];

type ClosedFloatRecord9Array FloatRecord9[3];

type FloatRecord10Array FloatRecord10[];

type ClosedFloatRecord10Array FloatRecord10[3];

type FloatRecord11Array FloatRecord11[];

type ClosedFloatRecord11Array FloatRecord11[3];

type FloatRecord12Array FloatRecord12[];

type ClosedFloatRecord12Array FloatRecord12[3];

type FloatRecord13Array FloatRecord13[];

type ClosedFloatRecord13Array FloatRecord13[3];

type FloatRecord14Array FloatRecord14[];

type ClosedFloatRecord14Array FloatRecord14[3];

type DecimalRecord1Array DecimalRecord1[];

type ClosedDecimalRecord1Array DecimalRecord1[3];

type DecimalRecord2Array DecimalRecord2[];

type ClosedDecimalRecord2Array DecimalRecord2[3];

type DecimalRecord3Array DecimalRecord3[];

type ClosedDecimalRecord3Array DecimalRecord3[3];

type DecimalRecord4Array DecimalRecord4[];

type ClosedDecimalRecord4Array DecimalRecord4[3];

type DecimalRecord5Array DecimalRecord5[];

type ClosedDecimalRecord5Array DecimalRecord5[3];

type DecimalRecord6Array DecimalRecord6[];

type ClosedDecimalRecord6Array DecimalRecord6[3];

type DecimalRecord7Array DecimalRecord7[];

type ClosedDecimalRecord7Array DecimalRecord7[3];

type DecimalRecord8Array DecimalRecord8[];

type ClosedDecimalRecord8Array DecimalRecord8[3];

type DecimalRecord9Array DecimalRecord9[];

type ClosedDecimalRecord9Array DecimalRecord9[3];

type DecimalRecord10Array DecimalRecord10[];

type ClosedDecimalRecord10Array DecimalRecord10[3];

type DecimalRecord11Array DecimalRecord11[];

type ClosedDecimalRecord11Array DecimalRecord11[3];

type DecimalRecord12Array DecimalRecord12[];

type ClosedDecimalRecord12Array DecimalRecord12[3];

type DecimalRecord13Array DecimalRecord13[];

type ClosedDecimalRecord13Array DecimalRecord13[3];

type DecimalRecord14Array DecimalRecord14[];

type ClosedDecimalRecord14Array DecimalRecord14[3];

type StringRecord1Array StringRecord1[];

type ClosedStringRecord1Array StringRecord1[3];

type StringRecord2Array StringRecord2[];

type ClosedStringRecord2Array StringRecord2[3];

type StringRecord3Array StringRecord3[];

type ClosedStringRecord3Array StringRecord3[3];

type StringRecord4Array StringRecord4[];

type ClosedStringRecord4Array StringRecord4[3];

type StringRecord5Array StringRecord5[];

type ClosedStringRecord5Array StringRecord5[3];

type StringRecord6Array StringRecord6[];

type ClosedStringRecord6Array StringRecord6[3];

type StringRecord7Array StringRecord7[];

type ClosedStringRecord7Array StringRecord7[3];

type StringRecord8Array StringRecord8[];

type ClosedStringRecord8Array StringRecord8[3];

type StringRecord9Array StringRecord9[];

type ClosedStringRecord9Array StringRecord9[3];

type StringRecord10Array StringRecord10[];

type ClosedStringRecord10Array StringRecord10[3];

type StringRecord11Array StringRecord11[];

type ClosedStringRecord11Array StringRecord11[3];

type StringRecord12Array StringRecord12[];

type ClosedStringRecord12Array StringRecord12[3];

type StringRecord13Array StringRecord13[];

type ClosedStringRecord13Array StringRecord13[3];

type StringRecord14Array StringRecord14[];

type ClosedStringRecord14Array StringRecord14[3];

type StringRecord15Array StringRecord15[];

type StringRecord16Array StringRecord16[];

type StringRecord17Array StringRecord17[];

type StringRecord18Array StringRecord18[];

type StringRecord19Array StringRecord19[];

type StringRecord20Array StringRecord20[];

type StringRecord21Array StringRecord21[];

type StringRecord22Array StringRecord22[];

type StringRecord23Array StringRecord23[];

type JsonRecord1Array JsonRecord1[];

type ClosedJsonRecord1Array JsonRecord1[3];

type JsonRecord2Array JsonRecord2[];

type ClosedJsonRecord2Array JsonRecord2[3];

type JsonRecord3Array JsonRecord3[];

type ClosedJsonRecord3Array JsonRecord3[3];

type JsonRecord4Array JsonRecord4[];

type ClosedJsonRecord4Array JsonRecord4[3];

type JsonRecord5Array JsonRecord5[];

type ClosedJsonRecord5Array JsonRecord5[3];

type JsonRecord6Array JsonRecord6[];

type ClosedJsonRecord6Array JsonRecord6[3];

type JsonRecord7Array JsonRecord7[];

type ClosedJsonRecord7Array JsonRecord7[3];

type JsonRecord8Array JsonRecord8[];

type ClosedJsonRecord8Array JsonRecord8[3];

type JsonRecord9Array JsonRecord9[];

type ClosedJsonRecord9Array JsonRecord9[3];

type JsonRecord10Array JsonRecord10[];

type ClosedJsonRecord10Array JsonRecord10[3];

type JsonRecord11Array JsonRecord11[];

type ClosedJsonRecord11Array JsonRecord11[3];

type JsonRecord12Array JsonRecord12[];

type ClosedJsonRecord12Array JsonRecord12[3];

type JsonRecord13Array JsonRecord13[];

type ClosedJsonRecord13Array JsonRecord13[3];

type JsonRecord14Array JsonRecord14[];

type ClosedJsonRecord14Array JsonRecord14[3];

type AnydataRecord1Array AnydataRecord1[];

type ClosedAnydataRecord1Array AnydataRecord1[3];

type AnydataRecord2Array AnydataRecord2[];

type ClosedAnydataRecord2Array AnydataRecord2[3];

type AnydataRecord3Array AnydataRecord3[];

type ClosedAnydataRecord3Array AnydataRecord3[3];

type AnydataRecord4Array AnydataRecord4[];

type ClosedAnydataRecord4Array AnydataRecord4[3];

type AnydataRecord5Array AnydataRecord5[];

type ClosedAnydataRecord5Array AnydataRecord5[3];

type AnydataRecord6Array AnydataRecord6[];

type ClosedAnydataRecord6Array AnydataRecord6[3];

type AnydataRecord7Array AnydataRecord7[];

type ClosedAnydataRecord7Array AnydataRecord7[3];

type AnydataRecord8Array AnydataRecord8[];

type ClosedAnydataRecord8Array AnydataRecord8[3];

type AnydataRecord9Array AnydataRecord9[];

type ClosedAnydataRecord9Array AnydataRecord9[3];

type AnydataRecord10Array AnydataRecord10[];

type ClosedAnydataRecord10Array AnydataRecord10[3];

type AnydataRecord11Array AnydataRecord11[];

type ClosedAnydataRecord11Array AnydataRecord11[3];

type AnydataRecord12Array AnydataRecord12[];

type ClosedAnydataRecord12Array AnydataRecord12[3];

type AnydataRecord13Array AnydataRecord13[];

type ClosedAnydataRecord13Array AnydataRecord13[3];

type AnydataRecord14Array AnydataRecord14[];

type ClosedAnydataRecord14Array AnydataRecord14[3];

type CustomRecord1Array CustomRecord1[];

type ClosedCustomRecord1Array CustomRecord1[3];

type CustomRecord2Array CustomRecord2[];

type ClosedCustomRecord2Array CustomRecord2[3];

type CustomRecord3Array CustomRecord3[];

type ClosedCustomRecord3Array CustomRecord3[3];

type CustomRecord4Array CustomRecord4[];

type ClosedCustomRecord4Array CustomRecord4[3];

type CustomRecord5Array CustomRecord5[];

type ClosedCustomRecord5Array CustomRecord5[3];

type CustomRecord6Array CustomRecord6[];

type ClosedCustomRecord6Array CustomRecord6[3];

type CustomRecord7Array CustomRecord7[];

type ClosedCustomRecord7Array CustomRecord7[3];

type CustomRecord8Array CustomRecord8[];

type ClosedCustomRecord8Array CustomRecord8[3];

type CustomRecord9Array CustomRecord9[];

type ClosedCustomRecord9Array CustomRecord9[3];

type CustomRecord10Array CustomRecord10[];

type ClosedCustomRecord10Array CustomRecord10[3];

type CustomRecord11Array CustomRecord11[];

type ClosedCustomRecord11Array CustomRecord11[3];

type CustomRecord12Array CustomRecord12[];

type ClosedCustomRecord12Array CustomRecord12[3];

type CustomRecord13Array CustomRecord13[];

type ClosedCustomRecord13Array CustomRecord13[3];

type CustomRecord14Array CustomRecord14[];

type ClosedCustomRecord14Array CustomRecord14[3];

type CustomRecord15Array CustomRecord15[];

type CustomRecord16Array CustomRecord16[];

type CustomRecord17Array CustomRecord17[];

type CustomRecord18Array CustomRecord18[];

type CustomRecord19Array CustomRecord19[];

type CustomRecord20Array CustomRecord20[];

type CustomRecord21Array CustomRecord21[];

type CustomRecord22Array CustomRecord22[];

type CustomRecord23Array CustomRecord23[];

type CustomRecord24Array CustomRecord24[];

type CustomRecord25Array CustomRecord25[];

type CustomRecord26Array CustomRecord26[];

type CustomRecord27Array CustomRecord27[];
type CustomRecord28Array CustomRecord28[];
type CustomRecord29Array CustomRecord29[];
type CustomRecord30Array CustomRecord30[];
type CustomRecord31Array CustomRecord31[];
type CustomRecord32Array CustomRecord32[];
type CustomRecord33Array CustomRecord33[];
type CustomRecord34Array CustomRecord34[];
type CustomRecord35Array CustomRecord35[];
type CustomRecord36Array CustomRecord36[];
type CustomRecord37Array CustomRecord37[];
type CustomRecord38Array CustomRecord38[];
type CustomRecord39Array CustomRecord39[];
type CustomRecord40Array CustomRecord40[];
type CustomRecord41Array CustomRecord41[];
type CustomRecord42Array CustomRecord42[];
type CustomRecord43Array CustomRecord43[];
type CustomRecord44Array CustomRecord44[];
type CustomRecord45Array CustomRecord45[];
type CustomRecord46Array CustomRecord46[];
type CustomRecord47Array CustomRecord47[];
type CustomRecord48Array CustomRecord48[];
type CustomRecord49Array CustomRecord49[];
type CustomRecord50Array CustomRecord50[];
type CustomRecord51Array CustomRecord51[];
type CustomRecord52Array CustomRecord52[];
type CustomRecord53Array CustomRecord53[];
type CustomRecord54Array CustomRecord54[];
type CustomRecord55Array CustomRecord55[];
type CustomRecord56Array CustomRecord56[];
// type CustomRecord57Array CustomRecord57[];

type BooleanTuple1Array BooleanTuple1[];

type ClosedBooleanTuple1Array BooleanTuple1[3];

type BooleanTuple2Array BooleanTuple2[];

type ClosedBooleanTuple2Array BooleanTuple2[3];

type BooleanTuple3Array BooleanTuple3[];

type ClosedBooleanTuple3Array BooleanTuple3[3];

type BooleanTuple4Array BooleanTuple4[];

type ClosedBooleanTuple4Array BooleanTuple4[3];

type NillableBooleanTuple5Array NillableBooleanTuple5[];

type NillableBooleanTuple6Array NillableBooleanTuple6[];

type NillableBooleanTuple7Array NillableBooleanTuple7[];

type NillableBooleanTuple8Array NillableBooleanTuple8[];

type NillableIntBooleanTuple9Array NillableIntBooleanTuple9[];

type NilTuple1Array NilTuple1[];

type ClosedNilTuple1Array NilTuple1[3];

type NilTuple2Array NilTuple2[];

type ClosedNilTuple2Array NilTuple2[3];

type NilTuple3Array NilTuple3[];

type ClosedNilTuple3Array NilTuple3[3];

type NilTuple4Array NilTuple4[];

type ClosedNilTuple4Array NilTuple4[3];

type IntegerTuple1Array IntegerTuple1[];

type ClosedIntegerTuple1Array IntegerTuple1[3];

type IntegerTuple2Array IntegerTuple2[];

type ClosedIntegerTuple2Array IntegerTuple2[3];

type IntegerTuple3Array IntegerTuple3[];

type ClosedIntegerTuple3Array IntegerTuple3[3];

type IntegerTuple4Array IntegerTuple4[];

type ClosedIntegerTuple4Array IntegerTuple4[3];

type FloatTuple1Array FloatTuple1[];

type ClosedFloatTuple1Array FloatTuple1[3];

type FloatTuple2Array FloatTuple2[];

type ClosedFloatTuple2Array FloatTuple2[3];

type FloatTuple3Array FloatTuple3[];

type ClosedFloatTuple3Array FloatTuple3[3];

type FloatTuple4Array FloatTuple4[];

type ClosedFloatTuple4Array FloatTuple4[3];

type DecimalTuple1Array DecimalTuple1[];

type ClosedDecimalTuple1Array DecimalTuple1[3];

type DecimalTuple2Array DecimalTuple2[];

type ClosedDecimalTuple2Array DecimalTuple2[3];

type DecimalTuple3Array DecimalTuple3[];

type ClosedDecimalTuple3Array DecimalTuple3[3];

type DecimalTuple4Array DecimalTuple4[];

type ClosedDecimalTuple4Array DecimalTuple4[3];

type StringTuple1Array StringTuple1[];

type ClosedStringTuple1Array StringTuple1[3];

type StringTuple2Array StringTuple2[];

type ClosedStringTuple2Array StringTuple2[3];

type StringTuple3Array StringTuple3[];

type ClosedStringTuple3Array StringTuple3[3];

type StringTuple4Array StringTuple4[];

type ClosedStringTuple4Array StringTuple4[3];

type AnydataTuple1Array AnydataTuple1[];

type ClosedAnydataTuple1Array AnydataTuple1[3];

type AnydataTuple2Array AnydataTuple2[];

type ClosedAnydataTuple2Array AnydataTuple2[3];

type AnydataTuple3Array AnydataTuple3[];

type ClosedAnydataTuple3Array AnydataTuple3[3];

type AnydataTuple4Array AnydataTuple4[];

type ClosedAnydataTuple4Array AnydataTuple4[3];

type JsonTuple1Array JsonTuple1[];

type ClosedJsonTuple1Array JsonTuple1[3];

type JsonTuple2Array JsonTuple2[];

type ClosedJsonTuple2Array JsonTuple2[3];

type JsonTuple3Array JsonTuple3[];

type ClosedJsonTuple3Array JsonTuple3[3];

type JsonTuple4Array JsonTuple4[];

type ClosedJsonTuple4Array JsonTuple4[3];

type CustomTuple1Array CustomTuple1[];

type ClosedCustomTuple1Array CustomTuple1[3];

type CustomTuple2Array CustomTuple2[];

type ClosedCustomTuple2Array CustomTuple2[3];

type CustomTuple3Array CustomTuple3[];

type ClosedCustomTuple3Array CustomTuple3[3];

type CustomTuple4Array CustomTuple4[];

type ClosedCustomTuple4Array CustomTuple4[3];

type CustomTuple5Array CustomTuple5[];

type ClosedCustomTuple5Array CustomTuple5[3];

type CustomTuple6Array CustomTuple6[];

type CustomTuple7Array CustomTuple7[];

type CustomTuple8Array CustomTuple8[];

type ClosedCustomTuple6Array CustomTuple6[3];

type IntegerArray1Array IntegerArray1[];

type ClosedIntegerArray1Array IntegerArray1[3];

type IntegerArray2Array IntegerArray2[];

type ClosedIntegerArray2Array IntegerArray2[3];

type IntegerArray3Array IntegerArray3[];

type ClosedIntegerArray3Array IntegerArray3[3];

type IntegerArray4Array IntegerArray4[];

type ClosedIntegerArray4Array IntegerArray4[3];

type IntegerArray5Array IntegerArray5[];

type ClosedIntegerArray5Array IntegerArray5[3];

type IntegerArray6Array IntegerArray5[];

type ClosedIntegerArray6Array IntegerArray5[3];

type StringArray1Array StringArray1[];

type StringArrayArray StringArray[];

type NillableStringArrayArray NillableStringArray[];

type NillableIntOrUnionStringArrayArray NillableIntOrUnionStringArray[];

type ClosedStringArray1Array StringArray1[3];

type StringArray2Array StringArray2[];

type ClosedStringArray2Array StringArray2[3];

type StringArray3Array StringArray3[];

type ClosedStringArray3Array StringArray3[3];

type StringArray4Array StringArray4[];

type ClosedStringArray4Array StringArray4[3];

type StringArray5Array StringArray5[];

type ClosedStringArray5Array StringArray5[3];

type StringArray6Array StringArray5[];

type ClosedStringArray6Array StringArray5[3];

type FloatArray1Array FloatArray1[];

type ClosedFloatArray1Array FloatArray1[3];

type FloatArray2Array FloatArray2[];

type ClosedFloatArray2Array FloatArray2[3];

type FloatArray3Array FloatArray3[];

type ClosedFloatArray3Array FloatArray3[3];

type FloatArray4Array FloatArray4[];

type ClosedFloatArray4Array FloatArray4[3];

type FloatArray5Array FloatArray5[];

type ClosedFloatArray5Array FloatArray5[3];

type FloatArray6Array FloatArray5[];

type ClosedFloatArray6Array FloatArray5[3];

type DecimalArray1Array DecimalArray1[];

type ClosedDecimalArray1Array DecimalArray1[3];

type DecimalArray2Array DecimalArray2[];

type ClosedDecimalArray2Array DecimalArray2[3];

type DecimalArray3Array DecimalArray3[];

type ClosedDecimalArray3Array DecimalArray3[3];

type DecimalArray4Array DecimalArray4[];

type ClosedDecimalArray4Array DecimalArray4[3];

type DecimalArray5Array DecimalArray5[];

type ClosedDecimalArray5Array DecimalArray5[3];

type DecimalArray6Array DecimalArray5[];

type ClosedDecimalArray6Array DecimalArray5[3];

type BooleanArrayArray BooleanArray[];

type ClosedBooleanArrayArray BooleanArray[3];

type NillableBooleanArrayArray NillableBooleanArray[];

type NillableIntOrUnionBooleanArrayArray NillableIntOrUnionBooleanArray[];

type BooleanArray2Array BooleanArray2[];

type ClosedBooleanArray2Array BooleanArray2[3];

type BooleanArray3Array BooleanArray3[];

type ClosedBooleanArray3Array BooleanArray3[3];

type BooleanArray4Array BooleanArray4[];

type ClosedBooleanArray4Array BooleanArray4[3];

type BooleanArray5Array BooleanArray5[];

type ClosedBooleanArray5Array BooleanArray5[3];

type BooleanArray6Array BooleanArray5[];

type ClosedBooleanArray6Array BooleanArray5[3];

type NilArray1Array NilArray1[];

type ClosedNilArray1Array NilArray1[3];

type NilArray2Array NilArray2[];

type ClosedNilArray2Array NilArray2[3];

type NilArray3Array NilArray3[];

type ClosedNilArray3Array NilArray3[3];

type NilArray4Array NilArray4[];

type ClosedNilArray4Array NilArray4[3];

type NilArray5Array NilArray5[];

type ClosedNilArray5Array NilArray5[3];

type NilArray6Array NilArray5[];

type ClosedNilArray6Array NilArray5[3];

type JsonArray1Array JsonArray1[];

type ClosedJsonArray1Array JsonArray1[3];

type JsonArray2Array JsonArray2[];

type ClosedJsonArray2Array JsonArray2[3];

type JsonArray3Array JsonArray3[];

type ClosedJsonArray3Array JsonArray3[3];

type JsonArray4Array JsonArray4[];

type ClosedJsonArray4Array JsonArray4[3];

type JsonArray5Array JsonArray5[];

type ClosedJsonArray5Array JsonArray5[3];

type JsonArray6Array JsonArray5[];

type ClosedJsonArray6Array JsonArray5[3];

type AnydataArray1Array AnydataArray1[];

type ClosedAnydataArray1Array AnydataArray1[3];

type AnydataArray2Array AnydataArray2[];

type ClosedAnydataArray2Array AnydataArray2[3];

type AnydataArray3Array AnydataArray3[];

type ClosedAnydataArray3Array AnydataArray3[3];

type AnydataArray4Array AnydataArray4[];

type ClosedAnydataArray4Array AnydataArray4[3];

type AnydataArray5Array AnydataArray5[];

type ClosedAnydataArray5Array AnydataArray5[3];

type AnydataArray6Array AnydataArray5[];

type ClosedAnydataArray6Array AnydataArray5[3];

type CustomArray1Array CustomArray1[];

type ClosedCustomArray1Array CustomArray1[3];

type CustomArray2Array CustomArray2[];

type ClosedCustomArray2Array CustomArray2[3];

type CustomArray3Array CustomArray3[];

type ClosedCustomArray3Array CustomArray3[3];

type CustomArray4Array CustomArray4[];

type ClosedCustomArray4Array CustomArray4[3];

type CustomArray5Array CustomArray5[];

type ClosedCustomArray5Array CustomArray5[3];

type CustomArray6Array CustomArray5[];

type ClosedCustomArray6Array CustomArray5[3];

type IntegerMapArray IntegerMap[];

type ClosedIntegerMapArray IntegerMap[3];

type StringMapArray StringMap[];

type NillableIntUnionStringMapArray NillableIntUnionStringMap[];

type IntUnionStringMapArray IntUnionStringMap[];

type ClosedStringMapArray StringMap[3];

type DecimalMapArray DecimalMap[];

type ClosedDecimalMapArray DecimalMap[3];

type FloatMapArray FloatMap[];

type ClosedFloatMapArray FloatMap[3];

type BooleanMapArray BooleanMap[];

type NillableBooleanMapArray NillableBooleanMap[];

type NillableIntUnionBooleanMapArray NillableIntUnionBooleanMap[];

type IntUnionBooleanMapArray IntUnionBooleanMap[];

type ClosedBooleanMapArray BooleanMap[3];

type NilMapArray NilMap[];

type ClosedNilMapArray NilMap[3];

type JsonMapArray JsonMap[];

type ClosedJsonMapArray JsonMap[3];

type AnydataMapArray AnydataMap[];

type ClosedAnydataMapArray AnydataMap[3];

type CustomMapArray CustomMap[];

type ClosedCustomMapArray CustomMap[3];

type RecordWithCustomAnnotation record {
    @Name {
        value: "c"
    }
    int a;
    int b;
};

type RecordWithCustomAnnotation2 record {
    @Name {
        value: "c"
    }
    int a?;
    @Name {
        value: "d"
    }
    int? b;
};

type RecordWithCustomAnnotation3 record {|
    @Name {
        value: "c"
    }
    int a?;
    @Name {
        value: "d"
    }
    int? b;
|};

type RecordWithCustomAnnotation4 record {|
    @Name {
        value: "c"
    }
    int a;
    @Name {
        value: "d"
    }
    int b;
    boolean...;
|};

type RecordWithCustomAnnotation5 record {
    @Name {
        value: "c"
    }
    int a;
    @Name {
        value: "d"
    }
    int b;
    int c?;
};

type RecordWithCustomAnnotation6 record {
    @Name {
        value: "c"
    }
    int a;
    @Name {
        value: "d"
    }
    int b;
    @Name {
        value: "e"
    }
    int c;
};

type RecordWithCustomAnnotation7 record {
    @Name {
        value: "c"
    }
    int a;
    @Name {
        value: "d"
    }
    int b;
    @Name {
        value: "a"
    }
    int c;
};

type RecordWithCustomAnnotation8 record {
    @Name {
        value: "c"
    }
    int a;
    @Name {
        value: "c"
    }
    int b;
    @Name {
        value: "a"
    }
    int c;
};
