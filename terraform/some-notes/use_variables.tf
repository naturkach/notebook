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
