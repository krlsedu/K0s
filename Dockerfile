FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt install -y openssh-server
RUN apt install -y curl
RUN apt-get install -y ubuntu-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' \
    /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional \
    pam_loginuid.so@g' -i /etc/pam.d/sshd

EXPOSE 22