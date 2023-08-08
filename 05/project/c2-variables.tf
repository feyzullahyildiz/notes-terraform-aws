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

variable "instance_type_list" {
  description = "EC2 Instance Type list"
  type        = list(string)
  default     = ["t3.micro", "t3.small"]
}

variable "instance_type_map" {
  description = "EC2 Instance Type Map"
  type        = map(string)
  default = {
    dev  = "t3.micro"
    qa   = "t3.small"
    prod = "t3.large"
  }
}
