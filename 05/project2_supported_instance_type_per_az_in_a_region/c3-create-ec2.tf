resource "aws_instance" "my_ec2_instances" {
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t3.micro"
  for_each = toset(keys({
    for key, value in data.aws_ec2_instance_type_offerings.ec2_list :
    key => value.instance_types if length(value.instance_types) != 0
  }))
  availability_zone = each.key

  tags = {
    Name = "HelloWorld-${each.key}"
  }
}
