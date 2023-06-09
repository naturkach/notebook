
<table>
  <tr>    <td></td> <td></td>  </tr>
<tr>    <td>lists the pods from all the namespaces</td><td>kubectl get pods -A</td>  </tr>
<tr>    <td>print namespaces</td><td>kubectl get namespaces</td>  </tr>
<tr>    <td>apply template</td><td>kubectl apply -f namespace.yml</td>  </tr>
<tr>    <td>get deploymnets in developmant namespace</td><td> kubectl get deploymnets -n development</td>  </tr>
<tr>    <td>get pods</td><td> kubectl get pods -n development</td>  </tr>
<tr>    <td>get pod info </td> <td> kubectl describe pod pod-name -n namespace-name <br> If a pod has been running for a while, Kubernetes will assume it is healthy and not show its events.</td>  </tr>
<tr>    <td>get ips of pods</td> <td> kubectl get pods -n development -o wide</td>  </tr>
<tr>    <td>get access to the pod</td> <td> kubectl exec -it podname -- /bin/bash </td>  </tr>
<tr>    <td>list app logs </td> <td> kubectl logs pod-name -n namespace-name</td>  </tr>
<tr>    <td>get services (with ports and ips) </td> <td>  kubectl get services -n development -o wide</td>  </tr>
<tr>    <td>clear created config </td> <td> kubectl delete -f some-config.                     yaml</td>  </tr>
<tr>    <td>to see all kube objects and API version</td> <td>kubectl api-resources</td>  </tr>
<tr>    <td>resent logs on etcd minikube</td> <td>kubectl logs etcd-minikube -n kube-system | jq .</td>  </tr>
<tr>    <td>get statuses</td> <td>kubectl get componentstatuses</td>  </tr>
<tr>    <td>cluster-info</td> <td>kubectl cluster-info</td>  </tr>
<tr>    <td></td> <td>kubectl get nodes</td>  </tr>
  <tr>    <td><hr></td> <td><hr></td>  </tr>
<tr>    <td>minikube</td> <td> minikube start/stop/delete <br> start --cpus=3 --memory=8gb --disk-size=10gb</td>  </tr>
<tr>    <td><a href='https://kind.sigs.k8s.io/docs/user/quick-start/#installation'>kind k8s cluster</a></td> <td></td>  </tr>
<tr>    <td><a href='https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/'>kubectl</a></td> <td></td>  </tr>
<tr>    <td><a href='https://kubernetes.io/docs/home/'> k8s documentation</a></td> <td></td>  </tr>
<tr>    <td><a href='https://kubernetes.io/docs/tutorials/kubernetes-basics/'> kuber tutorial</a></td> <td></td>  </tr>
<tr>    <td></td> <td></td>  </tr>
  <tr>    <td></td> <td></td>  </tr>
  <tr>    <td></td> <td></td>  </tr>
  <tr>    <td></td> <td></td>  </tr>

</table>
