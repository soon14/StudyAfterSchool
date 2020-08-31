1. [451 No mapping for the Unicode characte0r](https://blog.csdn.net/kuluzs/article/details/51836416)

解决：

    1) 打开 控制面板 - “Internet” - Web管理工具 - IIS管理控制台 的 FTP 设置界面，选择“高级设置”
    2) 将“允许UTF8”从 “True” 改为 “False”，重新启动服务器， 即可解决。