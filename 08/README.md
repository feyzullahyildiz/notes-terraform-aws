## [<- Geri](../README.md)

# AWS EKS CLuster Public Private Node Groups using terraform
- [00](./00/README.md)
    - Genel hazırlıklar
    - ne öğreneceğiz, nasıl yapacağız
    - Büyük resimde neler var
- [01](./01/README.md)
    - IAM Role EKS Cluster
- [02](./02/README.md)
    - IAM Role EKS Node Group
    - Burada role oluştururken `Version` diye bir flag var ve değeri `2012-10-17`. Bu ne şimdi. Bu dosyanın içinde bunun ile alakalı birşeyler yazıyor
- [03](./03/README.md)
    - EKS cluster resource with role assignments.
- [04](./04/README.md)
    - EKS Node Group with role assignments
    - public node group, private node group
- [05](./05/README.md)
    - Genel Review.
    - EKS Cluster ve Node Group network ilişkisi özeti
    - Private NodeGroup ve Nat gateway ilişkisi
- [06 İlk Deploy](./06/README.md)
    - 13 dk sürmüş işlem :D
    - deploy sonrasında parametre kontrolleri

