# https://github.com/stacksimplify/terraform-on-aws-eks/blob/main/02-Terraform-Basics/02-03-Terraform-Language-Syntax/terraform-manifests/top-level-blocks-samples.tf

terraform {
  required_version = ">= 1.0.0" 
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = ">= 3.0"
      version = ">= 4.65"
    }
  } 
}  
# Provider Block
provider "aws" {
  region = "us-east-1"
}