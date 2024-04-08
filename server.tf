resource "aws_instance" "this" {
  ami                     = "ami-080e1f13689e07408"
  instance_type           = "t2.micro"

  tags= {

  Name="ajit-test-server"
  }
}
