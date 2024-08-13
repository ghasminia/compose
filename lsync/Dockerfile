FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y lsyncd rsync openssh-client

COPY lsyncd.conf.lua /etc/lsyncd/lsyncd.conf.lua

CMD ["lsyncd", "-nodaemon", "/etc/lsyncd/lsyncd.conf.lua"]
