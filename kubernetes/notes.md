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
<summary> </summary>
</details>