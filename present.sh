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

xxd -p -c 16 interfaces/$1 2> /dev/null
# Alternatively:
# xxd interfaces/$1
# hexdump -v -C interfaces/$1
# hexdump -v interfaces/$1
