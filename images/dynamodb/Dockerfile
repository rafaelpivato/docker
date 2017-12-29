FROM openjdk:7

LABEL maintainer="Rafael Pivato <rpivato@gmail.com>"

RUN mkdir /srv/dynamodb
WORKDIR /srv/dynamodb

ADD https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz ./dynamodb.tgz
RUN tar -xzvf dynamodb.tgz

EXPOSE 8000

COPY docker-entrypoint.sh /srv
RUN chmod a+x /srv/docker-entrypoint.sh
ENTRYPOINT ["/srv/docker-entrypoint.sh"]
