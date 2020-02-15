#!/bin/bash

if [ !  -L /var/lib/dhcp ]; then
    rm -rf /var/lib/dhcp
    ln -s /tmp /var/lib/dhcp
fi
if [ ! -L /var/lib/dhcpcd5 ]; then
    rm -rf /var/lib/dhcpcd5
    ln -s /tmp /var/lib/dhcpcd5
fi
if [ ! -L /var/spool ]; then
    rm -rf /var/spool
    ln -s /tmp /var/spool
fi
if [ ! -L /etc/resolv.conf ]; then
    rm -rf /etc/resolv.conf
    touch /tmp/dhcpcd.resolv.conf
    ln -s /tmp/dhcpcd.resolv.conf /etc/resolv.conf
fi
if [ ! -L /var/lib/systemd/random-seed ]; then
    rm -f /var/lib/systemd/random-seed
    ln -s /tmp/random-seed /var/lib/systemd/random-seed
fi
