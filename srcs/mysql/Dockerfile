FROM alpine

RUN apk update
RUN apk add --no-cache mariadb mariadb-client

COPY setup.sh /tmp
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306

CMD sh /tmp/setup.sh