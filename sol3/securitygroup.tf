resource "aws_security_group" "allow-ssh-http" {
  
  vpc_id      = aws_vpc.kiunsen-vpc.id
  
  name        = "allow-ssh-http"
  description = "security group that allows ssh, http and all egress traffic"
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { 
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh-http"
  }
}

resource "aws_security_group" "allow-mysql" {

  vpc_id      = aws_vpc.kiunsen-vpc.id
  
  name        = "allow-mysql"
  description = "security group that allows mysql port and public-zone egress traffic"
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { 
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [
        for subnet in aws_subnet.kiunsen-public:
        subnet.cidr_block
      ]
  }

  ingress { 
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = [
        for subnet in aws_subnet.kiunsen-public:
        subnet.cidr_block
      ]
  }

  tags = {
    Name = "allow-mysql"
  }
}

