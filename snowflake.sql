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


