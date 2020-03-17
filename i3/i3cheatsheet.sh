#!/bin/bash
# all lines for shortcuts start w/ 'bindsym' so we can use that as an identifier
awk '/^bind/ {printf "%-20s",$2;$1=$2=""; print $0}' config | pr -2 -w 230 -t
