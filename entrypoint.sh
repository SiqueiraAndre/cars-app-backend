#!/bin/sh

# run python command
python manage.py makemigrations --no-input
python manage.py migrate --no-input
python manage.py collectstatic --noinput --clear

DJANGO_SUPERUSER_PASSWORD=$SUPER_USER_PASSWORD python manage.py createsuperuser --username $SUPER_USER_NAME --email $SUPER_USER_EMAIL --noinput

gunicorn app.wsgi:application --workers 2 --bind 0.0.0.0:8000 --access-logfile '-' --timeout 90 --reload --reload-engine=poll