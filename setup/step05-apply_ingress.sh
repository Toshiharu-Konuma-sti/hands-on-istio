#!/bin/sh

SET_DIR=$(cd $(dirname $0); pwd)
. $SET_DIR/functions.sh

call_show_start_banner

APPHOST="try-istio.example"
echo "\n### the dir for setting up  = [$SET_DIR] ##########"

echo "\n### START: Add the ip address for Ingress to /etc/hosts ###"
KUBE_IP=$(minikube ip)
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
kubectl apply -f $SET_DIR/ingress/try-istio-ingress.yaml

call_show_finish_banner
