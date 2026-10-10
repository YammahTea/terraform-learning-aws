output "aws_main_vpc_id" {
  value       = module.network.aws_main_vpc_id
  description = "The ID of the main VPC"
}

output "main_vpc_subnet_ids" {
  value       = module.network.main_vpc_subnet_ids
  description = "The IDs of all subnets in the main VPC"
}

output "main_vpc_internet_gateway_id" {
  value       = module.network.main_vpc_internet_gateway_id
  description = "The ID of the internet gateway in main VPC"
}

output "main_vpc_route_tables_ids" {
  value       = module.network.main_vpc_route_tables_ids
  description = "The IDs of all route tables in the main VPC"
}
