<details>
<summary> commands </summary>
  
 - kubectl describe pods hello -- get detailed info about pod
 - kubectl logs hello
 - kubectl exec hello -- date -- run date command on hello pod
 - kubectl exec -it hello  - run on interractive mode
 - kubectl apply -f configfile.yaml  -- create objects from file
</details>

<details>
<summary>create cluster</summary>
<br> eksctl create cluster -f eks-cluster.yaml
<br> eksctl delete cluster -f eks-cluster.yaml


  cat ks-cluster.yaml
```
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name  : first-eks-cluster
  region: eu-north-1

nodeGroups:
  - name             : worker
    instanceType     : t3.small
    desiredCapacity  : 2
    privateNetworking: true                         # Use Private Subnets
```
</details>

<details>
<summary>run pod locally</summary>
<br> kubectl run hello --image=naturkach/k8sphp:ver2 --port=80      (create pod hello fromo image expose port 80)
<br> kubectl port-forward hello 8080:80  ( forward to local host Forwarding from 127.0.0.1:8080 -> 80)
</details>

<details>
<summary>run pod with manifest</summary>

kubectl apply -f pod-manifest-ver1.yaml 

pod-manifest-ver1.yaml:
```
apiVersion : v1
kind: Pod
metadata:
  name: my-web
  labels:
    env: prod
spec:
  containers:
    - name: container-apache
      image: naturkach/k8sphp:ver2
      ports:
        - containerPort: 80
```		
delete pod: kubectl delete -f pod-manifest-ver1.yaml

</details>

<details>
<summary> Deployments</summary>
  
 -  kubectl create deployment mynew-deployment --image naturkach/k8sphp:ver2        (create manually)
 -  kubectl describe deployments mynew-deployment
 -  kubectl get deploy        (get deployments)
 -  kubectl scale deployment mynew-deployment --replicas 3     (scale to 3)
 -  kubectl get rs  - show replicaset (allways will be running as we setup: --replicas 3)
 -  kubectl autoscale deployment mynew-deployment --min=3 --max=6 --cpu-percent=80   (autoscaling)
 -  kubectl get hpa  (check horizontal pods autoscaling)
```
NAME               REFERENCE                     TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
mynew-deployment   Deployment/mynew-deployment   <unknown>/80%   3         6         3          30s
it will works if it can check targets
```

<details>
<summary> deployment strategies </summary>
  
  - rolling update
```
kind: Deployment
spec:
  replicas: 5
  minReadySeconds: 10      -- pod will be ready after 10 sec
  strategy:
    rollingUpdate:
      maxSurge: 1          -- 1 pod will be creted on update
      maxUnavailable: 1    -- 1 pod wiil be drained
    type: RollingUpdate
```
  - recreate
```
spec:
  replicas: 5
  minReadySeconds: 10
  strategy:
    type: Recreate         -- all pods will be drained, and only after new pods will be created
```
</details>

update image:

 - kubectl describe deployment mynew-deployment  - get container name (k8sphp in my example / check what image is deployed)
 - kubectl set image deployment/mynew-deployment k8sphp=naturkach/k8sphp:ver1 --record
 - kubectl rollout status deployment/mynew-deployment  (check status)
 - kubectl rollout history deployment/mynew-deployment (check deployment history)
 - kubectl rollout undo deployment/mynew-deployment --to-revision=2 (number from history)
 - kubectl rollout restart deployment/mynew-deployment  (will re-deploy if immage is latest and was changed)

manifest:
```
apiVersion : apps/v1
kind: Deployment
metadata:
  name: my-web-deployment-cailing
  labels:
    app: my-k8s-app
    env: prod
spec:
  replicas: 2
  selector:
    matchLabels:
      project: project3
  template:
    metadata:
      labels:
        project: project3
    spec:
      containers:
        - name: project3-web
          image: naturkach/k8sphp:ver2
          ports:
            - containerPort: 80

---
apiVersion : autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: my-autoscaling
  spec:
    scaleTargetRef:
      apiVersion: apps/v1
      kind: Deployment
      name: my-web-deployment-cailing
    minReplicas: 2
    maxReplicas: 3
    metrics:
    - type: Resource
      resource:
        name: cpu
        targetAverageUtilization: 70
    - type: Resource
      resource:
        name: memory
        targetAverageUtilization: 80
```


</details>
 
<details>
<summary> Services </summary>

  Service - is Kubernetes object created to have one point of access to the group of pods
  
  when you create Service, your app is going to be accessed:

  - ClusterIP - (only internal cluster IP (bydefault))
    <br>kubectl expose deployment first-eks-deployment --type=ClusterIP --port 80       create service with type ClusterIP
  - NodePort - some port on all worker nodes
    <br> kubectl expose deployment first-eks-deployment --type=NodePort --port 80        create service with type NodePort
  - ExternalName - DNS CNAME record
  - LoadBalancer - only in cloud
    <br> kubectl expose deployment first-eks-deployment --type=LoadBalancer --port 80   create service with type LoadBalancer




