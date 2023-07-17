resource "aws_route_table" "public-crt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"                 # associated subnet can reach everywhere
    gateway_id = aws_internet_gateway.igw.id # uses this IGW to reach internet
  }

  tags = {
    Name = "public-crt"
  }
}

resource "aws_route_table_association" "crta-public-subnet" {
  count          = 2
  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.public-crt.id
}