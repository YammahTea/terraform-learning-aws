output "aws_main_vpc_id" {
  value       = module.network.aws_main_vpc_id
  description = "The ID of the main VPC"
}

output "subnet_ids" {
  value       = module.network.subnet_ids
  description = "The IDs of all subnets in the main VPC"
}