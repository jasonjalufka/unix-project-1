#!/bin/bash
# Removes an entry from the database

removeRecord() {
  findRecord remove #searches for record to remove, passes "remove" operation flag
}

processRemove() {
  index="$1"
  read -r -p "Are you sure you wish to remove the following record? (y/n)
  ${contactsArray[$index]}
  > " confirm

  stop=0
  while [ "$stop" -ne "1" ]; do
    case "$confirm" in
      [yY] ) stop=1
             remove $index ;;
      [nN] ) clear
             stop=1
             printf "--Remove operation aborted--\n"
             mainSelection ;;
         * ) printf "Please choose a valid option (y/n)\n" ;;
    esac
  done
}

remove() {
  printf "\nRemoving contact record:\n"
  printf "%s\n" "${contactsArray[$index]}" > deleted.txt
  unset contactsArray["$1"]
  clear
  mainSelection
  printf "Successfully removed contact\n"
}
