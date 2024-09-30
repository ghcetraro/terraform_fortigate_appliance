#
resource "fortios_firewallservice_custom" "service" {
  #
  for_each = var.services
  #
  name            = lookup(each.value, "name", each.key)
  category        = lookup(each.value, "category", null)
  protocol        = lookup(each.value, "protocol", null)
  protocol_number = lookup(each.value, "protocol_number", null)
  tcp_portrange   = lookup(each.value, "tcp_portrange")
  iprange         = lookup(each.value, "iprange", null)
  visibility      = lookup(each.value, "visibility", null)
}
