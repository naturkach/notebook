#!/bin/bash
yum -y update
yum -y install httpd
sed -i 's/Listen 80/Listen 0.0.0.0:80/g' /etc/httpd/conf/httpd.conf

myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > /var/www/html/index.html
<html>
<center>
<h2>build by terrafrom</h2>
<h2> webserver ip: $myip</h2><br> build by terraform
<br>gen2
</center>
</html>
EOF

sudo service httpd start
chkconfig httpd on
