#!/bin/bash
# Display the main menu for contacts database management

source ./add.sh
source ./find.sh
source ./remove.sh
source ./update.sh
source ./interface.sh
source ./utilities.sh

displaymenu

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
