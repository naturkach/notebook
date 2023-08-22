<details>
<summary>Mapping  - fixed variables within your CF Template</summary>
 
```
   RegionMap:
     us-east-1:
       "32" : "ami-234452"
       "64" : "ami-34j542"
     us-west-1:
       "32" : "ami-werw235"
       "64" : "ami-wqewr23"
```
!FindInMap [MapName, TopLevelKey, SecondLevelKey]

```
Resources:
  myEC2Instance:
    Type: "AWS::EC2::Instance"
    Proeperties:
      ImageId: !FindInMap [RegionMap, !Ref "AWS::Region", 32]
      InstanceType: t2.micro
```
</details>


<details>
<summary>Outputs - for cross-stack collaboration (export-import)</summary>

```
Outputs:                            
  VPCID:
    Description: the ID of this VPC
    Value: !Ref MyVPC
    Export:                                      -- export from one template
      Name: ExportedVPCID

Resources:
  MySubnet:
    Type: AWS::EC2::Subnet
    Properties:
      AvailabilityZone: eu-north-1a
      CidrBlock: 10.32.0.0/24
      VpcId: !ImportValue ExportedVPCID         -- import in another template
```
</details>


<details>
<summary>Conditions (If / Not / Or / Equals)</summary>

```
Conditions:
  CreateProdResources: !Equals [ !Ref EnvType, prod ]
```

  - !And
  - !Equals
  - !If
  - !Not
  - !Or
</details>

<details>
<summary>Intrisic Functions (- Ref / GetAtt / ImportValue / Join / Sub ) </summary>

<details>
<summary>Ref</summary> 
 
```
     function can be leveraged to reference:
       • Parameters => returns the value of the parameter
       • Resources => returns the physical ID of the underlying resource (ex: EC2 ID)
```
     
  Ref: -- reference to parameter
  Fn:Ref  / !Ref = the same
  
```
  VPC:
    Type: AWS::EC2::VPC
    Properties:
      CidrBlock: !Ref VpcCIDR
      EnableDnsSupport: true
      EnableDnsHostnames: true
      Tags:
        - Key: Name
          Value: !Ref EnvironmentName

  PublicSubnet1:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref VPC
      AvailabilityZone: !Select [ 0, !GetAZs '' ]
      CidrBlock: !Ref PublicSubnet1CIDR
      MapPublicIpOnLaunch: true
      Tags:
        - Key: Name
          Value: !Sub ${EnvironmentName} Public Subnet (AZ1)
```
</details>

<details>
<summary>GetAtt -Attributes are attached to any resources you create</summary>
 
```
      Resources:
        EC2Instance:
          Type: "AWS::EC2::Instance"
          Properties:
            ImageId: ami-sdfs23
            InstanceType: t2.micro

        NewVolume:
          Type: "AWS::EC2::Volume"
          Condition: CreateProdResources
          Properties:
            Size: 100
            AvailabilityZone:
              !GetAtt EC2Instance.AvailabilityZone             --get att from ec2 instance
```

</details>
<details>
<summary>Sub (substitute/use vars)</summary>

The following example uses a mapping to substitute the ${Domain} variable with the resulting value from the Ref function.

```
Name: !Sub 
  - 'www.${Domain}'
  - Domain: !Ref RootDomainName
```

example uses Fn::Sub with the AWS::Region and AWS::AccountId pseudo parameters and the vpc resource logical ID to create an Amazon Resource Name (ARN) for a VPC.

```
!Sub 'arn:aws:ec2:${AWS::Region}:${AWS::AccountId}:vpc/${vpc}'
```

 example uses a literal block to specify the user data script.

```
UserData:
  Fn::Base64:
    !Sub |
      #!/bin/bash -xe
      yum update -y aws-cfn-bootstrap
      /opt/aws/bin/cfn-init -v --stack ${AWS::StackName} --resource LaunchConfig --configsets wordpress_install --region ${AWS::Region}
      /opt/aws/bin/cfn-signal -e $? --stack ${AWS::StackName} --resource WebServerGroup --region ${AWS::Region}
```

</details>

     
</details>

<details>
<summary>EC2 UserData (Base64)</summary>

 ```
Resources:
  MyInstance:
  Properties:
    UserData:
      Fn::Base64 |
        #!/bin/bash -xe
        yum update -y
```

