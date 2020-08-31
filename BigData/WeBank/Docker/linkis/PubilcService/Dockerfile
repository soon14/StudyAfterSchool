FROM jdk:0.1
LABEL maintainer="jnW"
ADD linkis-publicservice.tar.gz /usr/local

RUN rm -f /usr/local/*.tar.gz

WORKDIR  /usr/local/linkis-publicservice
EXPOSE 9102
CMD [ "./bin/start-publicservice.sh" ]
