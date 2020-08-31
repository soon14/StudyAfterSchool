drop table if exists demo.dwd_t_old_finance_add;
create table if not exists demo.dwd_t_old_finance_add
as select 
financetype,
companyadd
from 
demo.ods_t_finance_info
where financetype rlike '^[A-Z]轮';

数据清洗