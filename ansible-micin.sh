#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

function help() {
  cat <<EOH
${bold}Usage${normal}:
  ansible-micin command variable_key [value] vars_file.yml [vault_file]
 
${bold}Available Commands${normal}:
  show-value
  set-value
  decrypt-value
  encrypt-value
EOH
}

function main() {
  case $1 in
    show-value)
      show-value $*
      ;;

    set-value)
      set-value $*
      ;;

    decrypt-value)
      decrypt-value $*
      ;;

    encrypt-value)
      encrypt-value $*
      ;;

    *)
      help
      ;;
  esac
}

function show-value() {
  echo 'Show some value'
}

function set-value() {
  echo 'Set some value'
}

function decrypt-value() {
  echo 'Decrypt some value'
}

function encrypt-value() {
  echo 'Encrypt some value'
}

main $*
