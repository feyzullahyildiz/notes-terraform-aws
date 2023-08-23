# Create AWS EKS Cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = "${local.name}-${var.cluster_name}"
  role_arn = aws_iam_role.eks_master_role.arn
  version  = var.cluster_version

  vpc_config {
    # TODO Bu değer önemli
    # EKS'nin Elastic Network interface'i hangi subnette olacağını söylüyoruz.
    # public subnete koyduk
    subnet_ids = module.vpc.public_subnets


    endpoint_private_access = var.cluster_endpoint_private_access
    # Bunu demo için açmıştık
    endpoint_public_access = var.cluster_endpoint_public_access

    # Whitelist Black list olayı. Demoda bu şekilde [0.0.0.0/0]
    public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  }

  # TODO Optional ama eklesek güzel olur. IP range
  kubernetes_network_config {
    service_ipv4_cidr = var.cluster_service_ipv4_cidr
  }

  # Enable EKS Cluster Control Plane Logging
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  #   Burada role'e değil de. policy attachment'a depend olmuş durumdayız. Çok mantıklı.
  # Yukarıda zaten role var. Ama policy ekledikten sonra oluşturmak zorundayız.
  # Zaten bunlar da role'e depend olmuş durumdalar
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController,
  ]
}
