#!/bin/sh

echo "Starting ZeroTier One..."
setsid /usr/sbin/zerotier-one &

PORT=8001
ZT_PORT=$(cat /var/lib/zerotier-one/zerotier-one.port)

# Since zerotier-one only binds on 127.0.0.1 instead of 0.0.0.0, we need a TCP proxy
# to make it available outside Docker:
echo "Proxying ZeroTier One API to 0.0.0.0:$PORT..."
setsid socat tcp-listen:$PORT,reuseaddr,fork tcp:localhost:$ZT_PORT &

echo "Sleeping forever..."
sleep infinity
