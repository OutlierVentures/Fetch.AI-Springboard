#!/bin/bash

ongreen='\033[42m'
onyellow='\033[43m'
endcolor="\033[0m"

echo -e "${onyellow}Testing Fetch install...$endcolor"
cd oefpy
sudo tox -e py37
cd ..

echo -e "${ongreen}Tests complete, see results above.$endcolor"
