## [<- Geri](../README.md)

[project2_supported_instance_type_per_az_in_a_region](./project2_supported_instance_type_per_az_in_a_region/README.md)
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
    - [for_each](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each#basic-syntax)
        - set yada map kabul ediyor. list veremezsinnnn
        - toset'ten geçirmen gerekebilir
        - map verisilse farklı set verilirse farklı syntax'ı var.
        - ```
            # Map: (each.key NOT equals each.value)
            resource "azurerm_resource_group" "rg" {
                for_each = {
                    a_group = "eastus"
                    another_group = "westus2"
                }
                name     = each.key
                location = each.value
            }
            ```
        - ```
            # Set of strings: (each.key equals each.value)
            resource "aws_iam_user" "the-accounts" {
                for_each = toset( ["Todd", "James", "Alice", "Dottie"] )
                name     = each.key
            }
        ```
    - toset
        - mixed-typed elements will be converted to most general type
        - toset(["a", "b", 3, "b"]) => ["a", "b", "3"]
    - tomap
    - aws_availability_zones