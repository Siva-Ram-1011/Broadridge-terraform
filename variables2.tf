--LAB :Different Approaches for Variable Assignment :

--- Default File used in Demo

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "myawsserver" {
  ami = "ami-064ff912f78e3e561"
  instance_type = var.type

  tags = {
    Name = "Techlanders-aws-ec2-instance"
  }
}

--variables.tf file

variable "type" {
default = "t2.micro"
}



-- custom.tfvars file :

type="t2.large"


-- terraform.tfvars file: takes the value from this file if default value is nt specified.

type="t2.nano"

--CLI Commands

terraform plan -var="type=t2.small"
terraform plan -var-file="custom.tfvars"

***************************************************************************

Lab : Fetching data from map and list in variable :

--- config code : use of list variable block

provider "aws" {
  region     = "us-east-2"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = var.list[2]
}

variable "list" {
  type = list
  default = ["m5.large","m5.xlarge","t2.medium"]
}

variable "types" {
  type = map
  default = {
    us-east-1 = "t2.micro"
    us-west-2 = "t2.nano"
    ap-south-1 = "t2.small"
  }
}


---- now try using types variable block

---- instance_type = var.types["us-west-2"] instead of instance_type = var.list[2]

*********************************************************************************************
