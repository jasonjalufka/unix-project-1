#!/bin/bash
# Display the main menu for contacts database management

#source ./add.sh
#source ./find.sh
#source ./remove.sh
#source ./update.sh
#source ./interface.sh
#source ./utilities.sh

printf '\n'
echo "a)find a record"
echo "b)add a record"
echo "c)update a record"
echo "d)remove a record"
echo "e)print all records"
echo "f)print all deleted records"
echo "g)quit"
printf '\n'
echo "Please Make a Selection"
read selection
case $selection in
  [aA1] ) echo "You chose a!" ;;
  [bB2] ) ./add.sh ;;
  [cC3] ) echo "You chose c!" ;;
  [dD4] ) ./remove.sh ;;
  [eE5] ) cat 'database.txt' ;;
  [fF6] ) cat 'deleted.txt' ;;
  [gG7] ) echo "thank you for using our program! Goodbye!" exit ;;
esac
~             
