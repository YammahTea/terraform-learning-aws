resource "aws_subnet" "main_vpc_subnets" {
  vpc_id = aws_vpc.main.id

  for_each = var.subnets

  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = each.value.is_public_subnet

  availability_zone = each.value.availability_zone

  tags = {
    Name = "${var.name_tag}-subnet-${each.key}"
  }

}
