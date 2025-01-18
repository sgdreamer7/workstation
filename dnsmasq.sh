#!/bin/sh
echo "log-queries\n#dont use hosts nameservers\nno-resolv\nstrict-order\n#explicitly define host-ip mappings\naddress=/workstation/$(ipconfig getifaddr en0)" > ./data/dnsmasq.conf
sudo mkdir -p /etc/resolver
sudo tee /etc/resolver/workstation >/dev/null <<EOF
nameserver 127.0.0.1
EOF