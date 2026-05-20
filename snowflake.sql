create database weather_db;
use database weather_db;

create schema weather_schema;
use schema weather_schema;

CREATE OR REPLACE TABLE weather_table (
    data VARIANT
);

CREATE OR REPLACE FILE FORMAT weather_json_format
TYPE = 'JSON';

CREATE OR REPLACE STAGE weather_stage
URL='s3://weather-00000001456/'

CREDENTIALS=(
AWS_KEY_ID=os.getenv('AWS_KEY_ID')
AWS_SECRET_KEY=os.getenv('AWS_SECRET_KEY')
)

FILE_FORMAT = weather_json_format;

create or replace pipe weather_pipe
auto_ingest = TRUE
as
copy into weather_table
from @weather_stage
file_format=(
type='json'
)
on_error=continue;





