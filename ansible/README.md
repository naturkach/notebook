# ansible
idempotent - if run once - will not do the same again 

<table>
  <tr><td>dynamic inventory list</td> <td> ansible-inventory -i aws_ec2.yaml --list</td> </tr>
<tr><td>ping node by tag in dymanic env</td> <td>ansible -i aws_ec2.yaml tag_function_web_server -m ping</td> </tr>
<tr><td>host setup by tag</td> <td>ansible tag_function_web_server -i aws_ec2.yaml -m setup</td> </tr>
<tr><td>handlers - do only if some task has some changes</td> <td>notify: restart apache <br> handler<br>- name: restart apache<br>service: name=httpd state=restarted </td> </tr>
<tr><td></td> <td></td> </tr>
<tr><td></td> <td></td> </tr>
<tr><td></td> <td></td> </tr>
 </table>




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
<br><b>vault</b> ansible-vault create test1.yml
<br>- run: ansible-playbook test.yml --ask-vault-pass
<br>- encrypt: ansible-vault encrypt my-file.yml
<br>- edit: ansible-vault edit my-file.yml
  
<br><b>print all vars</b> ansible all --setup
  
show additional info of tasks execution:
  - add -v option: ansible-playbook first.yml --tags "please_ping" -v

  
run playbook in check mode:
<br> ansible-playbook firstplay.yml --check
  
  
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
