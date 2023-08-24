# Create AWS EKS Node Group - Public
resource "aws_eks_node_group" "eks_ng_public" {
  # resource -> aws_eks_cluster'dan alıyor. (c5-06-eks-cluster.tf)
  cluster_name = aws_eks_cluster.eks_cluster.name

  node_group_name = "${local.name}-eks-ng-public"
  # IAM için oluşturduğumuz role     değeri
  node_role_arn = aws_iam_role.eks_nodegroup_role.arn
  # public subnette oluşmasını istiyoruz.
  subnet_ids = module.vpc.public_subnets
  # Buradan custom verion verebiliyoruz
  #version = var.cluster_version #(Optional: Defaults to EKS Cluster Kubernetes version)    

  # https://docs.aws.amazon.com/eks/latest/APIReference/API_Nodegroup.html
  ami_type       = "AL2_x86_64"
  
  # iki tip varmış bundan. SPOT ve ON_DEMAND. 
  capacity_type  = "ON_DEMAND"
  disk_size      = 20
  instance_types = ["t3.medium"]

  # EC2 içinde KEY-PAIR oluşturmuşduk. Burada bu şekilde veriyoruz.
  remote_access {
    ec2_ssh_key = "eks-terraform-key"
  }

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }

  # Desired max percentage of unavailable worker nodes during node group update.
  update_config {
    max_unavailable = 1
    #max_unavailable_percentage = 50    # ANY ONE TO USE
  }

  # Burası çok mantıklı. Role oluşturulduktan sonra policy atamalarını bekliyor.
  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = {
    Name = "Public-Node-Group"
  }
}
