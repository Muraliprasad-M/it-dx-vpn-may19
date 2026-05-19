resource "aws_dx_gateway" "dxgw" {
  name            = var.dx_gateway_name
  amazon_side_asn = var.amazon_side_asn

  tags = {
    Name        = var.dx_gateway_name
    Environment = "network"
    ManagedBy   = "terraform"
  }
}

resource "aws_dx_gateway_association" "dxgw_tgw" {
  dx_gateway_id         = aws_dx_gateway.dxgw.id
  associated_gateway_id = var.tgw_id

  allowed_prefixes = var.allowed_prefixes
}

resource "aws_dx_transit_virtual_interface" "transit_vif" {
  connection_id  = var.dx_connection_id
  name           = "transit-vif-hub"
  vlan           = var.vlan
  address_family = "ipv4"

  bgp_asn = var.onprem_bgp_asn

  amazon_address   = var.amazon_ip
  customer_address = var.customer_ip

  dx_gateway_id = aws_dx_gateway.dxgw.id

  tags = {
    Name = "transit-vif-hub"
  }
}
