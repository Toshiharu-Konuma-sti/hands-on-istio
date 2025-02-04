#!/bin/sh

CUR_DIR=$(cd $(dirname $0); pwd)
. $CUR_DIR/functions.sh

call_show_start_banner

CLT_DIR=$(call_path_of_cluster $CUR_DIR)
echo "\n### the dir for cluster = [$CLT_DIR] ##########"

echo "\n### START: Apply resources of kubernetes for WordPress Application ###"
kubectl apply -f $CLT_DIR/wordpress/

kubectl get pods | grep -v "NAME" | grep -v "Running"
while [ $? -eq 0 ]
do
	sleep 2
	echo "--> check a status of pods in progress"
	kubectl get pods | grep -v "NAME" | grep -v "Running"
done

call_show_finish_banner
