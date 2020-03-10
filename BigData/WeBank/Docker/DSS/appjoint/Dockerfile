FROM jdk:0.1
LABEL maintainer="jnW"
ADD linkis-appjoint-entrance.tar.gz /usr/local
RUN rm -f /usr/local/*.tar.gz
WORKDIR /usr/local/linkis-appjoint-entrance/
CMD [ "./bin/start-linkis-appjoint-entrance.sh" ]