#!/bin/bash
set -eu

psql -v ON_ERROR_STOP=1 <<-EOSQL
  create role ${DB_USERNAME} login password '${DB_PASSWORD}';
  create database gee1bot_development;
  create database gee1bot_test;
  grant all privileges on database gee1bot_development to ${DB_USERNAME};
  grant all privileges on database gee1bot_test to ${DB_USERNAME};
EOSQL
