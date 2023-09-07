use 2 profiles:

```
$ aws configure                     (create default profile)
$ aws configure --profile account2

You can then switch between the accounts by passing the profile on the command.

$ aws dynamodb list-tables         (using default profile)
$ aws s3 ls --profile account2

If you spend more time using account1, you can make it the default by setting the AWS_DEFAULT_PROFILE environment variable. 
When the default environment variable is set, you do not need to specify the profile on each command.
$ export AWS_DEFAULT_PROFILE=account2
$ aws dynamodb list-tables
```
