<details>
<summary>What is the difference between declarative and imperative infrastructure as code?</summary>
<br> Declarative is more flexible. 
  Explanation: Declarative infrastructure as code (IaC) focuses on describing the desired end state of the infrastructure, 
  without specifying the exact steps needed to get there. 
  This allows for more flexibility in how the infrastructure is provisioned and managed, as the system can determine the most efficient way to achieve the desired state. 
</details>

<details>
<summary>what it means: version = "~> 3.0"</summary>
<br> The ~> symbol is a version constraint operator that specifies a range of compatible versions. In the example you provided, version = "~> 3.0", it means that Terraform should use a provider plugin version that is greater than or equal to version 3.0, but less than version 4.0.
<br>This is known as a "pessimistic constraint" because it allows for minor version updates (e.g. 3.1, 3.2, 3.3) but not major version updates (e.g. 4.0). This helps ensure compatibility with the provider plugin while still allowing for bug fixes and minor feature updates.
</details>

<details>
<summary>simple</summary>
<br> count = 2
</details>
