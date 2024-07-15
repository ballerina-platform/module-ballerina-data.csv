import ballerina/io;
import ballerina/random;

string[] firstNames = ["John", "Jane", "Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Helen"];
string[] lastNames = ["Doe", "Smith", "Johnson", "Brown", "Williams", "Jones", "Garcia", "Miller", "Davis", "Rodriguez"];
string[] gender = ["m", "f"];
string[] emailDomains = ["gmail.com", "yahoo.com", "hotmail.com", "outlook.com", "icloud.com", "icloud.com", "icloud.com", "icloud.com", "icloud.com", "icloud.com"];
string[] ips = ["192.168.1.1", "192.168.1.2", "192.168.1.3", "192.168.1.4", "192.168.1.5", "192.168.1.6", "192.168.1.7"];

public function main() returns error? {
    int index = 1;
    string[][] a = [];
    foreach int i in 0...10000 {
        int ri = check random:createIntInRange(0, 9);
        a.push([
            index.toBalString(),
            firstNames[ri],
            lastNames[ri],
            firstNames[ri] + "." + lastNames[ri] + "@" + emailDomains[ri],
            gender[ri % 2],
            ips[ri % 7]
        ]);
        index = index + 1;
    }

    check io:fileWriteCsv("data.csv", a);
}