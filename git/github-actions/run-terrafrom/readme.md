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
  - role-trusted-entity.json
