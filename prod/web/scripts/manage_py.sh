#!/bin/bash

/code/venv/bin/python /code/mybook/manage_dev.py migrate
/code/venv/bin/python /code/mybook/manage_dev.py update_permissions
/code/venv/bin/python /code/mybook/manage_dev.py update_default_roles
#/code/venv/bin/python /code/mybook/manage_dev.py collectstatic
#/code/venv/bin/python /code/mybook/manage_dev.py compress
echo 'from django.contrib.auth.models import User; User.objects.create_superuser("admin", "admin@admin.com", "admin")' | /code/venv/bin/python /code/mybook/manage_dev.py shell