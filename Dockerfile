FROM centos:6

MAINTAINER Battcor <battcor@gmail.com>

WORKDIR /tmp

RUN yum -y install epel-release wget && \
    wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm && \
    wget https://centos6.iuscommunity.org/ius-release.rpm && \
    rpm -Uvh ius-release*.rpm && \
    yum -y update

RUN yum -y install ansible

RUN curl -SLO "https://s3.amazonaws.com/codeship-jet-releases/1.19.3/jet-linux_amd64_1.19.3.tar.gz"

RUN tar -xaC /usr/local/bin -f jet-linux_amd64_1.19.3.tar.gz

RUN chmod +x /usr/local/bin/jet

RUN wget http://stedolan.github.io/jq/download/linux64/jq

RUN chmod +x ./jq

RUN cp jq /usr/bin

RUN yum -y install git

RUN yum -y install php56u php56u-gd php56u-mcrypt php56u-mbstring php56u-mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

RUN pear install XML_Parser

RUN yum -y install unzip

RUN echo -e "date.timezone=\"Asia/Singapore\"" > /etc/php.d/timezone.ini

RUN yum -y install gcc-c++ make

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash

RUN source ~/.bashrc && nvm install v6.10.3 && nvm alias default 6.10.3 

RUN yum -y install nodejs

