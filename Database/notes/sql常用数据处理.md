<!--
 * @Author: wjn
 * @Date: 2020-05-29 09:44:47
 * @LastEditors: wjn
 * @LastEditTime: 2020-06-19 11:08:10
--> 
# 身份证号处理

if(LENGTH(id_code) != 18 OR SUBSTR(id_code, 7, 2) NOT in('18','19','20') 
                                      OR CAST(SUBSTR(id_code, 11, 2) AS INT) > 12
                                      OR CAST(SUBSTR(id_code, 11, 2) AS INT) <= 0
                                      OR CAST(SUBSTR(id_code, 13, 2) AS INT) > 31
                                      OR CAST(SUBSTR(id_code, 13, 2) AS INT) <= 0
                                      -- 处理身份证号2月异常
                                      OR if(substr('14270219790229',11, 2) = '02' AND CAST(substr('14270219790229',7,4) as int)% 4 = 0 AND CAST(substr('14270219790229',7,4) as int) % 100 !=0 or CAST(substr('14270219790229',7,4) as int) %400 =0, CAST(substr('14270219790229',13,2) as int) <= 29,CAST(substr('14270219790229',13,2) as int) <= 28) , null,id_code) id_code -- 身份证号码


alter table ads_bi_mana_indicat_df modify column 




    id varchar(255) comment '自增id',
    month_id varchar(6) comment '会计月',
    dealer_id varchar(255) comment '实际供货商id',
    dealer_name varchar(255) comment '实际供货商',
    store_area_type varchar(255) comment '管理南北区',
    store_lev2_name varchar(255) comment '管理大区',
    store_lev3_name varchar(255) comment '管理省区',
    store_lev4_name varchar(255) comment '管理地区',
    store_lev5_name varchar(255) comment '管理片区',
    dep_dealer_id varchar(255) comment '属地供货商id',
    dep_dealer_name varchar(255) comment '属地供货商',
    dep_area_type varchar(255) comment '费用计入南北区',
    dep_province varchar(255) comment '费用计入省区',
    dep_region varchar(255) comment '费用计入地区',
    store_leader_manager varchar(255) comment '门店负责地区经理',
    store_leader_represent varchar(255) comment '门店负责销售代表',
    store_leader_guide varchar(255) comment '门店负责导购专员',
    store_province varchar(255) comment '行政省区',
    store_city varchar(255) comment '行政城市',
    store_county varchar(255) comment '行政县区',
    guide_area_type varchar(255) comment '南北区',
    guide_lev2_name varchar(255) comment '大区',
    guide_lev3_name varchar(255) comment '省区',
    guide_dep_province varchar(255) comment '费用计入省区',
    guide_lev4_name varchar(255) comment '地区',
    guide_lev5_name varchar(255) comment '片区',
    guide_id varchar(255) comment '顾问ID',
    guide_name varchar(255) comment '顾问姓名',
    guide_mobile varchar(255) comment '顾问电话',
    guide_idcode varchar(255) comment '身份证号码',
    guide_age double comment '年龄',
    guide_age_lev varchar(255) comment '年龄坎级',
    guide_seniority double comment '司龄',
    guide_seniority_lev varchar(255) comment '司龄坎级',
    guide_classfiy varchar(255) comment '顾问类别',
    guide_property varchar(255) comment '顾问性质',
    guide_education varchar(255) comment '顾问学历',
    guide_source varchar(255) comment '顾问来源',
    guide_certificate varchar(255) comment '证书',
    guide_compete_sales varchar(255) comment '竞品销量（万元）',
    guide_compete_lev varchar(255) comment '竞品销量坎级',
    guide_begin_date varchar(255) comment '上岗日期',
    guide_end_date varchar(255) comment '离职日期',
    guide_dimission varchar(255) comment '在职状态',
    guide_leave_type varchar(255) comment '主动/被动离职',
    guide_leave_reason varchar(255) comment '离职原因',
    guide_is_excellent varchar(255) comment '是否竞品优秀顾问',
    guide_is_base varchar(255) comment '是否有保底',
    guide_base_months varchar(255)  comment '保底月数',
    guide_base_start varchar(255) comment '保底开始时间',
    guide_base_end varchar(255) comment '保底结束时间',
    guide_base_amt varchar(255)   comment '保底金额',
    guide_isinsurance varchar(255) comment '是否有保险',
    guide_insurance_start varchar(255) comment '社保启动时间',
    guide_insurance_end varchar(255) comment '社保退出时间',
    guide_noinsurance_time bigint comment '未缴纳保险时长',
    guide_risk_money double   comment '风险预估金额',
    guide_risk_lev varchar(255) comment '风险分级',
    target_inefficiency double comment '销量目标-低效',
    target_achievement varchar(255) comment '销量是否符合',
    target_is_inefficiency varchar(255) comment '是否低效',
    target_guide_star varchar(255) comment '星级等级',
    store_id varchar(255) comment '门店ID',
    store_shortname varchar(255) comment '门店简称',
    store_type varchar(255) comment '门店类别',
    store_channel varchar(255) comment '门店渠道',
    store_sys varchar(255) comment '系统名称',
    store_analysis double comment '门店奶容',
    store_analysis_lev varchar(255) comment '奶容坎级',
    store_prom_num bigint comment '门店现有顾问数量',
    store_isbareprice varchar(255) comment '是否裸价飞帆',
    store_isimportant varchar(255) comment '是否重点门店（猎洋/大系统）',
    store_oneornorx varchar(255) comment '是否1+n+x',
    store_rate3 varchar(255)   comment '近3月门店费率',
    store_rate_except varchar(255) comment '门店异常情况',



