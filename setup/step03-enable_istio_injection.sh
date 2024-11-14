#!/bin/sh

SET_DIR=$(cd $(dirname $0); pwd)
. $SET_DIR/functions.sh

call_show_start_banner

echo "\n### START: Enable Istio injection to kubernetes cluster ###"
istioctl install --set profile=demo -y
kubectl label namespace default istio-injection=enabled

call_show_finish_banner
