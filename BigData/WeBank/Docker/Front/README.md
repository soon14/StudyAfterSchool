<!--
 * @Author: wjn
 * @Date: 2020-03-10 07:24:29
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-10 07:25:27
 -->
docker run --name dss-front -d dss-front
docker run --name web -v ./nginx.conf:/etc/nginx/nginx.conf -d dss-front

docker cp tmp-nginx-container:/etc/nginx/nginx.conf /host/path/nginx.conf