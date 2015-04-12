TAGS = centos5 centos6 centos6

all: $(TAGS)

$(TAGS):
	m4 -P -D_TAG_=$@ Dockerfile.m4 | docker build -t buzztaiki/sysstat:$@ -

.PHONY: all $(TAGS)
