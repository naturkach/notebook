You pay $0.10 per hour for each Amazon EKS cluster that you create.

<table>
  <tr>    <td></td> <td></td>  </tr>
<tr>    <td>minikube</td> <td> minikube start/stop/delete <br> minikube start --cpus=3 --memory=8gb --disk-size=10gb</td>  </tr>
<tr>    <td><a href='https://kind.sigs.k8s.io/docs/user/quick-start/#installation'>kind k8s cluster</a></td> <td></td>  </tr>
<tr>    <td><a href='https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/'>kubectl</a></td> <td></td>  </tr>
<tr>    <td><a href='https://kubernetes.io/docs/home/'> k8s documentation</a></td> <td></td>  </tr>
<tr>    <td><a href='https://kubernetes.io/docs/tutorials/kubernetes-basics/'> kuber tutorial</a></td> <td></td>  </tr>
  <tr>    <td><hr></td> <td><hr></td>  </tr> 
<tr>    <td>kubectl create namespace ns2 -o yaml --dry-run=client > ns2.yaml <br>
            kubectl create deployment my-deploy -o yaml --dry-run=client --image=httpd:2.4-alpine --replicas=3 > my-deploy.yaml</td> <td>create template for deployment</td>  </tr>
<tr>    <td>lists the pods from all the namespaces</td><td>kubectl get pods -A</td>  </tr>
<tr>    <td>kubectl edit deployment nginx <br>
            kubectl replace -f nginx.yaml</td> <td> update objects <br>replace in this way - is better way - changes will be keeped in file no not lost in future</td>  </tr>
  <tr>    <td>--dry-run=client </td> <td>option. This will not create the resource, instead, tell you whether the resource can be created and if your command is right.</td>  </tr>  
  <tr>    <td>-o yaml</td> <td>This will output the resource definition in YAML format on screen.</td>  </tr>
<tr>    <td>print namespaces</td><td>kubectl get namespaces</td>  </tr>
<tr>    <td>apply template</td><td>kubectl apply -f namespace.yml</td>  </tr>
<tr>    <td>get deploymnets in developmant namespace</td><td> kubectl get deploymnets -n development</td>  </tr>

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
<tr>    <td>lists the pods from all the namespaces</td><td>kubectl get pods -A</td>  </tr>
<tr>    <td>get pods</td><td> kubectl get pods -n development</td>  </tr>
<tr>    <td>get pod info </td> <td> kubectl describe pod pod-name -n namespace-name <br> If a pod has been running for a while, Kubernetes will assume it is healthy and not show its events.</td>  </tr>
<tr>    <td>create pod hello manually</td> <td>kubectl run hello --image=naturkach/k8sphp:ver2 --port=80</td>  </tr>
<tr>    <td>delete pod manually</td> <td>kubectl delete pods hello</td>  </tr>
<tr>    <td>enter to the pod</td> <td>kubectl exec -it <podname> -- sh</td>  </tr>
<tr>    <td>port-forward to pod manually</td> <td>kubectl port-forward hello 8080:80</td>  </tr>
<tr>    <td>create deployment</td> <td>kubectl create deployment firstdep --image naturkach/k8sphp:ver2</td>  </tr
  <tr>    <td>check deployments</td> <td>kubectl get deploy</td>  </tr
  <tr>    <td>get deployments info</td> <td>kubectl describe deployments firstdep</td>  </tr
  <tr>    <td>scale deployment up to 2 pods</td> <td>kubectl scale deployment firstdep --replicas 2</td>  </tr>
  <tr>    <td>autoscaling on all cpu load</td> <td>kubectl autoscale deployment firstdep --min=1 --max=6 --cpu-percent=80</td>  </tr>
  <tr>    <td>show scaling Horizontal Pod Autoscaler (HPA) </td> <td>kubectl get hpa</td>  </tr>
  <tr>    <td>returns resource utilization metrics for the pods.</td> <td>kubectl top pod </td>  </tr>
  <tr>    <td>Check that the Metrics Server is accessible from the node where you are running kubectl</td> <td>curl http://localhost:10255/metrics </td>  </tr>
  <tr>    <td>deploument history</td> <td>kubectl rollout history deployment/firstdep</td>  </tr>
  <tr>    <td>deployment status</td> <td>kubectl rollout status deployment/firstdep</td>  </tr>
  <tr>    <td><hr></td> <td><hr></td>  </tr>
  <tr>    <td>kubectl config get-contexts</td> <td> - if you have several clusters - to check contexts(clusters)</td>  </tr>
  <tr>    <td>kubectl config current-context</td> <td>get current context</td>  </tr>
  <tr>    <td>kubectl config use-context minikube</td> <td></td>  </tr> 
  <tr>    <td>kubectl config get-clusters</td> <td> what clusters we are opeqrating?</td>  </tr>
  <tr>    <td></td> <td></td>  </tr>
  <tr>    <td></td> <td></td>  </tr>
  
</table>
