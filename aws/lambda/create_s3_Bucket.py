import boto3, os, time
from botocore.exceptions import ClientError

AWS_DEFAULT_REGION = "eu-north-1"
os.environ['AWS_DEFAULT_REGION'] = AWS_DEFAULT_REGION

bucketname = "createdby-lambda-on-" + str(time.time())

def lambda_handler(event, context):
    myS3 = boto3.resource('s3')
    print(f"bucketname {bucketname}")
    

        
    response = myS3.create_bucket(
        Bucket = bucketname,
        CreateBucketConfiguration={
           'LocationConstraint': AWS_DEFAULT_REGION,
        },
    )
    print("<h1>S3 bucket was created</h1>"+ str(response) )
    print(response)
