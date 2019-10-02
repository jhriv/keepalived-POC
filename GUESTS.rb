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
  { name: 'pr-1', box: 'ubuntu/bionic64', ip: '11' },
  { name: 'pr-2', box: 'ubuntu/bionic64', ip: '12' },
  { name: 'pr-3', box: 'ubuntu/bionic64', ip: '13' },
  #{ name: 'web-1', box: 'centos/7', ip: '2' },
  #{ name: 'web-2', ip: '192.168.1.3' },
  #{ name: 'db-1' },
  #{ name: 'app', sync: true, ports: [ 8088, { guest: 80, host: 8000 } ] },
  #{ name: 'datastore', box: 'ubuntu/bionic64', needs_python: true },
]
