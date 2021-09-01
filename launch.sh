#!/bin/bash


if [[ $1 = "qtcreator" ]]
then
  export DISPLAY=${2:-":0"}
  qtcreator
else
  /bin/bash
fi      
