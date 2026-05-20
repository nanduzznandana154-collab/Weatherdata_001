import json
import boto3
import urllib.request
from datetime import datetime
from dotenv import load_dotenv
import os

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('weather_data_table')

