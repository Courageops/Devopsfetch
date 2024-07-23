#!/bin/bash

start_time=$1
end_time=$2

sudo awk -v start="$start_time" -v end="$end_time" '$0 >= start && $0 <= end' /var/log/syslog
