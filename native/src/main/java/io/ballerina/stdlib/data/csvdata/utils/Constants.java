package io.ballerina.stdlib.data.csvdata.utils;

import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BString;

public class Constants {
    public static class ConfigConstants {
        public static BString DELIMITER = StringUtils.fromString("delimiter");
        public static BString TEXT_ENCLOSURE = StringUtils.fromString("textEnclosure");
        public static BString HEADER = StringUtils.fromString("header");
        public static BString ESCAPE_CHAR = StringUtils.fromString("escapeChar");
        public static BString LINE_TERMINATOR = StringUtils.fromString("lineTerminator");
        public static BString SKIP_LINES = StringUtils.fromString("skipLines");
        public static BString NIL_VALUE = StringUtils.fromString("nilValue");
        public static BString COMMENT_CHAR = StringUtils.fromString("comment");
        public static BString LOCALE = StringUtils.fromString("locale");
        public static BString ENCODING = StringUtils.fromString("encoding");
        public static BString NIL_AS_OPTIONAL = StringUtils.fromString("nilAsOptionalField");
        public static BString ABSENT_AS_NILABLE = StringUtils.fromString("absentAsNilableType");
        public static BString ALLOW_DATA_PROJECTION = StringUtils.fromString("allowDataProjection");
        public static BString CUSTOM_HEADERS = StringUtils.fromString("customHeaders");
    }

    public static class Values {
        public static String NULL = "null";
        public static String BALLERINA_NULL = "()";
    }

    public static String SKIP_LINE_RANGE_SEP = "-";
}
