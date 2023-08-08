#!/bin/vbash

# From LOCAL to WAN
set firewall name LOCAL-WAN default-action accept

# FROM Local to LAN
set firewall name LOCAL-LAN default-action accept

# From LOCAL to SERVERS
set firewall name LOCAL-SERVERS default-action 'drop'
set firewall name LOCAL-SERVERS description 'From LOCAL to SERVERS'
set firewall name LOCAL-SERVERS enable-default-log
set firewall name LOCAL-SERVERS rule 40 action 'accept'
set firewall name LOCAL-SERVERS rule 40 description 'Rule: accept_dns'
set firewall name LOCAL-SERVERS rule 40 destination port 'domain,domain-s'
set firewall name LOCAL-SERVERS rule 40 protocol 'tcp_udp'
set firewall name LOCAL-SERVERS rule 70 action 'accept'
set firewall name LOCAL-SERVERS rule 70 description 'Rule: accept_bgp'
set firewall name LOCAL-SERVERS rule 70 destination port 'bgp'
set firewall name LOCAL-SERVERS rule 70 protocol 'tcp'
set firewall name LOCAL-SERVERS rule 100 action 'accept'
set firewall name LOCAL-SERVERS rule 100 description 'Rule: accept_k8s_api'
set firewall name LOCAL-SERVERS rule 100 destination port '6443'
set firewall name LOCAL-SERVERS rule 100 protocol 'tcp'
set firewall name LOCAL-SERVERS rule 200 action 'accept'
set firewall name LOCAL-SERVERS rule 200 description 'Rule: accept_vector_syslog'
set firewall name LOCAL-SERVERS rule 200 destination group address-group 'k8s_vector_aggregator'
set firewall name LOCAL-SERVERS rule 200 destination port '6001'
set firewall name LOCAL-SERVERS rule 200 protocol 'tcp'
set firewall name LOCAL-SERVERS rule 999 action 'drop'
set firewall name LOCAL-SERVERS rule 999 description 'Rule: drop_invalid'
set firewall name LOCAL-SERVERS rule 999 state invalid 'enable'
set firewall name LOCAL-SERVERS rule 999 log 'enable'

# From LOCAL to CONTAINERS
set firewall name LOCAL-CONTAINERS default-action 'accept'
set firewall name LOCAL-CONTAINERS description 'From LOCAL to CONTAINERS'
set firewall name LOCAL-CONTAINERS rule 40 action 'accept'
set firewall name LOCAL-CONTAINERS rule 40 description 'Rule: accept_dns'
set firewall name LOCAL-CONTAINERS rule 40 destination port 'domain,domain-s'
set firewall name LOCAL-CONTAINERS rule 40 protocol 'tcp_udp'
set firewall name LOCAL-CONTAINERS rule 999 action 'drop'
set firewall name LOCAL-CONTAINERS rule 999 description 'Rule: drop_invalid'
set firewall name LOCAL-CONTAINERS rule 999 state invalid 'enable'
set firewall name LOCAL-CONTAINERS rule 999 log 'enable'

# From LAN to WAN
set firewall name LAN-WAN default-action accept

# From LAN to LOCAL
set firewall name LAN-LOCAL default-action accept

# From LAN to SERVERS
set firewall name LAN-SERVERS default-action 'drop'
set firewall name LAN-SERVERS description 'From LAN to SERVERS'
set firewall name LAN-SERVERS enable-default-log
set firewall name LAN-SERVERS rule 999 action 'drop'
set firewall name LAN-SERVERS rule 999 description 'Rule: drop_invalid'
set firewall name LAN-SERVERS rule 999 state invalid 'enable'
set firewall name LAN-SERVERS rule 999 log 'enable'

# From LAN to CONTAINERS
set firewall name LAN-CONTAINERS default-action 'drop'
set firewall name LAN-CONTAINERS description 'From LAN to CONTAINERS'
set firewall name LAN-CONTAINERS enable-default-log
set firewall name LAN-CONTAINERS rule 999 action 'drop'
set firewall name LAN-CONTAINERS rule 999 description 'Rule: drop_invalid'
set firewall name LAN-CONTAINERS rule 999 state invalid 'enable'
set firewall name LAN-CONTAINERS rule 999 log 'enable'

