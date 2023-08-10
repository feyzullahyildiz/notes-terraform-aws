module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"

  name            = "${local.name}-${local.environment}"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]


  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = ["10.0.21.0/24", "10.0.22.0/24"]


  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true


  private_subnet_tags = {
    Type = "${local.name}-private-subnet"
  }
  public_subnet_tags = {
    Type = "${local.name}-public-subnet"
  }
  database_subnet_tags = {
    Type = "${local.name}-database-subnet"
  }

  tags = local.common_tags
  vpc_tags = {
    Name = local.name
  }

}
