#!/bin/vbash

#LAN Zone
set firewall zone LAN default-action drop
set firewall zone LAN from WAN firewall name WAN-LAN
set firewall zone LAN from LOCAL firewall name LOCAL-LAN
set firewall zone LAN from SERVERS firewall name SERVERS-LAN
set firewall zone LAN from CONTAINERS firewall name CONTAINERS-LAN
set firewall zone LAN interface eth1

#
set firewall zone LOCAL local-zone
set firewall zone LOCAL default-action drop
set firewall zone LOCAL from LAN firewall name LAN-LOCAL
set firewall zone LOCAL from WAN firewall name WAN-LOCAL
set firewall zone LOCAL from SERVERS firewall name SERVERS-LOCAL
set firewall zone LOCAL from CONTAINERS firewall name CONTAINERS-LOCAL

set firewall zone WAN default-action drop
set firewall zone WAN from LAN firewall name LAN-WAN
set firewall zone WAN from LOCAL firewall name LOCAL-WAN
set firewall zone WAN from SERVERS firewall name SERVERS-WAN
set firewall zone WAN from CONTAINERS firewall name CONTAINERS-WAN
set firewall zone WAN interface eth0

set firewall zone SERVERS default-action drop
set firewall zone SERVERS from LAN firewall name LAN-SERVERS
set firewall zone SERVERS from LOCAL firewall name LOCAL-SERVERS
set firewall zone SERVERS from WAN firewall name WAN-SERVERS
set firewall zone SERVERS from CONTAINERS firewall name CONTAINERS-SERVERS
set firewall zone SERVERS interface 'eth1.70'

set firewall zone CONTAINERS default-action drop
set firewall zone CONTAINERS description 'VyOS containers zone'
set firewall zone CONTAINERS from LAN firewall name LAN-CONTAINERS
set firewall zone CONTAINERS from LOCAL firewall name LOCAL-CONTAINERS
set firewall zone CONTAINERS from SERVERS firewall name SERVER-CONTAINERS
set firewall zone CONTAINERS from WAN firewall name WAN-CONTAINERS
set firewall zone CONTAINERS interface POD-CONTAINERS