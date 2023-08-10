## [<- Geri](../README.md)

# Section 7

### Notes

- 9 step var, 5 tanesini izledim. Hiçbirşey yapmadık ya.
- Bastion Host diye birşey var, ne işe yarıyor anlamadım. ec2 instance için module kullanıyor. Proje çok karışık, henüz bir deploy yapmadık diye hatırlıyorum.
- bastion'ın kubernates ile alakası var ellam :D
- Terraform Provisioners Concepts
  - File Provisioner
    - copy files from machine executing Terraform to the nrely crated resource
  - remote-exec
    - invokes a script on a remote resource after it is created
  - local-exec
    - invokes a local executable after a resource is created.
    - the script in current machine not on the resource
  - null_resource
    - if you need to run provisioners that are NOT directly associated with a specific resource.
- passing data into VMs
- running configuration management software (packer, chef, ansible)
- creation-time provisioners
- failure beaviour
  - continue. Ignore the error and continue with creation or destruction
  - fail. Raise an error and stop applying (default)
- `connection block` Bu ne bilmiyorum henüz

### null_resource

```terraform
resource "null_resource" "copy_ec2_keys" {

    depends_on = [module.ec2_public]
    connection {
        type = "ssh"   
        host = aws_eip.bastion_eip.public_id
        user = "ec2-user"
        password = ""
        private_key = file("private-key/eks-terraform-key.pem")
    }

    provisioner "file" {
        source = "private-key/eks-terraform-key.pem"
        destination = "/tmp/eks-terraform-key.pem"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo chmod 400 /tmp/eks-terraform-key.pem"
        ]
    }
    <!-- Burası sadece öğrenmek için -->
    provisioner "local-exec" {
        command = "echo VPC created on `date` and VPC ID = ${module.ec2_public.vpc_id} >> log.txt"
        workin_dir = "local-exec-output-file/"
    }
}
```
