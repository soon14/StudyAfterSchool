<!--
 * @Author: wjn
 * @Date: 2020-01-31 10:00:10
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-09 20:35:34
 -->
1. [下载安装包](http://nginx.org/) 

2. 解压

3. 安装相关依赖

    yum -y install gcc pcre-devel openssl openssl-devel
4. 编译nginx

    ./configure --prefix=解压到的文件目录（安装目录，不需要创建）  --without-http_rewrite_module --without-http_gzip_module

例： 

    ./configure --prefix=/usr/local/nginx/nginx1.6.3 --without-http_rewrite_module --without-http_gzip_module

5. 安装

    make install
    
6. 启动

    * 进入sbin 目录  
    * 启动./nginx  
    * 关闭 ./nginx -s quit  
    * 重启 ./nginx -s reload  


7. 创建软连接（可选）

ln  -s  [源文件或目录]  [目标文件或目录]

例:

    ln -s /usr/local/nginx/nginx1.6.3/sbin/nginx /usr/local/bin/nginx