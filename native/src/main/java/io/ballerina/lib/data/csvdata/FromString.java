/*
 * Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package io.ballerina.lib.data.csvdata;

import io.ballerina.lib.data.csvdata.utils.Constants;
import io.ballerina.lib.data.csvdata.utils.CsvConfig;
import io.ballerina.lib.data.csvdata.utils.CsvUtils;
import io.ballerina.runtime.api.PredefinedTypes;
import io.ballerina.runtime.api.TypeTags;
import io.ballerina.runtime.api.creators.ErrorCreator;
import io.ballerina.runtime.api.creators.TypeCreator;
import io.ballerina.runtime.api.creators.ValueCreator;
import io.ballerina.runtime.api.types.FiniteType;
import io.ballerina.runtime.api.types.IntersectionType;
import io.ballerina.runtime.api.types.ReferenceType;
import io.ballerina.runtime.api.types.Type;
import io.ballerina.runtime.api.types.UnionType;
import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.utils.TypeUtils;
import io.ballerina.runtime.api.values.BDecimal;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BString;

import java.math.BigDecimal;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.WeakHashMap;

/**
 * Native implementation of data:fromStringWithType(string).
 *
 * @since 0.1.0
 */
public final class FromString {
    private static WeakHashMap<String, LocaleInfo> localeAttributes = new WeakHashMap<>();

    private static final List<Integer> TYPE_PRIORITY_ORDER = List.of(
            TypeTags.INT_TAG,
            TypeTags.FLOAT_TAG,
            TypeTags.DECIMAL_TAG,
            TypeTags.NULL_TAG,
            TypeTags.BOOLEAN_TAG,
            TypeTags.JSON_TAG,
            TypeTags.STRING_TAG
    );

    private static final List<Type> BASIC_JSON_MEMBER_TYPES = List.of(
            PredefinedTypes.TYPE_NULL,
            PredefinedTypes.TYPE_BOOLEAN,
            PredefinedTypes.TYPE_INT,
            PredefinedTypes.TYPE_FLOAT,
            PredefinedTypes.TYPE_DECIMAL,
            PredefinedTypes.TYPE_STRING
    );
    private static final UnionType JSON_TYPE_WITH_BASIC_TYPES = TypeCreator.createUnionType(BASIC_JSON_MEMBER_TYPES);
    public static final Integer BBYTE_MIN_VALUE = 0;
    public static final Integer BBYTE_MAX_VALUE = 255;
    public static final Integer SIGNED32_MAX_VALUE = 2147483647;
    public static final Integer SIGNED32_MIN_VALUE = -2147483648;
    public static final Integer SIGNED16_MAX_VALUE = 32767;
    public static final Integer SIGNED16_MIN_VALUE = -32768;
    public static final Integer SIGNED8_MAX_VALUE = 127;
    public static final Integer SIGNED8_MIN_VALUE = -128;
    public static final Long UNSIGNED32_MAX_VALUE = 4294967295L;
    public static final Integer UNSIGNED16_MAX_VALUE = 65535;
    public static final Integer UNSIGNED8_MAX_VALUE = 255;

    private FromString() {
    }

    public static Object fromStringWithType(BString string, Type expType, CsvConfig config) {
        String value = string.getValue();

        try {
            return switch (expType.getTag()) {
                case TypeTags.INT_TAG -> stringToInt(value, config);
                case TypeTags.BYTE_TAG -> stringToByte(value, config);
                case TypeTags.SIGNED8_INT_TAG -> stringToSigned8Int(value, config);
                case TypeTags.SIGNED16_INT_TAG -> stringToSigned16Int(value, config);
                case TypeTags.SIGNED32_INT_TAG -> stringToSigned32Int(value, config);
                case TypeTags.UNSIGNED8_INT_TAG -> stringToUnsigned8Int(value, config);
                case TypeTags.UNSIGNED16_INT_TAG -> stringToUnsigned16Int(value, config);
                case TypeTags.UNSIGNED32_INT_TAG -> stringToUnsigned32Int(value, config);
                case TypeTags.FLOAT_TAG -> stringToFloat(value, config);
                case TypeTags.DECIMAL_TAG -> stringToDecimal(value, config);
                case TypeTags.CHAR_STRING_TAG -> stringToChar(value);
                case TypeTags.STRING_TAG -> string;
                case TypeTags.BOOLEAN_TAG -> stringToBoolean(value);
                case TypeTags.NULL_TAG -> stringToNull(value, config);
                case TypeTags.FINITE_TYPE_TAG -> stringToFiniteType(value, (FiniteType) expType, config);
                case TypeTags.UNION_TAG -> stringToUnion(string, (UnionType) expType, config, false);
                case TypeTags.JSON_TAG, TypeTags.ANYDATA_TAG ->
                        stringToUnion(string, JSON_TYPE_WITH_BASIC_TYPES, config, true);
                case TypeTags.TYPE_REFERENCED_TYPE_TAG ->
                        fromStringWithType(string, ((ReferenceType) expType).getReferredType(), config);
                case TypeTags.INTERSECTION_TAG ->
                        fromStringWithType(string, ((IntersectionType) expType).getEffectiveType(), config);
                default -> returnError(value, expType.toString());
            };
        } catch (NumberFormatException | ParseException e) {
            return returnError(value, expType.toString());
        }
    }

