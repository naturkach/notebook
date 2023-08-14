 

<details>
<summary>How do you upgrade or downgrade a system with near-zero downtime? </summary>
</details>

<details>
<summary>difference beetween SG and NACL </summary>

  - SG: This acts as a firewall for the EC2 instances, controlling inbound and outbound traffic at the instance level.
    <br> can filter only allow rules (per port/source address or other SG)
    
  - NACL: It acts as a firewall for the subnets, controlling inbound and outbound traffic at the subnet level
    <br> Each subnet in a VPC can have its own NACL, and each NACL can have multiple rules that allow or deny traffic based on IP addresses, protocols, and ports.
    <br> VPC can also have a default NACL that applies to all subnets in the VPC.
    <br> can filer in/out traffic based on protocol, port, source ip, allow/deny option
</details>

<details>
<summary> cost-saving </summary>
  
  - Cost Explorer : will help you to view and analyze your usage costs for the last 13 months. You can also get a cost forecast for the upcoming three months.
  - AWS Budgets : This allows you to plan a budget for the services. Also, it will enable you to check if the current plan meets your budget and the details of how you use the services.
  - Cost Allocation Tags: This helps in identifying the resource that has cost more in a particular month. It lets you organize your resources and cost allocation tags to keep track of your AWS costs.

  - S3 - glasier/Infrequent Access
</details>

<details>
<summary> On an EC2 instance, an application of yours is active. Once the CPU usage on your instance hits 80%, you must reduce the load on it. What strategy do you use to complete the task?</summary>
</details>

<details>
<summary> What is the difference between stopping and terminating an EC2 instance? </summary>
  hibernate?
</details>

<details>
<summary> most scalable arch</summary>

S3 -  S3 cross-region replication
  
</details>


<details>
<summary> 5 </summary>
</details>


<details>
<summary> count 6</summary>
</details>
