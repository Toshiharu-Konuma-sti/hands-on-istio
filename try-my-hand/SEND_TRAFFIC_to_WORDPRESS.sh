#!/bin/sh

URL="http://try-istio.example/"
MAX=10000
UNIT=10

for i in $(seq 1 $MAX)
do
	RET=$(curl -L -I "$URL" | grep HTTP/)
	echo "$RET" | sed "s/^/$(echo "$i\/$MAX: ")/g"
	if [ $(expr $i % $UNIT) -eq 0 ]; then
		sleep 1
	fi
done
