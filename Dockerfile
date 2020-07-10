FROM debian:9
LABEL maintainer="Graham Lillico"

ENV DEBIAN_FRONTEND noninteractive

# Update packages to the latest version
RUN apt-get update \
&& apt-get upgrade \
&& apt-get autoremove

# Install required packages.
# Remove packages that are nolonger requried.
# Clean the apt cache.
# Remove documents, man pages & apt files.
RUN apt-get install -y --no-install-recommends \
sudo \
python \
python-pip \
python-setuptools \
python-wheel \
systemd \
systemd-sysv \
&& apt-get autoremove \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /usr/share/doc/* \
&& rm -rf /usr/share/man/*

# Install ansible.
RUN pip install ansible

# Create ansible directory and copy ansible inventory file.
RUN mkdir /etc/ansible
COPY hosts /etc/ansible/hosts

# Stop systemd from spawning agettys on tty[1-6].
RUN rm -f /lib/systemd/system/multi-user.target.wants/getty.target

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]