alter table ads_bi_mana_indicat_df modify column  store_sales_base double comment '门店销售额-厂价';
alter table ads_bi_mana_indicat_df modify column  store_sales_retail double comment '门店额-零售价';
alter table ads_bi_mana_indicat_df modify column  store_sales_baby double comment '门店额-婴儿粉-厂价';
alter table ads_bi_mana_indicat_df modify column  store_sales_babypart double comment '门店额-（婴儿粉-超飞）-厂价';
alter table ads_bi_mana_indicat_df modify column  store_sales_zzyj double comment '门店额-臻稚有机-厂价';
alter table ads_bi_mana_indicat_df modify column  store_sales_xff double comment '门店额-星飞帆-厂价';
alter table ads_bi_mana_indicat_df modify column  store_sales_cjff double comment '门店额-超级飞帆';
alter table ads_bi_mana_indicat_df modify column  store_sales_xyyh double comment '门店额-星阶优护-厂价';
alter table ads_bi_mana_indicat_df modify column  store_sales_ff double comment '门店额-飞帆-厂价';
alter table ads_bi_mana_indicat_df modify column  store_sales_xy double comment '门店额-星蕴-厂价';
alter table ads_bi_mana_indicat_df modify column  store_sales_nonnaked double comment '门店额-非裸价sc-厂价';
alter table ads_bi_mana_indicat_df modify column  store_sales_othersc double comment '门店额-其他SC-厂价';
alter table ads_bi_mana_indicat_df modify column  store_sales_other double comment '门店额-其他-厂价';
alter table ads_bi_mana_indicat_df modify column  guide_sales_base double comment '营养顾问销售额-厂价';
alter table ads_bi_mana_indicat_df modify column  guide_sales_retail double comment '营养顾问销售额-零售价';
alter table ads_bi_mana_indicat_df modify column  guide_sales_baby double comment '营养顾问销售额-婴儿粉-厂价';
alter table ads_bi_mana_indicat_df modify column  guide_sales_babypart double comment '营养顾问销售额-（婴儿粉-超飞）-厂价';
alter table ads_bi_mana_indicat_df modify column  guide_sales_zzyj double comment '营养顾问销售额-臻稚有机-厂价';
alter table ads_bi_mana_indicat_df modify column  guide_sales_xff double comment '营养顾问销售额-星飞帆-厂价';
alter table ads_bi_mana_indicat_df modify column  guide_sales_cjff double comment '营养顾问销售额-超级飞帆';
alter table ads_bi_mana_indicat_df modify column  guide_sales_xyyh double comment '营养顾问销售额-星阶优护-厂价';
alter table ads_bi_mana_indicat_df modify column  guide_sales_ff double comment '营养顾问销售额-飞帆-厂价';
alter table ads_bi_mana_indicat_df modify column  guide_sales_xy double comment '营养顾问销售额-星蕴-厂价';
alter table ads_bi_mana_indicat_df modify column  guide_sales_nonnaked double comment '营养顾问销售额-非裸价sc-厂价';
alter table ads_bi_mana_indicat_df modify column  guide_sales_othersc double comment '营养顾问销售额-其他SC-厂价';
alter table ads_bi_mana_indicat_df modify column  guide_sales_other double comment '营养顾问销售额-其他-厂价';






    wages_base double comment '基础薪资';
    wages_payable double comment '应发工资';
    wages_payable_draw double comment '工资+提成',
    wages_insurance double comment '公司承担保险',
    manage_newmembers bigint comment '新客数量',
    manage_scan_prop double comment '扫码率',
    manage_sales_scan double comment '扫码销量',
    manage_sales_total double comment '整体销量',
    manage_score bigint comment '考试成绩',
    integral_series bigint comment '销售产品系列数',
    integral_dan bigint comment '销售产品段位数',
    integral_except varchar(255) comment '异常情况',
    newmember_proportion double comment '当月门店新客销量/终端门店近三月月均销量',
    newmember_abnormal varchar(255) comment '当前门店是否异常',
    newmember_punish_level varchar(255) comment '处理等级',
    attend_schedule_days bigint comment '排班天数',
    attend_schedule_except varchar(255) comment '排班是否异常',
    attend_sign_days bigint comment '签到天数',
    attend_sign_times varchar(255) comment '在岗时长',
    attend_except varchar(255) comment '考勤是否异常',
    attend_absent_days bigint comment '未打卡天数',
    attend_leave_days bigint comment '请假天数',
    guide_sales_near3 double comment '导购近3月销量',
    guide_sales_last3 double comment '导购上3月销量',
    guide_max_type bigint comment '门店内是·否有专职导购 1-是 0-否',
    store_rate_standard double comment '费率标准（不包括上海专职导购）',
    bizdate varchar(255) comment '执行日期',
    is_delete varchar(255) comment '删除标志'


