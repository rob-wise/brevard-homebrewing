#!/bin/sh

# exit on error with code 0
set -e

python manage.py collectstatic --noinput

uwsgi --socket :8000 --master --enable-threads --module app.wsgi