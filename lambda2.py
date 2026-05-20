import json
import boto3
import uuid

s3 = boto3.client('s3')

BUCKET_NAME = 'weather-00000001456'
