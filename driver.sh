#!/bin/bash
# Driver file for Database Management System

# Initialize empty contacts array
contactsArray=()

#source ./add.sh
#source ./find.sh
#source ./remove.sh
#source ./update.sh
source ./utilities.sh
#source ./menu.sh
source ./interface.sh

#load data from database.txt into contacts array
loadArray
printArray

#displays menu from interface.sh
clear
while [ $? -ne 1 ]; do
  mainSelection
done
