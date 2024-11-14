#!/bin/sh

S_TIME=$(date +%s)

echo "############################################################"
echo "# START"
echo "############################################################"

./step01-install_command.sh
./step02-start_minikube.sh
./step03-enable_istio_injection.sh
./step04-apply_resource_for_bookinfo.sh
./step05-apply_ingress.sh
./step06-apply_kiali.sh*

E_TIME=$(date +%s)
DURATION=$((E_TIME - S_TIME))

echo "############################################################"
echo "# FINISH ($DURATION seconds)"
echo "############################################################"
