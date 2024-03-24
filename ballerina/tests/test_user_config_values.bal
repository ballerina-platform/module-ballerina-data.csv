FromCSVConfig config1 = {
    startNumber: 1
};

FromCSVConfig config2 = {
    startNumber: 2
};

FromCSVConfig config3 = {
    startNumber: -2
};

FromCSVConfig config4 = {
    startNumber: 100
};

FromCSVConfig config5 = {
    headerStartNumber: 1
};

FromCSVConfig config6 = {
    headerStartNumber: 2
};

FromCSVConfig config7 = {
    headerStartNumber: -2
};

FromCSVConfig config8 = {
    headerStartNumber: 100
};

FromCSVConfig config9 = {
    dataStartNumber: 1
};

FromCSVConfig config10 = {
    dataStartNumber: 2
};

FromCSVConfig config11 = {
    dataStartNumber: -2
};

FromCSVConfig config12 = {
    dataStartNumber: 100
};

FromCSVConfig config13 = {
    startNumber: 10,
    headerStartNumber: 8
};

FromCSVConfig config14 = {
    startNumber: 10,
    headerStartNumber: 10
};

FromCSVConfig config15 = {
    startNumber: 10,
    dataStartNumber: 8
};

FromCSVConfig config16 = {
    startNumber: 10,
    dataStartNumber: 10
};

FromCSVConfig config17 = {
    headerStartNumber: 10,
    dataStartNumber: 8
};

FromCSVConfig config18 = {
    headerStartNumber: 10,
    dataStartNumber: 10
};

FromCSVConfig config19 = {
    startNumber: 12,
    headerStartNumber: 10,
    dataStartNumber: 12
};

FromCSVConfig config20 = {
    startNumber: 12,
    headerStartNumber: 10,
    dataStartNumber: 12
};

// startNumber, header Start number, data start number values should be configured to each test cases separately.

FromCSVConfig config21 = {
    headers: false
};

FromCSVConfig config22 = {
    customheader: ["H1", "H2", "H3", "H4", "H5", "H6"]
};

FromCSVConfig config23 = {
    headers: false,
    customheader: ["H1", "H2", "H3", "H4", "H5", "H6"]
};

FromCSVConfig config24 = {
    skipHeaders: true,
    customheader: ["H1", "H2", "H3", "H4", "H5", "H6"]
};

FromCSVConfig config25 = {
    customheader: [1, 2, 3, 4, 5, 6]
};

FromCSVConfig config26 = {
    customheader: ["H2", "H3", "H4", "H5", "H6"]
};

FromCSVConfig config27 = {
    skipHeaders: true,
    customheader: [1, 2, 3, 5, 6]
};

FromCSVConfig config28 = {
    ignoreEmptyLines: false
};

FromCSVConfig config29 = {
    ignoreEmptyLines: false
};

// Tests with ignore empty lines with data startnumber, header Start number, Start number should be tested separaetly.

FromCSVConfig config30 = {
    ignoreEmptyLines: false,
    orderBy: {
        column: "a"
    }
};

FromCSVConfig config31 = {
    ignoreEmptyLines: false,
    orderBy: [
        { column: "a", columnOrder: "DESC"},
        { column: "f", columnOrder: "ASC"}
    ]
};

FromCSVConfig config32 = {
    ignoreEmptyLines: false,
    customheader: ["H1", "H2", "H3", "H4", "H5", "H6"],
    orderBy: [
        { column: "a", columnOrder: "DESC"},
        { column: "f", columnOrder: "ASC"}
    ]
};

FromCSVConfig config33 = {
    ignoreEmptyLines: false,
    customheader: ["H1", "H2", "H3", "H4", "H5", "H6"],
    orderBy: [
        { column: "H3", columnOrder: "DESC"},
        { column: "H4", columnOrder: "ASC"}
    ]
};

// Need to test with orders with each column(type) separately

FromCSVConfig config34 = {
    skipHeaders: true,
    headers: false
};

FromCSVConfig config35 = {
    customheader: ["H1", "H2", "H3", "H4", "H5", "H6"]
};

FromCSVConfig config36 = {
    skipHeaders: true,
    headers: false,
    customheader: ["H1", "H2", "H3", "H4", "H5", "H6"]
};

FromCSVConfig config37 = {
    skipHeaders: true,
    headers: true,
    customheader: ["H1", "H2", "H3", "H4", "H5", "H6"]
};

FromCSVConfig config38 = {
    skipHeaders: true,
    headers: true,
    customheader: [1, 2, 3, 4, 5, 6]
};

FromCSVConfig config39 = {
    skipHeaders: true,
    headers: true,
    customheader: ["H2", "H3", "H4", "H5", "H6"]
};

