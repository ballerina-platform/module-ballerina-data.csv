package io.ballerina.lib.data.csvdata.utils;

import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BTypedesc;
import io.ballerina.stdlib.constraint.Constraints;

/*
 * Utility functions used in the CSV data module.
 *
 * @since 0.1.0
 */
public final class DataUtils {
    private DataUtils() {
    }

    public static Object validateConstraints(Object convertedValue, BTypedesc typed, boolean requireValidation) {
        if (!requireValidation) {
            return convertedValue;
        }

        Object result = Constraints.validate(convertedValue, typed);
        if (result instanceof BError bError) {
            return DiagnosticLog.getCsvError(getPrintableErrorMsg(bError));
        }
        return convertedValue;
    }

    private static String getPrintableErrorMsg(BError err) {
        StringBuilder errorBuilder = new StringBuilder(err.getMessage() != null ? err.getMessage() : "");
        Object details = err.getDetails();
        if (details != null && !details.toString().equals("{}")) {
            errorBuilder.append(!errorBuilder.isEmpty() ? ", " : "" + details);
        }
        return errorBuilder.toString();
    }
}
