
<table>
  <tr><td>VpcId: !ImportValue ExportedVPCID</td><td>inported value from another stack</td></tr>
  <tr><td> IsProduction: !Equals [ !Ref Environment, 'production'] </td><td> check if equals</td></tr>
<tr><td>pseudo parameters </td><td></td></tr>
<tr><td>AWS::Region </td><td>Region in which the encompassing resource is being created</td></tr>
<tr><td>AWS::StackId </td><td>ID of the stack created</td></tr>
<tr><td> </td><td></td></tr>
</table>
