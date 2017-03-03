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
    [bB2] ) echo "You chose b (ADD)" 
            ./add.sh ;;
    [cC3] ) echo "You chose c (UPDATE)" ;;
    [dD4] ) echo "You chose d (REMOVE)" 
            ./remove.sh ;;
    [eE5] ) cat 'database.txt' ;;
    [fF6] ) cat 'deleted.txt' ;;
    [gG7] ) echo "Thank you. Goodbye" 
              return 1 ;; #exit main menu loop
  esac  
  return 0; #continue looping main menu
}