FromCSVConfig config40 = {
    skipHeaders: true,
    headers: true,
    customheader: ["H2", "H3", "H4", "H5", "H6"]
};

FromCSVConfig config41 = {
    skipdataRows: 2
};

FromCSVConfig config42 = {
    skipdataRows: 3,
    ignoreEmptyLines: false
};

FromCSVConfig config43 = {
    skipdataRows: 2,
    headers: false
};

FromCSVConfig config44 = {
    skipdataRows: 3,
    ignoreEmptyLines: false,
    skipHeaders: true
};

FromCSVConfig config45 = {
    dataRowCount: 2
};

FromCSVConfig config46 = {
    dataRowCount: 3,
    ignoreEmptyLines: false
};

FromCSVConfig config47 = {
    dataRowCount: 2,
    skipHeaders: true
};

FromCSVConfig config48 = {
    dataRowCount: 3,
    headers: false,
    ignoreEmptyLines: false
};

FromCSVConfig config49 = {
    dataRowCount: 2,
    skipdataRows: 2
};

FromCSVConfig config50 = {
    dataRowCount: 2,
    skipdataRows: 2,
    ignoreEmptyLines: false
};

FromCSVConfig config51 = {
    dataRowCount: 2,
    skipdataRows: 2,
    ignoreEmptyLines: false,
    skipHeaders: true
};

FromCSVConfig config52 = {
    dataRowCount: 2,
    skipdataRows: 2,
    ignoreEmptyLines: false,
    headers: false
};

FromCSVConfig config53 = {
    separator: "@"
};

FromCSVConfig config54 = {
    separator: "@",
    skipHeaders: true
};

FromCSVConfig config55 = {
    separator: "@",
    headers: false
};

FromCSVConfig config56 = {
    headers: false,
    orderBy: {
        column: "abc"
    }
};

FromCSVConfig config57 = {
    skipHeaders: true,
    orderBy: {
        column: "abc"
    }
};

FromCSVConfig config58 = {
    orderBy: [
        {column: "a", columnOrder: "DESC"},
        {column: "b"}
    ]
};

FromCSVConfig config59 = {
    orderBy: [
        {column: "a", columnOrder: "DESC"},
        {column: "b"}
    ],
    skipColumns: "c"
};

FromCSVConfig config60 = {
    orderBy: [
        {column: "a", columnOrder: "DESC"},
        {column: "b"}
    ],
    skipColumns: "a"
};

FromCSVConfig config61 = {
    orderBy: [
        {column: "a", columnOrder: "DESC"},
        {column: "b"}
    ],
    skipColumns: ["c", "a"]
};

FromCSVConfig config62 = {
    orderBy: [
        {column: "a", columnOrder: "DESC"},
        {column: "b"}
    ],
    skipColumns: ["b", "a"]
};

FromCSVConfig config63 = {
    orderBy: [
        {column: "a", columnOrder: "DESC"},
        {column: "b"}
    ],
    skipColumns: 1
};

FromCSVConfig config64 = {
    customheader: ["H1", "H2", "H3", "H4", "H5", "H6"],
    orderBy: [
        {column: "H1", columnOrder: "DESC"},
        {column: "H2"}
    ],
    skipColumns: "a"
};

FromCSVConfig config65 = {
    customheader: ["H1", "H2", "H3", "H4", "H5", "H6"],
    orderBy: [
        {column: "a", columnOrder: "DESC"},
        {column: "b"}
    ],
    skipColumns: ["a", "b"]
};

FromCSVConfig config66 = {
    customheader: [1, 2, 3, 4, 5, 6],
    orderBy: [
        {column: "1", columnOrder: "DESC"},
        {column: "2"}
    ],
    skipColumns: [1, 2]
};

FromCSVConfig config67 = {
    customheader: [1, 2, 3, 4, 5, 6],
    orderBy: [
        {column: 1, columnOrder: "DESC"},
        {column: 2}
    ],
    skipColumns: [1, 2]
};

FromCSVConfig config68 = {
    customheader: [1, 2, 3, 4, 5, 6],
    orderBy: [
        {column: 1, columnOrder: "DESC"},
        {column: 2}
    ],
    skipColumns: [3, 4]
};

FromCSVConfig config69 = {
    customheader: [1, 2, 3, 4, 5, 6],
    skipColumns: [100, 101]
};

FromCSVConfig config70 = {
    customheader: ["H1", "H2", "H3", "H4", "H5", "H6"],
    skipColumns: ["A", "B"]
};

FromCSVConfig config71 = {
    customheader: [1, 2, 3, 4, 5, 6],
    skipColumns: ["4", "5"]
};

// Needs to have separate tests for each skip columns query
