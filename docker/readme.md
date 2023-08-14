- Update the package index: sudo yum update -y
- Install Docker: sudo yum install docker -y
- Start the Docker service: sudo service docker start
- Add the ec2-user to the docker group: sudo usermod -a -G docker ec2-user
- Verify the installation by running the hello-world container: sudo docker run hello-world

<table>
  <tr> <td><a href='https://docs.docker.com/'> docker docs </a> </td> <td> </td> </tr>
<tr> <td>build </td> <td>docker build -t <imagename> . </td> </tr>
<tr> <td>run </td> <td> docker run --rm --name <container name> -p <external port>:<internal port> <immage name> </td> </tr>
<tr> <td>local registry:  </td> <td> docker run --name local-registry -d --restart=always -p 5000:5000 registry:2 </td> </tr>
<tr> <td>docker compose </td> <td> </td> </tr>
<tr> <td> Run container in the background </td> <td>docker-compose up -d </td> </tr>
<tr> <td>show running apps </td> <td>docker-compose ps </td> </tr>
<tr> <td>kubectl logs pi-gvvjk </td> <td> show pods logs </td> </tr>
  <tr> <td> </td> <td> </td> </tr>
  <tr> <td> </td> <td> </td> </tr>
  </table>