# From SERVERS to LAN
set firewall name SERVERS-LAN default-action 'drop'
set firewall name SERVERS-LAN description 'From SERVERS to LAN'
set firewall name SERVERS-LAN enable-default-log
set firewall name SERVERS-LAN rule 999 action 'drop'
set firewall name SERVERS-LAN rule 999 description 'Rule: drop_invalid'
set firewall name SERVERS-LAN rule 999 state invalid 'enable'
set firewall name SERVERS-LAN rule 999 log 'enable'

# From SERVERS to LOCAL
set firewall name SERVERS-LOCAL default-action 'drop'
set firewall name SERVERS-LOCAL description 'From SERVERS to LOCAL'
set firewall name SERVERS-LOCAL enable-default-log
set firewall name SERVERS-LOCAL rule 50 action 'accept'
set firewall name SERVERS-LOCAL rule 50 description 'Rule: accept_dhcp'
set firewall name SERVERS-LOCAL rule 50 destination port '67,68'
set firewall name SERVERS-LOCAL rule 50 protocol 'udp'
set firewall name SERVERS-LOCAL rule 50 source port '67,68'
set firewall name SERVERS-LOCAL rule 60 action 'accept'
set firewall name SERVERS-LOCAL rule 60 description 'Rule: accept_ntp'
set firewall name SERVERS-LOCAL rule 60 destination port 'ntp'
set firewall name SERVERS-LOCAL rule 60 protocol 'udp'
set firewall name SERVERS-LOCAL rule 70 action 'accept'
set firewall name SERVERS-LOCAL rule 70 description 'Rule: accept_bgp'
set firewall name SERVERS-LOCAL rule 70 destination port 'bgp'
set firewall name SERVERS-LOCAL rule 70 protocol 'tcp'
set firewall name SERVERS-LOCAL rule 80 action 'accept'
set firewall name SERVERS-LOCAL rule 80 description 'Rule: accept_tftp'
set firewall name SERVERS-LOCAL rule 80 destination port '69'
set firewall name SERVERS-LOCAL rule 80 protocol 'udp'
set firewall name SERVERS-LOCAL rule 100 action 'accept'
set firewall name SERVERS-LOCAL rule 100 description 'Rule: accept_node_exporter_from_k8s_nodes'
set firewall name SERVERS-LOCAL rule 100 destination port '9100'
set firewall name SERVERS-LOCAL rule 100 protocol 'tcp'
set firewall name SERVERS-LOCAL rule 100 source group address-group 'k8s_nodes'
set firewall name SERVERS-LOCAL rule 110 action 'accept'
set firewall name SERVERS-LOCAL rule 110 description 'Rule: accept_speedtest_exporter_from_k8s_nodes'
set firewall name SERVERS-LOCAL rule 110 destination port '9798'
set firewall name SERVERS-LOCAL rule 110 protocol 'tcp'
set firewall name SERVERS-LOCAL rule 110 source group address-group 'k8s_nodes'
set firewall name SERVERS-LOCAL rule 999 action 'drop'
set firewall name SERVERS-LOCAL rule 999 description 'Rule: drop_invalid'
set firewall name SERVERS-LOCAL rule 999 state invalid 'enable'
set firewall name SERVERS-LOCAL rule 999 log 'enable'

