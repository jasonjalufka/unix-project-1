#!/bin/bash
# Find a record in contacts database

findRecord() {
   operation="$1" #stores operation to be performed after record found
   findRecordSelection "$operation"
}

findRecordSelection() {
  operation="$1"
  read -r -p "Choose how you would like to search for a record:
  (1) Name
  (2) Address
  (3) Phone Number
  (4) Email
  (5) Keyword
  (6) CANCEL
  Selection is >" selection

  processFind "$selection" "$operation"
}

processFind() {
  operation="$2"
  case "$1" in
    [aA1] ) clear
              search name 0 "$operation" ;;
    [bB2] ) clear
              search address 1 "$operation" ;;
    [cC3] ) clear
              search phone 2 "$operation" ;;
    [dD4] ) clear
              search email 3 "$operation" ;;
    [eE5] ) clear
              search keyword 4 "$operation" ;;
    [fF6] ) clear
              mainSelection ;;
         *) clear 
            echo " --INVALID INPUT-- "
              findRecordSelection "$operation" ;;
  esac
}

search() {
  operation="$3"
  searchField=$1 # name of search field
  fieldIndex=$2  # index to search in 'fields' array
  count=0        # amount of matching records
  index=0        # contacts array index
  matches=()     # initialize empty array that will hold matching records
  
  echo "Searching by $searchField"
  read -r -p "$searchField to search: " search

  if [[ $searchField == keyword ]]; then
    # search entire line
    for i in "${contactsArray[@]}"; do
      IFS= read -r temp <<< "$i"
      shopt -s nocasematch
      if [[ "${temp}" == *"$search"* ]]; then
        matches+=("$temp") #add line to matches array
        count=$(( count + 1 )) 
      fi
      index=$(( index + 1 ))
    done
  else
    #search by specified field
    for i in "${contactsArray[@]}"; do
      IFS=: read -a fields <<< "$i" # stores input into array "fields" and stores sequentially
      shopt -s nocasematch
        if [[ ${fields["$fieldIndex"]} == *$search* ]]; then
          matches+=("$i") #add line to matches array
          count=$(( count + 1 ))
        fi
      index=$(( index + 1 ))
    done
  fi
  
  if [ "$count" -gt "0" ]; then
    displayResults matches[@] "$operation"
  else
    clear
    printf "No matches were found, please try again:\n\n"
    findRecordSelection "$operation"
  fi   
}

displayResults() {
  operation="$2"
  declare -a results=("${!1}") 
  divider=-----------------------------
  index=0
  for i in "${results[@]}"; do
    IFS=: read -a fields <<< "$i"
    index=$(( index + 1 ))
    printf "%s) Name:    %s\n   Address: %s\n   Phone:   %s\n   Email:   %s\n$divider\n" "$index" "${fields[0]}" "${fields[1]}" "${fields[2]}" "${fields[3]}"
  done
  
  stop=0
  while [ "$stop" -ne "1" ]; do
  read -r -p "Select a contact record to "$operation":
Selection >" record
  
    if [[ ( "$record" > "$index" ) || ( "$record" <  1 ) ]]; then
      printf "Please enter a valid record selection:\n"
    else 
      contactsIndex=0
      record=$(( $record - 1 ))
      for i in "${contactsArray[@]}"; do
        IFS= read -r temp <<< "$i"
        shopt -s nocasematch
        if [[ "${results["$record"]}" == "${temp}" ]]; then
          processResult "$contactsIndex" "$operation"
          break
        fi
        contactsIndex=$(( contactsIndex + 1 ))
      done 
      stop=1
    fi
  done 
}

processResult() {
  operation="$2"
  case "$operation" in
    "find" ) clear
             echo "Operation Performed: Find" ;;
    "update" ) clear
               processUpdate "$1"
               echo "Operation Performed: Update" ;;
    "remove" ) clear
               processRemove "$1"
               echo "Operation Performed: Remove" ;;
    "add" ) echo "add" ;;
    [*] ) echo "what's going on here?" ;;
  esac
  mainSelection
}

