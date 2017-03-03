#!/bin/bash
# Various utilities to help with database management

loadArray() {
  echo "Loading Array!"
  while IFS= read -r line; do
    contacts+=("$line");
  done < "database.txt" 
  echo "Done loading array!";
}

printArray() {
  echo "Printing contacts database:"
  for i in $contacts; do
    echo $i;
  done
  echo "Done printing contacts database!"
}

processSelection() {
  case "$1" in
    [aA1] ) echo "You chose a (FIND)" ;;
    [bB2] ) echo "You chose b (ADD)" ;;
    [cC3] ) echo "You chose c (UPDATE)" ;;
    [dD4] ) echo "You chose d (REMOVE)" ;;
    [eE5] ) cat 'database.txt' ;;
    [fF6] ) cat 'deleted.txt' ;;
    [gG7] ) echo "Thank you. Goodbye" exit ;;
  esac  
}
