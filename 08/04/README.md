## [<- Geri](../README.md)

# EKS Node Group [(Step 7)](https://github.com/stacksimplify/terraform-on-aws-eks/tree/main/08-AWS-EKS-Cluster-Basics)
- resource "aws_eks_node_group" kullanacağız
- [c5-07-eks-node-group-public.tf](c5-07-eks-node-group-public.tf) dosyasına notlarımı alıyorum.
- [aws docs APIReference/API_Nodegroup.html](https://docs.aws.amazon.com/eks/latest/APIReference/API_Nodegroup.html)
    - amiType diye birşey var. Bu tam olarak nedir anlamadım. EC2'de böyle birşey görmemiştim, onda da olmalı bence.
    - ami yerine amiType veriyoruz galiba, en güncelini sana veriyor. Ben öyle anladım
- capacity_type var
    - ON_DEMAND, production için tavsiye etti ve bunu kullanıyorz
    - SPOT
- disk_size. GB değerinden alıyor. numeric
# Not
Eleman ilginç birşey anlattı. `aws_eks_node_group` için olan ssh-key'i variable olarak vermiyorum dedi. Daha önceden variable olarak oluşturduk var. Ama onu bastion host için kullanıyor olacağız dedi ve buradakini hardcoded olarak bırakmayı tercih etti.

## Devam
Abimiz `c5-08-eks-node-group-private.tf` dosyası da oluşturuyor.
Public dosyasının içindeki herşeyi Copy-Paste yaptı ve bunu oluşturdu. İsimlerinde düzenlemeye gidiyoruz
- name private oluyor
- subnet private subnet oluyor.
- tags içindeki isimi güncelliyor.