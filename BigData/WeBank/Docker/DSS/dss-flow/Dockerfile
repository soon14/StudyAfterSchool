FROM wjn0918/ubuntu-jdk1.8
LABEL maintainer="jnW"
ADD dss-flow-execution-entrance.tar.gz /usr/local
RUN rm -f /usr/local/*.tar.gz
WORKDIR /usr/local/dss-flow-execution-entrance/
CMD [ "./bin/start-dss-flow-execution-entrance.sh" ]