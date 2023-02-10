FROM zerotier/zerotier:1.10.2

EXPOSE 9993/udp
EXPOSE 9993/tcp

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
