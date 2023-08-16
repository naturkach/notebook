


   

<table>
   <tr><td>helm version</td><td></td></tr>
   <tr><td>helm list</td><td> show deployed releases</td></tr>
   <tr><td>helm delete app1</td><td> remove all resources</td></tr>
   <tr><td></td><td></td></tr>
   <tr><td>helm search hub</td><td></td></tr>
   <tr><td>helm search repo</td><td>repo should be installed first</td></tr>
  <tr><td>helm install app app-helmChart/</td><td></td></tr>
  <tr><td>helm install app app-helmChart/  --set container.image=dockerRepo/appImage:v2 </td><td>-- re-define default image from chart</td></tr>
  <tr><td>helm package app-helmChart/</td><td>create helm package</td></tr>
  <tr><td>helm install myappv2 app-helmchart-0.2.0.tgz</td><td></td></tr>
  <tr><td>helm upgrade app1 app-helmChart/ set container.image=dockerrepo/myapp:v3</td><td>upgrade deployment</td></tr>
  <tr><td>helm install app3 firstchart/ -f prod_values.yaml</td><td> over-write default values file</td></tr>
   <tr><td></td><td></td></tr>
</table>
