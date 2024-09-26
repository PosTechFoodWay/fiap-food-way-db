data "aws_subnet" "private_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["PrivateSubnet1"]
  }
}

data "aws_subnet" "private_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["PrivateSubnet2"]
  }
}

data "aws_vpc" "base_vpc" {
  filter {
    name   = "tag:Name"
    values = ["Base VPC"]
  }
}