#!/bin/bash
# Various utilities to help with database management

loadArray() {
  while IFS= read -r line_data; do
    contactsArray+=("$line_data")
  done < "database.txt"
  }

printArray() {
  header="Contact Database (Name:Address:Phone:Email)"
  divider="-------------------------------------------"
  printf "%s\n%s\n%s\n%s\n" "$header" "$divider" "${contactsArray[@]}" "$divider"
}

saveDatabase() {
  printf "%s\n" "${contactsArray[@]}" > database.txt
}
