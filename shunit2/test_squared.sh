#!/usr/bin/env

under_test='./squared.sh'

test3Squared() {
  . "$under_test"
  local n_sq="$(main 3)"
  assertEquals "did not compute 3^2" "$n_sq" "9"
}

test4Squared() {
  . "$under_test"
  local n_sq="$(main 4)"
  assertEquals "did not compute 4^2" "$n_sq" "16"
}

testUsage() {
  . "$under_test"
  main | grep -qi usage
  assertTrue "did not see usage" "$?"
}

. shunit2
