# vars can be overriden: terraform apply -var="region=us-east-1"
# tf will take exported vars  - ex. export TF_VAR_region=us-east-2 -- will take during apply: region=us-east-2

#in variables.tf

variable "region" {
  description = "enter region"
  type        = string
  default     = "eu-north-1"
}

variable "instance_name" {
  description = "set-instance-name"
  default     = "test node"
}

variable "instance_type" {
  description = "instance type"
  default     = "t3.micro"
}

variable "allow_ports" {
  description = "list of orts to open"
  type        = list(any)
  default     = ["80", "443", "22"]
}

## - in main.tf  SG definition:
  dynamic "ingress" {
    for_each = var.allow_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

##-------------------------

variable "common_tags" {
  description = "tags for all resources"
  type        = map(any)
  default = {
    owner   = "nat"
    project = "learning"
    env     = "dev"
  }
}
## in main.tf aws_instance deffinition:
 tags = merge(var.common_tags, { Name = "${var.instance_name}-${count.index}-${var.common_tags["env"]}" })
#-- would be like:   "Name"    = "test node-0-dev"


##################################################
# or can be used terraform.tfvars file to define all vars -- it will override defaults
# file can be named terraform.tfvars or *.tfvars
# apply: terraform apply -var-file="dev.tfvars"

region = "ca-central-1"
instance_type = "t2.micro"

allowed_ports = ["80", "443", "22"]

common_tags = {
    owner   = "nat"
    project = "learning"
    env     = "dev"
  }
################################################

resource "aws_instance" "webhost" {
  count                         = var.ec2_servers["web_servers"]["amount"]

variable "ec2_servers" {
  default = {
    web_servers = {
      amount   = 1,
      ec2_type =
------------------------------------
