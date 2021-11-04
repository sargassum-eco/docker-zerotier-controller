FROM zerotier/zerotier:latest

EXPOSE 9993/udp
EXPOSE 9993/tcp

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
