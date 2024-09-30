#
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.67.0"
      configuration_aliases = [
        aws.devops_shared_us_east_1,
      ]
    }
    fortios = {
      source  = "fortinetdev/fortios"
      version = "1.16.0"
    }
  }
}
#
provider "fortios" {
  token    = var.fortigate_token
  hostname = var.hostname_ip
  insecure = "true"
}
#
