LAB : Variables :

--- take the ec2 instance from the prev iac code and add a security group to it :

vi firstec2.tf

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "myawsserver" {
  ami = "ami-064ff912f78e3e561"
  instance_type = "t2.micro"

  tags = {
    Name = "Techlanders-aws-ec2-instance"
  }
}

resource "aws_security_group" "var_demo" {
  name        = "raman-variables"
  vpc_id      = "vpc-09db8688d039eb48a"

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
