FROM jdk:0.1
LABEL maintainer="jnW"
ADD linkis-ujes-spark-entrance.tar.gz /usr/local

RUN rm -f /usr/local/*.tar.gz

WORKDIR  /usr/local/linkis-ujes-spark-entrance
EXPOSE 9106
CMD [ "./bin/start-spark-entrance.sh" ]
