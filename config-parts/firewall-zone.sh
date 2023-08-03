#!/bin/vbash

#LAN Zone
set firewall zone LAN default-action drop
set firewall zone LAN from WAN firewall name WAN-LAN
set firewall zone LAN from LOCAL firewall name LOCAL-LAN
set firewall zone LAN from SERVERS firewall name SERVERS-LAN
set firewall zone LAN interface eth1

#
set firewall zone LOCAL local-zone
set firewall zone LOCAL from LAN firewall name LAN-LOCAL
set firewall zone LOCAL from WAN firewall name WAN-LOCAL
set firewall zone LOCAL from SERVERS firewall name SERVERS-LOCAL
set firewall zone LOCAL default-action drop

set firewall zone WAN from LAN firewall name LAN-WAN
set firewall zone WAN from LOCAL firewall name LOCAL-WAN
set firewall zone WAN from SERVERS firewall name SERVERS-WAN
set firewall zone WAN interface eth0
set firewall zone WAN default-action drop

set firewall zone SERVERS from LAN firewall name 'LAN-SERVERS'
set firewall zone SERVERS from LOCAL firewall name 'LOCAL-SERVERS'
set firewall zone SERVERS from WAN firewall name 'WAN-SERVERS'
set firewall zone SERVERS interface 'eth1.70'
set firewall zone SERVERS default-action drop