# From SERVERS to CONTAINERS
set firewall name SERVERS-CONTAINERS default-action 'accept'
set firewall name SERVERS-CONTAINERS description 'From SERVERS to CONTAINERS'
set firewall name SERVERS-CONTAINERS enable-default-log
set firewall name SERVERS-CONTAINERS rule 40 action 'accept'
set firewall name SERVERS-CONTAINERS rule 40 description 'Rule: accept_dns'
set firewall name SERVERS-CONTAINERS rule 40 destination port 'domain,domain-s'
set firewall name SERVERS-CONTAINERS rule 40 protocol 'tcp_udp'
set firewall name SERVERS-CONTAINERS rule 100 action 'accept'
set firewall name SERVERS-CONTAINERS rule 100 description 'Rule: accept_k8s_nodes'
set firewall name SERVERS-CONTAINERS rule 100 protocol 'tcp'
set firewall name SERVERS-CONTAINERS rule 100 source group address-group 'k8s_nodes'
set firewall name SERVERS-CONTAINERS rule 999 action 'drop'
set firewall name SERVERS-CONTAINERS rule 999 description 'Rule: drop_invalid'
set firewall name SERVERS-CONTAINERS rule 999 state invalid 'enable'
set firewall name SERVERS-CONTAINERS rule 999 log 'enable'

# From SERVERS to WAN
set firewall name SERVERS-WAN default-action 'accept'
set firewall name SERVERS-WAN description 'From SERVERS to WAN'

# From WAN to LOCAL
set firewall name WAN-LOCAL default-action drop
set firewall name WAN-LOCAL rule 5 action accept
set firewall name WAN-LOCAL rule 5 state established enable
set firewall name WAN-LOCAL rule 5 state related enable
set firewall name WAN-LOCAL rule 5 description "Allow EST/Related Traffic"
set firewall name WAN-LOCAL rule 20 protocol icmp
set firewall name WAN-LOCAL rule 20 state new enable
set firewall name WAN-LOCAL rule 20 action accept
set firewall name WAN-LOCAL rule 30 action accept
set firewall name WAN-LOCAL rule 30 description 'Accept ssh from Trusted'
set firewall name WAN-LOCAL rule 30 source group network-group INTERNAL_TRUSTED
set firewall name WAN-LOCAL rule 30 destination port 22
set firewall name WAN-LOCAL rule 30 protocol tcp
set firewall name WAN-LOCAL rule 30 state new enable
set firewall name WAN-LOCAL rule 30 state established enable
set firewall name WAN-LOCAL rule 30 state related enable

# From WAN to SERVERS
set firewall name WAN-SERVERS default-action drop
set firewall name WAN-SERVERS rule 5 action accept
set firewall name WAN-SERVERS rule 5 state established enable
set firewall name WAN-SERVERS rule 5 state related enable
set firewall name WAN-SERVERS rule 5 state new enable
set firewall name WAN-SERVERS rule 5 description "Allow EST/Related/New Traffic from Trusted VLAN"
set firewall name WAN-SERVERS rule 5 source group network-group INTERNAL_TRUSTED
set firewall name WAN-SERVERS rule 10 action accept
set firewall name WAN-SERVERS rule 10 state established enable
set firewall name WAN-SERVERS rule 10 state related enable
set firewall name WAN-SERVERS rule 10 state new enable
set firewall name WAN-SERVERS rule 10 description "Allow HTTP/S from Trusted VLAN"
set firewall name WAN-SERVERS rule 10 destination port 80
set firewall name WAN-SERVERS rule 10 destination port 443
set firewall name WAN-SERVERS rule 10 protocol tcp
set firewall name WAN-SERVERS rule 10 source group network-group INTERNAL_TRUSTED

# From WAN to CONTAINERS
set firewall name WAN-CONTAINERS default-action 'accept'
set firewall name WAN-CONTAINERS description 'From WAN to CONTAINERS'
set firewall name WAN-CONTAINERS rule 40 action 'accept'
set firewall name WAN-CONTAINERS rule 40 description 'Rule: accept_dns'
set firewall name WAN-CONTAINERS rule 40 destination port 'domain,domain-s'
set firewall name WAN-CONTAINERS rule 40 protocol 'tcp_udp'
set firewall name WAN-CONTAINERS rule 999 action 'drop'
set firewall name WAN-CONTAINERS rule 999 description 'Rule: drop_invalid'
set firewall name WAN-CONTAINERS rule 999 state invalid 'enable'
set firewall name WAN-CONTAINERS rule 999 log 'enable'

