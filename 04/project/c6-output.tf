output "instance_public_ip" {
    description = "EC2 Public IP"
    value = aws_instance.myec2.public_ip
}

output "instance_public_dns" {
    description = "EC2 Public DNS"
    value = aws_instance.myec2.public_dns
}
