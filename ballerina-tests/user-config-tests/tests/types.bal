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

import ballerina/data.csv;

type RecordWithCustomAnnotation record {
    @csv:Name {
        value: "c"
    }
    int a;
    int b;
};

type RecordWithCustomAnnotation2 record {
    @csv:Name {
        value: "c"
    }
    int a?;
    @csv:Name {
        value: "d"
    }
    int? b;
};

type RecordWithCustomAnnotation3 record {|
    @csv:Name {
        value: "c"
    }
    int a?;
    @csv:Name {
        value: "d"
    }
    int? b;
|};

type RecordWithCustomAnnotation4 record {|
    @csv:Name {
        value: "c"
    }
    int a;
    @csv:Name {
        value: "d"
    }
    int b;
    boolean...;
|};

type RecordWithCustomAnnotation5 record {
    @csv:Name {
        value: "c"
    }
    int a;
    @csv:Name {
        value: "d"
    }
    int b;
    @csv:Name {
        value: "e"
    }
    int c;
};

type RecordWithCustomAnnotation6 record {
    @csv:Name {
        value: "c"
    }
    int a;
    @csv:Name {
        value: "d"
    }
    int b;
    @csv:Name {
        value: "a"
    }
    int c;
};
