region = "eu-west-2"

network_account_role = "arn:aws:iam::<network-account-id>:role/AWSControlTowerExecution"

tgw_id = "tgw-xxxxxxxx"

# ✅ HA: Two DX connections (different DX locations)
dx_connection_ids = [
  "dxcon-aaaa1111",
  "dxcon-bbbb2222"
]

# ✅ VLAN per connection
vlans = [101, 102]

# ✅ On-prem ASN
onprem_bgp_asn = 65010

# ✅ /30 link-local IPs for BGP sessions
amazon_ips = [
  "169.254.100.1/30",
  "169.254.101.1/30"
]

customer_ips = [
  "169.254.100.2/30",
  "169.254.101.2/30"
]

# ✅ AWS CIDRs advertised to on-prem
allowed_prefixes = [
  "10.0.0.0/8"
]
