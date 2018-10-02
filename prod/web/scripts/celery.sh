#!/bin/bash

/code/venv/bin/python -m celery worker --app=mybook_site --concurrency=10