
<a href = 'https://registry.terraform.io/providers/hashicorp/aws/latest/docs'> AWS provider docs </a>
<table>
<tr> <td>  </td>  <td>terraform fmt </td> </tr>
<tr> <td>  </td>  <td>terraform validate </td> </tr>
<tr> <td> </td>   <td> </td>  </tr>
<tr> <td> override var </td>  <td>terraform apply -var "instance_name=NewName" </td> </tr>
<tr> <td>show resource states</td>  <td>terraform state list </td> </tr>
<tr> <td>detail state of resource </td>  <td>terraform state show (name from list) </td> </tr>
 <tr> <td>show state file </td>   <td>terraform show </td>  </tr>
<tr> <td>re-create resource without change </td>  <td> terraform taint aws_instance.somenode (and then apply) </td> </tr>
<tr> <td>show workspaces  </td>  <td>  terraform workspace show </td> </tr>
<tr> <td>  </td>  <td>.terraform.lock.hcl  - providers will download versions placed in this file <br> terraform init -upgrade -- will upgrade to latest </td> </tr>
<tr> <td>terraform state  <br> list<br>mv<br>pull<br>push<br>replace-provider<br>rm<br>show<br></td>  <td>Subcommands:
  <br>                 List resources in the state
  <br>                    Move an item in the state
  <br>                  Pull current state and output to stdout
  <br>                  Update remote state from a local state file
  <br>      Replace provider in the state
  <br>                    Remove instances from the state
  <br>                  Show a resource in the state </td> </tr>
<tr> <td>  </td>  <td> </td> </tr>
<tr> <td>  </td>  <td> </td> </tr>
<tr> <td>  </td>  <td> </td> </tr>
 
  
 </table>





module - tf feature to combine code to logical group that can be managed together
