#!/bin/sh

CUR_DIR=$(cd $(dirname $0); pwd)
. $CUR_DIR/functions.sh

call_show_start_banner

kubectl delete deployment productpage-v1
kubectl delete deployment details-v1
kubectl delete deployment reviews-v1
kubectl delete deployment reviews-v2
kubectl delete deployment reviews-v3
kubectl delete deployment ratings-v1

kubectl delete service productpage
kubectl delete service details
kubectl delete service reviews
kubectl delete service ratings

kubectl delete VirtualService productpage
kubectl delete VirtualService details
kubectl delete VirtualService ratings
kubectl delete VirtualService reviews
kubectl delete httproute reviews

kubectl get pods
kubectl get deployment
kubectl get services
kubectl get httproute

call_show_finish_banner
