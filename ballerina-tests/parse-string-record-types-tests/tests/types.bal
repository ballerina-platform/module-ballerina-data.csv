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

type StringMap map<string>;

type DecimalMap map<decimal>;

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

type BooleanMapArray BooleanMap[];

type NillableBooleanMapArray NillableBooleanMap[];

type NillableIntUnionBooleanMapArray NillableIntUnionBooleanMap[];

type IntUnionBooleanMapArray IntUnionBooleanMap[];

type ClosedBooleanMapArray BooleanMap[3];

type NilMapArray NilMap[];

type DecimalMapArray DecimalMap[];

type StringMapArray StringMap[];

type ClosedNilMapArray NilMap[3];

type JsonMapArray JsonMap[];

type ClosedJsonMapArray JsonMap[3];

type AnydataMapArray AnydataMap[];

type ClosedAnydataMapArray AnydataMap[3];

type CustomMapArray CustomMap[];

type ClosedCustomMapArray CustomMap[3];
