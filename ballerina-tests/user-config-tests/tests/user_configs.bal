import ballerina/data.csv as csv;

// Valid parser options
csv:ParseOption option1 = {delimiter: "@", nilValue: "null", lineTerminator: [csv:LF]};
csv:ParseOption option2 = {nilValue: "N/A", lineTerminator: [csv:CR, csv:LF], comment: "/"};
csv:ParseOption option3 = {nilValue: "()", header: 1, skipLines: [1, 2]};
csv:ParseOption option4 = {nilValue: "", header: 4, skipLines: "1-5"};
csv:ParseOption option5 = {nilValue: "", header: 4, skipLines: "1-1"};
csv:ParseOption option6 = {nilValue: "()", header: false, skipLines: [1, 2]};

csv:parseToRecordOption ptOption1 = {nilValue: "", header: 1, skipLines: [2, 4]};
csv:parseToRecordOption ptOption2 = {nilValue: "", header: 1, skipLines: "2-4"};
csv:parseToRecordOption ptOption3 = {nilValue: "", header: 4, skipLines: "1-5"};
csv:parseToRecordOption ptOption4 = {nilValue: "", header: 4, skipLines: [-1, -2, 4, 2]};
csv:parseToRecordOption ptOption5 = {header: false, skipLines: [-1, -2, 5, 3]};

// Invalid parser options
csv:ParseOption invalidParserOptions1 = {header: 4};
csv:ParseOption invalidParserOptions2 = {comment: "$"};
csv:ParseOption invalidParserOptions3 = {lineTerminator: csv:CR};
csv:ParseOption invalidParserOptions4 = {skipLines: [1000, 1001]};
csv:ParseOption invalidParserOptions5 = {skipLines: "a-b"};
csv:ParseOption invalidParserOptions6 = {skipLines: "3-1"};
csv:ParseOption invalidParserOptions7 = {skipLines: "a-5"};
csv:ParseOption invalidParserOptions8 = {skipLines: "6-a"};
csv:ParseOption invalidParserOptions9 = {skipLines: "a-5"};
csv:ParseOption invalidParserOptions10 = {skipLines: "-1-6"};
csv:ParseOption invalidParserOptions11 = {nilValue: "", header: 4, skipLines: "0-10"};
csv:ParseOption invalidParserOptions12 = {skipLines: [1, 3, 4, -1]};
