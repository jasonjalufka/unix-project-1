#!/bin/bash
# Add line to database

echo "Please use format: Name:Address:Number:Email"
read text
echo "$text" >> 'database.txt'
echo "you entered $text"
cat 'database.txt'
