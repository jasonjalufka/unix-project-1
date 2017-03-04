#!/bin/bash
# Various utilities to help with database management

loadArray() {
  while IFS= read -r line_data; do
    contactsArray+=("$line_data")
  done < "database.txt"
  }

printArray() {
  printf "%s\n" "${contactsArray[@]}"
}

processSelection() {
  case "$1" in
    [aA1] ) echo "You chose a (FIND)"
              processFind ;;
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
