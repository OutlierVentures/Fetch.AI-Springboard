#!/bin/bash

onred='\033[41m'
ongreen='\033[42m'
onyellow='\033[43m'
endcolor="\033[0m"

docker info &> /dev/null || (echo -e "${onred}Error: Docker is not running.$endcolor" && exit 1)

# Handle errors
set -e
error_report() {
    echo -e "${onred}Error: failed on line $1.$endcolor"
}
trap 'error_report $LINENO' ERR

echo -e "${onyellow}Starting Fetch node...$endcolor"
cd oef-search-pluto
python3 scripts/launch.py -c ./scripts/launch_config.json --background &> /dev/null
cd ../oef-mt-core
bazel run mt-core/main/src/cpp:app -- --config_file `pwd`/mt-core/main/src/cpp/config.json &> /dev/null &
echo -e "${ongreen}Fetch node is running.$endcolor"
