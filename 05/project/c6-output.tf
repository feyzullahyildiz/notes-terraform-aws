# OUTPUT - For Loop with List

output "for_output_list_public_dns" {
    description = "For loop with List"
    value = [for instance in aws_instance.myec2: instance.public_dns]
}

output "for_output_list_public_ip" {
    description = "For loop with List"
    value = [for instance in aws_instance.myec2: instance.public_ip]
}
