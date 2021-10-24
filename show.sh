#!/bin/bash

if [ ! $# -eq 1 ]
  then echo "Error: parameters problem"
  exit 1
fi

if [ ! -d "./$1" ]
then
  echo "Error: user does not exist"
else
  echo "wallStart"
  cat "./$1/wall"
  echo "wallEnd"
fi
