[链接](https://blog.csdn.net/qq_41262248/article/details/80205556)


脚本中使用


```
sql=`cat <<EOF

use ..;
select * from ..;



EOF`

```


# 使用
cat>/etc/docker/daemon.json<<EOF
{
"registry-mirrors": [
    "https://registry.docker-cn.com"
]
}
EOF


1. warning: here-document at line 11 delimited by end-of-file (wanted `EOF')
EOF前后不能有任何字符
```
sql=$(cat <<EOF

12321321
EOF
)

```
