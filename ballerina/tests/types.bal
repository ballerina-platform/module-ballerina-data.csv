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

type CustomeRecord1 record {
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

type CustomeRecord2 record {|
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

type CustomeRecord3 record {|
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
|};

type CustomeRecord4 record {
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
};

type CustomeRecord5 record {
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
    string defaultableField = "";
    string? nillableField = ();
};

type CustomeRecord6 record {|
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
    anydata defaultableField = "";
    anydata? nillableField = ();
|};

type CustomeRecord7 record {
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

type CustomeRecord8 record {|
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

type CustomeRecord9 record {|
    int i1;
    string s1;
    boolean b1;
    () n1;
    float f1;
    decimal d1;
    string...;
|};

type CustomeRecord10 record {|
    string...;
|};

type CustomeRecord11 record {|
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

type CustomeRecord12 record {|
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

type CustomeRecord13 record {|
    anydata defaultableField = "";
    anydata? nillableField = ();
    string...;
|};

type CustomeRecord14 record {|
    anydata defaultableField = "";
    anydata? nillableField = ();
    anydata requiredField;
    string...;
|};

type BooleanTuple1 [boolean, boolean, boolean, boolean];
type BooleanTuple2 [boolean, boolean];
type BooleanTuple3 [boolean, boolean...];
type BooleanTuple4 [boolean...];

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

type StringTuple1 [string, string, string];
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

type IntegerArray1 int[];
type IntegerArray2 int[2];
type IntegerArray3 int[];
type IntegerArray4 int[2];
type IntegerArray5 int[3];
type IntegerArray6 int[4];

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

type BooleanArray1 boolean[];
type BooleanArray2 boolean[2];
type BooleanArray3 boolean[];
type BooleanArray4 boolean[2];
type BooleanArray5 boolean[3];
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
type DecimalMap map<decimal>;
type FloatMap map<float>;
type BooleanMap map<boolean>;
type NillableBooleanMap map<boolean>;
type NillableIntUnionBooleanMap map<boolean>;
type IntUnionBooleanMap map<boolean>;
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
type CustomeRecord1Array CustomeRecord1[];
type ClosedCustomeRecord1Array CustomeRecord1[3];
type CustomeRecord2Array CustomeRecord2[];
type ClosedCustomeRecord2Array CustomeRecord2[3];
type CustomeRecord3Array CustomeRecord3[];
type ClosedCustomeRecord3Array CustomeRecord3[3];
type CustomeRecord4Array CustomeRecord4[];
type ClosedCustomeRecord4Array CustomeRecord4[3];
type CustomeRecord5Array CustomeRecord5[];
type ClosedCustomeRecord5Array CustomeRecord5[3];
type CustomeRecord6Array CustomeRecord6[];
type ClosedCustomeRecord6Array CustomeRecord6[3];
type CustomeRecord7Array CustomeRecord7[];
type ClosedCustomeRecord7Array CustomeRecord7[3];
type CustomeRecord8Array CustomeRecord8[];
type ClosedCustomeRecord8Array CustomeRecord8[3];
type CustomeRecord9Array CustomeRecord9[];
type ClosedCustomeRecord9Array CustomeRecord9[3];
type CustomeRecord10Array CustomeRecord10[];
type ClosedCustomeRecord10Array CustomeRecord10[3];
type CustomeRecord11Array CustomeRecord11[];
type ClosedCustomeRecord11Array CustomeRecord11[3];
type CustomeRecord12Array CustomeRecord12[];
type ClosedCustomeRecord12Array CustomeRecord12[3];
type CustomeRecord13Array CustomeRecord13[];
type ClosedCustomeRecord13Array CustomeRecord13[3];
type CustomeRecord14Array CustomeRecord14[];
type ClosedCustomeRecord14Array CustomeRecord14[3];
type BooleanTuple1Array BooleanTuple1[];
type ClosedBooleanTuple1Array BooleanTuple1[3];
type BooleanTuple2Array BooleanTuple2[];
type ClosedBooleanTuple2Array BooleanTuple2[3];
type BooleanTuple3Array BooleanTuple3[];
type ClosedBooleanTuple3Array BooleanTuple3[3];
type BooleanTuple4Array BooleanTuple4[];
type ClosedBooleanTuple4Array BooleanTuple4[3];
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
type BooleanArray1Array BooleanArray1[];
type ClosedBooleanArray1Array BooleanArray1[3];
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
