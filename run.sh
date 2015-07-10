#!/bin/bash
set -eo pipefail

echo "[confd] booting container. ETCD: $ETCD"
# Try to make initial configuration every 5 seconds until successful
until confd -onetime -node $ETCD -config-file /etc/confd/conf.d/dnsZone.toml; do
    echo "[hosts] waiting for confd to create initial dnsZone configuration"
    sleep 5
done

confd -interval 10 -node $ETCD -config-file /etc/confd/conf.d/dnsZone.toml &
echo "[confd] is now monitoring etcd for changes..."

# Follow the logs to allow the script to continue running
tail -f /var/log/lastlog