package io.ballerina.lib.data.csvdata.utils;

import io.ballerina.runtime.api.TypeTags;
import io.ballerina.runtime.api.flags.SymbolFlags;
import io.ballerina.runtime.api.types.ArrayType;
import io.ballerina.runtime.api.types.Field;
import io.ballerina.runtime.api.types.IntersectionType;
import io.ballerina.runtime.api.types.RecordType;
import io.ballerina.runtime.api.types.TupleType;
import io.ballerina.runtime.api.types.Type;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.utils.TypeUtils;
import io.ballerina.runtime.api.utils.ValueUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BDecimal;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;

import static io.ballerina.lib.data.csvdata.utils.Constants.SKIP_LINE_RANGE_SEP;

/*
 * Utility functions used in the CSV data module.
 * 
 * @since 0.1.0
 */
public class CsvUtils {
    private static final long[] EMPTY_LONG_ARRAY =  new long[]{};
    public static boolean isCarriageTokenPresent = false;

    public static void setCarriageTokenPresent(boolean isCarriageTokenPresent) {
        CsvUtils.isCarriageTokenPresent = isCarriageTokenPresent;
    }

    public static void validateExpectedArraySize(int size, int currentSize) {
        if (size != -1 && size > currentSize) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_EXPECTED_ARRAY_SIZE, currentSize);
        }
    }

    public static boolean isExpectedTypeIsArray(Type expectedType) {
        expectedType = TypeUtils.getReferredType(expectedType);

        return switch (expectedType.getTag()) {
            case TypeTags.TUPLE_TAG, TypeTags.ARRAY_TAG -> true;
            default -> false;
        };
    }

    public static boolean isBasicType(Type type) {
        return switch (type.getTag()) {
            case TypeTags.INT_TAG, TypeTags.STRING_TAG, TypeTags.BOOLEAN_TAG, TypeTags.DECIMAL_TAG, TypeTags.FLOAT_TAG,
                 TypeTags.NULL_TAG, TypeTags.JSON_TAG, TypeTags.ANYDATA_TAG, TypeTags.UNION_TAG,
                 TypeTags.INTERSECTION_TAG, TypeTags.CHAR_STRING_TAG, TypeTags.BYTE_TAG, TypeTags.SIGNED8_INT_TAG,
                 TypeTags.SIGNED16_INT_TAG, TypeTags.SIGNED32_INT_TAG, TypeTags.UNSIGNED8_INT_TAG,
                 TypeTags.UNSIGNED16_INT_TAG, TypeTags.UNSIGNED32_INT_TAG -> true;
            default -> false;
        };
    }

    public static String[] createHeadersForParseLists(BArray csvElement, String[] headers, CsvConfig config) {
        Object customHeaders = config.customHeaders;
        long headersRows = config.headersRows;

        int length = headers.length;
        if (customHeaders instanceof BArray array) {
            if (array.size() != length) {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_CUSTOM_HEADER_LENGTH);
            }
            for (int i = 0; i < length; i++) {
                headers[i] = array.get(i).toString();
            }
            return headers;
        }

        if (headersRows == 1) {
            return csvElement.getStringArray();
        }

        if (headersRows > 1) {
            throw DiagnosticLog.error(DiagnosticErrorCode.NO_CUSTOM_HEADER_PROVIDED);
        }

        // when headersRows = 0 and customHeaders = null
        for (int i = 0; i < length; i++) {
            headers[i] = String.valueOf(i + 1);
        }
        return headers;
    }

    public static Optional<Type> getMutableType(IntersectionType intersectionType) {
        for (Type constituentType : intersectionType.getConstituentTypes()) {
            if (constituentType.getTag() == TypeTags.READONLY_TAG) {
                continue;
            }
            return Optional.of(constituentType);
        }
        return Optional.empty();
    }

    public static Object convertToBasicType(Object csv, Type targetType, CsvConfig config) {
        if (csv == null) {
            csv = config.nilValue;
        }
        return ValueUtils.convert(csv, targetType);
    }

    public static void checkRequiredFieldsAndLogError(Map<String, Field> filedHierarchy, boolean absentAsNilableType) {
        filedHierarchy.values().forEach(field -> {
            if (absentAsNilableType && field.getFieldType().isNilable()) {
                return;
            }
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

    public static boolean checkTypeCompatibility(Type constraintType, Object csv, boolean stringConversion) {
        int tag = constraintType.getTag();
        if (csv instanceof BString) {
            if (stringConversion || tag == TypeTags.STRING_TAG
                    || tag == TypeTags.CHAR_STRING_TAG || isJsonOrAnyDataOrAny(tag)) {
                return true;
            }
        }
        if (csv instanceof Long) {
            if (tag == TypeTags.INT_TAG
                    || tag == TypeTags.FLOAT_TAG || tag == TypeTags.DECIMAL_TAG || tag == TypeTags.BYTE_TAG
                    || tag == TypeTags.SIGNED8_INT_TAG || tag == TypeTags.SIGNED16_INT_TAG
                    || tag == TypeTags.SIGNED32_INT_TAG || tag == TypeTags.UNSIGNED8_INT_TAG
                    || tag == TypeTags.UNSIGNED16_INT_TAG || tag == TypeTags.UNSIGNED32_INT_TAG
                    || isJsonOrAnyDataOrAny(tag)) {
                return true;
            }
        }
        if (csv instanceof BDecimal) {
            if ((tag == TypeTags.DECIMAL_TAG
                    || tag == TypeTags.FLOAT_TAG || tag == TypeTags.INT_TAG) || isJsonOrAnyDataOrAny(tag)) {
                return true;
            }
        }
        if (csv instanceof Double) {
            if ((tag == TypeTags.FLOAT_TAG
                    || tag == TypeTags.DECIMAL_TAG || tag == TypeTags.INT_TAG) || isJsonOrAnyDataOrAny(tag)) {
                return true;
            }
        }
        if (csv instanceof Boolean) {
            if (tag == TypeTags.BOOLEAN_TAG || isJsonOrAnyDataOrAny(tag)) {
                return true;
            }
        }
        if (csv == null) {
            return tag == TypeTags.NULL_TAG || isJsonOrAnyDataOrAny(tag);
        }
        return false;
    }

    private static boolean isJsonOrAnyDataOrAny(int tag) {
        return tag == TypeTags.JSON_TAG || tag == TypeTags.ANYDATA_TAG || tag == TypeTags.ANY_TAG;
    }

    public static int getTheActualExpectedType(Type type) {
        if (type instanceof TupleType tupleType) {
            if (tupleType.getRestType() != null) {
                return -1;
            }
            return tupleType.getTupleTypes().size();
        } else {
            return ((ArrayType) type).getSize();
        }
    }

    public static Map<String, String> processNameAnnotationsAndBuildCustomFieldMap(RecordType recordType,
                                                 Map<String, Field> fieldHierarchy) {
        BMap<BString, Object> annotations = recordType.getAnnotations();
        HashMap<String, String> updatedRecordFieldNames = new HashMap<>();
        HashSet<String> updatedFields = new HashSet<>();
        HashSet<String> updatedValues = new HashSet<>();

        for (BString annotationsKey : annotations.getKeys()) {
            String key = annotationsKey.getValue();
            if (key.contains(Constants.FIELD)) {
                BMap<BString, Object> annotMap = ((BMap<BString, Object>) annotations.get(annotationsKey));
                for (BString mapKey : annotMap.getKeys()) {
                    if (mapKey.getValue().endsWith(Constants.NAME)) {
                        String name = ((Map<BString, Object>) annotMap.get(mapKey)).get(Constants.VALUE).toString();
                        String originalName = key.substring(Constants.FIELD.length());
                        if (updatedValues.contains(name)) {
                            throw DiagnosticLog.error(DiagnosticErrorCode.DUPLICATE_FIELD, name);
                        }
                        if (updatedFields.contains(originalName)) {
                            throw DiagnosticLog.error(DiagnosticErrorCode.DUPLICATE_FIELD, originalName);
                        }
                        updatedFields.add(originalName);
                        updatedValues.add(name);
                        updatedRecordFieldNames.put(name, originalName);
                        break;
                    }
                }
            }
        }
        for (String field : fieldHierarchy.keySet()) {
            if (updatedFields.contains(field)) {
                continue;
            }
            if (updatedValues.contains(field) || updatedRecordFieldNames.containsKey(field)) {
                throw DiagnosticLog.error(DiagnosticErrorCode.DUPLICATE_FIELD, field);
            }
            updatedRecordFieldNames.put(field, field);
        }

        return updatedRecordFieldNames;
    }

    public static String getUpdatedHeaders(Map<String, String> updatedRecords, String key, boolean isKeyContains) {
        String fieldName = updatedRecords.get(key);
        if (fieldName != null) {
            return fieldName;
        }
        if (isKeyContains) {
            throw DiagnosticLog.error(DiagnosticErrorCode.DUPLICATE_FIELD, key);
        }
        return key;
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
        if (skipLines == null) {
            return EMPTY_LONG_ARRAY;
        }
        if (skipLines instanceof BArray skipLinesArray) {
            if (skipLinesArray.getLength() == 0) {
                return EMPTY_LONG_ARRAY;
            }
            skipDataRows = skipLinesArray.getIntArray();
            return skipDataRows;
        }

        skipDataRows = getSkipLinesFromStringConfigValue(StringUtils.getStringValue(skipLines));
        return skipDataRows;
    }

    public static boolean isNullValue(Object nullValue, Object value) {
        if (value == null) {
            return true;
        }
        if (value instanceof BString bString) {
            value = StringUtils.getStringValue(bString);
        }
        if (value instanceof String v) {
            return handleStringNullValue(nullValue, v, value);
        }
        return false;
    }

    private static boolean handleStringNullValue(Object nullValue, String v, Object value) {
        if ((nullValue == null) && (Constants.Values.NULL.equalsIgnoreCase(v)
                || Constants.Values.BALLERINA_NULL.equalsIgnoreCase(v))) {
            return true;
        }
        return nullValue != null && value.equals(StringUtils.getStringValue(nullValue));
    }

    public static boolean isCharContainsInLineTerminatorUserConfig(char c, Object lineTerminatorObj) {
        if (lineTerminatorObj instanceof BArray array) {
            Object[] lineTerminators = array.getValues();
            for (Object lineTerminator: lineTerminators) {
                Optional<Boolean> value = handleLineTerminator(lineTerminator, c);
                if (value.isEmpty()) {
                    continue;
                }
                return value.get();
            }
            return false;
        }

        String lineTerminator = StringUtils.getStringValue(StringUtils.fromString(lineTerminatorObj.toString()));
        if (c == Constants.LineTerminator.LF) {
            if (lineTerminator != null) {
                if (lineTerminator.equals(Constants.LineTerminator.CRLF)) {
                    return isCarriageTokenPresent;
                }
                return true;
            }
        }
        return false;
    }

    private static Optional<Boolean> handleLineTerminator(Object lineTerminator, char c) {
        if (lineTerminator != null && c == Constants.LineTerminator.LF) {
            String lineTerminatorString = lineTerminator.toString();
            if (isCarriageTokenPresent) {
                if (lineTerminatorString.equals(Constants.LineTerminator.CRLF)) {
                    return Optional.of(true);
                }
                return Optional.empty();
            }
            return Optional.of(true);
        }
        return Optional.empty();
    }

    public static class UnMappedValue {
        private static UnMappedValue value = null;
        public static UnMappedValue createUnMappedValue() {
            if (value == null) {
                value = new UnMappedValue();
            }
            return value;
        }
    }

    public static class SkipMappedValue {
        private static SkipMappedValue value = null;
        public static SkipMappedValue createSkippedValue() {
            if (value == null) {
                value = new SkipMappedValue();
            }
            return value;
        }
    }

    public static Locale createLocaleFromString(String localeString) {
        // Split the string into language, country, and variant
        String[] parts = localeString.split(Constants.UNDERSCORE);
        if (parts.length == 3) {
            return new Locale(parts[0], parts[1], parts[2]);
        } else if (parts.length == 2) {
            return new Locale(parts[0], parts[1]);
        } else {
            return new Locale(parts[0]); // Only language
        }
    }

    public static void validateConfigs(CsvConfig config) {
        if (config.headersRows > 1 && config.customHeaders == null) {
            throw DiagnosticLog.error(DiagnosticErrorCode.NO_CUSTOM_HEADER_PROVIDED);
        }
    }
}
