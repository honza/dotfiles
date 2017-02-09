#!/usr/bin/env bash

if [ "$1" = "--inbox" ]
then
    # Quick sync
    offlineimap -c ~/Dropbox/Code/email-conf/offlineimaprc -o -q -f INBOX
else
    # Full sync
    offlineimap -c ~/Dropbox/Code/email-conf/offlineimaprc -o
fi

# /usr/local/bin/notmuch new
