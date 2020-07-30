#!/usr/bin/env bash

usage() {
  echo "Usage: $0 N"
  echo "Return N squared"
  exit 1
}

[ -z "$1" ] && usage

echo "$(( $1 * $1 ))"

# vim: set ft=sh:
