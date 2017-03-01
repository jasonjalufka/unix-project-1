#!/bin/bash
# Various utilities to help with database management


function loadArray {
  while IFS= read -r line; do
    contacts+=("$line");
  done < "database.txt"
  
  echo "Done loading array!";

}

function printArray {
  for i in $contacts; do
    echo $i;
  done
}
