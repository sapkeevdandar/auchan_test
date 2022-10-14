#!/bin/bash

echo root:321 | chpasswd
useradd zorik
echo zorik:321 | chpasswd
echo "Port 1055" >> /etc/ssh/sshd_config
/etc/init.d/ssh restart