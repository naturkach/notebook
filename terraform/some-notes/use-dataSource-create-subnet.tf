//check: https://registry.terraform.io/providers/aaronfeng/aws/latest/docs/resources/subnet

provider "aws" {}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_vpcs" "my_vpcs" {}

//
data "aws_vpc" "prod_vpc" {
  tags = {
    Name = "prod_vpc"
  }
}

resource "aws_subnet" "prod_subnet_1" {
  vpc_id            = data.aws_vpc.prod_vpc.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name    = "prod subnet-1 in ${data.aws_availability_zones.available.names[0]}"
    account = "acc:${data.aws_caller_identity.current.account_id}"
    region  = data.aws_region.current.name
  }
}

resource "aws_subnet" "prod_subnet_2" {
  vpc_id            = data.aws_vpc.prod_vpc.id
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block        = "10.0.2.0/24"
  tags = {
    Name    = "prod subnet-2 in ${data.aws_availability_zones.available.names[1]}"
    account = "acc:${data.aws_caller_identity.current.account_id}"
    region  = data.aws_region.current.name
  }
}


output "my_vpc_id" {
  value = data.aws_vpc.prod_vpc.id
}

output "my_vpc_cidr" {
  value = data.aws_vpc.prod_vpc.cidr_block
}

output "aws_vpcs" {
  value = data.aws_vpcs.my_vpcs.ids
}

output "data_aws_availability_zones" {
  value = data.aws_availability_zones.available.names
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}

output "data_aws_region_name" {
  value = data.aws_region.current.name
}

output "data_aws_region_description" {
  value = data.aws_region.current.description
}
