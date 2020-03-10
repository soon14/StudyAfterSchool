FROM jdk:0.1
LABEL maintainer="jnW"
ADD linkis-ujes-python-entrance.tar.gz /usr/local

RUN rm -f /usr/local/*.tar.gz

WORKDIR  /usr/local/linkis-ujes-python-entrance
EXPOSE 9110
CMD [ "./bin/start-python-entrance.sh" ]
