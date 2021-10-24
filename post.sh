#!/bin/bash

if [ ! $# -eq 3 ]
  then echo "Error: parameters problem"
  exit 1
fi

if [ ! -d "./$2" ]
then
  echo "Error: Sender does not exist"
elif [ ! -d "./$1" ]
then
  echo "Error: Receiver does not exist"
elif ! grep -q "$2" "./$1/friends" 
then
  echo "Error: Sender is not a friend of receiver"
else
  echo "$2: $3" >> "./$1/wall"
  echo "Ok: Message posted to wall"
fi
