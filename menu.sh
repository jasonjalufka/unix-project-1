#!/bin/bash
# Display the main menu for contacts database management

source ./add.sh
source ./find.sh
source ./remove.sh
source ./update.sh

echo 'Welcome to my contact database, please select in the following menu:
(a) Find a new record
(b) Add a new record
(c) Update a record
(d) Remove a record
(e) Quit'

read -r -p "Selection is: " selection

case $selection in
  [aA] ) echo "You chose a!" ;;
  [bB] ) echo "You chose b!"
    # call add.sh script
    . ./add.sh ;;
    # echo "Jason:205 Nueces:1234567:jrj105@txstate.edu" >> 'database.txt' ;;
  [cC] ) echo "You chose c!" ;;
    
  [dD] ) echo "You chose d!" ;;
  [eE] ) echo "You chose e!" ;;
  * ) "No match for selection" ;;
esac

cat 'database.txt'
