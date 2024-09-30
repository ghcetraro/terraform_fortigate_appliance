#
resource "fortios_vpnipsec_phase1interface" "vpnipsec_phase1interface" {
  #
  for_each = var.ipsec_phase1_interfaces
  #
  name        = lookup(each.value, "name", each.key)
  interface   = lookup(each.value, "interface", null)
  comments    = lookup(each.value, "comments", null)
  dhgrp       = lookup(each.value, "dhgrp", null)
  keylife     = lookup(each.value, "keylife", null)
  local_gw    = lookup(each.value, "local_gw", null)
  net_device  = lookup(each.value, "net_device", null)
  peertype    = lookup(each.value, "peertype", null)
  proposal    = lookup(each.value, "proposal", null)
  psksecret   = lookup(each.value, "psksecret", null)
  remote_gw   = lookup(each.value, "remote_gw", null)
  ike_version = lookup(each.value, "ike_version", "2")
}

resource "fortios_vpnipsec_phase2interface" "vpnipsec_phase2interface" {
  #
  for_each = var.ipsec_phase2_interfaces
  #
  add_route                = lookup(each.value, "add_route", "phase1")
  auto_discovery_forwarder = lookup(each.value, "auto_discovery_forwarder", "phase1")
  auto_discovery_sender    = lookup(each.value, "auto_discovery_sender", "phase1")
  auto_negotiate           = lookup(each.value, "auto_negotiate", "disable")
  dhcp_ipsec               = lookup(each.value, "dhcp_ipsec", "disable")
  dhgrp                    = lookup(each.value, "dhgrp", "1")
  dst_addr_type            = lookup(each.value, "dst_addr_type", "subnet")
  dst_end_ip6              = lookup(each.value, "dst_end_ip6", "::")
  dst_port                 = lookup(each.value, "dst_port", "0")
  dst_subnet               = lookup(each.value, "dst_subnet", null)
  encapsulation            = lookup(each.value, "encapsulation", "tunnel-mode")
  keepalive                = lookup(each.value, "keepalive", "disable")
  keylife_type             = lookup(each.value, "keylife_type", "seconds")
  keylifekbs               = lookup(each.value, "keylifekbs", "5120")
  keylifeseconds           = lookup(each.value, "keylifeseconds", "3600")
  l2tp                     = lookup(each.value, "l2tp", "disable")
  name                     = lookup(each.value, "name", each.key)
  pfs                      = lookup(each.value, "pfs", "enable")
  phase1name               = lookup(each.value, "phase1name", each.key)
  proposal                 = lookup(each.value, "proposal", "aes256-sha256")
  protocol                 = lookup(each.value, "protocol", "0")
  replay                   = lookup(each.value, "replay", null)
  route_overlap            = lookup(each.value, "route_overlap", null)
  single_source            = lookup(each.value, "single_source", null)
  src_addr_type            = lookup(each.value, "src_addr_type", "subnet")
  src_end_ip6              = lookup(each.value, "src_end_ip6", "::")
  src_port                 = lookup(each.value, "src_port", "0")
  src_subnet               = lookup(each.value, "src_subnet", null)
}