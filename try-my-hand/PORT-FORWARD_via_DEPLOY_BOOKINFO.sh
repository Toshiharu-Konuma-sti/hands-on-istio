#!/bin/sh

SRC_HOST=localhost
SRC_PORT=8081
DST_HOST=productpage-v1
DST_PORT=9080

echo "\n### START: Port-Forward from [$SRC_HOST:$SRC_PORT] to [$DST_HOST:$DST_PORT(Deployment)] ##########"
echo " - App > http://$SRC_HOST:$SRC_PORT/productpage"
echo "Press Ctrl-C to interrupt at any time.\n"

kubectl port-forward deployment/$DST_HOST $SRC_PORT:$DST_PORT
