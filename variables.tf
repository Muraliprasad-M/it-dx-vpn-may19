variable "region" { default = "eu-west-2" }
variable "network_account_role" {}
variable "dx_gateway_name" { default = "central-dxgw" }
variable "amazon_side_asn" { default = 64512 }
variable "tgw_id" {}
variable "dx_connection_id" {}
variable "vlan" {}
variable "onprem_bgp_asn" {}
variable "amazon_ip" {}
variable "customer_ip" {}
variable "allowed_prefixes" { type = list(string) default = ["10.0.0.0/8"] }
