#!/usr/bin/env

under_test='./create_secret.sh'

testEquality() {
  assertEquals "1" "1"
}

. shunit2
