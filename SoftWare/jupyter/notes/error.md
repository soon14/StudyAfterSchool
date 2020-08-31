1. OSError: [Errno 99] Cannot assign requested address

运行Jupyter时增加--ip=0.0.0.0参数
```
jupyter notebook --ip=0.0.0.0 --no-browser --allow-root
```

2. is not UTF-8 encoded

* 先输入file file1.txt查看这个文件的编码
* iconv -f 文件的编码 -t utf-8 file1.txt > file2.txt