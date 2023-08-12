#!/bin/vbash

#LAN Zone
set firewall zone lan default-action drop
set firewall zone lan from wan firewall name wan-lan
set firewall zone lan from local firewall name local-lan
set firewall zone lan from servers firewall name servers-lan
set firewall zone lan from containers firewall name containers-lan
set firewall zone lan interface 'eth1'

#
set firewall zone local local-zone
set firewall zone local default-action drop
set firewall zone local from lan firewall name lan-local
set firewall zone local from wan firewall name wan-local
set firewall zone local from servers firewall name servers-local
set firewall zone local from containers firewall name containers-local

set firewall zone wan default-action drop
set firewall zone wan from lan firewall name lan-wan
set firewall zone wan from local firewall name local-wan
set firewall zone wan from servers firewall name servers-wan
set firewall zone wan from containers firewall name containers-wan
set firewall zone wan interface 'eth0'

set firewall zone servers default-action drop
set firewall zone servers from lan firewall name lan-servers
set firewall zone servers from local firewall name local-servers
set firewall zone servers from wan firewall name wan-servers
set firewall zone servers from containers firewall name containers-servers
set firewall zone servers interface 'eth1.70'

set firewall zone containers default-action drop
set firewall zone containers description 'VyOS containers zone'
set firewall zone containers from lan firewall name lan-containers
set firewall zone containers from local firewall name local-containers
set firewall zone containers from servers firewall name servers-containers
set firewall zone containers from wan firewall name wan-containers
set firewall zone containers interface 'pod-containers'