#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t -q --no-align -c"
GAME(){
  NUM=$((1 + $RANDOM % 1000 ))
  echo $NUM
  echo "Guess the secret number between 1 and 1000:"
  read GUESS
  ATTEMPT=1
  while (( $NUM != $GUESS ))
  do
    ATTEMPT=$(($ATTEMPT + 1))
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      read GUESS
    elif [[ $NUM -lt $GUESS ]]
    then
      echo "It's lower than that, guess again:"
      read GUESS
    else [[ $NUM -gt $GUESS ]]
      echo "It's higher than that, guess again:"
      read GUESS
    fi
  done
  if (( $3 & $3 < $ATTEMPT ))
  then
    BESET_GAME=$3
  else
    BEST_GAME=$ATTEMPT
  fi
  NO_OF_GAMES=$(($NO_OF_GAMES + 1))
  $PSQL "UPDATE users SET no_of_games=$NO_OF_GAMES,best_game_guesses=$BEST_GAME WHERE name='$1'"
  echo "You guessed it in $ATTEMPT tries. The secret number was $NUM. Nice job!"
}


echo "Enter your username: " 
read USERNAME
USER=$($PSQL "SELECT * FROM users WHERE name='$USERNAME'")
if [[ -z $USER ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(name) VALUES('$USERNAME')"
  USER=$($PSQL "SELECT * FROM users WHERE name='$USERNAME'")
  IFS="|" read NAME NO_OF_GAMES <<< $USER
  GAME $NAME $NO_OF_GAMES
else
  IFS="|" read NAME NO_OF_GAMES BEST_GAME <<< $USER
  echo "Welcome back, $NAME! You have played $NO_OF_GAMES games, and your best game took $BEST_GAME guesses."
  GAME $NAME $NO_OF_GAMES $BEST_GAME
fi

