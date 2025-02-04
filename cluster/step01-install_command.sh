#!/bin/sh

CUR_DIR=$(cd $(dirname $0); pwd)
. $CUR_DIR/functions.sh

call_show_start_banner

CLT_DIR=$(call_path_of_cluster $CUR_DIR)
echo "\n### the dir for cluster  = [$CLT_DIR] ##########"

ISTIO_DIR=$CLT_DIR/istio

echo "\n### START: Install Minikube ##########"
minikube version
if [ $? -ne 0 ]; then
	curl -LO "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
	sudo install -o root -g root -m 0755 minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
fi

echo "\n### START: Install kubectl ##########"
which kubectl
if [ $? -ne 0 ]; then
	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
	sudo install -o root -g root -m 0755 kubectl /usr/local/bin/ && rm kubectl
fi

echo "\n### START: Install Istio ##########"
which istioctl
if [ $? -ne 0 ] || [ ! -d $ISTIO_DIR/ ]; then
	curl -L "https://istio.io/downloadIstio" | sh 
	mv ./istio-1.*.*/ $ISTIO_DIR/
	sudo install -o root -g root -m 0755 $ISTIO_DIR/bin/istioctl /usr/local/bin/
fi

call_show_finish_banner
