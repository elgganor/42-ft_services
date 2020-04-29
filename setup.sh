minikube start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable dashboard
minikube addons enable ingress

eval $(minikube docker-env)
IP=$(minikube ip)

cp srcs/nginx/index_template.html srcs/nginx/index.html
sed -i '' "s/MINIKUBE_IP/$IP/g" srcs/nginx/index.html

docker build -t nginx srcs/nginx
docker build -t wordpress srcs/wordpress
docker build -t mysql srcs/mysql

kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/nginx/ingress.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/mysql/mysql.yaml

rm srcs/nginx/index.html

sleep 2
open http://$IP:80