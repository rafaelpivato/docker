FROM python:2.7

RUN mkdir /srv/app/ /srv/static/ /srv/media
WORKDIR /srv/app/

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*
    && pip install --no-cache-dir gunicorn

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . ./

EXPOSE 8000

CMD ["serve"]
ENTRYPOINT ["/srv/app/docker-entrypoint.sh"]
