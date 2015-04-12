FROM centos:_TAG_
MAINTAINER Taiki Sugawara <buzztaiki@gmail.com>

RUN yum -y install man sysstat
COPY entrypoint /

ENTRYPOINT ["/entrypoint"]
