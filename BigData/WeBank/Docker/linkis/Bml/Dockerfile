FROM jdk:0.1
LABEL maintainer="jnW"
ADD linkis-bml.tar.gz /usr/local

RUN rm -f /usr/local/*.tar.gz

WORKDIR  /usr/local/linkis-bml
CMD [ "./bin/start-bml.sh" ]
