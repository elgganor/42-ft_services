#!/bin/sh
docker rm mysql
docker rmi mysql
docker build -t mysql .
docker run --name mysql -p 3306:3306 -it mysql