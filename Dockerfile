FROM centos:6

MAINTAINER Battcor <battcor@gmail.com>

WORKDIR /tmp

RUN yum -y install epel-release

RUN yum -y install ansible

RUN curl -SLO "https://s3.amazonaws.com/codeship-jet-releases/1.19.3/jet-linux_amd64_1.19.3.tar.gz"

RUN tar -xaC /usr/local/bin -f jet-linux_amd64_1.19.3.tar.gz

RUN chmod +x /usr/local/bin/jet

RUN yum -y install git
