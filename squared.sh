#!/usr/bin/env bash

usage() {
  echo "Usage: $0 N"
  echo "Return N squared"
  exit 1
}

n_squared() {
  echo "$(( $1 * $1 ))"
}

main() {
  [ -z "$1" ] && usage
  n="$1" ; n_squared "$n"
}

if [ "$0" == "${BASH_SOURCE[0]}" ] ; then
  main "$@"
fi

# vim: set ft=sh:
