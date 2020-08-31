FROM wjn0918/ubuntu-jdk1.8
LABEL maintainer="jnW"
ADD linkis-ujes-python-enginemanager.tar.gz /usr/local
RUN rm -f /usr/local/*.tar.gz
WORKDIR  /usr/local/linkis-ujes-python-enginemanager
CMD [ "./bin/start-python-enginemanager.sh" ]