FROM jdk:0.1
LABEL maintainer="jnW"
ADD linkis-gateway.tar.gz /usr/local

RUN rm -f /usr/local/*.tar.gz

WORKDIR  /usr/local/linkis-gateway
EXPOSE 9101
CMD [ "./bin/start-gateway.sh" ]
