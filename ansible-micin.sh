#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

function help() {
  cat <<EOH
${bold}Usage${normal}:
  ansible-micin command variable_key [value] vars_file.yml [vault_file]
 
${bold}Available Commands${normal}:
  show
  set
  vault-show
  vault-set
  decrypt
  encrypt
EOH
}

function main() {
  case $1 in
    show)
      show $2 $3
      ;;

    set)
      set-value $*
      ;;

    decrypt)
      decrypt $*
      ;;

    encrypt)
      encrypt $*
      ;;

    vault-show)
      vault-show $2 $3 $4
      ;;

    vault-set)
      encrypt-value $*
      ;;

    *)
      help
      ;;
  esac
}

function show() {
  KEY=$1
  FILENAME=$2
  yq r $FILENAME $KEY
}

function vault-show() {
  KEY=$1
  FILENAME=$2
  VAULT_FILE=$3
  TMPFILE=$(mktemp)

  show $KEY $FILENAME > $TMPFILE
  ansible-vault decrypt --vault-password-file $VAULT_FILE $TMPFILE > /dev/null
  
  PLAINTEXT=$(cat $TMPFILE)
  echo "$PLAINTEXT"
  rm $TMPFILE
}

function set() {
  echo 'Set some value'
}

function decrypt() {
  echo 'Decrypt some value'
}

function encrypt() {
  echo 'Encrypt some value'
}

function vault-set() {
  echo 'Encrypt some value'
}

main $*
