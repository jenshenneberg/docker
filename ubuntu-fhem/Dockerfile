FROM ubuntu:latest
MAINTAINER Marius Hein <mhein@itsocks.de>
LABEL Description="Ubuntu FHEM container"
EXPOSE 22 8083 8084 8085
# ----------------
# VOLUME /opt/fhem
# ----------------
VOLUME /opt/fhem/local
VOLUME /opt/temp
RUN apt-get update && apt-get install -y  apt-transport-https avrdude usbutils libauthen-sasl-perl wget
RUN wget -qO - https://debian.fhem.de/archive.key | apt-key add -
RUN echo "deb https://debian.fhem.de/stable ./" > /etc/apt/sources.list.d/fhem.list
RUN echo 'Acquire::https::debian.fhem.de::Verify-Peer "false";' > /etc/apt/apt.conf.d/fhem.conf
RUN apt-get update && apt-get install -y fhem
COPY docker-rootfs/docker-env.sh    /etc/profile.d/docker-env.sh
COPY docker-rootfs/timezone /etc/timezone
COPY docker-rootfs/fhem-main.cfg /opt/fhem/fhem-main.cfg
RUN chown -R fhem:root /opt/fhem/local
ENTRYPOINT cd /opt/fhem; /usr/bin/perl /opt/fhem/fhem.pl /opt/fhem/fhem-main.cfg
