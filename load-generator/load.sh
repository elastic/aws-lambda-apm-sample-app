#!/bin/bash

echo "Started load. Press [CTRL+C] to stop."
while true
do
  NODE_DEBUG=request node client.js https://$1/dev/produce > /dev/null 2>&1
  printf "."
	sleep 5
done