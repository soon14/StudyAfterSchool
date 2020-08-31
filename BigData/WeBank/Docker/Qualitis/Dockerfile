FROM wjn0918/ubuntu-jdk1.8
LABEL maintainer="jnW"
ADD qualitis-0.7.0.tar.gz /usr/local
RUN rm -f /usr/local/*.tar.gz
WORKDIR /usr/local/qualitis-0.7.0/
CMD [ "./bin/qualitis" ]