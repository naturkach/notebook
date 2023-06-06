
<table>
  <tr>    <td></td> <td></td>  </tr>
<tr>    <td>lists the pods from all the namespaces</td><td>kubectl get pods -A</td>  </tr>
<tr>    <td>print namespaces</td><td>kubectl get namespaces</td>  </tr>
<tr>    <td>add namespace</td><td>kubectl apply -f namespace.yml</td>  </tr>
<tr>    <td>get deploymnets in developmant namespace</td><td> kubectl get deploymnets -n development</td>  </tr>
<tr>    <td>get pods</td><td> kubectl get pods -n development</td>  </tr>
<tr>    <td>get pod info </td> <td> kubectl describe pod pod-name -n namespace-name</td>  </tr>
<tr>    <td>get ips of pods</td> <td> kubectl get pods -n development -o wide</td>  </tr>
<tr>    <td>get access to the pod</td> <td> kubectl exec -it podname -- /bin/bash </td>  </tr>
<tr>    <td>list app logs </td> <td> kubectl logs pod-name -n namespace-name</td>  </tr>
</table>
