#!/bin/vbash

#WAN
set interfaces ethernet eth0 address dhcp
set interfaces ethernet eth0 description WAN

#LAN
set interfaces ethernet eth1 address '10.1.0.1/24'
set interfaces ethernet eth1 description LAN

set interfaces ethernet eth1 vif 70 address '10.1.7.1/24'
set interfaces ethernet eth1 vif 70 description 'SERVERS'
