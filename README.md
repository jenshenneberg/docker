# Docker Ubuntu Base Image

Docker images for testing.

## Features

* Prepared to use with Vagrant
* Fixed en_US.UTF-8 locales
* Bridge network, eth0 interfaces
* DNS config w/ google dns servers
* Easy sshd configuration (unsecure)
* Supervisor main command

## How to

    # Start
    docker run --name=ubuntu --detach --privileged  mxhash/ubuntu-base:latest

    # Show ip address
    docker exec -ti ubuntu  ip addr show dev eth0

	  # SSH connection
	  ssh root@10.37.129.110
	  # password: vagrant

## License

    Enhanced Ubuntu Docker Image
    Copyright (C) 2015 Marius Hein

    This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be     useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
