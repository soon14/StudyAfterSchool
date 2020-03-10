FROM jdk:0.1
LABEL maintainer="jnW"
ADD nginx-1.6.3.tar.gz /usr/local
RUN rm -f /usr/local/*.tar.gz
WORKDIR /usr/local/nginx-1.6.3/
CMD [ "./bin/start-dss-flow-execution-entrance.sh" ]