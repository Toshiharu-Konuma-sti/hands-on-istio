#!/bin/sh

echo "\n### START: Turn on Kiali Dashboard ##########"
echo "Press Ctrl-C to interrupt at any time."

istioctl dashboard kiali
