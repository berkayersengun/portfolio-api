##!/bin/bash
#set -e
#
#echo "creating db ........"
#psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
#    CREATE DATABASE portfolio;
#EOSQL