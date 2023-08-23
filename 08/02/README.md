## [<- Geri](../README.md)

# IAM role for EKS Node Group [(Step 4)](https://github.com/stacksimplify/terraform-on-aws-eks/tree/main/08-AWS-EKS-Cluster-Basics)
- Bunları oluşturacağız
    - EKS Node Group IAM Role
    - EKS Node Group
- Öncelikle `role` oluşturuyoruz.
    - `resource` ile `aws_iam_role` kullanıyoruz.
    - `name` ve `assume_role_policy` parametreleri var.
    - `assume_role_policy` json tipinde bir veri ve `jsonencode` function'ını kullandık
    ```
    resource "aws_iam_role" "eks_nodegroup_role" {
        name = "${local.name}-eks-nodegroup-role"
        assume_role_policy = jsonencode({
            Statement = [{
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    // BURASI İlginç, diğerinde `eks.amaozonaws.com` yazıyordu
                    Service = "ec2.amazonaws.com" 
                }
            }]
            Version = "2012-10-17"
        })
    }
    ```
- Rol oluşturduk, policy ekleyeceğiz. Bu sefer 3 tane, neden ? Bilmiyorum :D
- Bu 3 Policy de amazon managed
    - `AmazonEKSWorkerNodePolicy`
        - Bu policy detayında fark ettim. Version diye birşey var. Ve içinde 2012-10-17 yazıyor. Yukarıda oluşturduğumuz role ile aynı tarih
        - Detayı; *This policy allows Amazon EKS worker nodes to conect to Amazon EKS Clusters*
        - Actions:
            - [EC2] Describe Instances
            - [EC2] Describe Route Tables
            - [EC2] Describe Security Groups
            - [EC2] Describe Volumns
            - [EC2] Describe Volumns Modifications
            - [EC2] Describe Vpcs
            - [EC2] Describe Cluster
    - `AmazonEKS_CNI_Policy`
        - Detayı; This policy provides the Amazon VPC CNI Plugin (amazon-vpc-cni-k8s) the permissions it requires to modify the IP addresses configuration on your EKS
        - Actions: (Resource *)
            - [EC2] Assign Private IP Addresses
            - [EC2] Network Interface modifications
            - [EC2] ...
        - Actions: (Resource (arn:aws:ec2:*:*:network-interface/*))
            - [EC2] Create Tags
    - `AmazonEC2ContainerRegistryReadOnly`
        - Detayı; Provides read-only access to Amazon EC2 Container Registry repositories
        - Actions: (Resource *)
            - [ECR] GetAuthToken
            - [ECR] ListImages
            - [ECR] DescribeImages
            - [ECR] ...

### Soru
- Bu rolü oluşturduk, policy'leri verdik. Herşey tamam kafamda oturdu. Ama bu role içindeki `Principal.Service` nedir aga. "ec2.amazonaws.com" yazıyor
