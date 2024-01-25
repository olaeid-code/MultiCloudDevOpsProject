output vpc_id {
  value       = aws_vpc.my-vpc.id
}

output public-subnet_id {
  value       = aws_subnet.public_subnet.id
}

output private_subnet_b_id {
  value       = aws_subnet.private_subnet_b.id
}

output private_subnet_c_id {
  value       = aws_subnet.private_subnet_c_id 
}