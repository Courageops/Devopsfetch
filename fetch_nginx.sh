#!/bin/bash

if [ "$1" ]; then
    sudo nginx -T 2>/dev/null | grep -A 20 "server_name $1"
else
    sudo nginx -T 2>/dev/null
fi
