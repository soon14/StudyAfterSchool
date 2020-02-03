yum，全称“Yellow dog Updater, Modified”，是一个专门为了解决包的依赖关系而存在的软件包管理器。就好像 Windows 系统上可以通过 360 软件管家实现软件的一键安装、升级和卸载，Linux 系统也提供有这样的工具，就是 yum。

> 网络 yum 源配置文件位于 /etc/yum.repos.d/ 目录下，文件扩展名为"*.repo"（只要扩展名为 "*.repo" 的文件都是 yum 源的配置文件）。


* [base]：容器名称，一定要放在[]中。
* name：容器说明，可以自己随便写。
* mirrorlist：镜像站点，这个可以注释掉。
* baseurl：我们的 yum 源服务器的地址。默认是 CentOS 官方的 yum 源服务器，是可以使用的。如果你觉得慢，则可以改成你喜欢的 yum 源地址。
* enabled：此容器是否生效，如果不写或写成 enabled 则表示此容器生效，* 写成 enable=0 则表示此容器不生效。
* gpgcheck：如果为 1 则表示 RPM 的数字证书生效；如果为 0 则表示 RPM 的数字证书不生效。
* gpgkey：数字证书的公钥文件保存位置。不用修改。