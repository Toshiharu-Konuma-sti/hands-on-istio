#!/bin/sh

CUR_DIR=$(cd $(dirname $0); pwd)
. $CUR_DIR/functions.sh

call_show_start_banner

CLT_DIR=$(call_path_of_cluster $CUR_DIR)


echo "\n### the dir for cluster = [$CLT_DIR] ##########"
KUBE_IP=$(minikube ip)
APPHOST=$(grep "\- host:" $CLT_DIR/ingress/try-istio-ingress.yaml | \
	grep -v "localhost" | sed 's/\s//g' | sed 's/-host://' | sed -z 's/\n//' | sed -z 's/\r//')

echo "\n### START: Add the ip address for Ingress to /etc/hosts ###"
grep "$KUBE_IP" /etc/hosts | grep "$APPHOST"
if [ $? -ne 0 ]; then
	sudo sh -c "echo \"\n$KUBE_IP\t$APPHOST\" >> /etc/hosts"
fi


echo "\n### START: Enable an addon of Ingress ###"
minikube addons enable ingress

RET=-1
while [ $RET -ne 0 ]
do
	if [ $RET -gt 0 ]; then
		sleep 2
	fi
	echo "--> Please wait until the status of Ingress becomes to 'Running'."
	kubectl get pods -n ingress-nginx | grep "controller" | grep "Running" | grep "1/1"
	RET=$?
done


echo "\n### START: Apply a resource of Ingress ###"
kubectl apply -f $CLT_DIR/ingress/try-istio-ingress.yaml

call_show_finish_banner
