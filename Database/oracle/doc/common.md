<!--
 * @Author: wjn
 * @Date: 2020-09-30 14:31:13
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-30 14:32:38
-->
select instance_name from v$instance;/*查看sid*/



show parameter sec_case

alter system set sec_case_sensitive_logon=false;