#!/bin/bash
# Find a record in contacts database

source ./interface.sh

# Display Find Record menu and process user input
findRecordSelection

printf '\n'
echo "Please type any key word to search the database"
read text
grep "$text" database.txt
