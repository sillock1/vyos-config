#!/bin/vbash

# from local to wan
set firewall name local-wan default-action accept

# from local to lan
set firewall name local-lan default-action accept

# from local to servers
set firewall name local-servers default-action 'drop'
set firewall name local-servers description 'from local to servers'
set firewall name local-servers enable-default-log
set firewall name local-servers rule 40 action 'accept'
set firewall name local-servers rule 40 description 'rule: accept_dns'
set firewall name local-servers rule 40 destination port 'domain,domain-s'
set firewall name local-servers rule 40 protocol 'tcp_udp'
set firewall name local-servers rule 70 action 'accept'
set firewall name local-servers rule 70 description 'rule: accept_bgp'
set firewall name local-servers rule 70 destination port 'bgp'
set firewall name local-servers rule 70 protocol 'tcp'
set firewall name local-servers rule 100 action 'accept'
set firewall name local-servers rule 100 description 'rule: accept_k8s_api'
set firewall name local-servers rule 100 destination port '6443'
set firewall name local-servers rule 100 protocol 'tcp'
set firewall name local-servers rule 200 action 'accept'
set firewall name local-servers rule 200 description 'rule: accept_vector_syslog'
set firewall name local-servers rule 200 destination group address-group 'k8s_vector_aggregator'
set firewall name local-servers rule 200 destination port '6001'
set firewall name local-servers rule 200 protocol 'tcp'
set firewall name local-servers rule 999 action 'drop'
set firewall name local-servers rule 999 description 'rule: drop_invalid'
set firewall name local-servers rule 999 state invalid 'enable'
set firewall name local-servers rule 999 log 'enable'

# from local to containers
set firewall name local-containers default-action 'accept'
set firewall name local-containers description 'from local to containers'
set firewall name local-containers rule 40 action 'accept'
set firewall name local-containers rule 40 description 'rule: accept_dns'
set firewall name local-containers rule 40 destination port 'domain,domain-s'
set firewall name local-containers rule 40 protocol 'tcp_udp'
set firewall name local-containers rule 999 action 'drop'
set firewall name local-containers rule 999 description 'rule: drop_invalid'
set firewall name local-containers rule 999 state invalid 'enable'
set firewall name local-containers rule 999 log 'enable'

# from lan to wan
set firewall name lan-wan default-action accept

# from lan to local
set firewall name lan-local default-action accept

# from lan to servers
set firewall name lan-servers default-action 'drop'
set firewall name lan-servers description 'from lan to servers'
set firewall name lan-servers enable-default-log
set firewall name lan-servers rule 999 action 'drop'
set firewall name lan-servers rule 999 description 'rule: drop_invalid'
set firewall name lan-servers rule 999 state invalid 'enable'
set firewall name lan-servers rule 999 log 'enable'

# from lan to containers
set firewall name lan-containers default-action 'drop'
set firewall name lan-containers description 'from lan to containers'
set firewall name lan-containers enable-default-log
set firewall name lan-containers rule 999 action 'drop'
set firewall name lan-containers rule 999 description 'rule: drop_invalid'
set firewall name lan-containers rule 999 state invalid 'enable'
set firewall name lan-containers rule 999 log 'enable'

# from servers to lan
set firewall name servers-lan default-action 'drop'
set firewall name servers-lan description 'from servers to lan'
set firewall name servers-lan enable-default-log
set firewall name servers-lan rule 999 action 'drop'
set firewall name servers-lan rule 999 description 'rule: drop_invalid'
set firewall name servers-lan rule 999 state invalid 'enable'
set firewall name servers-lan rule 999 log 'enable'

