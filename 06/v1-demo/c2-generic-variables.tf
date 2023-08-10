variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "my-vpc-name"
}
variable "environment" {
  description = "Environment"
  type        = string
  default     = "DEV"
}
variable "region" {
  description = "region"
  type        = string
  default     = "us-east-1"
}
