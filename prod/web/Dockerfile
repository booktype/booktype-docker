# ubuntu image for booktype
FROM ride90/ubuntu-booktype

# set env vars
ENV INSTANCENAME mybook
ENV BOOKTYPE_SERVER 127.0.0.1
ENV BOOKTYPE_URL http://127.0.0.1
ENV BOOKTYPE_REDIS_HOST redis
ENV BOOKTYPE_BROKER_URL amqp://guest:guest@rabbit:5672/
ENV BOOKTYPE_DATABASE_ENGINE django.db.backends.postgresql_psycopg2
ENV BOOKTYPE_DATABASE_HOST db
ENV BOOKTYPE_DATABASE_PORT 5432
ENV BOOKTYPE_DATABASE_NAME booktype
ENV BOOKTYPE_DATABASE_USER booktype
ENV BOOKTYPE_DATABASE_PASSWORD booktype

# create dir for supervisor logs
RUN mkdir -p /var/log/supervisor

# copy supervisor configs
COPY configs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# create code dir
RUN mkdir -p /code/scripts

# copy shell scripts
COPY scripts /code/scripts

# set working dir
WORKDIR /code

# clone project
RUN git clone -b BK-2423 https://github.com/ride90/Booktype.git /code/Booktype/

# clone mpdf
#RUN git clone https://github.com/mpdf/mpdf.git /code/mpdf60/

# install && create && activate python virtualenv
# install python dependencies && generate project's skeleton
RUN pip install virtualenv \
    && virtualenv venv \
    && . venv/bin/activate \
    && pip install -r Booktype/requirements/prod.txt \
    && ./Booktype/scripts/createbooktype --database postgresql ${INSTANCENAME}

# make scripts executable
RUN chmod ug+x scripts/celery.sh scripts/web.sh scripts/manage_py.sh scripts/wait-for-it.sh ${INSTANCENAME}/manage_prod.py

RUN chown -R booktype.booktype /code/ \
    && chmod -R 775 /code/${INSTANCENAME}/logs \
    && chmod -R 775 /code/${INSTANCENAME}/data

EXPOSE 8000

# * wait for db container is ready to accept connection
#     https://docs.docker.com/compose/startup-order/
#     https://github.com/vishnubob/wait-for-it
#     https://github.com/vishnubob/wait-for-it/issues/15
# * run manage commands
#     - migrate
#     - update_permissions
#     - update_default_roles
#     - collectstatic
#     - compress
#     - create_superuser
# * run supervisor
#     - django dev server
#     - celery
CMD ./scripts/wait-for-it.sh -t 60 db:5432 -- ./scripts/manage_py.sh \
    && /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf