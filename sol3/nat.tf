# nat gw
resource "aws_eip" "kiunsen-nat-ip" {
  vpc = true
}

# NAT는 
# 1. Public Subnet에 위치(독자 Pirvate IP를 가짐)
# 2. EIP를 할당 받고
# 3. 인터넷 연결을 위해선는 Public Subnet의 Instance와 동일하게 I-GW연결
resource "aws_nat_gateway" "kiunsen-nat-gw" {
  allocation_id = aws_eip.kiunsen-nat-ip.id
  subnet_id     = aws_subnet.kiunsen-public[0].id
  depends_on    = [aws_internet_gateway.kiunsen-gw] 
}

# VPC setup for NAT
resource "aws_route_table" "kiunsen-private-route" {
  vpc_id = aws_vpc.kiunsen-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.kiunsen-nat-gw.id
  }

  tags = {
    Name = "kiunsen-private-route"
  }
}

# route associations private subnet
resource "aws_route_table_association" "kiunsen-private" {
  count          = length(aws_subnet.kiunsen-private)
  subnet_id      = aws_subnet.kiunsen-private[count.index].id
  route_table_id = aws_route_table.kiunsen-private-route.id
}