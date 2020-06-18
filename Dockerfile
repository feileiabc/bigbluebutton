FROM ubuntu:16.04
wget -qO- https://ubuntu.bigbluebutton.org/bbb-install.sh | bash -s -- -w -v xenial-22 -a -w
