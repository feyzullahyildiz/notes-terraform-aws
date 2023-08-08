## [<- Geri](../README.md)

## What we are going to learn
- dynamically get last AMI ID
- EC2 Key/Pair
- 2 Security Group. (This is for to demonstrate list items, we could use single one)
    - VPC-SSH
    - VPC-Web
- EC2 will be in a public subnet

## Notlar
- input variables
    - cli ile
        - `terraform apply -var "foo=bar"`
        - `terraform apply -var-file ./auto.tfvars`
    - terraform.tfvars (default file)
- `data resource` kullanımı
    - Veri çekmek
    - başka üst yada ayrılmış terraform configursyonunda kullanlıyor.
    - terraform apply yapmadan önce data içindeki verileri görebiliyoruz. Mesela AMI bulma yapınca apply confirmation öncesi ami'yi görüyoruz
- Key/Pair atama ve kullanımı
    - Key/Pair oluşturuyoruz (AWS Console üzerinden). İsim çok önemli, pem dosyasını indiriyoruz.
    - aws_instance oluştururken `key_name` olarak veriyoruz.
    - kullanıcı adı, `ec2-user` oluyor
    - ~./.ssh/config içine bunu eklersen `ssh ec2` yazarak bağlanırsın
    - ```
        Host ec2
            HostName 44.205.22.141
            User ec2-user
            Port 22
            IdentityFile ~/.ssh/terraform-key.pem ```
    - yada şu şekilde bağlanabilirsin
        - `ssh -i ./pem-file-folder/pemfile.pem ec2-user@44.205.22.141`
    - 
