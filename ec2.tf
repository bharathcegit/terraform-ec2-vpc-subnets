resource "aws_instance" "app" {
    ami                     = var.ami_id
    instance_type           = var.instance_type
    key_name                = var.key_name
    security_groups         = [aws_security_group.app_security_group.id]
    subnet_id               = aws_subnet.public_subnet_1.id
    associate_public_ip_address = true

    tags      = {
        Name = var. app_instance_name
    } 

}



resource "aws_instance" "lb" {
    ami                     = var.ami_id
    instance_type           = var.instance_type
    key_name                = var.key_name
    security_groups         = [aws_security_group.lb_security_group.id]
    subnet_id               = aws_subnet.public_subnet_2.id
    associate_public_ip_address = true

    tags      = {
        Name = var.lb_instance_name
    } 
}  


resource "aws_security_group" "app_security_group" {
  vpc_id      = aws_vpc.main_vpc.id
  name = "app_sg"
  description = "security group that allows ssh and all egress traffic"
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
    cidr_blocks = ["49.204.239.163/32"]
  }

   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.lb_security_group.id]
  }
   ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.lb_security_group.id]
  }

}



resource "aws_security_group" "lb_security_group" {
  vpc_id      = aws_vpc.main_vpc.id
  name = "lb_sg"
  description = "security group that allows ssh and all egress traffic"
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
    cidr_blocks = ["49.204.239.163/32"]
  }
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
