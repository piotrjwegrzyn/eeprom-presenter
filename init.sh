#!/bin/sh

mkdir interfaces

for interface in $(find eeproms/* -type d | sed 's/eeproms\///')
do
    file=eeproms/$interface/$(ls eeproms/$interface/ | head -1)
    if test -f "$file";
    then
        ln -sf ../$file interfaces/$interface
    fi
done

# echo "alias show-eeprom=present.sh" >> $HOME/.bashrc
