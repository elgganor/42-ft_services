minikube start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable dashboard
minikube addons enable ingress

eval $(minikube docker-env)
IP=$(minikube ip)

cp srcs/nginx/index_template.html srcs/nginx/index.html
sed -i '' "s/MINIKUBE_IP/$IP/g" srcs/nginx/index.html

docker build -t nginx srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/nginx/ingress.yaml

rm srcs/nginx/index.html