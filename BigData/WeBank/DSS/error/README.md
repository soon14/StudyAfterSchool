# 创建工程

1. add scheduler project failederrCode: 90019 ,desc: Connect to 172.16.42.10:8091 [/172.16.42.10] failed: Connection refused (Connection refused) ,ip: slave2 ,port: 9004 ,serviceKind: dss-server"

DSS-SERVER需要配置azkaban

端口为azkaban web端口
```
##azkaban
wds.dss.appjoint.scheduler.azkaban.address=https://slave1:8443
```


# Scriptis

hdfs 目录刷新不出来

1. 查看linkis-publicservice的配置文件，hadoop.conf.dir是否配置正确

数据库刷新不出来

1. 查看各服务hive配置文件是否配置正确

2. hive 需要对用户赋予查询权限

参考脚本
```
SELECT
	NAME
FROM
	(
		SELECT
			t2. NAME AS NAME
		FROM
			DB_PRIVS t1,
			DBS t2
		WHERE
			(
				lcase(t1.PRINCIPAL_NAME) = #{userName,jdbcType=VARCHAR}
				OR t1.PRINCIPAL_NAME IN (
					SELECT
						ROLE
					FROM
						(
							SELECT
								r.ROLE_NAME AS ROLE,
								u.PRINCIPAL_NAME AS USER
							FROM
								ROLES r
							LEFT JOIN (
								SELECT
									*
								FROM
									ROLE_MAP
								WHERE
									PRINCIPAL_TYPE = 'USER'
							) u ON r.ROLE_ID = u.ROLE_ID
						) AS T
					WHERE
						T. USER = "hadoop"
					AND lcase(t1.DB_PRIV) IN ('select', 'all')
					AND t1.DB_ID = t2.DB_ID
					UNION ALL
						SELECT
							t3. NAME AS NAME
						FROM
							TBL_PRIVS t1,
							TBLS t2,
							DBS t3
						WHERE
							t1.TBL_ID = t2.TBL_ID
						AND lcase(t1.TBL_PRIV) IN ('select', 'all')
						AND (
							lcase(t1.PRINCIPAL_NAME) = #{userName,jdbcType=VARCHAR} or lcase(t1.PRINCIPAL_NAME) in (SELECT ROLE FROM(SELECT r.ROLE_NAME AS ROLE, u.PRINCIPAL_NAME AS USER FROM ROLES r LEFT JOIN (SELECT * FROM ROLE_MAP WHERE PRINCIPAL_TYPE = 'USER') u ON r.ROLE_ID = u.ROLE_ID)AS T where T.USER = #{userName,jdbcType=VARCHAR}))
							AND t2.DB_ID = t3.DB_ID
						) a
						GROUP BY
							NAME
						ORDER BY
							NAME

```


# spark

加载不到hadoop包

版本冲突
将spark-enginemanager 和hadoop jars 中的hadoop相关包对比

