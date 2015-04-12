TAGS = centos5 centos6 centos7

all: $(TAGS)

%.docker: Dockerfile.m4
	m4 -P -D_TAG_=$(basename $@) Dockerfile.m4 > $@

centos5: centos5.docker
centos6: centos6.docker
centos7: centos7.docker

$(TAGS):
	docker build -t buzztaiki/sysstat:$@ -f $@.docker .

.PHONY: all $(TAGS)
