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




