#!/bin/bash

if [ ! $# -eq 1 ]
  then echo "Error: parameters problem"
  exit 1
fi

if [ ! -d "./$1" ] 
then 
  mkdir "$1"
  touch "./$1/friends"
  touch "./$1/wall"
  echo "OK: user created"
else
echo "Error: user already exists"
fi  
