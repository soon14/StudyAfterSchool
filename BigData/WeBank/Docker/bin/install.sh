###
 # @Author: wjn
 # @Date: 2020-03-12 17:48:54
 # @LastEditors: wjn
 # @LastEditTime: 2020-03-12 20:49:46
 ###



# 创建工作目录


dirs=(linkis-ujes-spark-entrance linkis-ujes-spark-enginemanager linkis-ujes-python-entrance linkis-ujes-python-enginemanager linkis-ujes-hive-entrance linkis-ujes-hive-enginemanager linkis-ujes-jdbc-entrance linkis-resourcemanager qualitis visualis-server dss-flow-execution-entrance linkis-appjoint-entrance dss-server dss-front eureka linkis-gateway)


create_dir() {
    for var in ${dirs[@]};
    do
        echo $var
    done
}

create_dir
