#!/usr/bin/env bash

OS=$(lsb_release -si)

[[ ${OS} != "Ubuntu" ]] && echo "This script has been tested on Ubuntu only." && exit 1

echo "It's reco"

sudo apt update && sudo apt install -y git make ripgrep
