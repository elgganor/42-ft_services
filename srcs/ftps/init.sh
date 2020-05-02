docker rm ftps
docker rmi ftps
docker build -t ftps .
docker run --name ftps -p 21:21 -it ftps