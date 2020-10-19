<!--
 * @Author: wjn
 * @Date: 2020-10-17 17:22:02
 * @LastEditors: wjn
 * @LastEditTime: 2020-10-17 17:23:27
-->
create database morgana owner morgana

CREATE USER morgana WITH PASSWORD 'morgana';

GRANT ALL PRIVILEGES ON DATABASE morgana TO morgana;

GRANT ALL PRIVILEGES ON all tables in schema public TO morgana;