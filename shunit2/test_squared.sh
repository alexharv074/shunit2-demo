#!/usr/bin/env

under_test='./squared.sh'

test3Squared() {
  local n_sq="$(bash "$under_test" 3)"
  assertEquals "did not compute 3^2" "$n_sq" "9"
}

test4Squared() {
  local n_sq="$(bash "$under_test" 4)"
  assertEquals "did not compute 4^2" "$n_sq" "16"
}

testUsage() {
  bash "$under_test" | grep -qi usage
  assertTrue "did not see usage" "$?"
}

. shunit2
