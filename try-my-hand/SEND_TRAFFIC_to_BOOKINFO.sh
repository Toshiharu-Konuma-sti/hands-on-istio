#!/bin/sh

CUR_DIR=$(cd $(dirname $0); pwd)
. $CUR_DIR/functions.sh

URL="http://try-istio.example/productpage"

call_send_http_request $URL

