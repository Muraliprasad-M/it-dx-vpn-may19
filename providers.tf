provider "aws" {
  region = var.region

  assume_role {
    role_arn = var.network_account_role
  }
}
