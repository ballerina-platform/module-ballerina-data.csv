package io.ballerina.stdlib.data.csvdata.utils;

import io.ballerina.runtime.api.TypeTags;
import io.ballerina.runtime.api.flags.SymbolFlags;
import io.ballerina.runtime.api.types.*;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.utils.ValueUtils;
import io.ballerina.runtime.api.values.*;

import java.util.Arrays;
import java.util.Map;

import static io.ballerina.runtime.api.TypeTags.INT_TAG;
import static io.ballerina.stdlib.data.csvdata.utils.Constants.SKIP_LINE_RANGE_SEP;

public class CsvUtils {
    public static void validateExpectedArraySize(int size, int currentSize) {
        if (size != -1 && size > currentSize) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_ARRAY_SIZE, currentSize);
        }
    }

    public static boolean isBasicType(Type type) {
        switch (type.getTag()) {
            case TypeTags.INT_TAG:
            case TypeTags.STRING_TAG:
            case TypeTags.BOOLEAN_TAG:
            case TypeTags.DECIMAL_TAG:
            case TypeTags.FLOAT_TAG:
            case TypeTags.NULL_TAG:
            case TypeTags.JSON_TAG:
            case TypeTags.ANYDATA_TAG:
                return true;
            default:
                return false;
        }
    }

    public static Object getRowValueForSort(Object row, Object columnName) {
        if (row instanceof BMap) {
            return ((BMap) row).get(columnName);
        } else {
            if (columnName instanceof Long) {
                return ((BArray) row).get((long) columnName);
            } else {
                // TODO: Add a new error
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, "Test", "Test");
            }
        }
    }

    public static int compareTwoColumnAndGetValue(Object o1, Object o2) {
        if (o1 == null && o2 ==null) {
            return 0;
        }
        if (o1 == null) {
            return -1;
        }
        if (o2 == null) {
            return 1;
        }
        if (o1 instanceof Long && o2 instanceof Long) {
            return ((Long) o1).compareTo((Long) o2);
        }
        if (o1 instanceof Boolean && o2 instanceof Boolean) {
            return ((Boolean) o1).compareTo((Boolean) o2);
        }
        if (o1 instanceof BDecimal && o2 instanceof BDecimal) {
            return (((BDecimal) o1).decimalValue()).compareTo(((BDecimal) o1).decimalValue());
        }
        if (o1 instanceof Float && o2 instanceof Float) {
            return ((Float) o1).compareTo((Float) o2);
        }
        if (o1 instanceof Double && o2 instanceof Double) {
            return ((Double) o1).compareTo((Double) o2);
        }
        return (StringUtils.getStringValue(o1)).compareTo(StringUtils.getStringValue(o2));
    }

    public static String[] createHeaders(String[] headers, CsvConfig config) {
        Object customHeaders = config.customHeader;

        if (customHeaders == null) {
            for (int i = 0; i < headers.length; i++) {
                headers[i] = String.valueOf( i + 1);
            }
        }

        if (customHeaders instanceof BArray) {
            BArray array = (BArray) customHeaders;
            if (array.size() != headers.length) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CUSTOM_HEADER_LENGTH);
            }
            for (int i = 0; i < headers.length; i++) {
                headers[i] = array.get(i).toString();
            }
        }

        return headers;
    }

    public static Object convertToBasicType(Object csv, Type targetType, CsvConfig config) {
        if (csv == null) {
            csv = config.nilValue;
        }
        try {
            return ValueUtils.convert(csv, targetType);
        } catch (BError e) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CAST, csv, targetType);
        }
    }

    public static void checkOptionalFieldsAndLogError(Map<String, Field> currentField) {
        currentField.values().forEach(field -> {
            if (SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.REQUIRED)) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_FIELD_IN_CSV, field.getFieldName());
            }
        });
    }

    public static boolean isHeaderFieldsEmpty(Map<String, Field> currentField) {
        for (Field field: currentField.values()) {
            if (SymbolFlags.isFlagOn(field.getFlags(), SymbolFlags.REQUIRED)) {
                return false;
            }
        }
        return true;
    }

    public static boolean checkTypeCompatibility(Type constraintType, Object csv) {
        int tag = constraintType.getTag();
        if ((csv instanceof BString && (tag == TypeTags.STRING_TAG || isJsonOrAnyDataOrAny(tag)))
                || (csv instanceof Long && (tag == INT_TAG || isJsonOrAnyDataOrAny(tag)))
                || (csv instanceof BDecimal && ((tag == TypeTags.DECIMAL_TAG
                        || tag == TypeTags.FLOAT_TAG) || isJsonOrAnyDataOrAny(tag)))
                || (csv instanceof Double && ((tag == TypeTags.FLOAT_TAG
                        || tag == TypeTags.DECIMAL_TAG) || isJsonOrAnyDataOrAny(tag)))
                || (Boolean.class.isInstance(csv) && (tag == TypeTags.BOOLEAN_TAG || isJsonOrAnyDataOrAny(tag)))
                || (csv == null && (tag == TypeTags.NULL_TAG || isJsonOrAnyDataOrAny(tag)))) {
            return true;
        } else {
            return false;
        }
    }

    private static boolean isJsonOrAnyDataOrAny(int tag) {
        return tag == TypeTags.JSON_TAG || tag == TypeTags.ANYDATA_TAG || tag == TypeTags.ANY_TAG;
    }

    public static void addValuesToArrayType(Object csvElement, Type arrayElementType, int index,
                                      Object currentCsvNode, CsvConfig config) {
        switch (arrayElementType.getTag()) {
            case TypeTags.NULL_TAG:
            case TypeTags.BOOLEAN_TAG:
            case TypeTags.INT_TAG:
            case TypeTags.FLOAT_TAG:
            case TypeTags.DECIMAL_TAG:
            case TypeTags.STRING_TAG:
            case TypeTags.JSON_TAG:
            case TypeTags.ANYDATA_TAG:
            case TypeTags.ANY_TAG:
                if (checkTypeCompatibility(arrayElementType, csvElement)) {
                    ((BArray) currentCsvNode).add(index, convertToBasicType(csvElement, arrayElementType, config));
                    return;
                }
                break;
            case TypeTags.UNION_TAG:
                for (Type memberType: ((UnionType) arrayElementType).getMemberTypes()) {
                    if (!isBasicType(memberType)) {
                        throw DiagnosticLog.error(DiagnosticErrorCode
                                .EXPECTED_TYPE_CAN_ONLY_CONTAIN_BASIC_TYPES, memberType);
                    }
                    if (checkTypeCompatibility(memberType, csvElement)) {
                        ((BArray) currentCsvNode).add(index, convertToBasicType(csvElement, memberType, config));
                        return;
                    }
                }
        }
        throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_TYPE_FOR_ARRAY, csvElement, index, arrayElementType);
    }

    public static int getTheActualExpectedType(Type type) {
        if (type instanceof TupleType) {
            TupleType tupleType = (TupleType) type;
            if (tupleType.getRestType() != null) {
                return -1;
            }
            return tupleType.getTupleTypes().size();
        } else {
            return ((ArrayType) type).getSize();
        }
    }

    public static long[] getSkipLinesFromStringConfigValue(String configValue) {
        String[] parts = configValue.split(SKIP_LINE_RANGE_SEP);
        if (parts.length != 2) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_RANGE_FOR_SKIPLINES);
        }
        try {
            int start = Integer.parseInt(parts[0]);
            int end = Integer.parseInt(parts[1]);
            int size = end - start + 1;
            if (size <= 0) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_RANGE_FOR_SKIPLINES);
            }
            long[] result = new long[size];
            for (int i = 0; i < size; i++) {
                result[i] = start + i;
            }
            return result;
        } catch (NumberFormatException e) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_VALUE_FOR_SKIPLINES);
        }
    }

    public static long[] getSkipDataRows(Object skipLines) {
        long[] skipDataRows;
        if (skipLines instanceof BArray) {
            BArray skipLinesArray = (BArray) skipLines;
            if (skipLinesArray.getLength() == 0) {
                return new long[]{-1};
            }
            skipDataRows = (skipLinesArray).getIntArray();
            return skipDataRows;
        }

        skipDataRows = getSkipLinesFromStringConfigValue(StringUtils.getStringValue(skipLines));
        return skipDataRows;
    }

    public static boolean isCharContainsInLineTerminatorUserConfig(char c, Object lineTerminatorObj) {
        String stringValue = Character.toString(c);
        if (lineTerminatorObj instanceof BArray) {
            Object[] lineTerminators = ((BArray) lineTerminatorObj).getValues();
            for (Object lineTerminator: lineTerminators) {
                if (lineTerminator != null && lineTerminator.toString().equals(stringValue)) {
                    return true;
                }
            }
            return false;
        }

        String lineTerminator = StringUtils.getStringValue(lineTerminatorObj);
        return lineTerminator.equals(stringValue);
    }

    public static class SortConfigurations {
        protected Object columnName;
        protected Object sortOrder;

        public SortConfigurations(Object columnName, Object sortOrder) {
            this.columnName = columnName;
            this.sortOrder = sortOrder;
        }
    }
}
