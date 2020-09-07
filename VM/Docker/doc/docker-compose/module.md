<!--
 * @Author: wjn
 * @Date: 2020-01-31 11:41:24
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-10 15:57:17
 -->
[参考地址](https://www.funtl.com/zh/docs-docker/Docker-Compose-%E6%A8%A1%E6%9D%BF%E6%96%87%E4%BB%B6.html#extra-hosts)

# volumes 

1. 使用具体路径直接挂载到本地，特点就是直观。

volumes:
  - 宿主机路径:容器路径

指定磁盘卷

2. 使用卷标的形式，特点就是简洁，但是不知道数据到底在本地的什么位置。需要通过卷标查看。

```
  volumes:
    - mysql-data:/usr/local/mysql/data
volumes:
  mysql:

```

[参考地址](volumns_info.md)

```
    environment:
      - MYSQL_ROOT_PASSWORD=xxx0209
```

# env_file

从文件中获取环境变量，可以为单独的文件路径或列表。

如果通过 docker-compose -f FILE 方式来指定 Compose 模板文件，则 env_file 中变量的路径会基于模板文件路径。

如果有变量名称与 environment 指令冲突，则按照惯例，以后者为准。

env_file: .env

env_file:
  - ./common.env
  - ./apps/web.env
  - /opt/secrets.env
环境变量文件中每一行必须符合格式，支持 # 开头的注释行。

```
# common.env: Set development environment
PROG_ENV=development
```
