#/bin/bash
source ./utilities.sh

mainSelection() {
  read -r -p "Welcome to my contact database, please select one of the following options:
(a) Find a record
(b) Add a new record
(c) Update a record
(d) Remove a record
(e) View current records
(f) View deleted records
(g) Quit
Selection is >" selection

# Calls function in utilities.sh to take appropriate action on user choice
processSelection "$selection"
}

findRecordSelection() {
  read -r -p "Choose how you would like to search for a record::
  (1) Name
  (2) Address
  (3) Phone Number
  (4) Email
  (5) Keyword
  (6) CANCEL
  Selection is >" selection

  processFind "$selection"
}
