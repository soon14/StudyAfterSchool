FROM jdk:0.1
LABEL maintainer="jnW"
ADD linkis-ujes-python-enginemanager.tar.gz /usr/local

RUN rm -f /usr/local/*.tar.gz

WORKDIR  /usr/local/linkis-ujes-python-enginemanager
EXPOSE 9109
CMD [ "./bin/start-python-enginemanager.sh" ]
