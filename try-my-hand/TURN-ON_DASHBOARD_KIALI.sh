#!/bin/sh

#	SRC_HOST=localhost
#	SRC_PORT=8080
#	DST_HOST=$(minikube ip)
#	DST_PORT=80

echo "\n### START: Turn on Kiali Dashboard ##########"
#	echo " - BookInfo App  > http://$SRC_HOST:$SRC_PORT/productpage"
#	echo " - WordPress App > http://$SRC_HOST:$SRC_PORT/"
echo "Press Ctrl-C to interrupt at any time."

#	ssh -N -i $(minikube ssh-key) -L $SRC_PORT:$SRC_HOST:$DST_PORT docker@$DST_HOST

istioctl dashboard kiali
