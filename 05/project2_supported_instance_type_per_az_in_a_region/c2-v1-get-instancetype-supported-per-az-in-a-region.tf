# https://registry.terraform.io/providers/hashicorp/aws/3.0.0/docs/data-sources/ec2_instance_type_offerings

data "aws_ec2_instance_type_offerings" "my_ins_type2" {
  for_each = toset(["us-east-1a", "us-east-1b", "us-east-1e"])
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }
  filter {
    name   = "location"
    values = [each.key]
  }
  location_type = "availability-zone"

}

# output "output_v2_1" {
#   # this is not going to work for for_each
#   # value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types

#   # value = [for t in data.aws_ec2_instance_type_offerings.my_ins_type2: toset(t.filter)]
#   value = [for t in data.aws_ec2_instance_type_offerings.my_ins_type2: t.instance_types]
# }
# # output "output_v2_2_feyz_method" {
# #   value = [for t in data.aws_ec2_instance_type_offerings.my_ins_type2: t.filter]
# # }

# output "output_v2_3" {
#   # for_each'deki her bir veri burada key olarak geliyor galiba
#   value = {
#     for key, value in data.aws_ec2_instance_type_offerings.my_ins_type2: key => value.instance_types
#   }
# }
