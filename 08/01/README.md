## [<- Geri](../README.md)
[REPO terraform-on-aws-eks/08-AWS-EKS-Cluster-Basics](https://github.com/stacksimplify/terraform-on-aws-eks/tree/main/08-AWS-EKS-Cluster-Basics)
# EKS variables - EKS Cluster IAM Role [(Step 2-3)](https://github.com/stacksimplify/terraform-on-aws-eks/tree/main/08-AWS-EKS-Cluster-Basics)
- Bunları oluşturacağız.
    - EKS Cluster IAM Role
    - EKS Cluster
    - EKS Node Group IAM Role           // Bu ikisi sonraki videoda
    - EKS Node Group                    // Bu ikisi sonraki videoda
- Network Interfaceler ve Security Grouplar kendiliğinden oluşacaklar
- Repodan önceki sectionlarda oluşturduğumuz dosyaları alacağız
- terraform tarafındaki bazı ayarlar
    - `cluster_endpoint_public_access` değeri default `false` olmalı
    - `cluster_endpoint_private_access` değeri default `true` olmalı
    - Bu ayarlar ile endpointleri public yapmış oluyoruz. İleride bunun detaylı örneklerine değineceğiz. Diğer varyasyonlarını inceleyeceğiz.
    - Bu değerler `c5-01-eks-variables.tf` dosyasında variable olarak tanımlı ve default değerleri var.
    - IP için white list yapabiliyoruz. `cluster_endpoint_public_access_cidrs` değişkeni ile. `c5-01-eks-variables.tf`
- IAM Groupları
    - `c5-03-iamrole-for-eks-cluster.tf`
    - Burada `aws_iam_role` resource'u kullanıyoruz. Ve Role oluşturuyoruz.
    - `aws_iam_role_policy_attachment` diye ayrı bir resource var.
        - Önceki `role` ile `bir parametre` daha alıyor. `policy_arn`; bu değer hardcoded. İzin verilen şeyin adı gibi duruyor.
        - Bu role için 2 tane `aws_iam_role_policy_attachment` yaptık
            - *eks-AmazonEKSClusterPolicy* (AWS managed Policy)
                - k8s ec2 instance create etmek zorunda kalıyor. Mesela yeni node ekleyecek veya çıkaracak. AWS tarafından k8s'in ihtiyacı olan ne izin var ise bu Policy içine konmuş. Bunu extend etmek zorunda kalmıyorsun. Bunu direk kullan geç demiş AWS abimiz.
            - *eks-AmazonEKSVPCResourceController* (AWS managed Policy)
                - Network interface oluşturmak, atamak, silmek gibi şeyler için rolleri var.
