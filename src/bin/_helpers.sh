#!/usr/bin/env bash

info() {
  level=1
  message="\r  [ \033[00;34m..\033[0m ] $1\n"

  if [ -n "$2" ]; then
    level=$2
  fi

  case ${level} in
  1)
    printf "${message}" "" >&1
    ;;
  2)
    printf "${message}" "" >&3
    ;;
  3)
    printf "${message}" "" >&4
    ;;
  4)
    printf "${message}" "" >&5
    ;;
  esac
}

question() {
  if [ ! -n "$2" ]; then
    fail "question method requires 2 parameters"
    exit 1
  fi

  local _answer=$2

  printf "\r  [ \033[0;33m??\033[0m ] $1"
  read -r answer

  eval $_answer="'$answer'"
}

user() {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

warn() {
  printf "\r\033[2K  [\033[00;33m !! \033[0m] $1\n"
}

fail() {
  printf "\r\033[2K  [\033[0;31m !! \033[0m] $1\n" >&2
  exit 1
}

set_environment() {
  if [ -n "$1" ]; then
    case $1 in
    dev | development)
      environment=dev
      ;;
    prod | production)
      environment=prod
      ;;

    *)
      fail "Unknown environment $1"
      ;;
    esac
    info "Environment: $environment"
  else
    fail '"--environment" requires a non-empty option argument'
  fi
}

# verbosity
set_verbosity() {
  for v in $(#Start counting from 3 since 1 and 2 are standards (stdout/stderr).
    seq 3 $verbosity
  ); do
    # Don't change anything higher than the maximum verbosity allowed.
    (("$v" <= "$maxverbosity")) && eval exec "$v>&2"
  done

  for v in $(#From the verbosity level one higher than requested, through the maximum;
    seq $((verbosity + 1)) $maxverbosity
  ); do
    #Redirect these to /dev/null, provided that they don't match stdout and stderr.
    (("$v" > "2")) && eval exec "$v>/dev/null"
  done
  info "Verbosity level set to: $verbosity" 2
}

generate_pwd() {
  local PASS=$(openssl rand -base64 64)
  PASS=$(echo "$PASS" | tr -dc "[:alnum:]")
  echo "${PASS:0:20}"
}
