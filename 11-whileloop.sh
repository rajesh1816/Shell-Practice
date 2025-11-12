#!/bin/bash

# if we want to read a file line by line use while loop

while IFS= read line # here line is a variable
do
     echo $line
done < 12-set.sh