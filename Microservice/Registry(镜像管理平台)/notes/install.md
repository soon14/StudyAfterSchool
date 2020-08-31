<!--
 * @Author: wjn
 * @Date: 2020-01-31 19:50:33
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-03 13:53:42
 -->

# docker-registry(docker-compose.yml)

```
version: '3'
services: 
  registry:
    restart: always
    image: registry
    container_name: registry
    ports: 
        - 5000:5000
    volumes:
        - /registry/data:/var/lib/registry
```

# docker-registry-front(docker-compose.yml)

```
version: '3'
services: 
    frontend:
        restart: always
        image: konradkleine/docker-registry-frontend:v2
        ports:
            - 80:80
        volumes:
          - ./certs/frontend.crt:/etc/apache2/server.crt:ro
          - ./certs/frontend.key:/etc/apache2/server.key:ro
        environment:
            - ENV_DOCKER_REGISTRY_HOST=192.168.137.100
            - ENV_DOCKER_REGISTRY_PORT=5000
```