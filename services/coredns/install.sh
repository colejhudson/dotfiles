#!/usr/bin/env bash

set -euo pipefail

echo "ℹ️  Adding coredns to systemd"

here=$(cd $(dirname $0) && pwd)
workdir=/var/run/coredns

sudo groupadd coredns || true
sudo useradd -M coredns || true
sudo usermod -aG docker coredns

sudo mkdir -p $workdir
for file in Corefile home.colejhudson.com.zone; do
  sudo cp $here/$file $workdir/$(basename $file)
done

sudo chown -R coredns:coredns $workdir

sudo cp $here/coredns.service /etc/systemd/system/coredns.service
systemctl daemon-reload

systemctl stop coredns
systemctl start coredns

current_ip=$(ip route get 1 | head -n 1 | awk '{ print $7 }')
router_ip=$(ip route get 1 | head -n 1 | awk '{ print $3 }')

echo ""
echo "🎉 Sucesss!"
echo ""
echo "To use this server from another computer:"
echo "  1) Make sure you update your router's settings to statically bind $current_ip"
echo "     to this computer's MAC address (you can probably do that at http://$router_ip)"
echo "  2) Add 'nameserver $current_ip' to /etc/resolv.conf'"
echo ""
echo "Et voila! Have fun!"
echo ""
