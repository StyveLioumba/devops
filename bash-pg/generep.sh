#!/bin/bash

# 1. Create a directory for each row in the CSV file
while IFS="!" read -r col1 col2 col3 col4 col5 col6
do
  dir=${PWD}/$col1

  if [ ! -d "$dir" ]; then
    mkdir $dir
  fi

  echo -e "
  Vos notes sont : \n
  Maths: $col3 \n
  Anglais: $col4 \n
  OMG: $col5 \n
  AP2: $col6
  " > $dir/notesperso.txt


done < <(tail -n+2 data.csv)

