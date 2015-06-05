# mxhash/ubuntu-base
#
# VERSION 0.0.1
FROM ubuntu:latest
MAINTAINER Marius Hein <mhein@itsocks.de>
LABEL Description="Ubuntu base box with dhcp/bridge network, sshd and supervisor"

EXPOSE 22
ADD . /vagrant

COPY docker-rootfs/docker-env.sh    /etc/profile.d/docker-env.sh
COPY docker-rootfs/resolv.conf      /etc/resolv.conf
COPY docker-rootfs/interfaces       /etc/network/interfaces
COPY docker-rootfs/sshd_config      /etc/ssh/sshd_config
COPY docker-rootfs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN apt-get update && apt-get install -y language-pack-en openssh-server supervisor
RUN rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
RUN echo 'root:vagrant' | chpasswd
RUN /sbin/ifup -a -v --no-mappings

CMD ["/usr/bin/supervisord"]
