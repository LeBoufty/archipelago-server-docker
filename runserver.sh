#! /bin/sh

rm -f output/*
rm -f *.archipelago

./ArchipelagoGenerate

cd output && unzip -j AP_*.zip
cp *.archipelago ../game.archipelago

cd ..

./ArchipelagoServer game.archipelago
