#!/usr/bin/env bash

set -euo pipefail

echo "ℹ️  Adding haproxy to systemd"

  # Create a system user
  # Ensure that the account is incable of logging in
  # Create an eponymously named group
  # Tag the account to the associated process
  # Don't create a home directory for this user
sudo useradd \
  --system \
  --shell /bin/false \
  --user-group \
  --comment "HAProxy" \
  --no-create-home \
  haproxy || true

sudo usermod -L haproxy # Disallow logins via this user

sudo mkdir -p /etc/haproxy
sudo mkdir -p /var/run/haproxy

sudo chown -R haproxy:haproxy /var/run/haproxy
sudo chmod -R 755 /var/run/haproxy

here=$(cd $(dirname $0) && pwd)
sudo cp $here/haproxy.conf /etc/haproxy/haproxy.conf
sudo cp $here/haproxy.service /etc/systemd/system/haproxy.service

systemctl daemon-reload

systemctl stop haproxy
systemctl start haproxy

echo ""
echo "Success! Go get em cowboy 🤠"
echo ""
