#!/bin/sh

########################
# this auto adds aliases
########################

MESSAGE=$(cat)

NEWALIAS=$(echo "${MESSAGE}" | grep ^"From: " | sed s/[\,\"\']//g | awk '{$1=""; if (NF == 3) {print "alias" $0;} else if (NF == 2) {print "alias" $0 $0;} else if (NF > 3) {print "alias", tolower($(NF-1))"-"tolower($2) $0;}}')

if grep -Fxq "$NEWALIAS" $HOME/.config/mutt/aliases; then
    :
else
    echo "$NEWALIAS" >> $HOME/.config/mutt/aliases
fi

echo "${MESSAGE}"

