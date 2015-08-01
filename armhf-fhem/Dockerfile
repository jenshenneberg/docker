FROM mazzolino/armhf-ubuntu:latest
MAINTAINER Marius Hein <mhein@itsocks.de>
LABEL Description="Ubuntu Raspberry FHEM container"
EXPOSE 22
VOLUME /opt/fhem
VOLUME /opt/fhem/local

RUN apt-get update && apt-get install -y  apt-transport-https \
    openssh-server supervisor ntp avrdude usbutils vim libauthen-sasl-perl
RUN wget -qO - https://debian.fhem.de/archive.key | apt-key add -
RUN echo "deb https://debian.fhem.de/stable ./" > /etc/apt/sources.list.d/fhem.list
RUN echo 'Acquire::https::debian.fhem.de::Verify-Peer "false";' > /etc/apt/apt.conf.d/fhem.conf
RUN apt-get update && apt-get install -y fhem

COPY docker-rootfs/docker-env.sh    /etc/profile.d/docker-env.sh
COPY docker-rootfs/resolv.conf      /etc/resolv.conf
COPY docker-rootfs/sshd_config      /etc/ssh/sshd_config
COPY docker-rootfs/authorized_keys  /root/.ssh/authorized_keys
COPY docker-rootfs/interfaces /etc/network/interfaces
COPY docker-rootfs/ntp.conf /etc/ntp.conf
COPY docker-rootfs/timezone /etc/timezone
COPY docker-rootfs/vimrc.local /etc/vim/vimrc.local
COPY docker-rootfs/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY docker-rootfs/fhem-main.cfg /opt/fhem/fhem-main.cfg

RUN chown -R fhem:root /opt/fhem/local
RUN /sbin/ifup -a -v --no-mappings

CMD ["/usr/bin/supervisord", "-n"]
