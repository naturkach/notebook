<details>
<summary>Describe each of the following components in Ansible, including the relationship between them:</summary>
<br>
Task – The definition of an ‘action’ to be applied to the managed host.     
<br><br> 
Handlers - A special form of a Task, that only executes when notified by a previous task which resulted in a ‘changed’ status
<br><br>   
Module – The code or binaries that Ansible copies to and executes on each managed node (when needed) to accomplish the action defined in each Task. Each module has a particular use 
<br><br>
  Play – One or more tasks executed on a given host(s)
<br><br>
Playbook – One or more plays. Each play can be executed on the same or different hosts
<br><br>
Role – Roles are a way to organize your playbooks into reusable units of work. They allow you to separate your code into logical components, making it easier to maintain and reuse. Each role should have a specific purpose, such as installing a package or configuring a service.
</details>


<details>
<summary>True or False? Ansible uses declarative style to describe the expected end state</summary>
<br>
Is Ansible declarative or procedural?
Ansible can be both declarative and procedural—many modules work declaratively, while other modules prefer a procedural programming approach. Additionally, some constructs in the Ansible language, such as conditionals and loops, allow the users to define a procedural logic.
  <br><br>
  Procedural Programming is the use of code in a step-wise procedure to develop applications
</details>

<details>
  <summary>What are facts? How to see all the facts of a certain host?</summary>
<br>
Ansible facts are data related to your remote systems, including operating systems, IP addresses, attached filesystems, and more.
<br>You can access this data in the ansible_facts variable. By default, you can also access some Ansible facts as top-level variables with the ansible_ prefix. You can disable this behavior using the INJECT_FACTS_AS_VARS setting.
  
To see all available facts, add this task to a play:
  
```
- name: Print all available facts
  ansible.builtin.debug:
    var: ansible_facts
```
</details>
