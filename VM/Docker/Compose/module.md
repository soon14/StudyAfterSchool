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

[参考地址](https://blog.csdn.net/u010931295/article/details/100098205)

