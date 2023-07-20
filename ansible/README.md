# ansible
idempotent - if run once - will not do the same again 

<a href="https://docs.ansible.com/ansible/latest/collections/amazon/aws/index.html"> ansible-docs</a>
<table>
  <tr><td>dynamic inventory list<br>show all hosts grouped by tags</td> <td> ansible-inventory -i aws_ec2.yaml --list</td> </tr>
<tr><td>ping node by tag in dymanic env</td> <td>ansible -i aws_ec2.yaml tag_function_web_server -m ping</td> </tr>
<tr><td>ansible tag_function_web_server -i aws_ec2.yaml -m setup</td> <td>show all variables from EC2</td> </tr>
<tr><td>handlers - do only if some task has some changes</td> <td>notify: restart apache <br> handler<br>- name: restart apache<br>service: name=httpd state=restarted </td> </tr>
<tr><td>extra vars </td> <td>--extra-var "MYHOSTS=tag_function_web_server  (if var defined without value) <br> MYHOSTS=newhost - re-define if exist</td> </tr>
<tr><td>devide big manifests to parts</td> <td>- name: create folders<br> include: createfolders.yaml </td> </tr>
<tr><td>save output to var</td> <td>- shell: uptime<br>register: results<br> now can use: msg: "uptime is {{ results.stdout }}"</td> </tr>
<tr><td>run only need task:</td> <td>ansible-playbook first.yml --tags "install_stress"</td> </tr>
<tr><td>list tags:</td> <td>ansible-playbook test.yml --list-tags</td> </tr>
<tr><td>skip tags:</td> <td>ansible-playbook test.yml --skip-tags tag_in_playbook</td> </tr>
<tr><td>playbook start from task</td> <td>ansible-playbook test.yml --start-at-task 'second task in play'</td> </tr>
<tr><td></td> <td></td> </tr>
<tr><td>ask on each step</td> <td>ansible-playbook test.yml --step </td> </tr>
<tr><td>vault</td> <td>ansible-vault create test1.yml</td> </tr>
<tr><td>- run vault</td> <td>ansible-playbook test.yml --ask-vault-pass</td> </tr>
<tr><td>- encrypt:</td> <td>ansible-vault encrypt my-file.yml</td> </tr>
<tr><td>- edit:</td> <td>ansible-vault edit my-file.yml</td> </tr>
<tr><td>ansible node1 -m ansible.builtin.shell -a "rpm -qi httpd"</td> <td>verify if httpd is installed</td> </tr>
<tr><td>ansible web -m ansible.builtin.service_facts | grep httpd.service -A4</td> <td> check all web hosts if httpd is installed</td> </tr>
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
when condition:

```
  tasks:
    - name: Install Postfix
      ansible.builtin.package:
        name: postfix
        state: latest
      when: inventory_hostname in groups["web"]
```


