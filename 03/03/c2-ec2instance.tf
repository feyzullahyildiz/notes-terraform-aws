# https://github.com/stacksimplify/terraform-on-aws-eks/blob/main/02-Terraform-Basics/02-03-Terraform-Language-Syntax/terraform-manifests/top-level-blocks-samples.tf

resource "aws_instance" "myec2vm" {
  ami = "ami-0742b4e673072066f"
  instance_type = "t3.micro"
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    Name = "EC2 Demo"
  }
}