#!/bin/bash
# Allows the user to update an entry in the database

echo "Whose records need to be updated?"
read update
sed -i /${update}/d 'database.txt'
echo "Please input the updated complete field:"
read nuField
echo "$nuField" >> 'database.txt'
cat 'database.txt'
