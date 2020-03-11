FROM wjn0918/ubuntu-jdk1.8
LABEL maintainer="jnW"
ADD linkis-metadata.tar.gz /usr/local
RUN rm -f /usr/local/*.tar.gz
WORKDIR  /usr/local/linkis-metadata
CMD [ "./bin/start-metadata.sh" ]
