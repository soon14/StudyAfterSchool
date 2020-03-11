<!--
 * @Author: wjn
 * @Date: 2020-03-10 15:40:11
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-10 15:43:09
 -->

# 需要配置mysql

tar -cvf linkis-metadata.tar.gz linkis-metadata/


vi Dockerfile
```
FROM wjn0918/ubuntu-jdk1.8
LABEL maintainer="jnW"
ADD linkis-metadata.tar.gz /usr/local
RUN rm -f /usr/local/*.tar.gz
WORKDIR  /usr/local/linkis-metadata
CMD [ "./bin/start-metadata.sh" ]
```
docker build -t linkis-metadata .

vi docker-compose.yml

```
version: '3'
services: 
  metadata:
    restart: always
    image: linkis-metadata
    container_name: linkis-metadata
    ports: 
        - 9103:9103
    extra_hosts:
        - "eureka.fd.com:192.168.137.60"
    volumes: 
        - ./logs:/usr/local/linkis-metadata/logs
        
```