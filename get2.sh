#! /bin/bash

while true 
do
    output=`date "+%F@%T"`.flv
    wget -O $output $1
done
