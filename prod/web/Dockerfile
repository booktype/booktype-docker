# ubuntu image for booktype
FROM ride90/ubuntu-booktype

# set env vars
ENV INSTANCENAME mybook
ENV BOOKTYPE_REDIS_HOST redis
ENV BOOKTYPE_BROKER_URL amqp://guest:guest@rabbit:5672/

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
    && ./Booktype/scripts/createbooktype --database sqlite ${INSTANCENAME}

# make scripts executable
RUN chmod ug+x scripts/celery.sh scripts/web.sh scripts/manage_py.sh ${INSTANCENAME}/manage_dev.py

# run manage commands
RUN ./scripts/manage_py.sh

RUN chown -R booktype.booktype /code/ \
    && chmod -R 775 /code/${INSTANCENAME}/logs \
    && chmod -R 775 /code/${INSTANCENAME}/data

EXPOSE 8000

# start supervisor
# - django dev server
# - celery
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]