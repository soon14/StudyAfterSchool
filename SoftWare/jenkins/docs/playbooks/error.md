1. Jenkins可安装插件列表没有可选择插件问题
Update Site
http://mirror.xmission.com/jenkins/updates/update-center.json 
http://mirror.esuni.jp/jenkins/updates/update-center.json
https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json


vi /etc/sysconfig/jenkins

-Dhudson.model.DownloadService.noSignatureCheck=true
参考：https://blog.csdn.net/kobedir/article/details/104960258



绑定 mirrors.jenkins-ci.org host 到本机

$ grep jenkins /etc/hosts
### jenkins ###
127.0.0.1 mirrors.jenkins-ci.org

nginx反向代理到清华

# root @ web-devops-01 in /usr/local/nginx/conf/vhost [23:32:55]
$ cat mirrors.jenkins-ci.org.conf
server
    {
        listen 80;
        server_name mirrors.jenkins-ci.org;

        location / {
            proxy_redirect off;
            proxy_pass https://mirrors.tuna.tsinghua.edu.cn/jenkins/;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Accept-Encoding "";
            #proxy_set_header User-Agent "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.49 Safari/537.36";
            proxy_set_header Accept-Language "zh-CN";
        }
        index index.html index.htm index.php;

        #error_page   404   /404.html;

        location ~ /\.
        {
            deny all;
        }

        access_log  /data/weblog/xx.access.log;
        error_log   /data/weblog/xx.error.log;
    }