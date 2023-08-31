## [<- Geri](../README.md)

# İlk Deploy (STEP 11-12)
- Deployu gerçekleştirdik
- outputlara bakıyoruz
    - `cluster_endpoint` Bu arkadaş bir url veriyor ki baya bi uzun.
        - https://9CE9D3E0F6A7E60C90484D9B2B5931DA.gr7.us-east-1.eks.amazonaws.com
        - Doğru yazmaya çalıştım, url bu. Ve buna nslookup yapıyor.
- AWS Panelinden EKS servisine girip kontrol ediyoruz.
    - Node groupları görüyoruz. Her birinden 1 tane node var.
    - node_group resource'unda `scaling_config.desired_size` değeri 1
    - 2 Tane Node Gorup
    - 3 tane EC2 instance görüyoruz.
        - Instancelardan bir tanesi Bastion Host için kullanıyor
        - 1 tanesi `public subnetteki` node
            - Burada 2 tane private address atanmış durumda.
                - 10.0.101.174
                - 10.0.101.137
            - Ve 1 tane Public IP var 18.213.246.128
        - 1 tanesi `private subnetteki` node
            - private ip değeri
                - 10.0.1.153
        - Bu değerlere vpc module'ündeki değerler ile karşılaştırarak baktım.

# EKS Workloads
- Arayüzden girince böyle bir sekme çıkıyor ve içinde 3 tane workload var.

| name       | namespace   | type       | Pod Count |
|------------|-------------|------------|-----------|
| coredns    | kube-system | Deployment | 2         |
| aws-node   | kube-system | DaemonSet  | 2         |
| kube-proxy | kube-system | DaemonSet  | 2         |
--- 
**DaemonSet will be created on every worker node**
Bunlar ile alakalı birşeyler anlattı ama pek anlamadım. Şuanda pek lazım değil sanki.
