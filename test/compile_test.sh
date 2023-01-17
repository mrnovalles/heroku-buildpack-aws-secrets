#!/bin/sh
. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

afterSetUp() {
  # Populate variables
  echo "key" > "${ENV_DIR}/AWS_ACCESS_KEY_ID"
  echo "eu-west-1" > "${ENV_DIR}/AWS_DEFAULT_REGION"
  echo "secret" > "${ENV_DIR}/AWS_SECRET_ACCESS_KEY"
  echo "VAR=value" > "${ENV_DIR}/AWS_SECRETS"
  export test=true
}

testCompile() {
  compile
  assertCapturedSuccess
}

