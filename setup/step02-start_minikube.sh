#!/bin/sh

CUR_DIR=$(cd $(dirname $0); pwd)
. $CUR_DIR/functions.sh

call_show_start_banner

SET_DIR=$(call_path_of_setup $CUR_DIR)
echo "### the dir for setting up  = [$SET_DIR] ##########"

echo "\n### START: Create a kubernetes cluster by minikube ###"
minikube stop
minikube delete
minikube start --cpus=4 --memory='4g'

echo "\n### START: Apply add-on for minikube dashboad ###"
minikube addons enable metrics-server

call_show_finish_banner
