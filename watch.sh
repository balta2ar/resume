#!/bin/bash

CMD="timeout 10 make"
LAST=`tree -sDct . -L 1 --matchdirs -P '*.tex' -I 'other|combined|output|pdf'`
while true; do
  sleep 1
  NEW=`tree -sDct . -L 1 --matchdirs -P '*.tex' -I 'other|combined|output|pdf'`
  if [ "$NEW" != "$LAST" ]; then
    $CMD
    LAST="$NEW"
  fi
done
