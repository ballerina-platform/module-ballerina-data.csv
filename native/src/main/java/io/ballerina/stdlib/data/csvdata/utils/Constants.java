package io.ballerina.stdlib.data.csvdata.utils;

import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BString;

public class Constants {
    public static class ConfigConstants {
        public static final BString DELIMITER = StringUtils.fromString("delimiter");
        public static final BString TEXT_ENCLOSURE = StringUtils.fromString("textEnclosure");
        public static final BString HEADER = StringUtils.fromString("header");
        public static final BString ESCAPE_CHAR = StringUtils.fromString("escapeChar");
        public static final BString LINE_TERMINATOR = StringUtils.fromString("lineTerminator");
        public static final BString SKIP_LINES = StringUtils.fromString("skipLines");
        public static final BString NIL_VALUE = StringUtils.fromString("nilValue");
        public static final BString COMMENT_CHAR = StringUtils.fromString("comment");
        public static final BString LOCALE = StringUtils.fromString("locale");
        public static final BString ENCODING = StringUtils.fromString("encoding");
        public static final BString NIL_AS_OPTIONAL = StringUtils.fromString("nilAsOptionalField");
        public static final BString ABSENT_AS_NILABLE = StringUtils.fromString("absentAsNilableType");
        public static final BString ALLOW_DATA_PROJECTION = StringUtils.fromString("allowDataProjection");
        public static final BString CUSTOM_HEADERS = StringUtils.fromString("customHeaders");
        public static final BString STRING_CONVERSION = StringUtils.fromString("stringConversion");
        public static final BString ENABLE_CONSTRAINT_VALIDATION = StringUtils.
                fromString("enableConstraintValidation");
    }

    public static class Values {
        public static final String NULL = "null";
        public static final String BALLERINA_NULL = "()";
    }

    public static class LineTerminator {
        public static final char LF = '\n';
        public static final char CR = '\r';
        public static final String CRLF = "\r\n";
    }

    public static final String SKIP_LINE_RANGE_SEP = "-";
    public static final String FIELD = "$field$.";
    public static final String NAME = "Name";
    public static final BString VALUE = StringUtils.fromString("value");
}
