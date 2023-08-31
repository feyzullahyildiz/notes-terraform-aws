## [<- Geri](../README.md)

# Büyük Resim
- Pre-requisite Resources (Önkoşul kaynaklar)
    - VPC
        - Subnets (Public / Private)
        - Route Tables
        - Nat Gateway / Elastic IP
        - Internet Gateway
    - Bastion Host (Optional diyor kardeş)
        - Bastion Host EC2 instance
        - Bastion Host Security Group
        - Bastion Host Elastic IP
- EKS Resources
    - EKS Cluster
        - EKS Cluster IAM Role
        - EKS Cluster Security Group 
        - EKS Cluster Network Interfaces
        - EKS Cluster
            - Bunu create edince `Security Group` ve `Network Interfaces` kendi kendine oluşacakmış
            - IAM Role ve EKS Cluster'ı oluşturacağız galiba
    - EKS Node Group
        - EKS Node Group IAM Role
        - EKS Node Group Security Group
        - EKS Node Group Network Interfaces
        - EKS Worker Nodes EC2 Intances
            - `Security Group` ve `Network Interfaces` otomatik oluşturulacakmış
        
---
Section 6'da, ne yaptıysak üzerine koyacağız.
- VPC oluşturmuştuk
    - Private, Public, Database subnetleri vardı.
    - Nat Gateway, Elastic IP, Internate Gateway
    - Security Grouplar ve Route tabellar
---
Secion 7'de Bastion host tanımlamıştık.
- Bastion EC2 Instance oluşlturduk
- içine public mi private key'i mi ne attık
- Buralara düzgün not almamışım, key nerede oluştu falan filan hiç hatırlamıyorum
---
Section 8, yani burası
- Kendi oluşturduğumuz birinci VPC için `VPC-1` diyorum.
- bir tane daha VPC oluşturuyoruz, `Amazon EKS`. İçinde `EKS Control Plane` var.
- **`EKS Elastic Network Interface` ve `EKS Cluster Security Group`**
    - `EKS Control Plane` <--> `EKS Elastic Network Interface`
    - Galiba `VPC-1` içine, (public subnet ile ilişlilendiriliyor olabilir) `EKS Elastic Network Interface` ekleniyor.
    - Bu `EKS Elastic Network Interface` içine de `EKS Cluster Security Group` oluşmuş olacak. Bu ikisi otomatik olacak demiştik. Yukarıda yazıyor.
    - Bu ikili sayesinde `Amazon EKS VPC` içindeki `EKS Control Plane` `VPC-1`'e erişebiliyor diye anlıyorum (resimden bunu çıkartıyorum)
    - Bunlar oluşurken, `Identity and Access Management (IAM)` ile birşeyler yapılacak.
    - `IAM Role for EKS Cluster` ile uğraşacağız
- **EKS Node Group in Public Subnets**
    - `EKS Control Plane` <-- `EKS Node Group`
        - Public Node Group - Access to EKS API Server Endpoint (yazıyordu ok'un üzerinde)
    - EKS Worker Node'lar buradalar.
    - `Public NG Security Group` - Port 22 Destination 0.0.0.0/0 ayarları var.
    - `IAM Role for EKS Node Groups` ile uğraşacağız
- **Amazon Elastic Container Registry (Amazon ECR)**
    - böyle birşey var. Bence Docker Image Registry gibi birşey
- **EKS Node Group in Private Subnets**
    - `EKS Control Plane` <-- `EKS Node Group`
        - Buradaki OK biraz daha farklı. NAT Gateway üzerinden geçtiğini görüyoruz.
        - Private Node Group - Access to EKS API Server Endpoint via NAT Gateway
        - Bir ilginç not daha. Her ne kadar NAT gateway üzerinden gitsede bu istek AWS Cloud içinde kalıyor. Dışarıya çıkmıyormuş
    - Burada da EKS Worker Node'lar var. Ama daha çok DB gibi şeyleri koyacağız gibi gözüküyor.
    - `Private NG Security Group` - Port 22 Destination 0.0.0.0/0 ayarları var.
- **Peki biz nasıl bağlanacağız :D**
    - Tabiki `kubectl` kullanacağız. Ve bağlantı direk olarak `EKS Control Plane`'e yapılacak.
    - `EKS Control Plane`'in Server endpointleri Public oluyormuş

## Ne öğreneceğiz
- Define EKS Variables
- Define IAM Roles for EKS Cluster and Node Groups
- *Create EKS Security Groups - `Placeholder file`*
    - Şimdilik bu dosya boş dosyaymış. Çok anlamadım
- Define EKS Cluster TF Configs
- *Define Node Group in Public Subnet*
- Define Node Group in Private Subnet
- *EKS Variables autoload during Terraform apply*
- EKS Outputs