# from servers to local
set firewall name servers-local default-action 'drop'
set firewall name servers-local description 'from servers to local'
set firewall name servers-local enable-default-log
set firewall name servers-local rule 50 action 'accept'
set firewall name servers-local rule 50 description 'rule: accept_dhcp'
set firewall name servers-local rule 50 destination port '67,68'
set firewall name servers-local rule 50 protocol 'udp'
set firewall name servers-local rule 50 source port '67,68'
set firewall name servers-local rule 60 action 'accept'
set firewall name servers-local rule 60 description 'rule: accept_ntp'
set firewall name servers-local rule 60 destination port 'ntp'
set firewall name servers-local rule 60 protocol 'udp'
set firewall name servers-local rule 70 action 'accept'
set firewall name servers-local rule 70 description 'rule: accept_bgp'
set firewall name servers-local rule 70 destination port 'bgp'
set firewall name servers-local rule 70 protocol 'tcp'
set firewall name servers-local rule 80 action 'accept'
set firewall name servers-local rule 80 description 'rule: accept_tftp'
set firewall name servers-local rule 80 destination port '69'
set firewall name servers-local rule 80 protocol 'udp'
set firewall name servers-local rule 100 action 'accept'
set firewall name servers-local rule 100 description 'rule: accept_node_exporter_from_k8s_nodes'
set firewall name servers-local rule 100 destination port '9100'
set firewall name servers-local rule 100 protocol 'tcp'
set firewall name servers-local rule 100 source group address-group 'k8s_nodes'
set firewall name servers-local rule 110 action 'accept'
set firewall name servers-local rule 110 description 'rule: accept_speedtest_exporter_from_k8s_nodes'
set firewall name servers-local rule 110 destination port '9798'
set firewall name servers-local rule 110 protocol 'tcp'
set firewall name servers-local rule 110 source group address-group 'k8s_nodes'
set firewall name servers-local rule 999 action 'drop'
set firewall name servers-local rule 999 description 'rule: drop_invalid'
set firewall name servers-local rule 999 state invalid 'enable'
set firewall name servers-local rule 999 log 'enable'

# from servers to containers
set firewall name servers-containers default-action 'accept'
set firewall name servers-containers description 'from servers to containers'
set firewall name servers-containers enable-default-log
set firewall name servers-containers rule 40 action 'accept'
set firewall name servers-containers rule 40 description 'rule: accept_dns'
set firewall name servers-containers rule 40 destination port 'domain,domain-s'
set firewall name servers-containers rule 40 protocol 'tcp_udp'
set firewall name servers-containers rule 100 action 'accept'
set firewall name servers-containers rule 100 description 'rule: accept_k8s_nodes'
set firewall name servers-containers rule 100 protocol 'tcp'
set firewall name servers-containers rule 100 source group address-group 'k8s_nodes'
set firewall name servers-containers rule 999 action 'drop'
set firewall name servers-containers rule 999 description 'rule: drop_invalid'
set firewall name servers-containers rule 999 state invalid 'enable'
set firewall name servers-containers rule 999 log 'enable'

# from servers to wan
set firewall name servers-wan default-action 'accept'
set firewall name servers-wan description 'from servers to wan'

# from wan to local
set firewall name wan-local default-action drop
set firewall name wan-local rule 5 action accept
set firewall name wan-local rule 5 state established enable
set firewall name wan-local rule 5 state related enable
set firewall name wan-local rule 5 description "allow est/related traffic"
set firewall name wan-local rule 20 protocol icmp
set firewall name wan-local rule 20 state new enable
set firewall name wan-local rule 20 action accept
set firewall name wan-local rule 30 action accept
set firewall name wan-local rule 30 description 'accept ssh from trusted'
set firewall name wan-local rule 30 source group network-group internal_trusted
set firewall name wan-local rule 30 destination port 22
set firewall name wan-local rule 30 protocol tcp
set firewall name wan-local rule 30 state new enable
set firewall name wan-local rule 30 state established enable
set firewall name wan-local rule 30 state related enable

