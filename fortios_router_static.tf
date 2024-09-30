#
resource "fortios_router_static" "route" {
  #
  for_each = var.routes
  #
  device              = lookup(each.value, "device")
  dstaddr             = lookup(each.value, "dstaddr", null)
  dst                 = lookup(each.value, "dst", "0.0.0.0 0.0.0.0")
  comment             = lookup(each.value, "comment", null)
  bfd                 = lookup(each.value, "bfd", "disable")
  blackhole           = lookup(each.value, "blackhole", "disable")
  distance            = lookup(each.value, "distance", "10")
  dynamic_gateway     = lookup(each.value, "dynamic_gateway", "disable")
  gateway             = lookup(each.value, "gateway", null)
  link_monitor_exempt = lookup(each.value, "link_monitor_exempt", "disable")
  priority            = lookup(each.value, "priority", null)
  seq_num             = lookup(each.value, "seq_num", null)
  src                 = lookup(each.value, "src", null)
  status              = lookup(each.value, "status", "enable")
  virtual_wan_link    = lookup(each.value, "virtual_wan_link", null)
  weight              = lookup(each.value, "weight", null)
  #dynamic_sort_subtable = lookup(each.value, "dynamic_sort_subtable", null)
  provider = fortios
}
#