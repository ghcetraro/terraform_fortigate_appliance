#
resource "fortios_firewall_ippool" "ippools" {
  #
  for_each = var.ippools
  #
  name                = lookup(each.value, "name", each.key)
  arp_reply           = lookup(each.value, "arp_reply", "enable")
  block_size          = lookup(each.value, "block_size", "128")
  endip               = lookup(each.value, "endip", "1.0.0.20")
  num_blocks_per_user = lookup(each.value, "num_blocks_per_user", "8")
  pba_timeout         = lookup(each.value, "pba_timeout", "30")
  permit_any_host     = lookup(each.value, "permit_any_host", "disable")
  source_endip        = lookup(each.value, "source_endip", "0.0.0.0")
  source_startip      = lookup(each.value, "source_startip", "0.0.0.0")
  startip             = lookup(each.value, "startip", "1.0.0.0")
  type                = lookup(each.value, "type", "overload")
}
#