import ballerina/data.csv;

type A record {
    int:Unsigned32 headerRows = 0;
    string[] customHeaders = [];
    boolean outputWithHeaders = false;
};

public function main() returns error? {
    record {}[] a = check csv:parseString(string `a,b`, {});
    record {}[] b = test({headerRows: 2, outputWithHeaders: false});
}

function test(A a) returns record{}[] {
    return [{}];
}
