to get URL - use "deploy apigw"

securing: use api-key in POST
- create api-key
- api resources - POST method, Method Request: API Key Required -> true
- connect key to api-gw:  usage plans - create new plan
- curl -X POST -H "x-api-key: ScanAbjKWC5Vg2xqPzx3F1P1dsN09s2l6owyn2V1" https://rnrnrfhsc2.execute-api.eu-north-1.amazonaws.com/DEV
