<!--
 * @Author: wjn
 * @Date: 2020-10-19 15:43:09
 * @LastEditors: wjn
 * @LastEditTime: 2020-10-19 17:03:22
-->
useradd gbase  
passwd gbase

tar xfj GBase8a-NoLicense-Free-8.6.2_build43-R7-redhat7.3-x86_64.tar.bz2

./Install_lin.sh

source ~/.bashrc

gbase.server start

# 修改密码
gbase -uroot

SET PASSWORD FOR root = PASSWORD('123456');

CREATE TABLE "t_cs" ( 
  "MONTH_ID" varchar(20) DEFAULT NULL COMMENT '月份', 
  "DAY_ID" varchar(40) DEFAULT NULL COMMENT '日期', 
  "AREA_NO" varchar(10) DEFAULT NULL COMMENT '地市', 
  "CITY_NO" varchar(20) DEFAULT NULL COMMENT '区县', 
  "TOWN_NO" varchar(30) DEFAULT NULL COMMENT '乡镇', 
  "CUST_NO" varchar(40) DEFAULT NULL COMMENT '客户标识', 
  "START_DATE" datetime DEFAULT NULL COMMENT '开始时间', 
  "FEE"  decimal(18,2)  DEFAULT NULL COMMENT '费用', 
  "PROV_ID" varchar(6) DEFAULT NULL COMMENT '省份' 
) COMPRESS(1, 3)  ENGINE=EXPRESS DISTRIBUTED BY('cust_no') DEFAULT CHARSET=utf8 COMMENT='个人客户资料表'




insert into t_cs values('2月','31','武汉市','','','','2020-10-16 10:08:41',200,'湖北省');