public type Error error;

# Defines the name of the JSON Object key.
#
# + value - The name of the JSON Object key
public type NameConfig record {|
    string value;
|};

# The annotation is used to overwrite the existing record field name.
public const annotation NameConfig Name on record field;                                               

public type Options record {
   record {
       # If `true`, nil values will be considered as optional fields in the projection.
       boolean nilAsOptionalField = false;
       # If `true`, absent fields will be considered as nilable types in the projection.
       boolean absentAsNilableType = false;
   }|false allowDataProjection = {};
   int[]|string skipLines = [];
};

public type ParseOption record {|
  *Options;
  string:Char delimiter = ",";
  string encoding = "UTF-8";
  string locale = "en_US";
  string:Char textEnclosure = "\"";
  string:Char escapeChar = "\\";
  LineTerminator|LineTerminator[] lineTerminator = [CR, LF, CRLF];
  NilValue? nilValue = ();
  string:Char comment = "#";
  false|int:Unsigned32 header = 0;
|};

public type parseToRecordOption record {|
  *ParseOption;
  string[]? customHeaders = ();
   boolean enableConstraintValidation = true;
|};

public type ListAsListOption record {|
    *Options;
    boolean stringConversion = true;
|};

public type RecordAsRecordOption record {|
    *Options;
   boolean enableConstraintValidation = true;
|};

public type ListAsRecordOption record {|
    *Options;
    boolean enableConstraintValidation = true;
    boolean stringConversion = true;
|};

public enum LineTerminator {
  CR = "\r",
  LF = "\n",
  CRLF = "\r\n"
};

public enum NilValue {
  NULL = "null",
  EMPTY_STRING = "",
  NOT_APPLICABLE = "N/A",
  BAL_NULL = "()"
};
