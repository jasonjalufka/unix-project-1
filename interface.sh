#!/bin/bash
source ./utilities.sh

mainSelection() {
clear
  read -r -p "Welcome to my contact database, please select one of the following options:
(a) Find a record
(b) Add a new record
(c) Update a record
(d) Remove a record
(e) View current records
(f) View deleted records
(g) Quit
Selection is >" selection

processSelection "$selection"
}
