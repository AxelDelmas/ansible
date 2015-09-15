#!/bin/sh

BASEDIR=${1-"."}

URLLIB_USERS=$(find "$BASEDIR" -name '*.py' -exec grep -H urlopen \{\} \;)
a=$(echo "$URLLIB_USERS" | sed '/(\n|lib\/ansible\/module_utils\/urls.py)/d') 
if test -n "$a" ; then
  printf ":$URLLIB_USERS:"
  exit 1
else
  exit 0
fi
