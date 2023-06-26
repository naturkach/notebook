this is how complex infrastructure can be build (ec2 and network layers in different folders) 
- sepparate parts can be managed sepparatelly in different folders,
- iterconnection is done thought remote state

#----------------------------------------
vars from one state file can be used in another thought outputs:

network:
```
output "vpc_id" {
  value = aws_vpc.main.id
}
output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}
output "public_subnets_ids" {
  value = aws_subnet.public_subnets[*].id
}
```

server layer:
```
data "terraform_remote_state" "network" {                   //connect remote state of network layer with name "network"
  backend = "s3"
  config = {
    bucket = "my-remote-state-9bda59c9bab4baab"
    key    = "global/s3/terraform.tfstate"
    region = "eu-north-1"
  }
}
```
```
resource "aws_instance" "web-server" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.test-sg-web.id]
  subnet_id              = data.terraform_remote_state.network.outputs.public_subnets_ids[0]

```

```
  resource "aws_security_group" "test-sg-web" {
  name   = "Web Security Group"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
```

```
  output "network_details" {
  value = data.terraform_remote_state.network
}
```


#--------------------------------------
  different folders should have different backends

server:
```
  terraform {
  backend "s3" {
    ## variables not allowed !!    
    bucket = "my-remote-state-9bda59c9bab4baab"
    key    = "global/servers/terraform.tfstate"
```

network:
```
terraform {
  backend "s3" {
    ## variables not allowed !!    
    bucket = "my-remote-state-9bda59c9bab4baab"
    key    = "global/s3/terraform.tfstate"
```
