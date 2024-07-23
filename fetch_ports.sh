#!/bin/bash

if [ "$1" ]; then
    sudo netstat -tuln | grep ":$1 "
else
    sudo netstat -tuln
fi
