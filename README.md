[Eğitimizi](https://www.udemy.com/course/terraform-on-aws-eks-kubernetes-iac-sre-50-real-world-demos) aldık, başladım bakalım


- GITHUB Repository: [terraform-on-aws-eks](https://github.com/stacksimplify/terraform-on-aws-eks)
- GITHUB Repository: [terraform-on-aws-ec2](https://github.com/stacksimplify/terraform-on-aws-ec2)
- Course Presentation: [Presentation Slides PPT](https://github.com/stacksimplify/terraform-on-aws-eks/tree/main/course-presentation)
- Kubernetes Fundamentals GitHub Repository: [kubernetes-fundamentals](https://github.com/stacksimplify/kubernetes-fundamentals)
- Kubernetes Fundamentals Presentation: [Presentation Slides](https://github.com/stacksimplify/kubernetes-fundamentals/tree/master/presentation)


Notlar: 
- arguments
    - kullanılan resource'a özel (mesela aws) argumentler
- meta-arguments
    - terraform'a özel argumentler
    - `depends-on`

### argument-reference vs attribute-reference
- [aws_instance docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance.html#argument-reference) burada, 2 değeri de göreceksin. argumentler, senin verdiğin (input) veriler mesela ami değeri. attribute-reference denilen şey mesela public_ip (output), bunlar readonly, instance oluştuktan sonra okuyabileceğin değerler diye anladım ben


Özet
- [03](./03/README.md)
    - AWS arayüzdünden Security Group ve inbounds rule ekleme
    - instace'ın içinden erişilen apiler
- [04](./04/README.md)
    - Security Group
    - Variables
    - Output
    - Search AMI by name
- [05](./05/README.md)
    - meta args like count and count.index
    - variable types in a list.
    - availability zones
    - `aws_ec2_instance_type_offerings` `aws_availability_zones`
    - filter with `aws ec2` cli
    - Region'a göre AZ listeleme. EC2 support listeme.
    - Arrayde length kontrolü
    - Map to MapValues
- [06](./06/README.md)
- [07](./07/README.md)
- [08](./08/README.md) EKS ile terraform
- [09 Uçtan uca kubernetes](./09/README.md)


# Sorular
- High Availability, Reliability nedir
    - High Availability: bir sistemde arıza olsa bile kesintisiz şekilde çalışmabilmesi yeteneği.
    - Reliability: istikrarlı çalışma yeteneği
- availability-zone vs location. Bunlar aynı şey mi
    - her regiona ait az'ler var ve suffix olarak a, b ile başlıyor ve devamı oluyor çoğunlukla
    - AZ ile location aynı şeymi acaba ???
    - Galiba location diye birşey yok. Şu komut kafa karıştırıyor.
        - ```t
            aws ec2 describe-instance-type-offerings --location-type availability-zone  --filters Name=instance-type,Values=t3.micro --region us-east-1 --output table
          ```
    - us-east-1 için bazı AZ'ler yada locationlar
        - us-east-1a
        - us-east-1b
        - us-east-1f
        - us-east-1c
        - us-east-1d
- availability-zone'ın olayı ne ? Ne işe yarıyor. Hangi resource'lar AZ'ye ihtiyacı var, hangi resourceların region'a ihtiyacı var
- `kubectl set image` için `--record=true` deprecated olmuş. Bu değeri vermeyince rollout historyde gözükmüyor, bu olayı nasıl çözeriz..
- k8s yaml dosyasında RS yada Deployment düşün. İçine template diye bir kısım giriyoruz ve burada pod için bir bölüm var. Pod'a neden ports diye bir kısım veriyoruz ve neden burada containerPort diye bir değer veriyoruz. Zaten bir service oluşturduğumuz zaman, port, targetPort ve nodePort diye 3 tane portumuz var. Bu ne ola, 4. port mu var ?