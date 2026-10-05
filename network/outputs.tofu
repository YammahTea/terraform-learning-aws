output "aws_main_vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the main VPC"
}

output "subnet_ids" {
  value       = { for subnet in aws_subnet.main_vpc_subnets : subnet.tags["Name"] => subnet.id }
  description = "A map of subnet names in the main VPC to their respective IDs"
}