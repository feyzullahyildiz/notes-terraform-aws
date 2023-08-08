variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Region in which AWS Resources to be created"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
  type        = string
  # validation {
  # }
}

variable "instance_keypair" {
  description = "AWS EC2 Key Pair"
  type        = string
  default     = "terraform-key"
}
