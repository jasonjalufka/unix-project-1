#!bin/bash
#driver

# Initialize empty contacts array
contacts=()

source ./add.sh
source ./find.sh
source ./remove.sh
source ./update.sh
source ./utilities.sh

#load data from database.txt into contacts array
loadArray
printArray
echo "done"
