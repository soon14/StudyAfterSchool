FROM wjn0918/ubuntu-jdk1.8
LABEL maintainer="jnW"
ADD visualis-server.tar.gz /usr/local
RUN rm -f /usr/local/*.tar.gz
WORKDIR /usr/local/visualis-server/
CMD [ "./bin/start-visualis-server.sh" ]