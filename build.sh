#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt

export DJANGO_SETTINGS_MODULE=todo_list.production_simple
python manage.py collectstatic --no-input
python manage.py migrate 