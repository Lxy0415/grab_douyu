#!/bin/bash

if [ "$1" == "" ]; then
    echo usage: ./get.sh url
    exit
fi

#flv_url=`./node_modules/.bin/slimerjs netlog.js $1`
flv_url=`xvfb-run ./node_modules/.bin/slimerjs netlog.js $1`
echo $flv_url

#grep '_[0..9]\{3\}.flv'
echo change the url to 

flv_url2=`echo $flv_url | sed -e "s/_[0..9]\{3\}.flv/.flv/g"`
echo $flv_url2

i=0
while true 
do
    #output=`date "+%s"`.flv
    output=`date "+%F@%T"`.flv
    wget -O $output $flv2_url
    let i=i+1
    if [ `wc -c < $output` == 0 ]; then
        rm $output
    else
        echo $output start after $i trys
        echo $output stop at `date "+%F %T"`
    fi
done