user data script log is in /var/log/cloud-init-output.log
</details>

<details>
<summary>cfn-init (instead of user-datascript)</summary>

```
 Resources:
  MyInstance:
    Type: AWS::EC2::Instance
    Properties:
      AvailabilityZone: us-east-1a
      ImageId: ami-009d6802948d06e52
      InstanceType: t2.micro
      KeyName: !Ref SSHKey
      SecurityGroups:
        - !Ref SSHSecurityGroup
      # we install our web server with user data
      UserData: 
        Fn::Base64:
          !Sub |
            #!/bin/bash -xe
            # Get the latest CloudFormation package
            yum update -y aws-cfn-bootstrap
            # Start cfn-init
            /opt/aws/bin/cfn-init -s ${AWS::StackId} -r MyInstance --region ${AWS::Region} || error_exit 'Failed to run cfn-init'
    Metadata:
      Comment: Install a simple Apache HTTP page
      AWS::CloudFormation::Init:
        config:
          packages:
            yum:
              httpd: []
          files:
            "/var/www/html/index.html":
              content: |
                <h1>Hello World from EC2 instance!</h1>
                <p>This was created using cfn-init</p>
              mode: '000644'
          commands:
            hello:
              command: "echo 'hello world'"
          services:
            sysvinit:
              httpd:
                enabled: 'true'
                ensureRunning: 'true'
```
</details>

<details>
<summary>cfn-signal / WaitCondition</summary>

logs in: /var/log/cloud-init.log
 ``` 
      UserData: 
        Fn::Base64:
          !Sub |
            #!/bin/bash -xe
            # Get the latest CloudFormation package
            yum update -y aws-cfn-bootstrap
            # Start cfn-init
            /opt/aws/bin/cfn-init -s ${AWS::StackId} -r MyInstance --region ${AWS::Region}
            # Start cfn-signal to the wait condition
            /opt/aws/bin/cfn-signal -e $? --stack ${AWS::StackId} --resource SampleWaitCondition --region ${AWS::Region}
    Metadata:
      Comment: Install a simple Apache HTTP page
      AWS::CloudFormation::Init:
        config:
          packages:
            yum:
              httpd: []
          files:
            "/var/www/html/index.html":
              content: |
                <h1>Hello World from EC2 instance!</h1>
                <p>This was created using cfn-init</p>
              mode: '000644'
          commands:
            hello:
              command: "echo 'hello world'"
          services:
            sysvinit:
              httpd:
                enabled: 'true'
                ensureRunning: 'true'

  SampleWaitCondition:
    CreationPolicy:
      ResourceSignal:
        Timeout: PT2M
        Count: 1
    Type: AWS::CloudFormation::WaitCondition
```
</details>

<details>
<summary>cfn failures</summary>

   - Verify that the cfn-init & cfn-signal command was successfully run on the instance. You can view logs, such as /var/log/cloud-init.log or /var/log/cfn-init.log
   -  You can retrieve the logs by logging in to your instance, but you must disable 
rollback on failure or else AWS CloudFormation deletes the instance after your stack fails to create\
   - Verify that the instance has a connection to the Internet
 
</details>

<details>
<summary>nested stack</summary>

```
 Resources:
  myStack:
    Type: AWS::CloudFormation::Stack
    Properties:
      TemplateURL: https://s3.amazonaws.com/cloudformation-templates-us-east-1/LAMP_Single_Instance.template
      Parameters:
        KeyName: !Ref SSHKey
        DBName: "mydb"
        DBUser: "user"
        DBPassword: "pass"
        DBRootPassword: "passroot"
        InstanceType: t2.micro
        SSHLocation: "0.0.0.0/0"
```
</details>

<details>
<summary>change sets</summary>
<br> it's updates that is not implemented in the same time, but you can check what can be deployed, if it's valid, what would be changed (if ec2 will be re-created or else)
</details>

<details>
<summary>cloudformation dritf</summary>
can check if something was changed manually from last stack apply
</details>

<details>
<summary>deletion policies</summary>

 - delete -- default - delete all resources
 - Retain -- delete step will be skipped for resource
 - Snapshot -- snapshot will be taken before
</details>

<details>
<summary>simple</summary>
<br> count =12
</details>
