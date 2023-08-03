#!/bin/vbash

set firewall group network-group INTERNAL_TRUSTED network '192.168.10.0/24'
set firewall group network-group INTERNAL_UNIFI_MANAGEMENT network '192.168.1.0/24'

set firewall group address-group nas address '10.1.7.10'

set firewall group network-group k8s_services network '10.45.0.0/16'
set firewall group address-group k8s_api address '10.5.0.2'

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