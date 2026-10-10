output "aws_main_vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the main VPC"
}

output "main_vpc_subnet_ids" {
  value = {
    for subnet in aws_subnet.main_vpc_subnets :
    subnet.tags["Name"] => subnet.id
  }
  description = "A map of subnet names in the main VPC to their respective IDs"
}

output "main_vpc_internet_gateway_id" {
  value       = aws_internet_gateway.igw.id
  description = "The ID of the internet gateway in the main VPC"
}

output "main_vpc_route_tables_ids" {
  value = {
    for route_table in [aws_route_table.private_route_table, aws_route_table.public_route_table] :
    route_table.tags["Name"] => route_table.id
  }
  description = "A map of route tables names in the main VPC to their respective IDs"
}
