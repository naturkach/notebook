provider "aws" {
  region = "eu-north-1"
}

module "vpc-default" {
  source = "../modules/aws_network"
}

module "vpc-qa" {
  source               = "../modules/aws_network"
  #source               = "git@github.com .../modules//aws_network"
  env                  = "qa"
  vpc_cidr             = "10.100.0.0/16"
  public_subnets_cidrs = ["10.100.1.0/24", "10.100.2.0/24"]
  private_subnet_cidrs = []
}

module "vpc-prod" {
  source               = "../modules/aws_network"
  env                  = "production"
  vpc_cidr             = "10.111.0.0/16"
  public_subnets_cidrs = ["10.111.1.0/24", "10.111.2.0/24", "10.111.3.0/24"]
  private_subnet_cidrs = ["10.111.10.0/24", "10.111.20.0/24", "10.111.30.0/24"]
}

#==================================
# outputs

output "prod_public_subnet_ids" {
  value = module.vpc-prod.public_subnets_ids
}

output "prod_private_subnet_ids" {
  value = module.vpc-prod.private_subnets_ids
}

output "dev_subnet_ids" {
  value = module.vpc-default.private_subnets_ids
}

output "dev_private_subnet" {
  value = module.vpc-prod.vpc_cidr
}
output "prod_private_subnet" {
  value = module.vpc-default.vpc_cidr
}
