#!/bin/bash
# Removes an entry from the database

printf '\n'
echo "Whose records would you like to remove?"
read delete
sed -i /$delete/d 'database.txt'
