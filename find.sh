#!/bin/bash
# Find a record in contacts database


findRecord() {
   findRecordSelection 
}

findRecordSelection() {
  read -r -p "Choose how you would like to search for a record:
  (1) Name
  (2) Address
  (3) Phone Number
  (4) Email
  (5) Keyword
  (6) CANCEL
  Selection is >" selection

  processFind "$selection"
}

processFind() {
  case "$1" in
    [aA1] ) clear
              search name 0 ;;
    [bB2] ) clear
              search address 1 ;;
    [cC3] ) clear
              search phone 2 ;;
    [dD4] ) clear
              search email 3;;
    [eE5] ) clear
              search keyword 4  ;;
    [fF6] ) clear
              mainSelection ;;
    [*]   ) clear echo " --INVALID INPUT-- "
              findRecordSelection ;;
  esac
}

search() {

   
  searchField=$1 # name of search field
  fieldIndex=$2  # index to search in 'fields' array
  count=0        # amount of matching records
  index=0        # contacts array index
  matches=()     # empty array that will hold matching records
  
  echo "Searching by $searchField"
  read -r -p "$searchField to search: " search

  if [[ $searchField == keyword ]]; then
    # search entire line
    for i in "${contactsArray[@]}"; do
      IFS= read -r temp <<< "$i"
      shopt -s nocasematch
      if [[ "${temp}" == *"$search"* ]]; then
        count=$(( count + 1 ))
        #TODO add line to matches array 
      fi
      index=$(( index + 1 ))
    done
  else
    #search by specified field
    for i in "${contactsArray[@]}"; do
      IFS=: read -a fields <<< "$i" # stores input into array "fields" and stores sequentially
      shopt -s nocasematch
        if [[ ${fields["$fieldIndex"]} == *$search* ]]; then
          echo "Match found at index [$index]"
          echo "$i"
          count=$(( count + 1))
        fi
      index=$(( index + 1))
    done
  fi
}

