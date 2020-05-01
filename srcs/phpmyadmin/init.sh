docker rm phpmyadmin
docker rmi phpmyadmin
docker build -t phpmyadmin .
docker run --name phpmyadmin -p 5000:5000 -it phpmyadmin