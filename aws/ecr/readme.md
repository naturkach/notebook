just follow push commands:

```
Retrieve an authentication token and authenticate your Docker client to your registry.
Use the AWS CLI:

aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin <acc-id>.dkr.ecr.eu-north-1.amazonaws.com
Note: If you receive an error using the AWS CLI, make sure that you have the latest version of the AWS CLI and Docker installed.
Build your Docker image using the following command. For information on building a Docker file from scratch see the instructions here . You can skip this step if your image is already built:

docker build -t ecs-test-repo .
After the build completes, tag your image so you can push the image to this repository:

docker tag ecs-test-repo:latest <acc-id>.dkr.ecr.eu-north-1.amazonaws.com/ecs-test-repo:latest
Run the following command to push this image to your newly created AWS repository:

docker push <acc-id>.dkr.ecr.eu-north-1.amazonaws.com/ecs-test-repo:latest
```

add Lifecycle Policy - to remove old images 
