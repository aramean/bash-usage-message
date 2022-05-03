#!/bin/bash

##
#@ Print the message "hello, world".
hello_world () {
  echo "hello, world"
}

##
#@ Generate a random int between 0-10.
random_int () {
  echo $(( $RANDOM % 10 ))
}

## Displays the automated command-line interface.
#@ This help.
help () {
  echo -e "Usage: "$0" [command] ..\n"
  grep -B1 -E "^[%a-zA-Z0-9_-]*[^\s]\(*[^\s])*[^\s]{" "$0" \
  | grep -v -- -- \
  | sed 's/()//g' \
  | sed 'N;s/\n/###/' \
  | sed -n 's/^#@ \(.*\)###\(.*\){.*/\2###\1/p' \
  | column -t -s '###'
  echo
}

# Runs help function if no argument passed.
if [ -z "$1" ]; then
  help
fi

"$@"
