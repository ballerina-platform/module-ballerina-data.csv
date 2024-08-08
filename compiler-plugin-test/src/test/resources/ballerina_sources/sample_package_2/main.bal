import ballerina/data.csv as c;

type A record {
    @c:Name {value: "b"}
    int a;
    string b;
};
