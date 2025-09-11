#!/usr/bin/bash

catch_errors() {
  echo -e "\n\e[31mOmacase installation failed!\e[0m"
  echo
  echo "The command ${BASH_COMMAND} failed with exit code $?"
  echo
  echo $1
}

trap catch_errors ERR
