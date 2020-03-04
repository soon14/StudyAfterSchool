FROM jdk:0.1
LABEL maintainer="jnW"
ADD eureka.tar.gz /usr/local

RUN rm -f /usr/local/*.tar.gz

WORKDIR  /usr/local/eureka
EXPOSE 20303
CMD [ "./bin/start-eureka.sh" ]
