#!/bin/sh

echo "Setting configuration..."
echo '{"settings": {"allowManagementFrom": ["0.0.0.0/0"]}}' > /var/lib/zerotier-one/local.conf

echo "Starting ZeroTier One..."
setsid /usr/sbin/zerotier-one &

echo "Sleeping forever..."
sleep infinity
