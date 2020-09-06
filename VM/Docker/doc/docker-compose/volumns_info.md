<!--
 * @Author: wjn
 * @Date: 2020-03-05 13:11:09
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-05 13:13:46
 -->
docker-compose中有两种方式可以设置volumes，并且都是可持久化的。
# 1.使用具体路径直接挂载到本地，特点就是直观。

    volumes:
        - /var/run/:/host/var/run/
        - ../chaincode/:/opt/gopath/src/github.com/chaincode
        - ./crypto-config:/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/
        - ./scripts:/opt/gopath/src/github.com/hyperledger/fabric/peer/scripts/
        - ./channel-artifacts:/opt/gopath/src/github.com/hyperledger/fabric/peer/channel-artifacts

# 2.使用卷标的形式，特点就是简洁，但是不知道数据到底在本地的什么位置。需要通过卷标查看。

    volumes:
        orderer.example.com:
        peer0.org1.example.com:
        peer1.org1.example.com:
        peer0.org2.example.com:
        peer1.org2.example.com:

    networks:
        byfn:

以上均取自fabric-samples中的first-network中的docker-compose-cli.yaml,在执行byfn.sh up的时候会创建数据卷：


# 查看所有卷标：

    docker volume ls


# 查看卷对应的地址：

docker volume inspect net_orderer.example.com

tree

–volumes:删除卷
–remove-orphans:移除未在compose文件中定义的容器

# 
  docker-compose -f docker-compose-file.yaml down --volumes --remove-orphans
