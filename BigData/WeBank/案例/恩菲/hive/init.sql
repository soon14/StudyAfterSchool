-- 创建财务计划表

CREATE EXTERNAL TABLE if not exists demo.ods_t_financial_plan(
id string comment 'id',
code string comment '编码'，
plan_type string comment '类型【year：年度计划；month：月度计划】',
name string comment '名称',
factory string comment '所属工厂',
dt string comment '日期',
status int comment '状态【新建：0，已建立：10，已审批：20，已审核：30，已完成：40】',
user string comment '填报人',
remark string comment '备注',
created string comment '创建时间',
changed string comment '更新时间'
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE


-- 创建业务费统计表

CREATE EXTERNAL TABLE if not exists demo.ods_t_financial_plan_bus(
_id	string	'ID',
financial_plan	string	comment '所属财务计划【financial_plan.ID】',
dt	int	comment '日期',
customer	string	comment '客户名称',
reason	int	comment '事由',
persons	int	comment '客人数',
entourage	string comment	'公司陪同人员',
pay_content	string	comment '支出内容',
apply_num	string	comment '申报单号',
claiming_content	string comment	'报销内容',
voucherno	string comment	'凭证号',
value	float comment	'金额',
note	string comment	'批注',
remark	string comment	'备注',
order	int comment	'排序',
created	int	comment '创建时间',
changed	int comment	'更新时间'

)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE





-- 创建水厂监控信息

CREATE EXTERNAL TABLE if not exists demo.ods_t_factory_info(
id	string	comment 'ID',
factory	string	comment '水厂名称',
code	string	comment '水司名称',
bjjb	string	comment '报警级别（0一般；1严重；）',
jcd	string	comment '监测点',
bjnr	string	comment '报警内容',
bjkssj	string	comment '报警开始时间',
Bjjssj	string	comment '报警结束时间',
Bjtzzt	string	comment '报警通知状态',
Bjqrzt	string	comment '报警确认状态',
zzzt	string	comment '最终状态'
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE




