#!/bin/bash

printf "waiting for app and 200 response code";
while [ "$(curl -s -o /dev/null -w '%{http_code}' $1)" != "200" ]; do
    printf '.'
    sleep 1
done
echo "... success!" 
