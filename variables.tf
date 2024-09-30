#
variable "hostname_ip" {}
variable "snmp_allow_ips" {}
variable "fortigate_token" {}
#
variable "access_lists" {
  type    = map(any)
  default = {}
}
#
variable "adddress_groups" {
  type    = map(any)
  default = {}
}
#
variable "vips" {
  type    = map(any)
  default = {}
}
#
variable "policies" {
  type    = map(any)
  default = {}
}
#
variable "services" {
  type    = map(any)
  default = {}
}
#
variable "routes" {
  type    = map(any)
  default = {}
}
#
variable "ipsec_phase1_interfaces" {
  type    = map(any)
  default = {}
}
#
variable "ipsec_phase2_interfaces" {
  type    = map(any)
  default = {}
}
#
variable "ldb_monitors" {
  type    = map(any)
  default = {}
}
#
variable "ippools" {
  type    = map(any)
  default = {}
}
#
variable "aws_profile" {
  type    = string
  default = "devops-shared-services"
}
#
