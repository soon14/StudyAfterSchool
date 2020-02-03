```
CREATE TABLE `t_xtsz_dq` (
  `WW_DQBM` varchar(15) NOT NULL COMMENT '地区编码',
  `WW_DQMC` varchar(50) DEFAULT NULL COMMENT '地区名称',
  `WW_DQQM` varchar(150) DEFAULT NULL COMMENT '地区全名',
  `WW_SJBM` varchar(15) DEFAULT NULL COMMENT '上级编码',
  `WW_YZBM` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `WW_BZ` varchar(200) DEFAULT NULL COMMENT '备注',
  `WW_CJSJ` datetime DEFAULT NULL COMMENT '创建时间',
  `WW_XGSJ` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`WW_DQBM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区';
```