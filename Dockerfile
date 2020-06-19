FROM ubuntu:16.04
ENV TERM linux

#RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get -y update && \
    apt-get install -y language-pack-en vim wget systemd net-tools software-properties-common \
                       sudo apt-transport-https && \
    update-locale LANG=en_US.UTF-8 && \
    dpkg-reconfigure locales

RUN wget https://ubuntu.bigbluebutton.org/repo/bigbluebutton.asc -O- | sudo apt-key add - && \
    echo "deb https://ubuntu.bigbluebutton.org/xenial-22/ bigbluebutton-xenial main" | sudo tee /etc/apt/sources.list.d/bigbluebutton.list && \
	sudo apt-get  -y update

RUN sudo apt-get install --reinstall -d `apt-cache depends bigbluebutton | grep depends | cut -d: f2 |tr -d "<>"`
RUN sudo apt-get install --reinstall -d `apt-cache depends bbb-html5 | grep depends | cut -d: f2 |tr -d "<>"`

ENTRYPOINT ["/lib/systemd/systemd"]
CMD ["/bin/bash", "-c", "exec /sbin/init --log-target=journal 3>&1"]