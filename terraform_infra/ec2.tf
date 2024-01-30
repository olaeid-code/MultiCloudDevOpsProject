# Define EC2 instance
resource "aws_instance" "my_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id      = module.network.public_subnet.id
  security_group  = [aws_security_group.my_security_group.id]
  key_name        = "my-key-pair"   

  tags = {
    Name = "my-ec2-instance"
  }
}