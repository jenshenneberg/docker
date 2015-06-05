# Docker Ubuntu Base Image

Collection of various docker images.

***These images are for testing purposes only.***

## Features

* Prepared to use with Vagrant
* Fixed en_US.UTF-8 locales
* Bridge network, eth0 interfaces
* DNS config w/ google dns servers
* Easy sshd configuration (unsecure)
* Supervisor main command

## How to

    # Start
    $ docker run --name=ubuntu --detach --privileged  mxhash/ubuntu-base:latest

    # Show ip address
    $ docker exec -ti ubuntu ip addr show dev eth0
    271: eth0: <BROADCAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default
        link/ether 02:42:0a:25:81:6e brd ff:ff:ff:ff:ff:ff
        inet 10.37.129.110/24 scope global eth0
           valid_lft forever preferred_lft forever
        inet6 fdb2:2c26:f4e4:1:42:aff:fe25:816e/64 scope global dynamic
           valid_lft 2591668sec preferred_lft 604468sec
        inet6 fe80::42:aff:fe25:816e/64 scope link
           valid_lft forever preferred_lft forever

    # SSH connection
    ssh root@10.37.129.110;
    Password:

    mhein@ws-mhein08~/NETWAYS/Docker/base
    $ ssh root@10.37.129.110;
    Password:
    Welcome to Ubuntu 14.04.2 LTS (GNU/Linux 4.0.3-boot2docker x86_64)

     * Documentation:  https://help.ubuntu.com/
    Last login: Fri Jun  5 16:46:34 2015 from 10.37.129.2
    root@68508f9404ac:~#

## License

GPLv2+, see LICENSE file for further details:

    Various Docker Image
    Copyright (C) 2015 Marius Hein

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
