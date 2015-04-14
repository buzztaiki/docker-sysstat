FROM centos:centos5
MAINTAINER Taiki Sugawara <buzztaiki@gmail.com>

RUN yum -y install man sysstat

COPY entrypoint /

ENTRYPOINT ["/entrypoint"]
