LAB :EC2 instance with output value and attributes :     

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ajit-test-server" {
  ami = ""
  instance_type = "t2.micro"

  tags = {
    Name = "ajit-aws-ec2-instance"
  }
}

output "myawsserver-ip" {
  value = [aws_instance.myawsserver.public_ip]
}

output "myawsserver-type" {
  value = [aws_instance.myawsserver.instance_type]
}

resource "aws_eip" "lb" {
  vpc      = true
}

output "eip" {
  value = aws_eip.lb
}

resource "aws_s3_bucket" "mys3" {
  bucket = "ramnn"
}

