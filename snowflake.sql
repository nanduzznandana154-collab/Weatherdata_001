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

desc integration s3_int;

CREATE OR REPLACE STAGE weather_stage
URL='s3://weather-00000001456/'
STORAGE_INTEGRATION = s3_int;

ls@weather_stage;

CREATE OR REPLACE FILE FORMAT weather_json_format
TYPE = 'JSON';

create or replace pipe weather_pipe
auto_ingest = TRUE
as
copy into weather_table
from @weather_stage
file_format=(
type='json'
)
on_error=continue;


