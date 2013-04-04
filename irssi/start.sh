read -s -p "znc password: " PASS

irssi -c irc.honza.ca -p 6666 -n honza -w $PASS
