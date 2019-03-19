#!/usr/bin/env bash

curl https://what-is-coles-server-ip.now.sh/ | jq '.' > ~/.ips
