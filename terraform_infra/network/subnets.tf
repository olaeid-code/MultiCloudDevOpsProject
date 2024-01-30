# Define public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                 = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = "${var.region}a"
  enable_dns_hostnames = true
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

# Define private subnet
resource "aws_subnet" "private_subnet_b" {
  vpc_id                 = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_b_cidr
    availability_zone       = "${var.region}b"
  tags = {
    Name = "private-subnet"
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id                 = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_c_cidr
    type         = string
    availability_zone       = "${var.region}c"
  tags = {
    Name = "private-subnet"
  }
}
