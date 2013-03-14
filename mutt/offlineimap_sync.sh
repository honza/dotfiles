#!/usr/bin/env bash

PID=`cat ~/.offlineimap/pid`
ps aux | grep "[ ]$PID" && kill $PID

source /Users/honza/Code/envs/mail/bin/activate

if [ "$1" = "--inbox" ]
then
    # Quick sync
    offlineimap -o -q -f INBOX
else
    # Full sync
    offlineimap -o
fi



/usr/local/bin/notmuch new
