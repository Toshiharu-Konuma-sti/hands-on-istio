#!/bin/sh

CUR_DIR=$(cd $(dirname $0); pwd)
. $CUR_DIR/functions.sh

call_show_start_banner

echo "\n### START: Enable add-ons including Kiali ###"
kubectl apply -f istio/samples/addons

echo "\n### START: Check a status of rollout for deployment/kili ###"
kubectl rollout status deployment/kiali -n istio-system

call_show_finish_banner
