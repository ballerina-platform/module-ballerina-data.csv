FromCSVConfig config1 = {
    startNumber: 0, 
    headerStartNumber: 0, 
    dataStartNumber: 1, 
    headers: true, 
    escapeCharacter: "\\", 
    ignoreEmptyLines: true, 
    separator: ",", 
    quote: "\"", 
    skipHeaders: false, 
    skipdataRows: 0, 
    dataRowCount: -1, 
    orderBy: (), 
    skipColumns: (), 
    customheader: (), 
    suppressEscaping: false, 
    nullValue: ()
};

FromCSVConfig config2 = {
    startNumber: 10, 
    headerStartNumber: 5, 
    dataStartNumber: 2, 
    headers: false, 
    escapeCharacter: "/", 
    ignoreEmptyLines: false, 
    separator: ";", 
    quote: "'", 
    skipHeaders: true, 
    skipdataRows: 2, 
    dataRowCount: 100, 
    orderBy: [
        {
            column: "column1",
            columnOrder: ASC
        }
    ], 
    skipColumns:["column2"], 
    customheader:["column1", "column2", "column3", "column4"],
    suppressEscaping: true, 
    nullValue: ""
};

FromCSVConfig config3 = {
    customheader: ()
};

FromCSVConfig config4 = {
    skipColumns: ["column1"]
};

FromCSVConfig config5 = {
    skipColumns: ["column1", "column2"]
};

FromCSVConfig config6 = {
    skipColumns: [1, 2, 3]
};

FromCSVConfig config7 = {
    customheader: ["header1", "header2", "header3"]
};

FromCSVConfig config8 = {
    separator: ";"
};

FromCSVConfig config9 = {
    escapeCharacter: "/"
};

FromCSVConfig config10 = {
    quote: "'"
};

