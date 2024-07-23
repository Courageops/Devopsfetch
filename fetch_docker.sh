#!/bin/bash

if [ "$1" ]; then
    sudo docker inspect "$1"
else
    sudo docker ps -a
fi
