FROM jdk:0.1
LABEL maintainer="jnW"
ADD linkis-ujes-jdbc-entrance.tar.gz /usr/local

RUN rm -f /usr/local/*.tar.gz

WORKDIR  /usr/local/linkis-ujes-jdbc-entrance
EXPOSE 9111
CMD [ "./bin/start-jdbc-entrance.sh" ]
