import ballerina/data.csv as c;

type A record {
    @c:Name {value: "b"}
    int a;
    string b;
};

type B record {
    @c:Name {value: "b"}
    int a;
    @c:Name {value: "a"}
    string b;
};

type B2 record {
    @c:Name {value: "b"}
    int a;
    @c:Name {value: "b"}
    string b;
};

type B3 record {
    @c:Name {value: "a"}
    int a;
    @c:Name {value: "a"}
    string b2;
};

type B4 record {
    @c:Name {value: "b"}
    int a;
    @c:Name {value: "a"}
    string b2;
};

type C record {
    @c:Name {value: "x"}
    int a;
    @c:Name {value: "x"}
    string b;
};
