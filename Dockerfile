FROM iojs:latest
MAINTAINER Vali Malinoiu
WORKDIR /usr/local/bin/
RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.10.0/confd-0.10.0-linux-amd64 -o confd
RUN chmod +x confd
RUN ls
RUN mkdir -p /etc/confd/{conf.d,templates}
ADD dnsZone.toml /etc/confd/conf.d/
ADD dnsZone.tmpl /etc/confd/templates/
ADD run.sh /usr/local/bin/
RUN chmod +x run.sh
RUN npm i cloudflare-diff
CMD /usr/local/bin/run.sh