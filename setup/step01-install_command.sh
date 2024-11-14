#!/bin/sh

SET_DIR=$(cd $(dirname $0); pwd)
. $SET_DIR/functions.sh

call_show_start_banner

#	EXP_DIR=$(call_path_of_experience $SET_DIR)
echo "\n### the dir for setting up  = [$SET_DIR] ##########"
#	echo "### the dir for experiences = [$EXP_DIR] ##########"

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
if [ $? -ne 0 ]; then
	curl -L "https://istio.io/downloadIstio" | sh 
	mv ./istio-1.*.*/ $SET_DIR/istio/
	sudo install -o root -g root -m 0755 $SET_DIR/istio/bin/istioctl /usr/local/bin/
fi

call_show_finish_banner
