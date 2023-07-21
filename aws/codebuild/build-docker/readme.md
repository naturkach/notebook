
1. create role for codebuild

policies:
   ```
CloudWatchFullAccess
AmazonS3FullAccess
AmazonSNSFullAccess
AmazonSSMReadOnlyAccess
AmazonSSMReadOnlyAccess
SecretsManagerReadWrite
code-star-connections-for-codebuild  -- if we are going to connect github as a source for codepipeline and trigger on commits
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "codestar-connections:UseConnection",
            "Resource": "*"
        }
    ]
}
   ```

2. Environment - Ubuntu, Standart (runtime), Image: aws/codebuild/standard:5.0
<br> Privileged - true  -- this is need for docker run 
