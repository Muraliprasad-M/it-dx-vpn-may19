
locals {
  common_tags = {
    BusinessUnit        = "infrastructure"
    SystemDomain        = "it"
    BusinessCriticality = "t1"
    ManagedBy           = "terraform"
    Environment         = "prod"
  }

  resource_name = "st-ns-prod-dx"

  # Final merged tags (recommended pattern ✅)
  tags = merge(
    local.common_tags,
    {
      Name = local.resource_name
    }
  )
}
