# application.properties文件参数之间的引用

# 项目路径
project.path=/home/USER/

# 日志配置
common.log.file=${project.path}/log/common.log
trace.log.file=${project.path}/log/trace.log
error.log.file=${project.path}/log/error.log

# 数据配置
data.path=${project.path}/data/
