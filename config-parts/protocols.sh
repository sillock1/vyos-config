#!/bin/vbash

# BGP configuration
set protocols bgp neighbor 10.1.7.20 address-family ipv4-unicast
set protocols bgp neighbor 10.1.7.20 description 'polaris'
set protocols bgp neighbor 10.1.7.20 remote-as '64512'
set protocols bgp neighbor 10.1.7.21 address-family ipv4-unicast
set protocols bgp neighbor 10.1.7.21 description 'rigel'
set protocols bgp neighbor 10.1.7.21 remote-as '64512'
set protocols bgp neighbor 10.1.7.22 address-family ipv4-unicast
set protocols bgp neighbor 10.1.7.22 description 'sirius'
set protocols bgp neighbor 10.1.7.22 remote-as '64512'
set protocols bgp neighbor 10.1.7.30 address-family ipv4-unicast
set protocols bgp neighbor 10.1.7.30 description 'mercury'
set protocols bgp neighbor 10.1.7.30 remote-as '64512'
set protocols bgp neighbor 10.1.7.31 address-family ipv4-unicast
set protocols bgp neighbor 10.1.7.31 description 'venus'
set protocols bgp neighbor 10.1.7.31 remote-as '64512'
set protocols bgp neighbor 10.1.7.32 address-family ipv4-unicast
set protocols bgp neighbor 10.1.7.32 description 'earth'
set protocols bgp neighbor 10.1.7.32 remote-as '64512'
set protocols bgp parameters router-id '10.1.0.1'
set protocols bgp system-as '64512'