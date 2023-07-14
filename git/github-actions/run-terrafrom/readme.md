it's all from: https://github.com/KasteM34/github-oidc-terraform

1. AWS IAM: add Identity privider (OpenID Connect)
   <a href='https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services'>
   Configuring OpenID Connect in AWS</a>
```
   For the provider URL: Use https://token.actions.githubusercontent.com
   For the "Audience": Use sts.amazonaws.com
   click "get thumbprint"
```

2. create S3 to store state
   - enable encryption, versioning

3. create a role that will be assumed
```
  - role-trusted-entity.json
    add policies to this role: s3-bucket-state.json -- to store state in s3
                               ssm-permisions.json  -- thermissions to resources we need to manipulate with terraform (ssm in our case)
```
4. create tf files in your repo:
```
terraform {
  backend "s3" {}                            -- no need to add more
}
resource "aws_ssm_parameter" "foo" {
  name  = "foo"
  type  = "String"
  value = "barr"
}
```

5. add git ignore for terrafrom
6. add secrets to repo:
   - AWS_BUCKET_NAME
   - AW_BUCKET_KEY_NAME -- value going to be path to state inside your bucket or just name of the state file infra.tfstate
   - AWS_REGION
   - AWS_ROLE -- arn of our role we created, that github actions will assume

7. githubactions:
   github-action.yml

