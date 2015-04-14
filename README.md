# Docker-Sysstat

Read several version sar data files using docker.

https://registry.hub.docker.com/u/buzztaiki/sysstat/

## Usage

Read CentOS6 sar data file with sadf.

````console
$ docker run -i --rm buzztaiki/sysstat:centos6 sadf -- -A < centos6.sa1
````

Read CentOS6 sar data file with sar.

````console
$ docker run -i --rm buzztaiki/sysstat:centos6 sar -A < centos6.sa1
````

Use `centos5`, `centos6`, `centos7` tag for reading sar data file.

````console
$ docker run -i --rm buzztaiki/sysstat:centos5 sar -A < centos5.sa1
$ docker run -i --rm buzztaiki/sysstat:centos6 sar -A < centos6.sa1
$ docker run -i --rm buzztaiki/sysstat:centos7 sar -A < centos7.sa1
````

Show man page of sar and sadf.

````
$ docker run -it --rm buzztaiki/sysstat:centos6 man sar
$ docker run -it --rm buzztaiki/sysstat:centos6 man sadf
````


## Daemon mode

You can use daemon mode for reading multi sar data files faster.

Run docker image as as daemon mode.

````console
$ docker run -i --name sysstat-centos6 --rm buzztaiki/sysstat:centos6 daemon
````

And run `/entrypoint` command using `docker exec`.

````console
$ docker exec -i sysstat-centos6 /entrypoint sadf -- -A < centos6.sa1
````


## License

[MIT](LICENSE)
