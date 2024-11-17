#!/bin/sh
brew install dnsmasq
cp $(brew list dnsmasq | grep /dnsmasq.conf.example$) /usr/local/etc/dnsmasq.conf
sudo cp $(brew list dnsmasq | grep /homebrew.mxcl.dnsmasq.plist$) /Library/LaunchDaemons/
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
echo "\naddress=/workstation/127.0.0.1" >> /usr/local/etc/dnsmasq.conf
sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq
sudo mkdir -p /etc/resolver
sudo tee /etc/resolver/workstation >/workstation/null <<EOF
nameserver 127.0.0.1
EOF
ping xxx.workstation