#!/bin/bash

# Create empty database
#createdb portfolio -U postgres


## Apply database migrations
echo "Apply database migrations"
python manage.py migrate

echo "Create superuser"
python manage.py initadmin

echo  "collectstatic"
python manage.py collectstatic --noinput

## Start server
#echo "Starting server"
#python manage.py runserver 0.0.0.0:8000
gunicorn port.wsgi:application --bind 0.0.0.0:8000
