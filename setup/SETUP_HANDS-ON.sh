#!/bin/sh

S_TIME=$(date +%s)

echo "############################################################"
echo "# START"
echo "############################################################"

./step01-install_command.sh
./step02-start_minikube.sh
./step03-enable_istio_injection.sh
./step04-apply_kiali.sh*
./step05-apply_ingress.sh*

#	./step11-apply_resource_for_bookinfo.sh
#	./step12-apply_resource_for_wordpress.sh

E_TIME=$(date +%s)
DURATION=$((E_TIME - S_TIME))

echo "############################################################"
echo "# FINISH ($DURATION seconds)"
echo "############################################################"
