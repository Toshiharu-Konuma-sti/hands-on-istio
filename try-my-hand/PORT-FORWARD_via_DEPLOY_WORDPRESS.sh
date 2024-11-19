#!/bin/sh

SRC_HOST=localhost
SRC_PORT=8082
DST_HOST=wordpress-deployment
DST_PORT=80

echo "\n### START: Port-Forward from [$SRC_HOST:$SRC_PORT] to [$DST_HOST:$DST_PORT(Deployment)] ##########"
echo " - App > http://$SRC_HOST:$SRC_PORT"
echo "Press Ctrl-C to interrupt at any time.\n"

kubectl port-forward deployment/$DST_HOST $SRC_PORT:$DST_PORT
#	minikube service wordpress-service --url
