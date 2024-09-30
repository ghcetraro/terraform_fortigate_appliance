#
resource "fortios_firewall_policy" "policy" {
  #
  for_each = var.policies
  #
  action             = lookup(each.value, "action ", "accept")
  logtraffic         = lookup(each.value, "logtraffic", "utm")
  name               = lookup(each.value, "name", each.key)
  comments           = lookup(each.value, "comment", "Added by terraform")
  rtp_nat            = lookup(each.value, "rtp_nat", "disable")
  schedule           = lookup(each.value, "schedule", "always")
  wanopt             = lookup(each.value, "wanopt", "disable")
  wanopt_detection   = lookup(each.value, "wanopt_detection", "active")
  wanopt_passive_opt = lookup(each.value, "wanopt_passive_opt", "default")
  wccp               = lookup(each.value, "wccp", "disable")
  webcache           = lookup(each.value, "webcache", "disable")
  webcache_https     = lookup(each.value, "webcache_https", "disable")
  nat                = lookup(each.value, "nat", "disable")
  ippool             = lookup(each.value, "ippool", "disable")

  dynamic "poolname" {
    for_each = contains(keys(each.value), "poolname") ? split(" ", each.value["poolname"]) : []
    content {
      name = poolname.value
    }
  }
  #
  dynamic "dstaddr" {
    for_each = contains(keys(each.value), "dstaddr") ? split(" ", each.value["dstaddr"]) : []
    content {
      name = dstaddr.value
    }
  }

  dynamic "dstintf" {
    for_each = contains(keys(each.value), "dstintf") ? split(" ", each.value["dstintf"]) : []
    content {
      name = dstintf.value
    }
  }

  dynamic "service" {
    for_each = contains(keys(each.value), "service") ? split(" ", each.value["service"]) : []
    content {
      name = service.value
    }
  }

  dynamic "srcaddr" {
    for_each = contains(keys(each.value), "srcaddr") ? split(" ", each.value["srcaddr"]) : []
    content {
      name = srcaddr.value
    }
  }

  dynamic "srcintf" {
    for_each = contains(keys(each.value), "srcintf") ? split(" ", each.value["srcintf"]) : []
    content {
      name = srcintf.value
    }
  }
}
