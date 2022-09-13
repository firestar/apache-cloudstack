FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y chrony wget gnupg2 iputils-ping

ADD /cloudstack.list /etc/apt/sources.list.d/cloudstack.list
RUN wget -O - http://download.cloudstack.org/release.asc | apt-key add -
RUN apt-get update

RUN apt-get install -y cloudstack-management

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
