#!/bin/bash

/code/venv/bin/python /code/mybook/manage_prod.py celery worker --concurrency=10