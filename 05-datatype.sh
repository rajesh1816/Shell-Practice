#!/bin/bash

TIMESTAMP=$(date)
NUMBER1=100
NUMBER2=200

MOVIES=("court" , "og" , "k-ramp" , "bahubali")

echo "${MOVIES[0]}"
echo "${MOVIES[2]}"
echo "${MOVIES[@]}"

echo "$TIMESTAMP"

SUM=$(($NUMBER1+$NUMBER2))
echo "$SUM"




