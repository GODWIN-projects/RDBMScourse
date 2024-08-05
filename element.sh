#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
ELEMENT(){
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NO=$1
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")
  elif [[ ${#1} -lt 3 ]]
  then
    ELEMENT_SYMBOL=$1
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol='$ELEMENT_SYMBOL'")
  else
    ELEMENT_NAME=$1
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE name='$ELEMENT_NAME'")
  fi

  
  IFS="|" read ATOMIC_NO ELEMENT_SYMBOL ELEMENT_NAME <<< $ELEMENT
  if [[ -z $ATOMIC_NO ]]
  then
    echo "I could not find that element in the database."
    return
  fi
  PROPERTIES=$($PSQL "SELECT atomic_mass,melting_point_celsius,boiling_point_celsius,type_id FROM properties WHERE atomic_number=$ATOMIC_NO")
  IFS="|" read ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID <<< $PROPERTIES
  TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")
  echo "The element with atomic number $ATOMIC_NO is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
}


if [[ $1 ]]
then
  ELEMENT $1
else
  echo "Please provide an element as an argument."
fi
