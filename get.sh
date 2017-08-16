#!/bin/bash

if [ "$1" == "" ]; then
    echo usage: ./get.sh roomid
    exit
fi

mkdir -p douyu/$1
logfile="douyu/$1/log"
touch $logfile

log(){
    echo `date "+%F %T"`"      " $* >> $logfile
}

#todo url test


base_url="https://staticlive.douyucdn.cn/common/share/play.swf?room_id="
room_url=$base_url$1
log recording $room_url

#flv_url=`./node_modules/.bin/slimerjs run.js $room_url`
#flv_url=`xvfb-run ./node_modules/.bin/slimerjs -P douyu run.js $room_url`
flv_url=`xvfb-run ./node_modules/.bin/slimerjs run.js $room_url`
log get flv url $flv_url

i=0
while true 
do
    #output=`date "+%s"`.flv
    output=douyu/$1/`date "+%F@%T"`.flv
    wget -O $output $flv_url
    let i=i+1
    if [ `wc -c < $output` == 0 ]; then
        rm $output
    else
        log $output start after $i trys
        log $output stop at `date "+%F %T"`
    fi
done
