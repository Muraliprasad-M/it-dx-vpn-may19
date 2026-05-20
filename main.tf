############################################
# 1. Direct Connect Gateway (Single Shared)
############################################
resource "aws_dx_gateway" "dxgw" {
  name            = var.dx_gateway_name
  amazon_side_asn = var.amazon_side_asn

  tags = local.tags
}

############################################
# 2. Associate DX Gateway → Transit Gateway
############################################
resource "aws_dx_gateway_association" "dxgw_tgw" {
  dx_gateway_id         = aws_dx_gateway.dxgw.id
  associated_gateway_id = var.tgw_id

  allowed_prefixes = var.allowed_prefixes
}

############################################
# 3. Transit VIFs (HA – Multiple Connections)
############################################

resource "aws_dx_transit_virtual_interface" "transit_vif" {
  count = length(var.dx_connection_ids)

  connection_id  = var.dx_connection_ids[count.index]
  name           = "transit-vif-${count.index}"
  vlan           = var.vlans[count.index]
  address_family = "ipv4"

  bgp_asn = var.onprem_bgp_asn

  amazon_address   = var.amazon_ips[count.index]
  customer_address = var.customer_ips[count.index]
  dx_gateway_id    = aws_dx_gateway.dxgw.id

  tags = merge(
    local.tags,
    {
      Name = "st-ns-prod-dx-vif-${count.index}"   # override per resource
    }
  )
}

