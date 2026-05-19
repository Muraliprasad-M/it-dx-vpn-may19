output "dx_gateway_id" {
  description = "DX Gateway ID"
  value       = aws_dx_gateway.dxgw.id
}

output "dx_gateway_association_id" {
  description = "DXGW to TGW association ID"
  value       = aws_dx_gateway_association.dxgw_tgw.id
}

output "transit_vif_ids" {
  description = "Transit VIF IDs"
  value       = aws_dx_transit_virtual_interface.transit_vif[*].id
}

output "transit_vif_names" {
  description = "Transit VIF Names"
  value       = aws_dx_transit_virtual_interface.transit_vif[*].name
}
