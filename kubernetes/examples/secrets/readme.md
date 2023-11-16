<table>
  <tr><td>kubectl get secrets</td><td> -this secret can handle several values</td></tr>
  <tr><td>kubectl describe secret dashboard-token</td><td>- check all values from secret</td></tr>
  <tr><td></td><td></td></tr>
</table>

Secrets are similar to ConfigMaps but are specifically intended to hold confidential data.

Secrets can be easily created using imperative commands.<br>
Use the <b>kubectl create secret command with the --from-literal</b> to pass in the secret data in the form of key value pairs.

kubectl create secret generic db-secret --from-literal=DB_Host=sql01 --from-literal=DB_User=root --from-literal=DB_Password=password123


Secrets are not encrypted, so it is not safer in that sense. However, some best practices around using secrets make it safer. As in best practices like:

Not checking-in secret object definition files to source code repositories.

Enabling Encryption at Rest for Secrets so they are stored encrypted in ETCD. 

Also the way kubernetes handles secrets. Such as:

A secret is only sent to a node if a pod on that node requires it.

Kubelet stores the secret into a tmpfs so that the secret is not written to disk storage.

Once the Pod that depends on the secret is deleted, kubelet will delete its local copy of the secret data as well.


Having said that, there are other better ways of handling sensitive data like passwords in Kubernetes, such as using tools like Helm Secrets, HashiCorp Vault.
