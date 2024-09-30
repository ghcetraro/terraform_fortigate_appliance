resource "fortios_systemsnmp_sysinfo" "trname" {
  status                    = "enable"
  trap_high_cpu_threshold   = 80
  trap_log_full_threshold   = 90
  trap_low_memory_threshold = 80
}
#
resource "fortios_systemsnmp_community" "trname" {
  status           = "enable"
  events           = "cpu-high mem-low log-full intf-ip vpn-tun-up vpn-tun-down ha-switch ha-hb-failure ips-signature ips-anomaly av-virus av-oversize av-pattern av-fragmented fm-if-change fm-conf-change bgp-established bgp-backward-transition ha-member-up ha-member-down ent-conf-change av-conserve av-bypass av-oversize-passed av-oversize-blocked ips-pkg-update ips-fail-open faz-disconnect wc-ap-up wc-ap-down fswctl-session-up fswctl-session-down load-balance-real-server-down device-new per-cpu-high"
  fosid            = 1
  name             = "devops"
  query_v1_port    = 161
  query_v1_status  = "enable"
  query_v2c_port   = 161
  query_v2c_status = "enable"
  trap_v1_lport    = 162
  trap_v1_rport    = 162
  trap_v1_status   = "enable"
  trap_v2c_lport   = 162
  trap_v2c_rport   = 162
  trap_v2c_status  = "enable"
  #
  hosts {
    ha_direct = "disable"
    host_type = "any"
    id        = 1
    ip        = var.snmp_allow_ips
    source_ip = "0.0.0.0"
  }

}