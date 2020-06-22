<!--
 * @Author: wjn
 * @Date: 2020-05-28 09:24:13
 * @LastEditors: wjn
 * @LastEditTime: 2020-05-28 09:24:30
--> 
# 添加字段
ALTER TABLE  quickbi_RDS.ads_bi_item_fx_df ADD COLUMN current_year VARCHAR(25) DEFAULT NULL COMMENT "当年年份";


ALTER TABLE quickbi_RDS.ads_bi_item_fx_df MODIFY COLUMN years VARCHAR(25) DEFAULT NULL COMMENT '统计年份';