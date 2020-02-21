-- 创建融资信息表

CREATE EXTERNAL TABLE if not exists demo.ods_t_finance_info(
companyName string comment 'company name',
companyType string comment 'company type',
financeType string comment 'finance type',
financePNum string comment 'finance number of people',
companyAdd string comment 'company address',
companyURL string comment 'company URL'
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE