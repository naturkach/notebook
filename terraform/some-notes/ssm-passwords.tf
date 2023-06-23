# how to create and use passwords

provider "aws" {
  region = "eu-north-1"
}

variable "dbname" {
  default = "admin3"
}

resource "random_string" "rds_password" {          // create password
  length           = 10
  special          = true
  override_special = "!-_"

  keepers = {                                     // pass will be re-created if keeper changes
    keeper1 = var.dbname
  }

}


resource "aws_ssm_parameter" "rds_password" {     // save pass to ssm store
  name        = "/prod/mysql"
  description = "master pass for RDS"
  type        = "SecureString"
  value       = random_string.rds_password.result

}

data "aws_ssm_parameter" "my_rds_password" {        // save to  var my_rds_password pass data       
  name       = "/prod/mysql"
  depends_on = [aws_ssm_parameter.rds_password]
}

resource "null_resource" "command" {                // execute local command
  triggers = {                                      // triger this command on each terraform apply
    timestamp = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = "echo ${timestamp()} ${data.aws_ssm_parameter.my_rds_password.value} >> log.txt"
  }
}

