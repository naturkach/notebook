
<a href = 'https://registry.terraform.io/providers/hashicorp/aws/latest/docs'> AWS provider docs </a>
<table>
  <tr> <td> override var </td>  <td>terraform apply -var "instance_name=NewName" </td> </tr>
<tr> <td>show resource states</td>  <td>terraform state list </td> </tr>
<tr> <td>detail state of resource </td>  <td>terraform state show <name from list> </td> </tr>
<tr> <td>re-create resource without change </td>  <td> terraform taint aws_instance.somenode (and then apply) </td> </tr>
 </table>





module - tf feature to combine code to logical group that can be managed together
