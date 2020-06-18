FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux
ENV container docker
ENV init /lib/systemd/systemd

RUN apt-get -y update && \
    apt-get install -y language-pack-en vim wget systemd net-tools software-properties-common \
                       sudo apt-transport-https && \
    update-locale LANG=en_US.UTF-8 && \
    dpkg-reconfigure locales
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ xenial multiverse" | tee -a /etc/apt/sources.list && \
    apt-get -y update && \
    apt-get -y dist-upgrade
RUN wget -vO- https://ubuntu.bigbluebutton.org/bbb-install.sh | bash -s -- -w -v xenial-22 -a -w
