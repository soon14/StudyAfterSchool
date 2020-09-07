#!/bin/bash
# 需要先安装curl
yum install -y --nogpgcheck curl

# 运行ansible,失败重试，多运行几次
# ansible-galaxy install geerlingguy.jenkins
# ansible-playbook playbook.yml


创建 CI 流程的第一件事应该是安装 CI 工具，本文以最常见的 Jenkins 为例，介绍如何使用 Ansible 自动安装 Jenkins Server。说明：本文的演示环境为 ubuntu 16.04。

Ansible roles(角色)
Ansible 中除了 playbook，还有更高层级的抽象，称为 role(角色)。所谓的 role 其实就是把一些 playbook 组织成为一个更简洁、清晰的可重用对象。比如把安装 Jenkins Server 的 playbook 组织成为一个 role。
感谢开源社区，当我们需要安装 Jenkins Server 的时候并不需要自己写一个对应的 role，直接使用大神们写好的就可以了。

Ansible Galaxy
Ansible Galaxy 是社区和分享 Ansible role 的地方。直接搜索 jenkins，由 geerlingguy 贡献的 jenkins role 是目前最受欢迎的：



ansible-galaxy 命令
通过 ansible-galaxy 命令可以把上面搜索到的 role 安装到本地：

$ ansible-galaxy install geerlingguy.jenkins
由于 geerlingguy.jenkins role 依赖 geerlingguy.java role，所以在安装 geerlingguy.jenkins role 的同时也安装了 geerlingguy.java role。默认的安装目录在当前用户家目录下的 .ansible/roles
同时会安装其依赖的 geerlingguy.java role(能够自行处理依赖关系)：



了解 jenkins role 的基本配置
我们安装的 geerlingguy.jenkins role 的主要配置文件为：~/.ansible/roles/geerlingguy.jenkins/defaults/main.yml。下面介绍一下其中的一些比较重要的配置项。
jenkins_package_state: present
安装的 jenkins 版本，present 表示仅安装系统默认包中的版本，如果需要最新版本的 jenkins，需要把 jenkins_package_state 设置为 latest。

jenkins_hostname: localhost
通过 http 协议访问 Jenkins 时使用的域名或主机名称，作为演示，设置为 localhost 就可以了。

jenkins_home: /var/lib/jenkins
Jenkins 的主目录。

jenkins_http_port: 8080
Jenkins 服务器监听的端口号。

jenkins_url_prefix: ""
如果不想通过域名或主机名称直接访问 Jenkins，可以设置 jenkins_url_prefix 变量。比如设置为 /jenkins，这样我们就需要通过下面的 URL 来访问 Jenkins server 了：
http://localhost:8080/jenkins

jenkins_jar_location: /opt/jenkins-cli.jar
Jenkins CLI 程序的位置，该程序主要用来以命令行的方式与 Jenkins server 交互。

jenkins_plugins: []
指定在安装 Jenkins server 的同时安装的插件，默认是一个插件都不装的：



如果需要安装插件，使用逗号分隔插件名称并写入到中括号中就可以了，下面是一个小 demo：
[junit,greenballs,git]

jenkins_plugins_state: present
指定插件的版本，如果设置为 latest，就会保证所有的插件都是最新版本。

jenkins_plugin_timeout: 30
安装插件时的连接超时时间。需要注意安装插件时的超时问题，国内安装插件非常耗时，最好把 jenkins_plugin_timeout 设置的大些，不然经常会碰到 timeout 错误：



jenkins_plugins_install_dependencies: true
安装插件时是否安装其所依赖的插件。

jenkins_admin_username: admin
jenkins_admin_password: admin
安装 Jenkins 时创建的管理员账号和密码。

jenkins_java_options: "-Djenkins.install.runSetupWizard=false"
可以通过 jenkins_java_options 来设置额外的 java 命令行参数。比如我们可以通过下面的配置来设置 Jenkings server 的时区为纽约：
jenkins_java_options: "-Dorg.apache.commons.jelly.tags.fmt.timeZone=America/New_York"

jenkins_version: "1.644"
jenkins_pkg_url: "http://www.example.com"
这两个配置是可选的，通过 jenkins_version 变量我们可以指定安装的 Jenkins 版本，这样每次都会安装相同的版本，当然必须是出现在 http://pkg.jenkins-ci.org/debian/ (Ubuntu)中的版本。
如果你不想使用官方的包，可以通过 jenkins_pkg_url 指定自己的包。默认这两个选项是被注释掉的，也就是说会安装官方的包。

jenkins_connection_delay: 5
jenkins_connection_retries: 60
启动后连接到 Jenkins 时需要等待的时间和次数，以验证 Jenkins 是否正在运行。等待的总时间=延迟*重试，因此默认情况下，这个角色在超时前将等待 300 秒。

jenkins_init_changes:
  - option: "JENKINS_ARGS"
    value: "--prefix={{ jenkins_url_prefix }}"
  - option: "JENKINS_JAVA_OPTIONS"
    value: "{{ jenkins_java_options }}"
修改 Jenkings 的初始脚本，默认的更改设置了配置的 URL 前缀，并为 Jenkins 的启动添加了配置的 Java 选项。如果要为 Jenkins 的初始化脚本设置其他选项，添加其他的 选项/值 就可以了。

下面的配置与平台相关，所以 Ubuntu 相关的配置放在配置文件 ~/.ansible/roles/geerlingguy.jenkins/vars/Debian.yml 中：
# For Debian (role default):
__jenkins_repo_url: deb https://pkg.jenkins.io/debian binary/
__jenkins_repo_key_url: https://pkg.jenkins.io/debian/jenkins.io.key
默认安装的是 Jenkins 的最新版本，如果要安装稳定版本请设置为下面的配置：
# For Debian/Ubuntu LTS:
__jenkins_repo_url: deb http://pkg.jenkins-ci.org/debian-stable binary/
__jenkins_repo_key_url: http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key

先在目标机器上安装 curl
由于在安装 Jenkins 的时候需要用到 curl 工具，所以有必要先安装该工具。具体的做法我们可以写一个简单 playbook 来实现，把下面的内容保存到文件 pb_curl.yml 文件中：

复制代码
---
- hosts: jenkinsservers
  become: true
  become_user: root
  tasks:
    - name: install curl on Ubuntu
      apt:
        name: curl
        state: 'latest'
        update_cache: no
复制代码
然后在 /etc/ansible/hosts 文件中添加一个组 jenkinsservers 来保存目标主机：

[jenkinsservers]
192.168.21.145
最后执行命令在目标机器上安装 curl：

$ ansible-playbook -u nick pb_curl.yml
如果你还不熟悉 Ansible 及其 playbook，请参考笔者的《Ansible 简介》一文。

安装 Jenkins
下面我们创建一个非常简单的 playbook 文件 pb_jenkins.yml，其中引用已经安装好的 role 来完成 jenkins 的安装：

复制代码
---
- hosts: jenkinsservers
  vars:
    jenkins_hostname: localhost
  roles:
    - role: geerlingguy.java
      become: yes
    - role: geerlingguy.jenkins
      become: yes
复制代码
注意，playbook 中先配置了 geerlingguy.java 来安装 Jenkins 依赖的 java。
执行下面的命令进行安装：

$ ansible-playbook -u nick pb_jenkins.yml 






http://mirror.esuni.jp/jenkins/updates/update-center.json