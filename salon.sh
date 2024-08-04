#!/bin/bash
echo -e "\n~~~~~ MY SALON ~~~~~"
PSQL="psql --username=freecodecamp --dbname=salon -t -q -c"
MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi
  SERVICES
}
SERVICES(){
  SERVICES=$($PSQL "SELECT service_id,name FROM services") 
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    if [[ $SERVICE_NAME != "name" ]]
    then
      echo "$SERVICE_ID) $SERVICE_NAME"
    fi
  done
  read SERVICE_ID_SELECTED
  SELECTED_SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
  if [[ -z $SELECTED_SERVICE_ID ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
    return
  fi
  SELECTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SELECTED_SERVICE_ID")
  
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    $PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')"
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID")

  echo -e "\nWhat time would you like your $SELECTED_SERVICE, $CUSTOMER_NAME?"
  read SERVICE_TIME
  $PSQL "INSERT INTO appointments(customer_id,time,service_id) VALUES($CUSTOMER_ID,'$SERVICE_TIME',$SELECTED_SERVICE_ID)"
  echo -e "\nI have put you down for a$SELECTED_SERVICE at $SERVICE_TIME,$CUSTOMER_NAME.\n"
}
MAIN_MENU 