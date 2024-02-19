package io.ballerina.stdlib.data.csvdata.utils;

import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BString;

public class Constants {
    public static class ConfigConstants {
        public static BString START_NUMBER = StringUtils.fromString("startNumber");
        public static BString HEADER_START_NUMBER = StringUtils.fromString("headerStartNumber");
        public static BString DATA_START_NUMBER = StringUtils.fromString("dataStartNumber");
        public static BString HEADERS = StringUtils.fromString("headers");
        public static BString ESCAPE_CHARACTER = StringUtils.fromString("escapeCharacter");
        public static BString IGNORE_EMPTY_LINES = StringUtils.fromString("ignoreEmptyLines");
        public static BString SEPARATOR = StringUtils.fromString("separator");
        public static BString QUOTE = StringUtils.fromString("quote");
        public static BString SKIP_HEADERS = StringUtils.fromString("skipHeaders");
        public static BString SKIP_DATA_ROWS = StringUtils.fromString("skipdataRows");
        public static BString DATA_ROW_COUNT = StringUtils.fromString("dataRowCount");
        public static BString ORDER_BY = StringUtils.fromString("orderBy");
        public static BString SKIP_COLUMNS = StringUtils.fromString("skipColumns");
        public static BString CUSTOM_HEADER = StringUtils.fromString("customheader");
        public static BString SUPPRESS_ESCAPING = StringUtils.fromString("suppressEscaping");
        public static BString NULL_VALUE = StringUtils.fromString("nullValue");
        public static BString ROOT = StringUtils.fromString("root");
        public static BString LINE_SEPARATOR = StringUtils.fromString("lineSeparator");
    }
}