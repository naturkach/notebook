# ansible
idempotent - if run once - will not do the same again 

hostfile:
<code>
[staging_servers]
linux1 ansible_host=<ip/hostname> ansible_user=ec2-user
</code>
cat ansible.cfg 
<code>
[defaults]
host_key_checking = false
inventory         = ./hosts.txt
  </code>
  
  
tags:
<br> <b>run only need task:   </b>ansible-playbook first.yml --tags "install_stress"
<br> <b>list tags:</b> ansible-playbook test.yml --list-tags
<br> <b>skip tags:</b> ansible-playbook test.yml --skip-tags tag_in_playbook
  
  <br><b></b>
<br><b>playbook start from task</b> ansible-playbook test.yml --start-at-task 'second task in play'
<br><b>ask on each step</b> ansible-playbook test.yml --step 
  
<br><b>ansible all --setup</b> - print all vars
  
show additional info of tasks execution:
  - add -v option: ansible-playbook first.yml --tags "please_ping" -v
<code>
---
- hosts:localhost
  
  taks:
    - name: get local info
      debug:
      var: hostvars[inventory_hostname]
      verbosity: 1
  </code>
  
  
  
<code>
---
  - name: "run on all servers one by one"
    hosts: myserverslist
    serial: 1   // - this is how to do this
  </code>
  
  
-----
  <b>run playbook from selected task:</b><br>
ansible-playbook play.yml --start-at-task 'install NTP'

----
conditions:
<code>
tasks:
  - name: upgrade redhat
    when: ansible_os_family == "Redhat"
    yum: name=* state=latest
</code>
  
-----------
