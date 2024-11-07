#!/bin/bash

team=$1
alerttype=$2
body=$3
escapebody=$(printf '%s\n' "$body" | sed -e 's/[]\/$*.^[]/\\&/g');
address=$4
subject=$5

Finalbody=$( sed -e "s/team/$team/g" -e "s/alerttype/$alerttype/g" -e "s/body/$escapebody/g" template.html)

echo "$Finalbody" | mail -s "$(echo -e "$subject\nContent-Type: text/html")" "$address"

