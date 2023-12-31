#!/bin/vbash

# General configuration
set firewall state-policy established action 'accept'
set firewall state-policy related action 'accept'

set firewall group network-group internal_trusted network '192.168.10.0/24'
set firewall group network-group internal_unifi_management network '192.168.1.0/24'

set firewall group address-group nas address '10.1.7.10'

set firewall group network-group k8s_services network '10.45.0.0/16'
set firewall group address-group k8s_api address '10.5.0.2'
set firewall group address-group vyos_bind address '10.5.0.3'
set firewall group address-group vyos_dnsdist address '10.5.0.4'

set firewall group address-group k8s_nodes address '10.1.7.20'
set firewall group address-group k8s_nodes address '10.1.7.21'
set firewall group address-group k8s_nodes address '10.1.7.22'
set firewall group address-group k8s_nodes address '10.1.7.30'
set firewall group address-group k8s_nodes address '10.1.7.31'
set firewall group address-group k8s_nodes address '10.1.7.32'

set firewall group address-group k8s_hass address '192.168.20.151'
set firewall group address-group k8s_ingress address '10.45.0.1'
set firewall group address-group k8s_ingress address '10.45.0.3'
set firewall group address-group k8s_vector_aggregator address '10.45.0.2'
set firewall group address-group k8s_mqtt address '10.45.0.10'
set firewall group address-group k8s_plex address '10.45.0.20'

set firewall group address-group plex_clients address '192.168.30.10'