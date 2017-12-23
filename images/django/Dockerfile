FROM python:2.7

RUN mkdir /srv/app/ /srv/static/ /srv/media
WORKDIR /srv/app/

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir gunicorn

EXPOSE 8000

COPY docker-entrypoint.sh /srv
RUN chmod a+x /srv/docker-entrypoint.sh
ENTRYPOINT ["/srv/docker-entrypoint.sh"]
CMD ["serve"]
