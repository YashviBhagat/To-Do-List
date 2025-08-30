#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt

# Set Django settings to production
export DJANGO_SETTINGS_MODULE=todo_list.production

# Create staticfiles directory if it doesn't exist
mkdir -p staticfiles

# Run collectstatic
python manage.py collectstatic --no-input

# Run migrations
python manage.py migrate 