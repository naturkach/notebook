![Alt text](kube-apis.png?raw=true "kuber apis")

![Alt text](Screenshot%202023-06-08%20111901.png?raw=true "kube parts")
<code>
Deployment: A deployment is a Kubernetes object that manages a set of identical pods. It ensures that the desired number of replicas of a pod are running at all times, and can be used to perform rolling updates and rollbacks of application versions. Deployments are typically used to manage stateless applications.

Service: A service is a Kubernetes object that provides a stable IP address and DNS name for a set of pods. It allows other applications within the cluster to access the pods using a consistent endpoint, even if the pods are constantly being created and destroyed. Services can be used to load balance traffic across multiple pods, and can be exposed externally using a NodePort or LoadBalancer.

Ingress: An ingress is a Kubernetes object that provides external access to services within the cluster. It acts as a layer 7 load balancer, routing traffic based on the HTTP/HTTPS protocol and the URL path. Ingresses can be used to expose multiple services under a single IP address, and can be configured with TLS certificates for secure communication.

In summary, deployments are used to manage the lifecycle of pods, services provide a stable endpoint for accessing pods, and ingresses provide external access to services within the cluster. Together, these three concepts form the foundation for managing and exposing applications in Kubernetes.
</code>

