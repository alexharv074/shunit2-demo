#!/usr/bin/env

under_test='./create_secret.sh'

aws() {
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
  assertTrue "script did not return exit status 0" "$?"
}

. shunit2
