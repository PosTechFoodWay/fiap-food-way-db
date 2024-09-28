data "aws_vpc" "base_vpc" {
  filter {
    name = "tag:Name"
    values = ["BaseVPC"]
  }
}

data "aws_subnet" "private_subnet_1" {
  filter {
    name = "vpc_id"
    values = [data.aws_vpc.base_vpc.id]
  }
  filter {
    name = "tag:Name"
    values = ["PrivateSubnet1"]
  }
}

data "aws_subnet" "private_subnet_2" {
  filter {
    name = "vpc_id"
    values = [data.aws_vpc.base_vpc.id]
  }
  filter {
    name = "tag:Name"
    values = ["PrivateSubnet2"]
  }
}