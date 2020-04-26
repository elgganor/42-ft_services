FROM alpine

RUN apk update
RUN apk add --no-cache mysql mysql-client

COPY my.cnf /etc/mysql/

EXPOSE 3306