#!/bin/sh

CUR_DIR=$(cd $(dirname $0); pwd)
. $CUR_DIR/functions.sh

call_show_start_banner

CLT_DIR=$(call_path_of_cluster $CUR_DIR)
echo "\n### the dir for cluster = [$CLT_DIR] ##########"

KUBE_IP=$(minikube ip)
APPHOST=$(grep "\- host:" $CLT_DIR/ingress/try-istio-ingress.yaml | grep -v "localhost" | sed 's/\s//g' | sed 's/-host://' | sed -z 's/\n//' | sed -z 's/\r//')

echo "\n### START: Add the ip address for Ingress to /etc/hosts ###"
grep "$KUBE_IP" /etc/hosts | grep "$APPHOST"
if [ $? -ne 0 ]; then
	sudo sh -c "echo \"\n$KUBE_IP\t$APPHOST\" >> /etc/hosts"
fi

echo "\n### START: Enable an addon of Ingress ###"
minikube addons enable ingress

kubectl get pods -n ingress-nginx | grep "controller" | grep "Running" | grep "1/1"
while [ $? -ne 0 ]
do
	sleep 2
	echo "--> check a status of Ingress controller in running"
	kubectl get pods -n ingress-nginx | grep "controller" | grep "Running" | grep "1/1"
done

echo "\n### START: Apply a resource of Ingress ###"
kubectl apply -f $CLT_DIR/ingress/try-istio-ingress.yaml

call_show_finish_banner
