FROM zerotier/zerotier:1.10.2
RUN apt-get update -qq && apt-get install socat -y

EXPOSE 9993/udp
EXPOSE 9993/tcp

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
