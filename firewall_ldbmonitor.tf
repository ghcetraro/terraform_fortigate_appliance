#
resource "fortios_firewall_ldbmonitor" "ldb" {
  #
  for_each = var.ldb_monitors
  #
  name               = lookup(each.value, "name", each.key)
  type               = lookup(each.value, "type", "tcp")
  interval           = lookup(each.value, "interval", null)
  timeout            = lookup(each.value, "timeout", null)
  retry              = lookup(each.value, "retry", null)
  port               = lookup(each.value, "port", 0)
  http_get           = lookup(each.value, "http_get", null)
  http_match         = lookup(each.value, "http_match", null)
  http_max_redirects = lookup(each.value, "http_match", null)
}
