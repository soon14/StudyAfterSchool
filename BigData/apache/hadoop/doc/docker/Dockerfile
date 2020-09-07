FROM wjn0918/ubuntu-jdk1.8
LABEL maintainer="jnW"
# 添加hadoop包
ADD hadoop-3.1.3.tar.gz /usr/local
RUN rm -f /usr/local/*.tar.gz
WORKDIR /usr/local/hadoop-3.1.3/
# 安装ssh
ADD sources.list /etc/apt
RUN apt-get update && apt-get install openssh-client -y && apt-get install openssh-server -y
# ssh 免密
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 0600 ~/.ssh/authorized_keys