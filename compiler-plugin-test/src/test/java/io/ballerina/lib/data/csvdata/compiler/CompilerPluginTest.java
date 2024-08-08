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

package io.ballerina.lib.data.csvdata.compiler;

import io.ballerina.projects.DiagnosticResult;
import io.ballerina.tools.diagnostics.Diagnostic;
import io.ballerina.tools.diagnostics.DiagnosticSeverity;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.util.List;
import java.util.stream.Collectors;

import static io.ballerina.lib.data.csvdata.compiler.CsvDataDiagnosticCodes.UNSUPPORTED_FIELD_TYPE;
import static io.ballerina.lib.data.csvdata.compiler.CsvDataDiagnosticCodes.UNSUPPORTED_TUPLE_MEMBER_TYPE;

/**
 * This class includes tests for Ballerina Csv Data compiler plugin.
 *
 * @since 0.1.0
 */
public class CompilerPluginTest {

    static final String UNSUPPORTED_TYPE = "unsupported type: type is not supported";
    static final String DUPLICATE_FIELD = "invalid field: duplicate field found";
    static final String UNSUPPORTED_FIELD_TYPE = "Unsupported type in the field: Only basic types " +
            "are supported for fields, and other types are not allowed.";
    static final String UNSUPPORTED_TUPLE_MEMBER_TYPE = "Unsupported type in the tuple member: " +
            "Tuple members can only be basic types, other types are not supported.";

    @Test
    public void testInvalidExpectedUnionType() {
        DiagnosticResult diagnosticResult =
                CompilerPluginTestUtils.loadPackage("sample_package_1").getCompilation().diagnosticResult();
        List<Diagnostic> errorDiagnosticsList = diagnosticResult.diagnostics().stream()
                .filter(r -> r.diagnosticInfo().severity().equals(DiagnosticSeverity.ERROR))
                .collect(Collectors.toList());
        Assert.assertEquals(errorDiagnosticsList.size(), 20);
        Assert.assertEquals(errorDiagnosticsList.get(0).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(1).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(2).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(3).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(4).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(5).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(6).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(7).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(8).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(9).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(10).diagnosticInfo().messageFormat(), UNSUPPORTED_FIELD_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(11).diagnosticInfo().messageFormat(), UNSUPPORTED_FIELD_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(12).diagnosticInfo().messageFormat(), UNSUPPORTED_FIELD_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(13).diagnosticInfo().messageFormat(), UNSUPPORTED_FIELD_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(14).diagnosticInfo().messageFormat(), UNSUPPORTED_FIELD_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(15).diagnosticInfo().messageFormat(), UNSUPPORTED_FIELD_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(16).
                diagnosticInfo().messageFormat(), UNSUPPORTED_TUPLE_MEMBER_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(17).
                diagnosticInfo().messageFormat(), UNSUPPORTED_TUPLE_MEMBER_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(18).
                diagnosticInfo().messageFormat(), UNSUPPORTED_TUPLE_MEMBER_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(19).
                diagnosticInfo().messageFormat(), UNSUPPORTED_TUPLE_MEMBER_TYPE);
    }

    @Test
    public void testInvalidRecordFields() {
        DiagnosticResult diagnosticResult =
                CompilerPluginTestUtils.loadPackage("sample_package_2").getCompilation().diagnosticResult();
        List<Diagnostic> errorDiagnosticsList = diagnosticResult.diagnostics().stream()
                .filter(r -> r.diagnosticInfo().severity().equals(DiagnosticSeverity.ERROR))
                .collect(Collectors.toList());
        Assert.assertEquals(errorDiagnosticsList.size(), 1);
        Assert.assertEquals(errorDiagnosticsList.get(0).diagnosticInfo().messageFormat(), DUPLICATE_FIELD);
    }

    @Test
    public void testInvalidProgram() {
        DiagnosticResult diagnosticResult =
                CompilerPluginTestUtils.loadPackage("sample_package_3").getCompilation().diagnosticResult();
        List<Diagnostic> errorDiagnosticsList = diagnosticResult.diagnostics().stream()
                .filter(r -> r.diagnosticInfo().severity().equals(DiagnosticSeverity.ERROR))
                .collect(Collectors.toList());
        Assert.assertEquals(errorDiagnosticsList.size(), 1);
    }

    @Test
    public void testModuleLevelInvalidExpectedUnionType() {
        DiagnosticResult diagnosticResult =
                CompilerPluginTestUtils.loadPackage("sample_package_4").getCompilation().diagnosticResult();
        List<Diagnostic> errorDiagnosticsList = diagnosticResult.diagnostics().stream()
                .filter(r -> r.diagnosticInfo().severity().equals(DiagnosticSeverity.ERROR))
                .collect(Collectors.toList());
        Assert.assertEquals(errorDiagnosticsList.size(), 10);
        Assert.assertEquals(errorDiagnosticsList.get(0).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(1).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(2).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(3).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(4).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(5).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(6).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(7).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(8).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(9).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
    }

    @Test
    public void testEmptyProject() {
        DiagnosticResult diagnosticResult =
                CompilerPluginTestUtils.loadPackage("sample_package_5").getCompilation().diagnosticResult();
        List<Diagnostic> errorDiagnosticsList = diagnosticResult.diagnostics().stream()
                .filter(r -> r.diagnosticInfo().severity().equals(DiagnosticSeverity.ERROR))
                .collect(Collectors.toList());
        Assert.assertEquals(errorDiagnosticsList.size(), 0);
    }

    @Test
    public void testInvalidExpectedUnionType2() {
        DiagnosticResult diagnosticResult =
                CompilerPluginTestUtils.loadPackage("sample_package_6").getCompilation().diagnosticResult();
        List<Diagnostic> errorDiagnosticsList = diagnosticResult.diagnostics().stream()
                .filter(r -> r.diagnosticInfo().severity().equals(DiagnosticSeverity.ERROR))
                .collect(Collectors.toList());
        Assert.assertEquals(errorDiagnosticsList.size(), 10);
        Assert.assertEquals(errorDiagnosticsList.get(0).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(1).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(2).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(3).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(4).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(5).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(6).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(7).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(8).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
        Assert.assertEquals(errorDiagnosticsList.get(9).diagnosticInfo().messageFormat(), UNSUPPORTED_TYPE);
    }
}
