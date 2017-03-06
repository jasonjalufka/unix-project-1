#!/bin/bash
# Removes an entry from the database

#printf '\n'
#echo "Whose records would you like to remove?"
#read delete
#cat database.txt | grep ${delete} >> deleted.txt
#sed -i /${delete}/d 'database.txt'

removeRecord() {
  findRecord remove #searches for record to remove, passes "remove" operation flag
}

processRemove() {
  index="$1"
  
  while [ "$exit" -ne 1 ]; do
    read -r -p "Are you sure you wish to remove the following record?
    "${contactsArray[$index]}"" confirm 
    case "$confirm" in
      [yY] ) printf "\nRemoving contact record:" 
  done
}
