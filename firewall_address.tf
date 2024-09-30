#
resource "fortios_firewall_address" "address" {
  #
  for_each = var.access_lists
  #
  name          = lookup(each.value, "name", each.key)
  allow_routing = lookup(each.value, "allow_routing", "disable")
  type          = lookup(each.value, "type", null)
  visibility    = lookup(each.value, "visibility", null)
  subnet        = lookup(each.value, "subnet", null)
  comment       = lookup(each.value, "comment", null)
  start_ip      = lookup(each.value, "start_ip", null)
  end_ip        = lookup(each.value, "end_ip", null)
}
#
resource "fortios_firewall_addrgrp" "addressgrp" {
  #
  for_each = var.adddress_groups
  #
  name          = lookup(each.value, "name", each.key)
  allow_routing = lookup(each.value, "allow_routing", "disable")
  visibility    = lookup(each.value, "visibility", null)
  comment       = lookup(each.value, "comment", null)

  dynamic "member" {
    for_each = each.value["members"]
    content {
      name = member.value
    }
  }
}