# from wan to servers
set firewall name wan-servers default-action drop
set firewall name wan-servers rule 5 action accept
set firewall name wan-servers rule 5 state established enable
set firewall name wan-servers rule 5 state related enable
set firewall name wan-servers rule 5 state new enable
set firewall name wan-servers rule 5 description "allow est/related/new traffic from trusted vlan"
set firewall name wan-servers rule 5 source group network-group internal_trusted
set firewall name wan-servers rule 10 action accept
set firewall name wan-servers rule 10 state established enable
set firewall name wan-servers rule 10 state related enable
set firewall name wan-servers rule 10 state new enable
set firewall name wan-servers rule 10 description "allow http/s from trusted vlan"
set firewall name wan-servers rule 10 destination port 80
set firewall name wan-servers rule 10 destination port 443
set firewall name wan-servers rule 10 protocol tcp
set firewall name wan-servers rule 10 source group network-group internal_trusted
#Allow IoT to servers
set firewall name wan-servers rule 20 action 'accept'
set firewall name wan-servers rule 20 description 'Rule: accept_plex_from_plex_clients'
set firewall name wan-servers rule 20 destination group address-group 'k8s_plex'
set firewall name wan-servers rule 20 destination port '32400'
set firewall name wan-servers rule 20 protocol 'tcp'
set firewall name wan-servers rule 20 source group address-group 'plex_clients'

# from wan to containers
set firewall name wan-containers default-action 'accept'
set firewall name wan-containers description 'from wan to containers'
set firewall name wan-containers rule 40 action 'accept'
set firewall name wan-containers rule 40 description 'rule: accept_dns'
set firewall name wan-containers rule 40 destination port 'domain,domain-s'
set firewall name wan-containers rule 40 protocol 'tcp_udp'
set firewall name wan-containers rule 999 action 'drop'
set firewall name wan-containers rule 999 description 'rule: drop_invalid'
set firewall name wan-containers rule 999 state invalid 'enable'
set firewall name wan-containers rule 999 log 'enable'

set firewall name wan-lan rule 5 action accept
set firewall name wan-lan rule 5 state established enable
set firewall name wan-lan rule 5 state related enable
set firewall name wan-lan rule 5 description "allow est/related traffic"
set firewall name wan-lan rule 20 protocol icmp
set firewall name wan-lan rule 20 state new enable
set firewall name wan-lan rule 20 action accept
set firewall name wan-lan rule 30 source group network-group internal_trusted
set firewall name wan-lan rule 30 action accept
set firewall name wan-lan rule 30 destination port 22
set firewall name wan-lan rule 30 protocol tcp
set firewall name wan-lan rule 30 state new enable
set firewall name wan-lan rule 30 state established enable
set firewall name wan-lan rule 30 state related enable
set firewall name wan-lan rule 40 action accept
set firewall name wan-lan rule 40 description 'accept proxmox management ui from trusted'
set firewall name wan-lan rule 40 source group network-group internal_trusted
set firewall name wan-lan rule 40 destination port 8006
set firewall name wan-lan rule 40 protocol tcp
set firewall name wan-lan rule 40 state new enable
set firewall name wan-lan rule 40 state established enable
set firewall name wan-lan rule 40 state related enable

#unifi port forwarding

set firewall name wan-lan default-action 'drop'
set firewall name wan-lan description 'from wan to lan'
set firewall name wan-lan enable-default-log
set firewall name wan-lan rule 50 action accept
set firewall name wan-lan rule 50 description 'accept dns for guest portal redirection, downloading updates, and remote access'
set firewall name wan-lan rule 50 source group network-group internal_unifi_management
set firewall name wan-lan rule 50 destination port 53
set firewall name wan-lan rule 50 protocol tcp_udp
set firewall name wan-lan rule 50 state new enable
set firewall name wan-lan rule 50 state established enable
set firewall name wan-lan rule 50 state related enable

set firewall name wan-lan rule 51 action accept
set firewall name wan-lan rule 51 description 'used stun'
set firewall name wan-lan rule 51 source group network-group internal_unifi_management
set firewall name wan-lan rule 51 destination port 3478
set firewall name wan-lan rule 51 protocol udp
set firewall name wan-lan rule 51 state new enable
set firewall name wan-lan rule 51 state established enable
set firewall name wan-lan rule 51 state related enable

set firewall name wan-lan rule 52 action accept
set firewall name wan-lan rule 52 description 'used remote syslog capture'
set firewall name wan-lan rule 52 source group network-group internal_unifi_management
set firewall name wan-lan rule 52 destination port 5514
set firewall name wan-lan rule 52 protocol udp
set firewall name wan-lan rule 52 state new enable
set firewall name wan-lan rule 52 state established enable
set firewall name wan-lan rule 52 state related enable

