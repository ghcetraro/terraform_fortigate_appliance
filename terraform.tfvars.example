#
hostname_ip     = "<ip server>"
snmp_allow_ips  = "<ip server> <mask>"
fortigate_token = " "
#
#################################################################
# Polcy & Objects / Addresses / IP Range/Subnet
access_lists = {
  "Inbound_ip" = {
    comment       = "Subnet del tunel de VPN",
    subnet        = "1.1.1.1 255.255.255.255"
    allow_routing = "disable"
  },
}
#
#################################################################
# Polcy & Objects / Addresses / Address Group
adddress_groups = {
  "group_a" = {
    members = [
      "server_01",
    ],
    comment = "group a"
  },
}
#################################################################
# Polcy & Objects | Virtual Ips
#
vips = {
  "server_01" = {
    extip    = "9.1.1.1",
    mappedip = "10.1.1.1",
    extintf  = "client_01"
  },
}
#################################################################
# VPN / Ipsec Tunnels - funciona
ipsec_phase1_interfaces = {
  "client_01" = {
    interface   = "port1",
    peertype    = "any",
    net_device  = "disable",
    proposal    = "aes256-sha256",
    remote_gw   = "170.1.1.1",
    psksecret   = "1234567890",
    ike_version = "2",
    dhgrp       = "21",
  },
}
#
ipsec_phase2_interfaces = {
  "client_01" = {
    proposal       = "aes256-sha256",
    keylifeseconds = "3600",
    dhgrp          = "21"
    dst_subnet     = "0.0.0.0 0.0.0.0"
  },
}
#################################################################
# Polcy & Objects | Firewall Policy
policies = {
  "inbound_nat" = {
    srcintf = "port2",
    dstintf = "client_01",
    #
    srcaddr = "server_private_ip",
    dstaddr = "all"
    #
    service = "ALL",
    #
    nat           = "enable"
    ippool        = "enable"
    poolname      = "server_nat"
    comment       = "Added by terraform",
    allow_routing = "enable"
    logtraffic    = "utm"
  },
}
#################################################################
# Network / Static Routes
routes = {
  "Cigna_40" = {
    device   = "client_01",
    distance = 10,
    dst      = "170.1.1.1 255.255.255.255",
  },
}
#
#################################################################
# Polcy & Objects | IP Pools
ippools = {
  "Server_Prod_nat" = {
    arp_reply           = "enable"
    block_size          = "128"
    endip               = "18.1.1.1"
    num_blocks_per_user = "8"
    pba_timeout         = "30"
    permit_any_host     = "disable"
    source_endip        = "0.0.0.0"
    source_startip      = "0.0.0.0"
    startip             = "18.1.1.1"
    type                = "overload"
  },
}