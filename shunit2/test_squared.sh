#!/usr/bin/env

under_test='./squared.sh'

setUp() {
  . "$under_test"
}

test3Squared() {
  local n_sq="$(main 3)"
  assertEquals "did not compute 3^2" "$n_sq" "9"
}

test4Squared() {
  local n_sq="$(main 4)"
  assertEquals "did not compute 4^2" "$n_sq" "16"
}

testUsage() {
  main | grep -qi usage
  assertTrue "did not see usage" "$?"
}

. shunit2
