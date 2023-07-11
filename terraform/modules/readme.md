module - reusable part can be reused in the same project for different resources, or different project

final structure can be:

```
|modules\
||aws-network-module
|||- main.tf
|||- variables.tf
|||- outputs.tf
||
||aws-ec2-module
||aws-db-module

|dev\
||-network\
|||- main.tf --  connect module and override default variables:
     module "vpc-qa" {
      source               = "../modules/aws_network"
      #source               = "git@github.com .../modules//aws_network"
      env                  = "qa"

||-dbs\
||-servers\

|qa\
||-network\
||-dbs\
||-servers\
```
