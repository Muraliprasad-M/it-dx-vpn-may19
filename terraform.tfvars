region = "eu-west-2"
network_account_role = "arn:aws:iam::<network-account-id>:role/AWSControlTowerExecution"

tgw_id = "tgw-xxxxxxxx"
dx_connection_id = "dxcon-xxxxxxx"

vlan = 101
onprem_bgp_asn = 65010

amazon_ip   = "169.254.100.1/30"
customer_ip = "169.254.100.2/30"

allowed_prefixes = ["10.0.0.0/8"]
