// Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

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

type StringRecord9 record {|
    string s1;
    string s2;
    string...;
|};

type StringRecord10 record {|
    string...;
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

type BooleanTuple4 [boolean...];

type NilTuple3 [(), ()...];

type IntegerTuple3 [int, int...];

type IntegerTuple4 [int...];

type DecimalTuple4 [decimal...];

type StringTuple1 [string, string, string, string];

type StringTuple2 [string, string];

type StringTuple3 [string, string...];

type StringTuple4 [string...];

type AnydataTuple3 [anydata, anydata...];

type JsonTuple3 [json, json...];

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

type DecimalArray1 decimal[];

type JsonArray1 json[];

type AnydataArray1 anydata[];

type IntegerMap map<int>;

type StringMap map<string>;

type NillableIntUnionStringMap map<string|int?>;

type IntUnionStringMap map<int|string>;

type DecimalMap map<decimal>;

type BooleanMap map<boolean>;

type NilMap map<()>;

type JsonMap map<json>;

type AnydataMap map<anydata>;

type CustomMap map<int|string>;

type StringRecord1Array StringRecord1[];

type StringRecord2Array StringRecord2[];

type StringRecord9Array StringRecord9[];

type StringRecord10Array StringRecord10[];

type StringRecord19Array StringRecord19[];

type StringRecord20Array StringRecord20[];

type StringRecord21Array StringRecord21[];

type StringRecord22Array StringRecord22[];

type StringRecord23Array StringRecord23[];

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

type BooleanTuple4Array BooleanTuple4[];

type NilTuple3Array NilTuple3[];
type IntegerTuple3Array IntegerTuple3[];

type IntegerTuple4Array IntegerTuple4[];

type DecimalTuple4Array DecimalTuple4[];

type StringTuple1Array StringTuple1[];

type StringTuple2Array StringTuple2[];

type StringTuple3Array StringTuple3[];

type StringTuple4Array StringTuple4[];

type AnydataTuple3Array AnydataTuple3[];

type JsonTuple3Array JsonTuple3[];

type IntegerArray1Array IntegerArray1[];

type IntegerArray2Array IntegerArray2[];

type IntegerArray3Array IntegerArray3[];

type IntegerArray4Array IntegerArray4[];

type IntegerArray5Array IntegerArray5[];

type IntegerArray6Array IntegerArray5[];

type StringArray1Array StringArray1[];

type StringArrayArray StringArray[];

type NillableStringArrayArray NillableStringArray[];

type NillableIntOrUnionStringArrayArray NillableIntOrUnionStringArray[];

type StringArray2Array StringArray2[];
type DecimalArray1Array DecimalArray1[];

type JsonArray1Array JsonArray1[];

type AnydataArray1Array AnydataArray1[];

type IntegerMapArray IntegerMap[];

type StringMapArray StringMap[];

type NillableIntUnionStringMapArray NillableIntUnionStringMap[];

type IntUnionStringMapArray IntUnionStringMap[];

type DecimalMapArray DecimalMap[];

type BooleanMapArray BooleanMap[];

type NilMapArray NilMap[];

type JsonMapArray JsonMap[];

type AnydataMapArray AnydataMap[];

type CustomMapArray CustomMap[];
