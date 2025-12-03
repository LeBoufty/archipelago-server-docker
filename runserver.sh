#! /bin/sh

rm -f output/*
rm -f *.archipelago

./ArchipelagoGenerate

cd output && unzip -j AP_*.zip
cp *.archipelago ../game.archipelago
mkdir -p static
rm -f static/spoiler.txt
cp *_Spoiler.txt static/spoiler.txt
cp AP_*.zip static/game.zip

cd ..

./ArchipelagoServer game.archipelago
