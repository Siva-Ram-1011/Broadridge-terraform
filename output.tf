LAB :EC2 instance with output value and attributes :     

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ajit-server" {
  ami = "ami-080e1f13689e07408"
  instance_type = "t2.micro"

  tags = {
    Name = "ajit-aws-ec2-instance"
  }
}

output "ajit-server-ip" {
  value = [aws_instance.ajit-server.public_ip]
}

output "myawsserver-type" {
  value = [aws_instance.ajit-server.instance_type]
}