    private static Object stringToFiniteType(String value, FiniteType finiteType, CsvConfig config) {
        return finiteType.getValueSpace().stream()
                .filter(finiteValue -> !(convertToSingletonValue(value, finiteValue, config) instanceof BError))
                .findFirst()
                .orElseGet(() -> returnError(value, finiteType.toString()));
    }

    private static Object convertToSingletonValue(String str, Object singletonValue, CsvConfig config) {
        String singletonStr = String.valueOf(singletonValue);
        if (str.equals(singletonStr)) {
            return fromStringWithType(StringUtils.fromString(str), TypeUtils.getType(singletonValue), config);
        } else {
            return returnError(str, singletonStr);
        }
    }

    private static Long stringToInt(String value, CsvConfig config) throws NumberFormatException, ParseException {
        Number number = parseNumberValue(value, config);
        if (isIntegerValue(value, number, config.locale)) {
            return number.longValue();
        }
        throw new NumberFormatException();
    }

    private static int stringToByte(String value, CsvConfig config) throws NumberFormatException, ParseException {
        Number number = parseNumberValue(value, config);
        if (isIntegerValue(value, number, config.locale)) {
            int intValue = parseNumberValue(value, config).intValue();
            if (isByteLiteral(intValue)) {
                return intValue;
            }
        }
        throw new NumberFormatException();
    }

    private static long stringToSigned8Int(String value, CsvConfig config) throws NumberFormatException,
            ParseException {
        Number number = parseNumberValue(value, config);
        if (isIntegerValue(value, number, config.locale)) {
            long intValue = parseNumberValue(value, config).longValue();
            if (isSigned8LiteralValue(intValue)) {
                return intValue;
            }
        }
        throw new NumberFormatException();
    }

    private static long stringToSigned16Int(String value, CsvConfig config) throws NumberFormatException,
            ParseException {

        Number number = parseNumberValue(value, config);
        if (isIntegerValue(value, number, config.locale)) {
            long intValue = parseNumberValue(value, config).longValue();
            if (isSigned16LiteralValue(intValue)) {
                return intValue;
            }
        }
        throw new NumberFormatException();
    }

    private static long stringToSigned32Int(String value, CsvConfig config) throws NumberFormatException,
            ParseException {
        Number number = parseNumberValue(value, config);
        if (isIntegerValue(value, number, config.locale)) {
            long intValue = parseNumberValue(value, config).longValue();
            if (isSigned32LiteralValue(intValue)) {
                return intValue;
            }
        }
        throw new NumberFormatException();
    }

    private static long stringToUnsigned8Int(String value, CsvConfig config)
            throws NumberFormatException, ParseException {
        Number number = parseNumberValue(value, config);
        if (isIntegerValue(value, number, config.locale)) {
            long intValue = parseNumberValue(value, config).longValue();
            if (isUnsigned8LiteralValue(intValue)) {
                return intValue;
            }
        }
        throw new NumberFormatException();
    }

    private static long stringToUnsigned16Int(String value, CsvConfig config)
            throws NumberFormatException, ParseException {
        Number number = parseNumberValue(value, config);
        if (isIntegerValue(value, number, config.locale)) {
            long intValue = parseNumberValue(value, config).longValue();
            if (isUnsigned16LiteralValue(intValue)) {
                return intValue;
            }
        }
        throw new NumberFormatException();
    }

    private static long stringToUnsigned32Int(String value, CsvConfig config)
            throws NumberFormatException, ParseException {
        Number number = parseNumberValue(value, config);
        if (isIntegerValue(value, number, config.locale)) {
            long intValue = parseNumberValue(value, config).longValue();
            if (isUnsigned32LiteralValue(intValue)) {
                return intValue;
            }
        }
        throw new NumberFormatException();
    }

    private static BString stringToChar(String value) throws NumberFormatException {
        if (isCharLiteralValue(value)) {
            return StringUtils.fromString(value);
        }
        throw new NumberFormatException();
    }

    private static Double stringToFloat(String value, CsvConfig config) throws NumberFormatException, ParseException {
        Number number = parseNumberValue(value, config);
        if (isDoubleValue(value, number, config.locale)) {
            return number.doubleValue();
        }
        throw new NumberFormatException();
    }

    private static BDecimal stringToDecimal(String value, CsvConfig config) throws NumberFormatException,
            ParseException {
        Number number = parseNumberValue(value, config);
        if (isDoubleValue(value, number, config.locale)) {
            BigDecimal decimalValue = BigDecimal.valueOf(number.doubleValue());
            return ValueCreator.createDecimalValue(decimalValue);
        }
        throw new NumberFormatException();
    }

    private static Object stringToBoolean(String value) throws NumberFormatException {
        if ("true".equalsIgnoreCase(value) || "TRUE".equalsIgnoreCase(value)) {
            return true;
        }

        if ("false".equalsIgnoreCase(value)  || "FALSE".equalsIgnoreCase(value)) {
            return false;
        }
        return returnError(value, "boolean");
    }

