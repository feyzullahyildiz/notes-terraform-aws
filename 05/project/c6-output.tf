# OUTPUT - For Loop with List

output "for_output_list" {
    description = "For loop with List"
    value = [for instance in aws_instance.myec2: instance.public_dns]
}