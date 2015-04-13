FROM centos:_TAG_
MAINTAINER Taiki Sugawara <buzztaiki@gmail.com>

RUN yum -y install man sysstat
m4_ifelse(
  _TAG_,`centos6',`RUN yum -y --setopt=tsflags= reinstall sysstat',
  _TAG_,`centos7',`RUN yum -y --setopt=tsflags= reinstall sysstat',
)

COPY entrypoint /

ENTRYPOINT ["/entrypoint"]
