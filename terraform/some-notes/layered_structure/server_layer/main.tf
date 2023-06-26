provider "aws" {
  region = "eu-north-1"
}

terraform {
  backend "s3" {
    ## variables not allowed !!    
    bucket = "my-remote-state-9bda59c9bab4baab"
    key    = "global/servers/terraform.tfstate"
    region = "eu-north-1"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}


data "terraform_remote_state" "network" {                            //take data from remote state
  backend = "s3"
  config = {
    bucket = "my-remote-state-9bda59c9bab4baab"
    key    = "global/s3/terraform.tfstate"
    region = "eu-north-1"
  }
}

data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}

#-------------------------------

resource "aws_instance" "web-server" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.test-sg-web.id]
  subnet_id              = data.terraform_remote_state.network.outputs.public_subnets_ids[0]
  user_data              = <<EOF
sudo yum -y update
sudo yum -y install httpd
sed -i 's/Listen 80/Listen 0.0.0.0:80/g' /etc/httpd/conf/httpd.conf
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2> webserver ip: $myip</h2><br> build by terraform remote state" >> /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
EOF 
  tags = {
    Name = "WebServer"
  }
}


resource "aws_security_group" "test-sg-web" {
  name   = "Web Security Group"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.network.outputs.vpc_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Web Security Group"
  }
}




output "network_details" {
  value = data.terraform_remote_state.network
}

output "webserver_sg_id" {
  value = aws_security_group.test-sg-web.id
}

output "server_ip" {
  value = aws_instance.web-server.public_ip
}
