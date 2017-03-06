#!/bin/bash
# Driver file for Database Management System

# Initialize empty contacts array
contactsArray=()

source ./add.sh
source ./remove.sh
source ./update.sh
source ./utilities.sh
source ./interface.sh
source ./find.sh

#clear the main display
clear

#load data from database.txt into contacts array
loadArray

#displays menu from interface.sh
mainSelection
