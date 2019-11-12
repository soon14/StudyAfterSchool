# 制作flink组件包
## 下载flink包
[下载地址](https://archive.apache.org/dist/flink/)

## 制作parcel

tar -czvf FLINK-1.9.0-el7.parcel FLINK-1.9.0




## 制作standlaone csd jar

mkdir descriptor images scripts

vim descriptor/service.sdl

vim scripts/control.sh


jar -cvf FLINK-1.6.0 *