FROM ubuntu:16.04
RUN wget -vO- https://ubuntu.bigbluebutton.org/bbb-install.sh | bash -s -- -w -v xenial-22 -a -w