set firewall name WAN-LAN rule 5 action accept
set firewall name WAN-LAN rule 5 state established enable
set firewall name WAN-LAN rule 5 state related enable
set firewall name WAN-LAN rule 5 description "Allow EST/Related Traffic"
set firewall name WAN-LAN rule 20 protocol icmp
set firewall name WAN-LAN rule 20 state new enable
set firewall name WAN-LAN rule 20 action accept
set firewall name WAN-LAN rule 30 source group network-group INTERNAL_TRUSTED
set firewall name WAN-LAN rule 30 action accept
set firewall name WAN-LAN rule 30 destination port 22
set firewall name WAN-LAN rule 30 protocol tcp
set firewall name WAN-LAN rule 30 state new enable
set firewall name WAN-LAN rule 30 state established enable
set firewall name WAN-LAN rule 30 state related enable
set firewall name WAN-LAN rule 40 action accept
set firewall name WAN-LAN rule 40 description 'Accept Proxmox management UI from Trusted'
set firewall name WAN-LAN rule 40 source group network-group INTERNAL_TRUSTED
set firewall name WAN-LAN rule 40 destination port 8006
set firewall name WAN-LAN rule 40 protocol tcp
set firewall name WAN-LAN rule 40 state new enable
set firewall name WAN-LAN rule 40 state established enable
set firewall name WAN-LAN rule 40 state related enable

#Unifi port forwarding

set firewall name WAN-LAN default-action 'drop'
set firewall name WAN-LAN description 'From WAN to LAN'
set firewall name WAN-LAN enable-default-log
set firewall name WAN-LAN rule 50 action accept
set firewall name WAN-LAN rule 50 description 'Accept DNS for Guest Portal redirection, downloading updates, and remote access'
set firewall name WAN-LAN rule 50 source group network-group INTERNAL_UNIFI_MANAGEMENT
set firewall name WAN-LAN rule 50 destination port 53
set firewall name WAN-LAN rule 50 protocol tcp_udp
set firewall name WAN-LAN rule 50 state new enable
set firewall name WAN-LAN rule 50 state established enable
set firewall name WAN-LAN rule 50 state related enable

set firewall name WAN-LAN rule 51 action accept
set firewall name WAN-LAN rule 51 description 'Used STUN'
set firewall name WAN-LAN rule 51 source group network-group INTERNAL_UNIFI_MANAGEMENT
set firewall name WAN-LAN rule 51 destination port 3478
set firewall name WAN-LAN rule 51 protocol udp
set firewall name WAN-LAN rule 51 state new enable
set firewall name WAN-LAN rule 51 state established enable
set firewall name WAN-LAN rule 51 state related enable

set firewall name WAN-LAN rule 52 action accept
set firewall name WAN-LAN rule 52 description 'Used remote syslog capture'
set firewall name WAN-LAN rule 52 source group network-group INTERNAL_UNIFI_MANAGEMENT
set firewall name WAN-LAN rule 52 destination port 5514
set firewall name WAN-LAN rule 52 protocol udp
set firewall name WAN-LAN rule 52 state new enable
set firewall name WAN-LAN rule 52 state established enable
set firewall name WAN-LAN rule 52 state related enable

set firewall name WAN-LAN rule 53 action accept
set firewall name WAN-LAN rule 53 description 'Used for device and application communication'
set firewall name WAN-LAN rule 53 source group network-group INTERNAL_UNIFI_MANAGEMENT
set firewall name WAN-LAN rule 53 destination port 8080
set firewall name WAN-LAN rule 53 protocol tcp
set firewall name WAN-LAN rule 53 state new enable
set firewall name WAN-LAN rule 53 state established enable
set firewall name WAN-LAN rule 53 state related enable

set firewall name WAN-LAN rule 54 action accept
set firewall name WAN-LAN rule 54 description 'Applications running on a UniFi Console'
set firewall name WAN-LAN rule 54 source group network-group INTERNAL_UNIFI_MANAGEMENT
set firewall name WAN-LAN rule 54 destination port 443
set firewall name WAN-LAN rule 54 protocol tcp
set firewall name WAN-LAN rule 54 state new enable
set firewall name WAN-LAN rule 54 state established enable
set firewall name WAN-LAN rule 54 state related enable

