#!/bin/vbash

set system domain-name 'pill.ac'
set system host-name 'gateway'

set system ipv6 disable-forwarding

set system login user vyos authentication public-keys personal key 'AAAAC3NzaC1lZDI1NTE5AAAAINMHWTH8wM3398bWCPXSIZtDl/aAORGMXEwJkIJ5YWnE'
set system login user vyos authentication public-keys personal type 'ssh-ed25519'

set system name-server '1.1.1.1'

set system sysctl parameter kernel.pty.max value '24000'

set system time-zone 'Europe/London'