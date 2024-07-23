#!/bin/bash

if [ "$1" ]; then
    last -F -n 1 "$1"
else
    last -F
fi
