#!/bin/bash
# Add line to database

#echo "Please use format: Name:Address:Number:Email"
#read text
#echo "$text" >> 'database.txt'
#echo "you entered $text"
#cat 'database.txt'

addRecord() {
  addPrompt="Please enter the new contact's information: "
  printf "%s\n" "$addPrompt"
  read -r -p "Name: " name
  read -r -p "Address: " address
  read -r -p "Phone: " phone
  read -r -p "Email: " email
  newRecord=""$name":"$address":"$phone":"$email""
  contactsArray+=("$newRecord")
  clear
  printf "Successfully added new contact:\n%s\n" "$newRecord"
  mainSelection
}
