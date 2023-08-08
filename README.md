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
- [04](./03/README.md)
    - Security Group
    - Variables
    - Output
    - Search AMI by name
    - 