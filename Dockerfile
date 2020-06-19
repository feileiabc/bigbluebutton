FROM ubuntu:16.04
ENV TERM linux

#RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get -y update && \
    apt-get install -y language-pack-en vim wget systemd net-tools software-properties-common \
                       sudo apt-transport-https && \
    update-locale LANG=en_US.UTF-8 && \
    dpkg-reconfigure locales
RUN  echo "deb http://archive.ubuntu.com/ubuntu/ xenial multiverse" | sudo tee -a /etc/apt/sources.list && \
    sudo apt-get install haveged && \
    sudo add-apt-repository ppa:bigbluebutton/support -y && \
    sudo add-apt-repository ppa:rmescandon/yq -y && \
	sudo add-apt-repository ppa:libreoffice/ppa && \
    sudo apt-get update && \
    sudo apt-get dist-upgrade
RUN wget -qO - https://www.mongodb.org/static/pgp/server-3.4.asc | sudo apt-key add - && \
    echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list &&\
    sudo apt-get update && \
    sudo apt-get install -y mongodb-org curl
	
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
    sudo apt-get install -y nodejs

RUN wget https://ubuntu.bigbluebutton.org/repo/bigbluebutton.asc -O- | sudo apt-key add - && \
    echo "deb https://ubuntu.bigbluebutton.org/xenial-22/ bigbluebutton-xenial main" | sudo tee /etc/apt/sources.list.d/bigbluebutton.list && \
	sudo apt-get  -y update

RUN sudo apt-get install  -y bigbluebutton
RUN sudo apt-get install  -y bbb-html5


