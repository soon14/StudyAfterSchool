# 数据汇总成数组以及用&&拼接数组中每一个元素

with price_group_01 as(
select
  partner_id,
  collect_set(pgd) as pgd_set
from
  (select distinct
     partner_id,
     concat(division,'-',price_group_description) as pgd
   from
     ccsd.tb_cpp_etl_bp_sales_basic_info
  )
group by partner_id
)
select distinct
  partner_id  as id,
 concat_ws('&&',pgd_set)  as  price_group
from
  price_group_01;

# group by操作后将其他字段串接
表tmp_test

a ios

b andriod

a andriod



目标数据

a ios|andriod

b andriod



sql： select uid,concat_ws('|', collect_set(device)) from tmp_test group by uid;





collect_set 是 Hive 内置的一个聚合函数, 它返回一个消除了重复元素的对象集合, 其返回值类型是 array 。
