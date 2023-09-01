## [<- Geri](../README.md)

Bu section'da burayı anlatıyor olacağız. [github.com/terraform-on-aws-eks/08-AWS-EKS-Cluster-Basics](https://github.com/stacksimplify/terraform-on-aws-eks/blob/main/08-AWS-EKS-Cluster-Basics/README.md)

# AWS EKS CLuster Public Private Node Groups using terraform
- [00 Büyük Resim](./00/README.md)
    - Genel hazırlıklar
    - ne öğreneceğiz, nasıl yapacağız
    - Büyük resimde neler var
- [01 EKS variables - EKS Cluster IAM Role (Step 2-3)](./01/README.md)
    - IAM Role EKS Cluster
- [02 IAM role for EKS Node Group (Step 4)](./02/README.md)
    - IAM Role EKS Node Group
    - Burada role oluştururken `Version` diye bir flag var ve değeri `2012-10-17`. Bu ne şimdi. Bu dosyanın içinde bunun ile alakalı birşeyler yazıyor
- [03 EKS Cluster Terraform Resource (Step 5-6)](./03/README.md)
    - EKS cluster resource with role assignments.
- [04 EKS Node Group (Step 7-8)](./04/README.md)
    - EKS Node Group with role assignments
    - public node group, private node group
- [05 Review variables and EKS Outputs (STEP 9-10)](./05/README.md)
    - Genel Review.
    - EKS Cluster ve Node Group network ilişkisi özeti
    - Private NodeGroup ve Nat gateway ilişkisi
- [06 İlk Deploy (STEP 11-12)](./06/README.md)
    - 13 dk sürmüş işlem :D
    - deploy sonrasında parametre kontrolleri
- [06_not Genel özet, yorum ve dosyalar](./06_not/README.md)
