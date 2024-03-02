FROM python:3.10-slim

WORKDIR /opt/app

RUN groupadd -r docker && useradd -d /opt/app -r -G docker myuser  \
    && chown -R myuser:myuser /opt/app && chmod 777 /opt/app -R

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV UWSGI_PROCESSES 1
ENV UWSGI_THREADS 16
ENV UWSGI_HARAKIRI 240
ENV DJANGO_SETTINGS_MODULE 'movies_app.settings'

COPY movies_app/run_uwsgi.sh run_uwsgi.sh
COPY requirements.txt requirements.txt
COPY movies_app/uwsgi/uwsgi.ini uwsgi.ini

RUN apt update && apt install -y gcc && pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

COPY movies_app movies_app
COPY sqlite_to_postgres sqlite_to_postgres
COPY .env .env

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

EXPOSE 8000

USER myuser
RUN newgrp docker

ENTRYPOINT ["./entrypoint.sh"]
