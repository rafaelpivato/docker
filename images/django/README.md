django container
================

You one of the following commands:

1. `serve`: launch Gunicorn WSGI server
2. `work`: launch Celery background worker
3. `migrate`: run Django migrate command

You will need to define environment variable `DJANGO_WSGI_APP` like
`myapp:wsgi` to run `serve` and `DJANGO_CELERY_APP` to run `work`
command.

This does not install neither Django nor Celery, as well as any other
requirements. You'll need to define that in your own Dockerfile with
`requirements.txt`.

    COPY requirements.txt ./
    RUN pip install --no-cache-dir -r requirements.txt
