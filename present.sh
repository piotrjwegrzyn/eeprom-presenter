#!/usr/bin/bash

if [ $# -ne 1 ];
then
    exit 1
fi

ip addr show $1 &> /dev/null
if [ $? -ne 0 ];
then
    exit 1
fi

xxd -p -c 16 $HOME/.eeprom-presenter/interfaces/$1 2> /dev/null
# Alternatively:
# xxd $HOME/.eeprom-presenter/interfaces/$1
# hexdump -v -C $HOME/.eeprom-presenter/interfaces/$1
# hexdump -v $HOME/.eeprom-presenter/interfaces/$1
