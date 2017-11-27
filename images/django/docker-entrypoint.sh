#!/bin/bash

export PYTHONUNBUFFERED=1

function serve() {
    gunicorn ${DJANGO_WSGI_APP} \
        --bind 0.0.0.0:8000 \
        --workers 3 \
        --log-level=info \
        --access-logfile=- \
        --error-logfile=- \
        --access-logformat='%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s" "%({X-Forwarded-For}i)s" "%({X-Forwarded-Proto}i)s" "%({Access-Control-Allow-Origin}i)s"'
}

function channels() {
    daphne ${DJANGO_ASGI_APP} \
           --bind 0.0.0.0 \
           --port 8000 \
           --proxy-headers
}

function runworker() {
    python manage.py runworker
}

function work() {
    celery worker -A ${DJANGO_CELERY_APP}
}

function migrate() {
    python -u manage.py migrate --noinput
}

command=$1

case $command in
    serve|server)
	serve
	;;
    channels)
        channels
        ;;
    runworker)
        runworker
        ;;
    work|worker)
	work
	;;
    migrate|migration)
	migrate
	;;
    *)
	serve
	;;
esac
