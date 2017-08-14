#!/bin/bash

if [ "$1" == "" ]; then
    echo usage: ./get.sh url
    exit
fi

flv_url=`./node_modules/.bin/slimerjs netlog.js $1`
echo $flv_url

while true 
do
    wget -O 1.flv $flv_url
done
