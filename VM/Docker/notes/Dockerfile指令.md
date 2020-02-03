# FROM <镜像名称>  

引入基础镜像

# RUN <shell命令>  

运行shell命令，如echo, mv, cp

# WORKDIR <工作目录>  

切换工作路径

# COPY <源路径> <目标路径>

源路径是docker build 构建的上下文路径，docker build 会将指定目录打包后传入docker server中进行解压，所以上下文路径是docker build 指定的路径

# * ADD <源路径> <目标路径>

同COPY，会自动解压tar包（不建议使用）

# EXPORT 

暴露docker容器中的端口

# CMD

启动容器命令

# ENV 

设置环境变量
