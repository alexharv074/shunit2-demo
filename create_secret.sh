#!/usr/bin/env bash

usage() {
  echo "Usage: SECRET_DESC=description \
SECRET_NAME=secret_name \
SECRET=xxxx bash $0"
  exit 1
}

sanity_check() {
  [ -z "$SECRET_DESC" ] && usage
  [ -z "$SECRET_NAME" ] && usage
  [ -z "$SECRET" ] && usage
}

create_secret() {
  aws secretsmanager create-secret \
    --name "$SECRET_NAME" \
    --description "$SECRET_DESC" \
    --secret-string "$SECRET"
}

main() {
  [ "$1" == "-h" ] && usage
  sanity_check
  create_secret
}

if [ "$0" == "$BASH_SOURCE" ] ; then
  main "$@"
fi

# vim: set ft=sh:
