#!/bin/sh

SET_DIR=$(cd $(dirname $0); pwd)
. $SET_DIR/functions.sh

call_show_start_banner

#	EXP_DIR=$(call_path_of_experience $SET_DIR)
#	echo "### the dir for setting up  = [$SET_DIR] ##########"
#	echo "### the dir for experiences = [$EXP_DIR] ##########\n"

echo "\n### START: Create kubernetes cluster by minikube ###"
minikube stop
minikube delete
minikube start  --cpus=4 --memory='4g'

echo "\n### START: Apply add-on for minikube dashboad ###"
minikube addons enable metrics-server

call_show_finish_banner
