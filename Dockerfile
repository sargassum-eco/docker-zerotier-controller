FROM zerotier/zerotier:1.10.1

EXPOSE 9993/udp
EXPOSE 9993/tcp

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
