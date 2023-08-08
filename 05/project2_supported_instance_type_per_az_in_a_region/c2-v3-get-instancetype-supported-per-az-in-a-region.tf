# https://registry.terraform.io/providers/hashicorp/aws/3.0.0/docs/data-sources/ec2_instance_type_offerings
/*
# Buradaki amacımız şöyle
Availability zoneları region'a göre otomatik çekmek
Buradaki tüm AZ'lere bakarak ec2 instancelarını görmek.
Bunların hangisinde t3.micro varsa sadece onları listelemek

*/

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones#by-filter
data "aws_availability_zones" "my_availability_zones" {
  # provider'daki region'a bakıyor ellam. Sadece oradaki AZ'ler geliyor.
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }

}

output "log_az" {
  value = data.aws_availability_zones.my_availability_zones.names
}

data "aws_ec2_instance_type_offerings" "ec2_list" {
  for_each = toset(data.aws_availability_zones.my_availability_zones.names)
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


output "log_ec2s" {
  value = {
    for key, value in data.aws_ec2_instance_type_offerings.ec2_list : key => value.instance_types
  }
}

output "log_ec2s_filtered_v1" {
  value = {
    for key, value in data.aws_ec2_instance_type_offerings.ec2_list :
    key => value.instance_types if length(value.instance_types) != 0
  }
}

# Valueları veriyor sadeceee
output "log_ec2s_filtered_v2" {
  description = "Only supported AZs WOW"
  value = keys({
    for key, value in data.aws_ec2_instance_type_offerings.ec2_list :
    key => value.instance_types if length(value.instance_types) != 0
  })
}
output "log_ec2s_filtered_v3" {
  description = "Only supported AZs WOW (LAST INDEX)"
  value = keys({
    for key, value in data.aws_ec2_instance_type_offerings.ec2_list :
    key => value.instance_types if length(value.instance_types) != 0
  })[0]
}
