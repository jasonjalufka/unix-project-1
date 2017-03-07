#!/bin/bash
# Allows the user to update an entry in the database

#echo "Whose records need to be updated?"
#read update
#if grep -Fq ${update} database.txt
#  then
#    sed -i /${update}/d 'database.txt'
#    ./add.sh
#else
#  echo "No match found. Note the database is case sensitive."
#fi

updateRecord() {
  findRecord update
}

processUpdate() {
  index="$1"
  divider=--------------------------------------------------------
  printf "\nPlease enter the updated contact information:\n%s\n%s\n%s\n" "$divider" "${contactsArray["$index"]}" "$divider"
  read -r -p "-Name: " name
  read -r -p "-Address: " address
  read -r -p "-Phone: " phone
  read -r -p "-Email: " email
  newRecord=""$name":"$address":"$phone":"$email""
  contactsArray["$index"]=${newRecord}
  clear
  printf "Successfully updated the contact:\n%s\n" "$newRecord"
  mainSelection
}
