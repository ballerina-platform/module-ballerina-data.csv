# Represents an error.
#
# This type is used to capture error details that occur during the execution of a program.
# It can hold an error message, an optional error cause, and an optional map of additional details.
public type Error error;

# Defines the name of the JSON Object key.
#
# + value - The name of the JSON Object key
public type NameConfig record {|
    string value;
|};

# The annotation is used to overwrite the existing record field name.
public const annotation NameConfig Name on record field;                                             

# Represents options for data projection.
public type Options record {
    # Allows data projection with specific settings.
    #
    # This field can be either a record or a boolean. If it's a record, it contains the following fields:
    # If it's set to `false`, data projection is not allowed.
    record {
        # If `true`, nil values will be considered as optional fields in the projection.
        boolean nilAsOptionalField = false;
        # If `true`, absent fields will be considered as nilable types in the projection.
        boolean absentAsNilableType = false;
    }|false allowDataProjection = {};
    # Lines to skip during processing, specified either as an array of integers or a string.
    int[]|string skipLines = [];
    # If `true`, enables validation of constraints during processing.
    boolean enableConstraintValidation = true;  
    # If `true`, the resulted CSV contains the headers as the first row.
    # This field is only considered if the expected type is a subset of `anydata[][]`
    boolean outputWithHeaders = false;
};

# Represents the options for parsing data.
public type ParseOptions record {|
    *Options;
    # The delimiter character used for separating fields in the data.
    string:Char delimiter = ",";
    # The character encoding of the data.
    string encoding = "UTF-8";
    # The locale used for parsing.
    string locale = "en_US";
    # The character used to enclose text fields.
    string:Char textEnclosure = "\"";
    # The character used for escaping.
    string:Char escapeChar = "\\";
    # The line terminator(s) used in the data.
    LineTerminator|LineTerminator[] lineTerminator = [LF, CRLF];
    # The value to represent nil.
    NilValue? nilValue = ();
    # The character used to indicate comments in the data.
    string:Char comment = "#";
    # Specifies whether the header is present and, if so, the number of header lines.
    false|int:Unsigned32 header = 0;
    # Custom headers for the data, if headers are absent.
    string[]? customHeadersIfHeaderAbsent = ();
|};

# Represents options for treating a list as a record.
public type ParseListOptions record {|
    *Options;
    # If `0`, all the source data will treat as data rows.
    # Otherwise specify the header rows(Starts from 1) in the source data.
    int:Unsigned32 headerRows = 0;
    # Specify the header names of the source data.
    # This field will overwrite the header values in the header rows.
    # This will be mandatory if the header row parameter is larger than one.
    string[]? customHeaders = ();
|};

# Represents options for treating a list as a record.
public type TransformOptions record {|
    *Options;
    # Specify the order of the headers in the source data.
    # If the expected type is a subset of `record{}[]` this parameter will be ignored.
    string[]? headersOrder = ();
|};

# Enum representing possible line terminators.
public enum LineTerminator {
    LF = "\n",
    CRLF = "\r\n"
};

# Enum representing possible nil values.
public enum NilValue {
    NULL = "null",
    NOT_APPLICABLE = "N/A",
    BAL_NULL = "()"
};