set firewall name WAN-LAN rule 55 action accept
set firewall name WAN-LAN rule 55 description 'Used for device discovery.'
set firewall name WAN-LAN rule 55 source group network-group INTERNAL_UNIFI_MANAGEMENT
set firewall name WAN-LAN rule 55 destination port 10001
set firewall name WAN-LAN rule 55 protocol udp
set firewall name WAN-LAN rule 55 state new enable
set firewall name WAN-LAN rule 55 state established enable
set firewall name WAN-LAN rule 55 state related enable

set firewall name WAN-LAN rule 56 action accept
set firewall name WAN-LAN rule 56 description 'Applications running on a UniFi Console'
set firewall name WAN-LAN rule 56 source group network-group INTERNAL_UNIFI_MANAGEMENT
set firewall name WAN-LAN rule 56 destination port 8443
set firewall name WAN-LAN rule 56 protocol tcp
set firewall name WAN-LAN rule 56 state new enable
set firewall name WAN-LAN rule 56 state established enable
set firewall name WAN-LAN rule 56 state related enable
set firewall name WAN-LAN rule 999 action 'drop'
set firewall name WAN-LAN rule 999 description 'Rule: drop_invalid'
set firewall name WAN-LAN rule 999 state invalid 'enable'
set firewall name WAN-LAN rule 999 log 'enable'


# From CONTAINERS to LAN
set firewall name CONTAINERS-LAN default-action 'drop'
set firewall name CONTAINERS-LAN description 'From CONTAINERS to LAN'
set firewall name CONTAINERS-LAN enable-default-log
set firewall name CONTAINERS-LAN rule 999 action 'drop'
set firewall name CONTAINERS-LAN rule 999 description 'Rule: drop_invalid'
set firewall name CONTAINERS-LAN rule 999 state invalid 'enable'
set firewall name CONTAINERS-LAN rule 999 log 'enable'

# From CONTAINERS to LOCAL
set firewall name CONTAINERS-LOCAL default-action 'drop'
set firewall name CONTAINERS-LOCAL description 'From CONTAINERS to LOCAL'
set firewall name CONTAINERS-LOCAL enable-default-log
set firewall name CONTAINERS-LOCAL rule 50 action 'accept'
set firewall name CONTAINERS-LOCAL rule 50 description 'Rule: accept_dhcp'
set firewall name CONTAINERS-LOCAL rule 50 destination port '67,68'
set firewall name CONTAINERS-LOCAL rule 50 protocol 'udp'
set firewall name CONTAINERS-LOCAL rule 50 source port '67,68'
set firewall name CONTAINERS-LOCAL rule 60 action 'accept'
set firewall name CONTAINERS-LOCAL rule 60 description 'Rule: accept_ntp'
set firewall name CONTAINERS-LOCAL rule 60 destination port 'ntp'
set firewall name CONTAINERS-LOCAL rule 60 protocol 'udp'
set firewall name CONTAINERS-LOCAL rule 999 action 'drop'
set firewall name CONTAINERS-LOCAL rule 999 description 'Rule: drop_invalid'
set firewall name CONTAINERS-LOCAL rule 999 state invalid 'enable'
set firewall name CONTAINERS-LOCAL rule 999 log 'enable'

# From CONTAINERS to SERVERS
set firewall name CONTAINERS-SERVERS default-action 'accept'
set firewall name CONTAINERS-SERVERS description 'From CONTAINERS to SERVERS'
set firewall name CONTAINERS-SERVERS rule 999 action 'drop'
set firewall name CONTAINERS-SERVERS rule 999 description 'Rule: drop_invalid'
set firewall name CONTAINERS-SERVERS rule 999 state invalid 'enable'
set firewall name CONTAINERS-SERVERS rule 999 log 'enable'


# From CONTAINERS to WAN
set firewall name CONTAINERS-WAN default-action 'accept'
set firewall name CONTAINERS-WAN description 'From CONTAINERS to WAN'