## [<- Geri](../README.md)

# Burada ilginç şeyler öğrendim.
- iki dosyayı da terraform apply diyince okudu veyayınlamaya başladı.
- t3.micro N.Virginia'da aktif çalışıyor
- EC2'yi yayınladıktan sonra 80 portunu açmamız gerekiyordu
    - AWS Console'dan yaptık, terrform ile değil
    - inctance ayarlarına girdik
    - Security
    - inbound rules kısmında security group var
    - Source kısmındaki isime tıklayıp security gruba gidiyoruz
    - Edit inbound rules
    - Add rule butonuna basıyoruz
    - HTTP 80 portunu, 0.0.0.0/0 için aktif ediyoruz
    - ve çalışyor
- Daha ilginç bir olay var.
- `app1-install.sh` içindeki son satırı incele
- EC2 açıldıktan sonra, 169.254.169.254 adresinine curl ile istek atıyor
- burada gelen dosyadan gelen response'u html dosyasına basıyor
- responsedan gelen şey json ve ec2 ile alakalı bilgiler içeriyor
- mesela, public ip, id falan filan 