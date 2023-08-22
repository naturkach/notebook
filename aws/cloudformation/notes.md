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

  - Ref   
  
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

  - GetAtt -Attributes are attached to any resources you create

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
<summary>simple</summary>
<br> count = 4
</details>
      
