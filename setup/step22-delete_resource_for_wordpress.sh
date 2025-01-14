#!/bin/sh

CUR_DIR=$(cd $(dirname $0); pwd)
. $CUR_DIR/functions.sh

call_show_start_banner

kubectl delete deployment mysql-deployment
kubectl delete deployment wordpress-deployment

kubectl delete service mysql-service
kubectl delete service wordpress-service
kubectl delete configmap wordpress-configmap
kubectl delete PersistentVolumeClaim mysql-pv-claim

kubectl get pods
kubectl get deployment
kubectl get services
kubectl get configmap
kubectl get PersistentVolumeClaim

call_show_finish_banner
