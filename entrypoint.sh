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

echo "Sleeping forever..."
sleep infinity
