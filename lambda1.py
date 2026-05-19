import json
import boto3
import urllib.request
from datetime import datetime
from dotenv import load_dotenv
import os

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('weather_data_table')

load_dotenv('.env')
API_KEY = os.getenv('API_KEY')
def lambda_handler(event, context):

    city = "Moscow"

    url = os.getenv('url')
    response = urllib.request.urlopen(url)
    data = json.loads(response.read())

    temperature = str(data['list'][0]['main']['temp'])
    humidity = str(data['list'][0]['main']['humidity'])

    item = {
        'city': data['city']['name'],
        'temperature': temperature,
        'humidity': humidity,
        'timestamp': datetime.now().isoformat()
    }

    table.put_item(Item=item)

    return {
        'statusCode': 200,
        'body': json.dumps('Weather data stored successfully')
    }