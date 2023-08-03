#!/bin/vbash

set service dhcp-server shared-network-name LAN subnet '10.1.0.0/24' range 0 start '10.1.0.150'
set service dhcp-server shared-network-name LAN subnet '10.1.0.0/24' range 0 stop '10.1.0.250'

set service dhcp-server shared-network-name LAN subnet '10.1.0.0/24' name-server '10.1.0.1'
set service dhcp-server shared-network-name LAN subnet '10.1.0.0/24' default-router '10.1.0.1'

set service dhcp-server shared-network-name SERVERS authoritative
set service dhcp-server shared-network-name SERVERS ping-check
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 default-router '10.1.7.1'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 domain-name 'vyos.pill.ac'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 lease '86400'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 range 0 start '10.1.7.200'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 range 0 stop '10.1.7.254'

set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 static-mapping control-plane-0 ip-address '10.1.7.20'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 static-mapping control-plane-0 mac-address '18:66:da:32:f7:b0'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 static-mapping control-plane-1 ip-address '10.1.7.21'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 static-mapping control-plane-1 mac-address '48:4d:7e:ef:54:59'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 static-mapping control-plane-2 ip-address '10.1.7.22'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 static-mapping control-plane-2 mac-address '18:66:da:42:33:e7'

set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 static-mapping worker-0 ip-address '10.1.7.30'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 static-mapping worker-0 mac-address 'e4:b9:7a:f8:90:c4'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 static-mapping worker-1 ip-address '10.1.7.31'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 static-mapping worker-1 mac-address 'd8:9e:f3:93:85:d8'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 static-mapping worker-2 ip-address '10.1.7.32'
set service dhcp-server shared-network-name SERVERS subnet 10.1.7.0/24 static-mapping worker-2 mac-address '6c:2b:59:d2:97:cd'

