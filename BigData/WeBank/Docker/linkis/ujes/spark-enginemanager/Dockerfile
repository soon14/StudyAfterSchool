FROM jdk:0.1
LABEL maintainer="jnW"
ADD linkis-ujes-spark-enginemanager.tar.gz /usr/local

RUN rm -f /usr/local/*.tar.gz

WORKDIR  /usr/local/linkis-ujes-spark-enginemanager
EXPOSE 9105
CMD [ "./bin/start-spark-enginemanager.sh" ]
