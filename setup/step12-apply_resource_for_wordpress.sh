#!/bin/sh

CUR_DIR=$(cd $(dirname $0); pwd)
. $CUR_DIR/functions.sh

call_show_start_banner

SET_DIR=$(call_path_of_setup $CUR_DIR)
echo "\n### the dir for setting up  = [$SET_DIR] ##########"

echo "\n### START: Apply resources of kubernetes for WordPress Application ###"
kubectl apply -f $SET_DIR/wordpress/

kubectl get pods | grep -v "NAME" | grep -v "Running"
while [ $? -eq 0 ]
do
	sleep 2
	echo "--> check a status of pods in progress"
	kubectl get pods | grep -v "NAME" | grep -v "Running"
done

call_show_finish_banner
