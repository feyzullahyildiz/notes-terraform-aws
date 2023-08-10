locals {
  name        = var.vpc_name
  environment = var.environment
  common_tags = {
    VPC_Name    = var.vpc_name
    Terraform   = "true"
    Environment = "${local.environment}"
  }
}
