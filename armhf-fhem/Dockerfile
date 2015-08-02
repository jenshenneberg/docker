FROM mazzolino/armhf-ubuntu:latest
MAINTAINER Marius Hein <mhein@itsocks.de>
LABEL Description="Ubuntu FHEM container"
EXPOSE 22 8083 8084 8085
# ----------------
# VOLUME /opt/fhem
# ----------------
VOLUME /opt/fhem/local
VOLUME /opt/temp
RUN sudo echo "Europe/Berlin" > /etc/timezone
RUN sudo dpkg-reconfigure -f noninteractive tzdata
RUN apt-get update && apt-get install -y apt-transport-https avrdude usbutils libauthen-sasl-perl wget
RUN wget -qO - https://debian.fhem.de/archive.key | apt-key add -
RUN echo "deb https://debian.fhem.de/stable ./" > /etc/apt/sources.list.d/fhem.list
RUN echo 'Acquire::https::debian.fhem.de::Verify-Peer "false";' > /etc/apt/apt.conf.d/fhem.conf
RUN apt-get update && apt-get install -y fhem
COPY docker-rootfs/docker-env.sh /etc/profile.d/docker-env.sh
COPY docker-rootfs/timezone /etc/timezone
COPY docker-rootfs/fhem-main.cfg /opt/fhem/fhem-main.cfg
COPY docker-rootfs/docker-fhem.sh /usr/bin/docker-fhem.sh
RUN chown -R fhem:root /opt/fhem/local; chmod 755 /usr/bin/docker-fhem.sh
RUN mknod /dev/ttyUSB0 c 188 0 > /dev/null 2>1
ENTRYPOINT /usr/bin/docker-fhem.sh
