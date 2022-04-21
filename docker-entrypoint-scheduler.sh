#!/bin/bash

echo "Apply database migrations"
python manage.py migrate

## Start scheduler
echo "Starting scheduler"
python manage.py schedule
