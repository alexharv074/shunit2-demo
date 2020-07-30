#!/usr/bin/env

under_test='./create_secret.sh'

aws() {
  echo "aws $@" > commands_log
  cat <<EOF
{
  "ARN": "arn:aws:secretsmanager:us-west-2:123456789012:secret:MyTestDatabaseSecret-a1b2c3",
  "Name": "MyTestDatabaseSecret",
  "VersionId": "EXAMPLE1-90ab-cdef-fedc-ba987EXAMPLE"
}
EOF
}

testMain() {
  (. "$under_test" ; SECRET_NAME=MyTestDatabaseSecret SECRET_DESC="My test" SECRET=abcd1234 main)

  local expected_behaviour="aws secretsmanager create-secret \
--name MyTestDatabaseSecret --description My test --secret-string abcd1234"

  local actual_behaviour="$(<commands_log)"

  assertEquals "unexpected behaviour" "$expected_behaviour" "$actual_behaviour"
}

tearDown() {
  rm -f commands_log
}

. shunit2
