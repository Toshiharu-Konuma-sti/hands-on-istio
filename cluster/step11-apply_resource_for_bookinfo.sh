#!/bin/sh

CUR_DIR=$(cd $(dirname $0); pwd)
. $CUR_DIR/functions.sh

call_show_start_banner

CLT_DIR=$(call_path_of_cluster $CUR_DIR)
echo "### the dir for cluster = [$CLT_DIR] ##########"


echo "\n### START: Apply resources of kubernetes for Bookinfo Application ###"
kubectl apply -f $CLT_DIR/istio/samples/bookinfo/platform/kube/bookinfo.yaml

RET=-1
while [ $RET -le 0 ]
do
	if [ $RET -eq 0 ]; then
		sleep 2
	fi
	echo "--> Please wait until there is no status of pods in progress."
	kubectl get pods | grep -v "NAME" | grep -v "Running"
	RET=$?
done


call_show_finish_banner
