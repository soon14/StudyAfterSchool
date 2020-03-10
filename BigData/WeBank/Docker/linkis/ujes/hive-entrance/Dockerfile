FROM jdk:0.1
LABEL maintainer="jnW"
ADD linkis-ujes-hive-entrance.tar.gz /usr/local

RUN rm -f /usr/local/*.tar.gz

WORKDIR  /usr/local/linkis-ujes-hive-entrance
EXPOSE 9108
CMD [ "./bin/start-hive-entrance.sh" ]
