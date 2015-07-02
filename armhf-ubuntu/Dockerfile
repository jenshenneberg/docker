FROM mazzolino/armhf-ubuntu:latest
MAINTAINER Marius Hein <mhein@itsocks.de>
LABEL Description="Ubuntu Raspberry FHEM container"

EXPOSE 22 2223

COPY docker-rootfs/docker-env.sh    /etc/profile.d/docker-env.sh
COPY docker-rootfs/resolv.conf      /etc/resolv.conf
COPY docker-rootfs/interfaces       /etc/network/interfaces
COPY docker-rootfs/sshd_config      /etc/ssh/sshd_config
COPY docker-rootfs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY docker-rootfs/authorized_keys  /root/.ssh/authorized_keys

RUN apt-get update && apt-get install -y language-pack-en openssh-server supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
RUN rm -rf /var/lib/apt/lists/*
RUN chmod 600 /root/.ssh && chmod 600 /root/.ssh/authorized_keys
RUN /sbin/ifup -a -v --no-mappings
CMD ["/usr/bin/supervisord", "-n"]