</details>


<details>
<summary> Ingress </summary>
  
  - "networking.k8s.io/v1beta1" API version was introduced in Kubernetes version 1.14 and was deprecated in version 1.22.
  - for older "networking.k8s.io/v1"

config on v1 should be like:
```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-hosts
spec:
  rules:
    - host: www.adv-it.net
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: main
                port:
                  number: 80
```
```
kubectl get ingress
NAME            CLASS    HOSTS                                           ADDRESS                                                                   PORTS   AGE
ingress-hosts   <none>   www.adv-it.net,web1.adv-it.net,cat.adv-it.net   a35d1a0ecb8d242efa974f838ab42491-918215148.eu-north-1.elb.amazonaws.com   80      15m
```
```
ubectl describe ingress
Name:             ingress-hosts
Labels:           <none>
Namespace:        default
Address:          a35d1a0ecb8d242efa974f838ab42491-918215148.eu-north-1.elb.amazonaws.com
Ingress Class:    <none>
Default backend:  <default>
Rules:
  Host             Path  Backends
  ----             ----  --------
  www.adv-it.net   
                   /   main:80 (192.168.111.231:80,192.168.188.15:80)
  web1.adv-it.net  
                   /   web1:80 (192.168.127.102:80,192.168.174.152:80)
  cat.adv-it.net   
                   /   tomcat:8080 (192.168.127.4:8080,192.168.167.146:8080)
Annotations:       <none>
Events:            <none>
```
</details>
 

<details>
<summary> Dashboard </summary>
  https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
</details>

<details>
<summary> Minikube </summary>

access apps - https://minikube.sigs.k8s.io/docs/handbook/accessing/

after port expose like: kubectl expose deployment hello-minikube1 --type=NodePort --port=8080
<br> create service tunell:
```
minikube service hello-minikube1 --url
```

- enable ingress:
  <br> minikube addons list
  <br> minikube addons enable ingress  (nginx controller)
</details>

<details>
<summary> daemonset </summary>
  
  - will run one pod on on each node
  - DaemonSet is a Kubernetes feature that lets you run a Kubernetes pod on all cluster nodes that meet certain criteria. Every time a new node is added to a cluster, the pod is added to it, and when a node is removed from the cluster, the pod is removed.
</details>

<details>
<summary>Job </summary>
<a href="https://kubernetes.io/docs/concepts/workloads/controllers/job/">Kuber what i Job </a>
  
- A Job creates one or more Pods and will continue to retry execution of the Pods until a specified number of them successfully terminate. As pods successfully complete, the Job tracks the successful completions. When a specified number of successful completions is reached, the task (ie, Job) is complete. Deleting a Job will clean up the Pods it created. Suspending a Job will delete its active Pods until the Job is resumed again.
 
- A simple case is to create one Job object in order to reliably run one Pod to completion. The Job object will start a new Pod if the first Pod fails or is deleted (for example due to a node hardware failure or a node reboot).complete.
</details>




<details>
<summary> CronJob </summary>
  CronJob is meant for performing regular scheduled actions such as backups, report generation, and so on. One CronJob object is like one line of a crontab (cron table) file on a Unix system. It runs a job periodically on a given schedule, written in Cron format.
</details>

<details>
<summary> replicaset\replication controller </summary>
  - the iam of RC is to controll pods and if it fails - deploy new one (it uses labels to know with pods to monitor)
</details>

<details>
<summary> Deployments vs Replicaset</summary>
  <table>
    <tr><td>deployment</td><td>replicaset</td></tr>
    <tr><td>High-level abstractions that manage replica sets.
It provides additional features such as rolling updates, rollbacks, and versioning of the application. </td><td>A lower-level abstraction that manages the desired number of replicas of a pod.
Additionally, it provides basic scaling and self-healing mechanisms.  </td></tr>
    <tr><td>Deployment manages a template of pods and uses replica sets to ensure that the specified number of replicas of the pod is running. </td><td>ReplicaSet only manages the desired number of replicas of a pod. </td></tr>
    <tr><td>Deployment provides a mechanism for rolling updates and rollbacks of the application, enabling seamless updates and reducing downtime. </td><td>Applications must be manually updated or rolled back </td></tr>
    <tr><td>It provides versioning of the application, allowing us to manage multiple versions of the same application. It also makes it easy to roll back to a previous version if necessary. </td><td>ReplicaSet doesn’t provide this feature. </td></tr>
    <tr><td> </td><td> </td></tr>
  </table>
</details>

<details>
<summary> </summary>
</details>
