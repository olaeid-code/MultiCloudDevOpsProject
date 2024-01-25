resource "aws_route_table" "public_routes" {
    vpc_id = var.aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }
    tags {
        "public_route_table"
    }

resource "aws_route_table_association" "public_subnet_association"{
    subnet_id = aws_subnet.public_subnet_id
    aws_route_table_id = aws_route_table.public_routes_id
}
}