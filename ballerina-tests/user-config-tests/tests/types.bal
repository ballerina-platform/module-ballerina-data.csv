import ballerina/data.csv as csv;

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
