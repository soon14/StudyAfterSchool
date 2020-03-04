<!--
 * @Author: wjn
 * @Date: 2020-02-25 10:40:01
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-04 15:02:09
 -->
# 使用Dockerfile 启动容器

    docker build -t jdk:0.1 .

-t 指定镜像名称:版本

    

# 指令说明

![image](/Images/VM/Docker/Dockerfile_1.png)

[FROM](#from)

[MAINTAINER](#maintainer)

[RUN](#run)

[CMD](#cmd)

[EXPOSE](#expose)

[ENV](#env)

[ADD](#add)

[COPY](#copy)

[ENTRYPOINT](#entrypoint)

[VOLUME](#volume)

[USER](#user)

[WORKDIR](#workdir)

[HEALTHCHECK](#healthcheck)

[ARG](#arg)

## <span id=from>FROM</span>

指明构建的新镜像是来自于哪个基础镜像，例如：

        FROM centos:6

## <span id=maintainer>MAINTAINER</span>

指明镜像维护着及其联系方式（一般是邮箱地址），例如：

    MAINTAINER jn Wang <edisonchou@hotmail.com>
　　
不过，MAINTAINER并不推荐使用，更推荐使用LABEL来指定镜像作者，例如：

    LABEL maintainer="jnW.cn"

## <span id=run>RUN</span>
构建镜像时运行的Shell命令，例如：

    RUN ["yum", "install", "httpd"]
    RUN yum install httpd
    
　　又如，我们在使用微软官方ASP.NET Core Runtime镜像时往往会加上以下RUN命令，弥补无法在默认镜像下使用Drawing相关接口的缺憾：

    FROM microsoft/dotnet:2.2.1-aspnetcore-runtime
    RUN apt-get update
    RUN apt-get install -y libgdiplus
    RUN apt-get install -y libc6-dev
    RUN ln -s /usr/lib/libgdiplus.so /lib/x86_64-linux-gnu/libgdiplus.so
## <span id=cmd>CMD</span>
　　启动容器时执行的Shell命令，例如：

    CMD ["-C", "/start.sh"] 
    CMD ["/usr/sbin/sshd", "-D"] 
    CMD /usr/sbin/sshd -D
## <span id=expose>EXPOSE</span>
声明容器运行的服务端口，例如：

        EXPOSE 80 443

        80 -- 宿主机端口

    
## <span id=env>ENV</span>
设置环境内环境变量，例如：

    ENV MYSQL_ROOT_PASSWORD 123456
    ENV JAVA_HOME /usr/local/jdk1.8.0_45
## <span id=add>ADD</span>
拷贝文件或目录到镜像中，例如：

    ADD <src>...<dest>
    ADD html.tar.gz /var/www/html
    ADD https://xxx.com/html.tar.gz /var/www/html
**PS：如果是URL或压缩包，会自动下载或自动解压。**

1、如果源路径是个文件，且目标路径是以 / 结尾， 则docker会把目标路径当作一个目录，会把源文件拷贝到该目录下。

如果目标路径不存在，则会自动创建目标路径。

2、如果源路径是个文件，且目标路径是不是以 / 结尾，则docker会把目标路径当作一个文件。

如果目标路径不存在，会以目标路径为名创建一个文件，内容同源文件；

如果目标文件是个存在的文件，会用源文件覆盖它，当然只是内容覆盖，文件名还是目标文件名。

如果目标文件实际是个存在的目录，则会源文件拷贝到该目录下。 注意，这种情况下，最好显示的以 / 结尾，以避免混淆。

3、如果源路径是个目录，且目标路径不存在，则docker会自动以目标路径创建一个目录，把源路径目录下的文件拷贝进来。

如果目标路径是个已经存在的目录，则docker会把源路径目录下的文件拷贝到该目录下。

4、如果源文件是个归档文件（压缩文件），则docker会自动帮解压。

## <span id=copy>COPY</span>
　　拷贝文件或目录到镜像中，用法同ADD，只是不支持自动下载和解压，例如：

    COPY ./start.sh /start.sh
## <span id=entrypoint>ENTRYPOINT</span>
启动容器时执行的Shell命令，同CMD类似，只是由ENTRYPOINT启动的程序不会被docker run命令行指定的参数所覆盖，而且，这些命令行参数会被当作参数传递给ENTRYPOINT指定指定的程序，例如：

    ENTRYPOINT ["/bin/bash", "-C", "/start.sh"]
    ENTRYPOINT /bin/bash -C '/start.sh'

**PS：Dockerfile文件中也可以存在多个ENTRYPOINT指令，但仅有最后一个会生效。**

## <span id=volume>VOLUME</span>
指定容器挂载点到宿主机自动生成的目录或其他容器，例如：

    VOLUME ["/var/lib/mysql"]
**PS：一般不会在Dockerfile中用到，更常见的还是在docker run的时候指定-v数据卷。**

## <span id=user>USER</span>
为RUN、CMD和ENTRYPOINT执行Shell命令指定运行用户，例如：

    USER <user>[:<usergroup>]
    USER <UID>[:<UID>]
    USER jnW
## <span id=workdir>WORKDIR</span>
为RUN、CMD、ENTRYPOINT以及COPY和AND设置工作目录，例如：

    WORKDIR /data
## <span id=healthcheck>HEALTHCHECK</span>
告诉Docker如何测试容器以检查它是否仍在工作，即健康检查，例如：

    HEALTHCHECK --interval=5m --timeout=3s --retries=3 \
        CMD curl -f http:/localhost/ || exit 1
其中，**一些选项的说明：**

 --interval=DURATION (default: 30s)：每隔多长时间探测一次，默认30秒  
 -- timeout= DURATION (default: 30s)：服务响应超时时长，默认30秒  
 --start-period= DURATION (default: 0s)：服务启动多久后开始探测，默认0秒  
 --retries=N (default: 3)：认为检测失败几次为宕机，默认3次  
**一些返回值的说明：**

 0：容器成功是健康的，随时可以使用  
 1：不健康的容器无法正常工作  
 2：保留不使用此退出代码  
## <span id=arg>ARG</span>
　　在构建镜像时，指定一些参数，例如：

    FROM centos:6
    ARG user # ARG user=root
    USER $user
这时，我们在docker build时可以带上自定义参数user了，如下所示：

    docker build --build-arg user=jnW Dockerfile .


# <span id = demo>Demo</span>
```
FROM centos:7
MAINTANIER www.edisonchou.com

ADD jdk-8u45-linux-x64.tar.gz /usr/local
ENV JAVA_HOME /usr/local/jdk1.8.0_45

ADD apache-tomcat-8.0.46.tar.gz /usr/local
COPY server.xml /usr/local/apache-tomcat-8.0.46/conf

RUN rm -f /usr/local/*.tar.gz

WORKDIR /usr/local/apache-tomcat-8.0.46
EXPOSE 8080
ENTRYPOINT ["./bin/catalina.sh", "run"]
```

docker build -t tomcat:v1 .

docker run -itd --name=tomcate -p 8080:8080 \
    -v /app/webapps/:/usr/local/apache-tomcat-8.0.46/webapps/ \
    tomcat:v1