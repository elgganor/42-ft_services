minikube start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable dashboard
minikube addons enable ingress

eval $(minikube docker-env)
IP=$(minikube ip)

cp srcs/nginx/index_template.html srcs/nginx/index.html
sed -i '' "s/MINIKUBE_IP/$IP/g" srcs/nginx/index.html

cp srcs/mysql/wordpress_template.sql srcs/mysql/wordpress.sql
sed -i '' "s/MINIKUBE_IP/$IP/g" srcs/mysql/wordpress.sql

docker build -t nginx srcs/nginx
docker build -t mysql srcs/mysql
docker build -t phpmyadmin srcs/phpmyadmin
docker build -t wordpress srcs/wordpress

kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/nginx/ingress.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml

state=$(kubectl describe pod $(kubectl get pods | grep mysql | cut -d" " -f1) | grep Status: | cut -d" " -f10)
until [ $state == "Running" ]; do
	state=$(kubectl describe pod $(kubectl get pods | grep mysql | cut -d" " -f1) | grep Status: | cut -d" " -f10)
	sleep 2
done

sleep 3
kubectl exec -i $(kubectl get pods | grep mysql | cut -d" " -f1) -- mysql wordpress -u root < srcs/mysql/wordpress.sql

sleep 2
open http://$IP:80

rm srcs/mysql/wordpress.sql
rm srcs/nginx/index.html