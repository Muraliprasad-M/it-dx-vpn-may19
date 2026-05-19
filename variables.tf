variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "network_account_role" {
  description = "Control Tower execution role in Network account"
  type        = string
}

variable "dx_gateway_name" {
  description = "Direct Connect Gateway name"
  type        = string
  default     = "central-dxgw"
}

variable "amazon_side_asn" {
  description = "ASN for DX Gateway"
  type        = number
  default     = 64512
}

variable "tgw_id" {
  description = "Existing Transit Gateway ID"
  type        = string
}

# HA Inputs
variable "dx_connection_ids" {
  description = "Two DX connection IDs (for HA across locations)"
  type        = list(string)
}

variable "vlans" {
  description = "VLAN IDs per VIF"
  type        = list(number)
}

variable "amazon_ips" {
  description = "Amazon side IPs per VIF (/30)"
  type        = list(string)
}

variable "customer_ips" {
  description = "Customer side IPs per VIF (/30)"
  type        = list(string)
}

variable "onprem_bgp_asn" {
  description = "On-prem BGP ASN"
  type        = number
}

variable "allowed_prefixes" {
  description = "Allowed AWS CIDR prefixes advertised to on-prem"
  type        = list(string)
  default     = ["10.0.0.0/8"]
}
