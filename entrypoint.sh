#!/bin/bash

./manage.py migrate

./manage.py updatecatalog

./manage.py collectstatic

./manage.py runserver 0.0.0.0:8000