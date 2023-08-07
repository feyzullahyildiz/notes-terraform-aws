# https://github.com/stacksimplify/terraform-on-aws-eks/blob/main/02-Terraform-Basics/02-02-Terraform-Command-Basics/terraform-manifests/ec2-instance.tf
# Terraform settings block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "ec2demo" {

  ami           = "ami-0533f2ba8a1995cf9" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
}
