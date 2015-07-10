# etcd cloudflare zone updater for Docker

This is a container that uses confd and a nodejs script in order to update the zone of a domain.
Quick instructions:

```bash
docker run -ti -e DOMAIN=0x4139.com -e EMAIL=0x4139@gmail.com -e TOKEN=cloudflare_token -e ETCD=etcd_peer_address 0x4139/etcd-cloudflare-updater
```
TODO:
why, how,