#!/bin/sh

clear
S_TIME=$(date +%s)
CUR_DIR=$(cd $(dirname $0); pwd)

echo "############################################################"
echo "# START SCRIPT"
echo "############################################################"

$CUR_DIR/step01-install_command.sh
$CUR_DIR/step02-start_minikube.sh
$CUR_DIR/step03-enable_istio_injection.sh
$CUR_DIR/step04-apply_dashboards.sh
$CUR_DIR/step05-apply_ingress.sh

#	$CUR_DIR/step11-apply_resource_for_bookinfo.sh
#	$CUR_DIR/step12-apply_resource_for_wordpress.sh

E_TIME=$(date +%s)
DURATION=$((E_TIME - S_TIME))

echo "############################################################"
echo "# FINISH SCRIPT ($DURATION seconds)"
echo "############################################################"
