# Debian 9 Docker Image for Ansible Testing

DEPRECATED - Debian 9 is End Of Life (EOL) as of June 30th 2022. For alternatives please see the below.

  - [Debian 10](https://github.com/glillico/docker-debian10-ansible)
  - [Debian 11](https://github.com/glillico/docker-debian11-ansible)

[![latest](https://github.com/glillico/docker-debian9-ansible/workflows/latest/badge.svg)](https://github.com/glillico/docker-debian9-ansible/actions?query=workflow%3Alatest)

A docker container using Debian 9 with Ansible installed for playbook and role testing.

## Tags

  - 'latest'  : Python 2.7.x and the latest stable version of Ansible.

## How To Build

To build this docker container you can do the following.

  - Install Docker Engine, see [here](https://docs.docker.com/engine/install/) for details.
  - Clone this repository.
    - `$ git clone https://github.com/glillico/docker-debian9-ansible.git`
  - Change to the repositories directory.
    - `$ cd docker-debian9-ansible`
  - Run the command
    - `$ docker build -t debian9-ansible .`

## How To Use

  - Install Docker Engine, see [here](https://docs.docker.com/engine/install/) for details.
  - To create a containter from the image you created in the `How To Build` section run the command.
    - `$ docker run --detach --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro debian9-ansible:latest`
  - To confirm Ansible is working within the container run the command.
    - `$ docker exec --tty <CONTAINER ID> env TERM=xterm ansible --version`

## Notes

This image is used for testing purposes only and is not intended to be used to provide live services of any sort.

## License

MIT

## Author Information

Created in 2020 by Graham Lillico.
