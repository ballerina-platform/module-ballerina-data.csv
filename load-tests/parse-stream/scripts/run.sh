#!/bin/bash -e
# Copyright 2021 WSO2 Inc. (http://wso2.org)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ----------------------------------------------------------------------------
# Execusion script for ballerina performance tests
# ----------------------------------------------------------------------------
set -e
source base-scenario.sh

jmeter -n -t "$scriptsDir/"http_parse_stream.jmx -l "$resultsDir/"summary.csv -Jusers=2 -Jduration=3600 -Jhost= -Jport=9091 -Jprotocol=http -Jpath=BalPerformance/parse $payload_flags
jmeter -n -t "$scriptsDir/"http-post-request.jmx -l "$resultsDir/"original.jtl -Jusers="$concurrent_users" -Jduration=1200 -Jhost=csv-parse-strea-svc.default.svc.cluster.local -Jport=9090 -Jprotocol=http -Jpath=csv-parse-strea $payload_flags
