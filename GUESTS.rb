# -*- mode: ruby -*-
# vi: set ft=ruby :

# List guests here, one per record.
# name: (REQUIRED), name of the box
# box: (optional), box to build from. Default DEFAULT_BOX
# ip: (optional), IP address for local networking. Can be full dotted quad,
#     the last octet, which will be appended to the IP_NETWORK environmental
#     variabl, or 'dhcp'. Default none.
# ports: (optional), Array of ports to forward. Can either be integers, or a
#     hash with supported options. Default none (ssh only)
# sync: (optional) Should /vagrant be mounted? Default false
# update: (optional) Updates all pacakges. Default false
# needs_python: (optional) Install python packages? Default false
#     (Debian/Ubuntu only)
# If there are multiple systems, the first one will be marked "primary"

GUESTS = [
  # proxy / front ends
  { name: 'pr-1', box: 'ubuntu/bionic64', ip: '11' },
  { name: 'pr-2', box: 'ubuntu/bionic64', ip: '12' },
  { name: 'pr-3', box: 'ubuntu/bionic64', ip: '13' },
  # back end webservers
  { name: 'be-1', box: 'ubuntu/bionic64', ip: '31' },
  { name: 'be-2', box: 'ubuntu/bionic64', ip: '32' },
  { name: 'be-3', box: 'ubuntu/bionic64', ip: '33' },
]
