#!/usr/bin/env bash

TIMESTAMP=$(timedatectl | head -n 1 | cut -d ':' -f 2-10)
LOCAL_IP=$(ip route get 8.8.8.8 | awk '{print $7; exit}')
GLOBAL_IP=$(curl http://checkip.amazonaws.com/)

curl -X POST https://what-is-coles-server-ip.now.sh \
  -H 'Content-Type: text/json; charset=utf-8' \
  -d @- <<-JSON
  {
    "timestamp": "$TIMESTAMP",
    "server": {
      "global": "$GLOBAL_IP",
      "local": "$LOCAL_IP"
    }
  }
JSON
