https://github.com/stacksimplify/terraform-on-aws-eks/blob/main/02-Terraform-Basics/02-03-Terraform-Language-Syntax/terraform-manifests/top-level-blocks-samples.tf

- fundamental blocks
  - Terraform block
    - buradaki herşey hardcoded olması lazımmış. variables'dan falan alınmaz diyor eleman
  - provider block
  - resources block
- varibale blocks
  - input variables
  - output values
  - local values
- calling / Referencing blocks
  - data sources blocks
  - modules blocks

Terraform 0.12'den sonra `terraform block` gelmiş
- ESKİ 0.12 ve öncesi
```
provider "aws" {
    version = "~> 3.0"
    region = "us-east-1"
}
```
- YENİ 0.13 ve sonrası
```hcl
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}
```

# Terraform backend
- terraform state'ini tutmak için kullanılıyor.
- Eğer tanımlanmaz ise, localde tutulur. Ama s3'e falan verebililiyormuşuz WOW
- ```hcl
    terraform {
        required_providers {
            aws = {
                source = "hashicorp/aws"
                version = "~> 3.0"
            }
        }
        backend "s3" {
            bucket = "mybucket"
            key = "path/to/my/key"
            region = "us-east-1"
        }
    }
    ```

