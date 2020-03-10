FROM nginx
LABEL maintainer="jnW"
ADD dss-web.tar.gz /FRONT
RUN rm -f /FRONT/*.tar.gz
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ENTRYPOINT ["nginx"]