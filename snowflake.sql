create database weather_db;
use database weather_db;

create schema weather_schema;
use schema weather_schema;

CREATE OR REPLACE TABLE weather_table (
    data VARIANT
);

CREATE STORAGE INTEGRATION s3_int
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE

STORAGE_AWS_ROLE_ARN = os.getenv('STORAGE_AWS_ROLE_ARN')

STORAGE_ALLOWED_LOCATIONS = ('s3://weather-00000001456/');

