FROM debian:buster-slim

RUN apt update && \
    apt install -y gnupg2 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 573E3D1C51AE1B3D && \
    echo "deb http://apt.spideroak.com/ubuntu/ release restricted" > /etc/apt/sources.list.d/spideroak.list && \
    apt update && apt install -y spideroakone && \
    rm /etc/apt/sources.list.d/spideroak.list && \
    apt clean

COPY entrypoint.sh /entrypoint.sh

WORKDIR /

ENTRYPOINT ["/entrypoint.sh"]
