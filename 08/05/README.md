## [<- Geri](../README.md)

# Review variables and EKS Outputs

- `eks.auto.tfvars` adında bir dosyamız var.
  - bunların hepsi variable olarak tanımlanmış oluyor (c5-01-eks-variables.tf).
  - endpoint private access'i kapattık. public olanı açtık
  - ip range için `cluster_service_ipv4_cidr` parametresi var.
  - public_api endpointlere erişmek için ip sıkalası belirledik. White-Black list gibi
    - şuanki değer ["0.0.0.0/0"]
  - `cluster_version` var. Eğitimde 1.21 kullanıyor. Güncel olan 1.27
- public networkun açık olması ve onu kullanmamız şu demek oluyor.
    - EKS Node groupları EKS'ye giderken public bir şekilde gidiyor.
    - Farklı VPC'ye gidiyor
    - Ama Tüm network AWS Cloud içinde kalıyor.
    - Lokalimdeki makinadan EKS Cluster'a bağlanmak için de bunu yapmam lazım
- private endpoint access ve NAT gateway ilişkisi.
    - private node groups EKS Cluster'a erişmesi için. Public subnet (yada herneyse) onun içine girmesi gerekiyor ve public endpoint'i çağırıyor. Bu public subnet içine girmesi için NAT Gatewaye bağlanıyor. Ben öyle anladım.
**GALİBA Aydınlama yaşadım**

# Output
- `c5-02-eks-outputs.tf` bu dosyaya koyduk işte.