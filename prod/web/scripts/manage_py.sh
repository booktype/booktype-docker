#!/bin/bash

/code/venv/bin/python /code/mybook/manage_prod.py migrate
/code/venv/bin/python /code/mybook/manage_prod.py update_permissions
/code/venv/bin/python /code/mybook/manage_prod.py update_default_roles
/code/venv/bin/python /code/mybook/manage_prod.py collectstatic --noinput
/code/venv/bin/python /code/mybook/manage_prod.py compress
echo 'from django.contrib.auth.models import User; User.objects.create_superuser("admin", "admin@admin.com", "admin")' | /code/venv/bin/python /code/mybook/manage_dev.py shell