    private static Object stringToNull(String value, CsvConfig config) throws NumberFormatException {
        Object nullValue = config.nilValue;
        if (CsvUtils.isNullValue(nullValue, value)) {
            return null;
        }
        return returnError(value, nullValue == null ? Constants.Values.BALLERINA_NULL : nullValue.toString());
    }

    private static Object stringToUnion(BString string, UnionType expType, CsvConfig config, boolean isJsonOrAnydata)
            throws NumberFormatException {
        List<Type> memberTypes = new ArrayList<>(expType.getMemberTypes());
        if (isJsonOrAnydata) {
            memberTypes.sort(Comparator.comparingInt(t -> {
                int index = TYPE_PRIORITY_ORDER.indexOf(TypeUtils.getReferredType(t).getTag());
                return index == -1 ? Integer.MAX_VALUE : index;
            }));
        } else {
            memberTypes.sort(Comparator.comparingInt(t -> {
                int tag = TypeUtils.getReferredType(t).getTag();
                return tag == TypeTags.NULL_TAG ? Integer.MIN_VALUE : memberTypes.indexOf(t);
            }));
        }
        for (Type memberType : memberTypes) {
            try {
                Object result = fromStringWithType(string, memberType, config);
                if (result instanceof BError) {
                    continue;
                }
                return result;
            } catch (Exception e) {
                // Skip
            }
        }
        return returnError(string.getValue(), expType.toString());
    }

    private static boolean isByteLiteral(long longValue) {
        return (longValue >= BBYTE_MIN_VALUE && longValue <= BBYTE_MAX_VALUE);
    }

    private static boolean isSigned32LiteralValue(Long longObject) {
        return (longObject >= SIGNED32_MIN_VALUE && longObject <= SIGNED32_MAX_VALUE);
    }

    private static boolean isSigned16LiteralValue(Long longObject) {
        return (longObject.intValue() >= SIGNED16_MIN_VALUE && longObject.intValue() <= SIGNED16_MAX_VALUE);
    }

    private static boolean isSigned8LiteralValue(Long longObject) {
        return (longObject.intValue() >= SIGNED8_MIN_VALUE && longObject.intValue() <= SIGNED8_MAX_VALUE);
    }

    private static boolean isUnsigned32LiteralValue(Long longObject) {
        return (longObject >= 0 && longObject <= UNSIGNED32_MAX_VALUE);
    }

    private static boolean isUnsigned16LiteralValue(Long longObject) {
        return (longObject.intValue() >= 0 && longObject.intValue() <= UNSIGNED16_MAX_VALUE);
    }

    private static boolean isUnsigned8LiteralValue(Long longObject) {
        return (longObject.intValue() >= 0 && longObject.intValue() <= UNSIGNED8_MAX_VALUE);
    }

    private static boolean isCharLiteralValue(String value) {
        return value.codePoints().count() == 1;
    }

    private static boolean isIntegerValue(String value, Number number, String localeStr) {
        return number instanceof Long && value.matches(getLocale(localeStr).intRegex());
    }

    private static boolean isDoubleValue(String value, Number number, String localeStr) {
        return (number instanceof Double || number instanceof Long)
                && value.matches(getLocale(localeStr).doubleRegex());
    }

    private static BError returnError(String value, String expType) {
        return ErrorCreator.createError(StringUtils
                .fromString("Cannot convert " + value + " to the expected type: " + expType));
    }

    private static Number parseNumberValue(String numberString, CsvConfig config) throws ParseException {
        NumberFormat numberFormat = NumberFormat.getInstance(getLocale(config.locale).locale());
        return numberFormat.parse(numberString);
    }

    private static LocaleInfo getLocale(String localeStr) {
        if (!localeAttributes.containsKey(localeStr)) {
            localeAttributes.put(localeStr, computeLocaleIfAbsent(localeStr));
        }
        return localeAttributes.get(localeStr);
    }

    private static LocaleInfo computeLocaleIfAbsent(String localeStr) {
        Locale locale = CsvUtils.createLocaleFromString(localeStr);
        DecimalFormatSymbols dfs = new DecimalFormatSymbols(locale);
        char decimalSeparator = dfs.getDecimalSeparator();
        char minusSign = dfs.getMinusSign();
        char zeroDigit = dfs.getZeroDigit();
        String exponentSeparator = dfs.getExponentSeparator();
        String intRegex = "^[" + minusSign + "+]?[" + zeroDigit + "-9]+$";
        String doubleRegex = "^[" + minusSign + "+]?[" + zeroDigit + "-9]+(" +
                (decimalSeparator == '.' ? "\\." : decimalSeparator)
                + "[" + zeroDigit + "-9]*)?(" + exponentSeparator + "[+-]?[" + zeroDigit + "-9]+)?$";
        return new LocaleInfo(locale, intRegex, doubleRegex);
    }

    private record LocaleInfo(Locale locale, String intRegex, String doubleRegex) {
    }
}
