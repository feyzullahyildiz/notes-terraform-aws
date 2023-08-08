data "aws_availability_zones" "my_azones" {
  # names - List of the Availability Zone names available to the account.
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

resource "aws_instance" "myec2" {
  ami = data.aws_ami.amzlinux2.id
  # instance_type          = var.instance_type
  instance_type = var.instance_type_list[1] # FOR List
  # instance_type = var.instance_type_map["prod"] # FOR Map
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  for_each               = toset(data.aws_availability_zones.my_azones.names)
  availability_zone      = each.key
  tags = {
    Name = "for_each-Demo-${each.value}"
  }
}
