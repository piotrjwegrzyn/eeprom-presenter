#!/usr/bin/bash

rm -rf interfaces
mkdir -p interfaces

for interface in $(find eeproms/* -type d | sed 's/eeproms\///')
do
    file=eeproms/$interface/$(ls eeproms/$interface/ | head -1)
    if test -f "$file";
    then
        ln -sf ../$file interfaces/$interface
    fi
done

FIN_DIR=$HOME/.eeprom-presenter

mkdir -p $FIN_DIR

mv eeproms $FIN_DIR/eeproms
mv interfaces $FIN_DIR/interfaces
mv present.sh update.sh $FIN_DIR/

echo "alias show-eeprom=$FIN_DIR/present.sh" >> $HOME/.bashrc
