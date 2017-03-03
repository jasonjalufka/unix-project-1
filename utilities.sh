#!/bin/bash
# Various utilities to help with database management

loadArray() {
  declare -a contactsArray
  let i=0
  while IFS= read -r line_data; do
    contactsArray[i]="${line_data}"
    ((++i))
  done < "database.txt"

#  echo "Loading contacts array!"
#  while IFS= read -r line; do
#    contacts+=("$line");
#  done < "database.txt" 
#  echo "Done loading array!";
}

printArray() {
  echo "Printing contacts database:"
  for i in $contactsArray; do
    echo $i;
  done
  echo "Done printing contacts database!"
}

processSelection() {
  case "$1" in
    [aA1] ) echo "You chose a (FIND)"
              ./find.sh ;;
    [bB2] ) echo "You chose b (ADD)"
              ./add.sh ;;
    [cC3] ) echo "You chose c (UPDATE)" 
              ./update.sh ;;
    [dD4] ) echo "You chose d (REMOVE)"
              ./remove.sh ;;
<<<<<<< HEAD
    [aA1] ) echo "You chose a (FIND)" ;;
    [bB2] ) echo "You chose b (ADD)" 
              ./add.sh ;;
    [cC3] ) echo "You chose c (UPDATE)" ;;
    [dD4] ) echo "You chose d (REMOVE)" 
              ./remove.sh ;;
=======
>>>>>>> master
    [eE5] ) cat 'database.txt' ;;
    [fF6] ) cat 'deleted.txt' ;;
    [gG7] ) echo "Thank you. Goodbye" 
              return 1 ;; #exit main menu loop
  esac  
  return 0; #continue looping main menu
}

processFind() {
  case "$1" in
    [aA1] ) echo "You chose 1 (Name)";;
    [bB2] ) echo "You chose 2 (Address)";;
    [cC3] ) echo "You chose 3 (Phone)" ;;
    [dD4] ) echo "You chose 4 (Email)";;
    [eE5] ) echo "You chose 5 (Keyword)" ;;
    [fF6] ) echo "You chose 6 (CANCEL)" ;;
  esac
}
