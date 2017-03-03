#!/bin/bash
# Removes an entry from the database

printf '\n'
echo "Whose records would you like to remove?"
read delete
cat database.txt | grep ${delete} >> deleted.txt
sed -i /${delete}/d 'database.txt'
