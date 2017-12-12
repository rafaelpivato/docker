# sentry composition

## Quickstart

```console
$ echo SECRET=$(docker-compose run --rm app config generate-secret-key) >> .env

$ docker-compose run --rm app upgrade --noinput
$ docker-compose run --rm app createuser                \
                                --email admin@localhost \
                                --password admin        \
                                --superuser             \
                                --no-input

$ docker-compose up -d
```
