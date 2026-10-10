resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name_tag}-public-rt-1"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name_tag}-private-rt-1"
  }
}

resource "aws_route" "igw_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "rt_associations" {
  # associates all subnets with either the public or private route_table based on if it is public or not
  for_each = aws_subnet.main_vpc_subnets

  subnet_id      = each.value.id
  route_table_id = each.value.map_public_ip_on_launch ? aws_route_table.public_route_table.id : aws_route_table.private_route_table.id
}
