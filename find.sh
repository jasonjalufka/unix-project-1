#!/bin/bash
# Find a record in contacts database

printf '\n'
echo "Please type any key word to search the database"
read text
grep "$text" database.txt
