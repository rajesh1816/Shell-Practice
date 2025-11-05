#!/bin/bash


echo "all variables passed to the script: $@"
echo "number of variables passed: $#"
echo "script name: $0"
echo "current working directory: $PWD"
echo "which user running script: $USER"
echo "user homw directory: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of the last command in background: $!"