package io.ballerina.stdlib.data.csvdata.csv;

import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticErrorCode;
import io.ballerina.stdlib.data.csvdata.utils.DiagnosticLog;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class QueryParser {
    private static String columnSeparator = ",";
    private static String rangeSeparator = ":";
    private static String exclamationCharacter = "!";
    private static String astrix = "*";
    private static String groupingStartCharacter = "(";
    private static String groupingEndCharacter = ")";
    private static Object skipColumnQuery = null;
    private static Set<String> inclusiveHeaders = new HashSet<>();
    private static Set<String> exclusiveHeaders = new HashSet<>();
    private static ArrayList<String> columns = null;
    private static String elementSeparatorRegex = "(?![^(]*\\))";
    private static String alphanumericRegex = "[0-9A-Za-z]";
    private static String rangeRegex = "[0-9A-Za-z]:[0-9A-Za-z]";

    private void reset() {
        inclusiveHeaders = new HashSet<>();
        exclusiveHeaders = new HashSet<>();
    }

    public static String[] parse(Object query, String[] headers) {
        //TODO: Need specific error message for all the scenarios
        skipColumnQuery = query;
        columns = new ArrayList<>(Arrays.asList(headers));
        return parse();
    }

    private static String[] parse() {
        if (skipColumnQuery instanceof BArray) {
            BArray columns = (BArray) skipColumnQuery;
            for (int i = 0; i < columns.size(); i++) {
                exclusiveHeaders.add(StringUtils.getStringValue(columns.get(i)));
            }
        } else if (skipColumnQuery instanceof Long) {
            exclusiveHeaders.add(skipColumnQuery.toString());
        } else {
            processStringQuery(StringUtils.getStringValue(skipColumnQuery));
        }

        exclusiveHeaders.removeAll(inclusiveHeaders);
        columns.removeAll(exclusiveHeaders);
        return columns.toArray(new String[columns.size()]);
    }

    private static void processStringQuery(String query) {
        processStringQuery(query, false);
    }

    private static void processStringQuery(String query, boolean exclamation) {
        String[] queryElements = query.split(elementSeparatorRegex);
        for (String element: queryElements) {
            //TODO: Header validations
            if (element.matches(alphanumericRegex)) {
                addColumn(element, exclamation);
            } else if (element.startsWith(groupingStartCharacter)) {
                processGroupingElements(element, exclamation);
            } else if (element.startsWith(exclamationCharacter)) {
                processExcludeColumns(element, !exclamation);
            } else if (element.matches(rangeRegex)) {
                processRangeExpression(element, exclamation);
            } else {
                throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_SKIP_COLUMN_QUERY, skipColumnQuery);
            }
        }
    }

    private static void addColumn(String element, boolean exclamation) {
        if (exclamation) {
            inclusiveHeaders.add(element);
        }
        exclusiveHeaders.add(element);
    }

    private static void processExcludeColumns(String element, boolean exclamation) {
        processStringQuery(element.substring(1), exclamation);
    }

    private static void processRangeExpression(String element, boolean exclamation) {
        //TODO: Handle if range contains brackets and :/,!
        String[] rangeElements = element.split(rangeSeparator);
        String rightValue = rangeElements[1];
        int leftIndex = columns.indexOf(rangeElements[0]);
        int rightIndex = rightValue.equals(astrix) ? columns.size() - 1 : columns.indexOf(rightValue);

        if (leftIndex == -1 || rightIndex == -1) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_SKIP_COLUMN_QUERY, skipColumnQuery);
        }
        if (leftIndex > rightIndex) {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_SKIP_COLUMN_QUERY, skipColumnQuery);
        }

        for (int i = leftIndex; i <= rightIndex; i++) {
            addColumn(columns.get(i), exclamation);
        }
    }

    private static void processGroupingElements(String element, boolean exclamation) {
        if (element.endsWith(groupingEndCharacter)) {
            processStringQuery(element.substring(0, element.length() - 1), exclamation);
        } else {
            throw DiagnosticLog.error(DiagnosticErrorCode.INVALID_SKIP_COLUMN_QUERY, skipColumnQuery);
        }
    }
}
