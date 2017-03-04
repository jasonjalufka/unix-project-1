#!/bin/bash
# Allows the user to update an entry in the database

echo "Whose records need to be updated?"
read update
if grep -Fq ${update} database.txt
  then
    sed -i /${update}/d 'database.txt'
    ./add.sh
else
  echo "No match found. Note the database is case sensitive."
fi
