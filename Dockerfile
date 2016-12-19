FROM ubuntu:trusty

RUN apt-get -y update 
RUN apt-get -y install git
RUN apt-get -y install software-properties-common
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get -y update
RUN apt-get -y install ansible

ADD . /ansible
WORKDIR /ansible

RUN useradd -m -s /bin/bash ubuntu
RUN usermod -aG sudo ubuntu
RUN echo "ubuntu ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER ubuntu
RUN ./provision.sh
WORKDIR /home/ubuntu
