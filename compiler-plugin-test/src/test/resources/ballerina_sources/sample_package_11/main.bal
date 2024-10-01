import ballerina/data.csv;

type A record {
    int:Unsigned32 headerRows = 0;
    string[] customHeaders = [];
    boolean outputWithHeaders = false;
};

public function main() returns error? {
    record {}[] _ = check csv:parseString(string `a,b`, {});
    record {}[] _ = test1({headerRows: 2, outputWithHeaders: false});
    [int...][] _ = test2({headerRows: 2, outputWithHeaders: false});
    record {} _ = test3({headerRows: 2, outputWithHeaders: false});
}

function test1(A a) returns record {}[] {
    return [{}];
}

function test2(A a) returns [int...][] {
    return [];
}

function test3(A a) returns record {} {
    return {};
}
