#
# (C) Copyright IBM Corp. 2017
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

library(testthat)
context("Testing r4ml.env\n")

test_that("r4ml.session", {
  
  # clean up any previous tests
  if (r4ml.env$R4ML_SESSION_EXISTS) { r4ml.session.stop()}

  expect_false(r4ml.env$R4ML_SESSION_EXISTS)
  
  r4ml.session()
  
  expect_true(r4ml.env$R4ML_SESSION_EXISTS)
  expect_true("r4ml.logger" %in% ls(.GlobalEnv))
  expect_true("sc" %in% ls(.GlobalEnv))
  expect_true("sysml.RDDUtils" %in% ls(.GlobalEnv))
  expect_true("sysmlSparkContext" %in% ls(.GlobalEnv))
  expect_true("sysmlSqlContext" %in% ls(.GlobalEnv))
  expect_true(r4ml.env$R4ML_SESSION_EXISTS)
  
  r4ml.session.stop()

  expect_false("logger" %in% ls(.GlobalEnv))
  expect_false("sc" %in% ls(.GlobalEnv))
  expect_false("sysml.RDDUtils" %in% ls(.GlobalEnv))
  expect_false("sysmlSparkContext" %in% ls(.GlobalEnv))
  expect_false("sysmlSqlContext" %in% ls(.GlobalEnv))
  expect_false(r4ml.env$R4ML_SESSION_EXISTS)
})
