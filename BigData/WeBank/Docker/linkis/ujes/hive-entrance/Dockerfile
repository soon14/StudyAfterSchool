FROM wjn0918/ubuntu-jdk1.8
LABEL maintainer="jnW"
ADD linkis-ujes-hive-entrance.tar.gz /usr/local
RUN rm -f /usr/local/*.tar.gz
WORKDIR  /usr/local/linkis-ujes-hive-entrance
CMD [ "./bin/start-hive-entrance.sh" ]