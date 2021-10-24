#!/bin/bash

if [ ! $# -eq 2 ]
  then echo "Error: parameters problem"
  exit 1
fi

if [ ! -d "./$1" ]
then
  echo "Error: user does not exist"
elif [ ! -d "./$2" ]
then
  echo "Error: friend does not exist"
elif grep -q "$2" "./$1/friends"
then
  echo "Error: user already friends with this user"
else
  echo "$2" >> "./$1/friends"
  echo "OK: friend added"
fi
