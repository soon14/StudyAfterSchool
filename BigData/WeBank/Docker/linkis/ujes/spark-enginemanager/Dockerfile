FROM wjn0918/ubuntu-jdk1.8
LABEL maintainer="jnW"
ADD linkis-ujes-spark-enginemanager.tar.gz /usr/local
RUN rm -f /usr/local/*.tar.gz
WORKDIR  /usr/local/linkis-ujes-spark-enginemanager
CMD [ "./bin/start-spark-enginemanager.sh" ]