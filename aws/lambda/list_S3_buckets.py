import boto3, os

def lambda_handler(event, context):
    myS3 = boto3.client('s3')
    try:
        results = myS3.list_buckets()
        print(results)
        output = ""
        for bucket in results['Buckets']:
            print(f'  {bucket["Name"]}')
            #output = output + bucket['Name'] 
            output = output + bucket['Name'] + "<br>"
        return(output)
    except:
        return("<h1><font color=red>ERROR</font></h1><br><br>")