set firewall name wan-lan rule 53 action accept
set firewall name wan-lan rule 53 description 'used for device and application communication'
set firewall name wan-lan rule 53 source group network-group internal_unifi_management
set firewall name wan-lan rule 53 destination port 8080
set firewall name wan-lan rule 53 protocol tcp
set firewall name wan-lan rule 53 state new enable
set firewall name wan-lan rule 53 state established enable
set firewall name wan-lan rule 53 state related enable

set firewall name wan-lan rule 54 action accept
set firewall name wan-lan rule 54 description 'applications running on a unifi console'
set firewall name wan-lan rule 54 source group network-group internal_unifi_management
set firewall name wan-lan rule 54 destination port 443
set firewall name wan-lan rule 54 protocol tcp
set firewall name wan-lan rule 54 state new enable
set firewall name wan-lan rule 54 state established enable
set firewall name wan-lan rule 54 state related enable

set firewall name wan-lan rule 55 action accept
set firewall name wan-lan rule 55 description 'used for device discovery.'
set firewall name wan-lan rule 55 source group network-group internal_unifi_management
set firewall name wan-lan rule 55 destination port 10001
set firewall name wan-lan rule 55 protocol udp
set firewall name wan-lan rule 55 state new enable
set firewall name wan-lan rule 55 state established enable
set firewall name wan-lan rule 55 state related enable

set firewall name wan-lan rule 56 action accept
set firewall name wan-lan rule 56 description 'applications running on a unifi console'
set firewall name wan-lan rule 56 source group network-group internal_unifi_management
set firewall name wan-lan rule 56 destination port 8443
set firewall name wan-lan rule 56 protocol tcp
set firewall name wan-lan rule 56 state new enable
set firewall name wan-lan rule 56 state established enable
set firewall name wan-lan rule 56 state related enable
set firewall name wan-lan rule 999 action 'drop'
set firewall name wan-lan rule 999 description 'rule: drop_invalid'
set firewall name wan-lan rule 999 state invalid 'enable'
set firewall name wan-lan rule 999 log 'enable'


# from containers to lan
set firewall name containers-lan default-action 'drop'
set firewall name containers-lan description 'from containers to lan'
set firewall name containers-lan enable-default-log
set firewall name containers-lan rule 999 action 'drop'
set firewall name containers-lan rule 999 description 'rule: drop_invalid'
set firewall name containers-lan rule 999 state invalid 'enable'
set firewall name containers-lan rule 999 log 'enable'

# from containers to local
set firewall name containers-local default-action 'drop'
set firewall name containers-local description 'from containers to local'
set firewall name containers-local enable-default-log
set firewall name containers-local rule 50 action 'accept'
set firewall name containers-local rule 50 description 'rule: accept_dhcp'
set firewall name containers-local rule 50 destination port '67,68'
set firewall name containers-local rule 50 protocol 'udp'
set firewall name containers-local rule 50 source port '67,68'
set firewall name containers-local rule 60 action 'accept'
set firewall name containers-local rule 60 description 'rule: accept_ntp'
set firewall name containers-local rule 60 destination port 'ntp'
set firewall name containers-local rule 60 protocol 'udp'
set firewall name containers-local rule 999 action 'drop'
set firewall name containers-local rule 999 description 'rule: drop_invalid'
set firewall name containers-local rule 999 state invalid 'enable'
set firewall name containers-local rule 999 log 'enable'

# from containers to servers
set firewall name containers-servers default-action 'accept'
set firewall name containers-servers enable-default-log
set firewall name containers-servers description 'from containers to servers'
set firewall name containers-servers rule 999 action 'drop'
set firewall name containers-servers rule 999 description 'rule: drop_invalid'
set firewall name containers-servers rule 999 state invalid 'enable'
set firewall name containers-servers rule 999 log 'enable'


# from containers to wan
set firewall name containers-wan default-action 'accept'
set firewall name containers-wan enable-default-log
set firewall name containers-wan description 'from containers to wan'