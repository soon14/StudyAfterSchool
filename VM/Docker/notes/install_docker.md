[参考地址](https://www.funtl.com/zh/docs-docker/Ubuntu-%E5%AE%89%E8%A3%85-Docker.html#%E4%BD%BF%E7%94%A8-apt-%E5%AE%89%E8%A3%85)



# 使用脚本自动安装
在测试或开发环境中 Docker 官方为了简化安装流程，提供了一套便捷的安装脚本，CentOS 系统上可以使用这套脚本安装：

    $ curl -fsSL get.docker.com -o get-docker.sh
    $ sudo sh get-docker.sh --mirror Aliyun

执行这个命令后，脚本就会自动的将一切准备工作做好，并且把 Docker CE 的 Edge 版本安装在系统中。

# 启动 Docker CE

    $ sudo systemctl enable docker
    $ sudo systemctl start docker

# 建立 docker 用户组

默认情况下，docker 命令会使用 Unix socket 与 Docker 引擎通讯。而只有 root 用户和 docker 组的用户才可以访问 Docker 引擎的 Unix socket。出于安全考虑，一般 Linux 系统上不会直接使用 root 用户。因此，更好地做法是将需要使用 docker 的用户加入 docker 用户组。

建立 docker 组：

    $ sudo groupadd docker

将当前用户加入 docker 组：

    $ sudo usermod -aG docker $USER

新建用户指定docker组：

    useradd -g docker $USER

退出当前终端并重新登录，进行如下测试。

# 测试 Docker 是否安装正确

    $ docker run hello-world

```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
ca4f61b1923c: Pull complete
Digest: sha256:be0cd392e45be79ffeffa6b05338b98ebb16c87b255f48e297ec7f98e123905c
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://cloud.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/

```
若能正常输出以上信息，则说明安装成功。

# 镜像加速

鉴于国内网络问题，后续拉取 Docker 镜像十分缓慢，强烈建议安装 Docker 之后配置 国内镜像加速。


对于使用 systemd 的系统，请在 /etc/docker/daemon.json 中写入如下内容（如果文件不存在请新建该文件）

    {
    "registry-mirrors": [
        "https://registry.docker-cn.com"
    ]
    }

注意，一定要保证该文件符合 json 规范，否则 Docker 将不能启动。

之后重新启动服务。

    $ sudo systemctl daemon-reload
    $ sudo systemctl restart docker

注意：如果您之前查看旧教程，修改了 docker.service 文件内容，请去掉您添加的内容（--registry-mirror=https://registry.docker-cn.com），这里不再赘述。

# 查看镜像是否配置成功

    docker info 

出现下面内容跟表示配置成功
```
Registry Mirrors:
    https://registry.docker-cn.com/
```        


# *添加内核参数

默认配置下，如果在 CentOS 使用 Docker CE 看到下面的这些警告信息：

    WARNING: bridge-nf-call-iptables is disabled
    WARNING: bridge-nf-call-ip6tables is disabled

请添加内核配置参数以启用这些功能。

    $ sudo tee -a /etc/sysctl.conf <<-EOF
    net.bridge.bridge-nf-call-ip6tables = 1
    net.bridge.bridge-nf-call-iptables = 1
    EOF

然后重新加载 sysctl.conf 即可

    $ sudo sysctl -p
