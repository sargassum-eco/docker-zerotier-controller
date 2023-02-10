#!/bin/sh

mkztfile() {
  file=$1
  mode=$2
  content=$3

  mkdir -p /var/lib/zerotier-one
  echo "$content" > "/var/lib/zerotier-one/$file"
  chmod "$mode" "/var/lib/zerotier-one/$file"
}

echo "Setting configuration..."
echo '{"settings": {"allowManagementFrom": ["0.0.0.0/0"]}}' > /var/lib/zerotier-one/local.conf

if [ "x$ZEROTIER_API_SECRET" != "x" ]; then
  mkztfile authtoken.secret 0600 "$ZEROTIER_API_SECRET"
fi

echo "Starting ZeroTier One..."
setsid /usr/sbin/zerotier-one &

if [ ! -z "$API_PORT" ]; then
  echo "Proxying ZeroTier One API to 0.0.0.0:$API_PORT..."
  ZT_PORT=$(cat /var/lib/zerotier-one/zerotier-one.port)
  setsid socat tcp-listen:$API_PORT,reuseaddr,fork tcp:localhost:$ZT_PORT &
fi

echo "Sleeping forever..."
sleep infinity
