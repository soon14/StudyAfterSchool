FROM jdk:0.1
LABEL maintainer="jnW"
ADD linkis-metadata.tar.gz /usr/local

RUN rm -f /usr/local/*.tar.gz

WORKDIR  /usr/local/linkis-metadata
EXPOSE 9103
CMD [ "./bin/start-metadata.sh" ]
