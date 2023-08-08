## [<- Geri](../README.md)

# Notes
- variable types
    - map(string)
    - ```
        variable "instance_type_map" {
            description = "EC2 Instance Type list"
            type        = map(string)
            default = {
                dev = "t3.micro"
                qa = "t3.small"
                prod = "t3.large"
            }
        }```
    - list(string)
    - ```
        variable "instance_type_map" {
            description = "EC2 Instance Type list"
            type        = list(string)
            default     = ["t3.micro", "t3.small"]
        }```
    - for_each
    - toset
    - tomap
    - aws_availability_zones