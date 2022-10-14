#!/bin/bash
touch /etc/netplan/01-netcfg.yaml
echo '
network:
  version: 2
  renderer: networkd
  ethernets:
    ens18:
      dhcp4: no
    ens19:
      dhcp4: no
  bonds:
    bond0:
      interfaces: [ens18, ens19]
      addresses: [192.168.2.2/24]
      parameters:
        mode: 802.3ad
        transmit-hash-policy: layer3+4
        mii-monitor-interval: 1
      nameservers:
        addresses:
          - "8.8.8.8"
' >> /etc/netplan/01-netcfg.yaml

netplan apply
ip addr add 192.168.2.2/24 dev ens18
ip route add default via 192.168.2.1
echo 'nameserver' > /etc/resolv.conf