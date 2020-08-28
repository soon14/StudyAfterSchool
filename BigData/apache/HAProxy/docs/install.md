yum -y install haproxy

将/etc/haproxy目录下的haproxy.cfg文件备份，新建haproxy.cfg文件，添加如下配置

```
#---------------------------------------------------------------------
# Example configuration for a possible web application.  See the
# full configuration options online.
#
#   http://haproxy.1wt.eu/download/1.4/doc/configuration.txt
#
#---------------------------------------------------------------------
#---------------------------------------------------------------------
# Global settings
#---------------------------------------------------------------------
global
    log         127.0.0.1 local2
    chroot      /var/lib/haproxy
    pidfile     /var/run/haproxy.pid
    maxconn     4000
    user        haproxy
    group       haproxy
    daemon
    # turn on stats unix socket
    stats socket /var/lib/haproxy/stats
#---------------------------------------------------------------------
# common defaults that all the 'listen' and 'backend' sections will
# use if not designated in their block
#---------------------------------------------------------------------
defaults
    mode                    http
    log                     global
    option                  httplog
    option                  dontlognull
    #option http-server-close
    #option forwardfor       except 127.0.0.0/8
    option                  redispatch
    retries                 3
    timeout http-request    10s
    timeout queue           1m
    timeout connect         10s
    timeout client          1m
    timeout server          1m
    timeout http-keep-alive 10s
    timeout check           10s
    maxconn                 3000
listen stats
    bind 0.0.0.0:1080
    mode http
    option httplog
    maxconn 5000
    stats refresh 30s
    stats  uri /stats 
listen ooziebalancer
    bind 0.0.0.0:11001
    mode tcp
    option tcplog
    balance leastconn
    server node89 node89:11000 check
    server node90 node90:11000 check


```

systemctl start haproxy


http://node90:1080/stats