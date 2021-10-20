FROM zerotier/zerotier:latest
RUN apt-get update -qq && apt-get install socat -y

EXPOSE 9993/udp
EXPOSE 8001/tcp

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
