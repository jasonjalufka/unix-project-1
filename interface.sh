#/bin/bash
# interface.sh file

mainSelection() {
  read -r -p "Welcome to my contact database, please select one of the following options:
(a) Find a record
(b) Add a new record
(c) Update a record
(d) Remove a record
(e) View current records
(f) View deleted records
(g) Quit
Selection is > " selection

processSelection "$selection"
}

processSelection() {
  case "$1" in
    [aA1] ) echo "You chose a (FIND)" 
            clear
            findRecord ;;
    [bB2] ) echo "You chose b (ADD)" ;;
    [cC3] ) echo "You chose c (UPDATE)" ;;
    [dD4] ) echo "You chose d (REMOVE)" ;;
    [eE5] ) echo "You chose e (VIEW CURRENT)" ;;
    [fF6] ) echo "You chose f (VIEW DELETED)" ;;
    [gG7] ) echo "You chose g (QUIT)" ;;
    * )     clear
            echo "--INVALID INPUT--"
            mainSelection ;;
  esac
}
