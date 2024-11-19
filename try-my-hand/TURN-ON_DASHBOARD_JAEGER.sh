#!/bin/sh

echo "\n### START: Turn on Jaeger Dashboard ##########"
echo "Press Ctrl-C to interrupt at any time."

istioctl dashboard jaeger
