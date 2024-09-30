#
resource "fortios_firewall_vip" "vip" {
  #
  for_each = var.vips
  #
  name        = lookup(each.value, "name", each.key)
  comment     = lookup(each.value, "comment", null)
  extintf     = lookup(each.value, "extintf", "any")
  extip       = lookup(each.value, "extip", null)
  extport     = lookup(each.value, "extport", "0-65535")
  ldb_method  = lookup(each.value, "ldb_method", null)
  mappedport  = lookup(each.value, "mappedport", "0-65535")
  persistence = lookup(each.value, "persistence", "none")
  portforward = lookup(each.value, "portforward", "disable")
  protocol    = lookup(each.value, "protocol", "tcp")
  server_type = lookup(each.value, "server_type", null)
  # 
  dynamic "realservers" {
    for_each = contains(keys(each.value), "realservers") ? split(" ", each.value["realservers"]) : []
    content {
      ip = realservers.value
    }
  }
  #
  dynamic "monitor" {
    for_each = contains(keys(each.value), "monitor") ? [each.value["monitor"]] : []
    content {
      name = monitor.value
    }
  }
  #
  dynamic "mappedip" {
    for_each = contains(keys(each.value), "mappedip") ? [each.value["mappedip"]] : []
    content {
      range = mappedip.value
    }
  }
  #
  dynamic "service" {
    for_each = contains(keys(each.value), "service") ? [each.value["service"]] : []
    content {
      name = service.value
    }
  }
  #
  type = lookup(each.value, "type", null)
}
