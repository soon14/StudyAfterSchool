FROM wjn0918/ubuntu-jdk1.8
LABEL maintainer="jnW"
ADD linkis-ujes-hive-enginemanager.tar.gz /usr/local
RUN rm -f /usr/local/*.tar.gz
WORKDIR  /usr/local/linkis-ujes-hive-enginemanager
CMD [ "./bin/start-hive-enginemanager.sh" ]