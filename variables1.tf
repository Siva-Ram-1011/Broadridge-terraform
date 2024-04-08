LAB : Variables :

--- take the ec2 instance from the prev iac code and add a security group to it :

vi firstec2.tf

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ajit-server" {
  ami = "ami-080e1f13689e07408"
  instance_type = "t2.micro"

  tags = {
    Name = "ajit-ec2-instance"
  }
}

resource "aws_security_group" "var_demo" {
  name        = "ajit-variables"
  vpc_id      = ""

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }

  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }
}


--- variables.tf file to avoid hard coding of values :

variable "vpn_ip" {
  default = "116.50.30.70/32"
}

---- try changing the value in variables.tf file to see the changes .

*********************************************************************
