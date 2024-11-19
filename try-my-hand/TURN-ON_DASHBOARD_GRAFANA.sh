#!/bin/sh

echo "\n### START: Turn on Grafana Dashboard ##########"
echo "Press Ctrl-C to interrupt at any time."

istioctl dashboard grafana
