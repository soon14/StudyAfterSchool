-- 组织用户成员管理

-- 用户信息表
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`               bigint(20)   NOT NULL,
    `user_id`         varchar(255) DEFAULT NULL COMMENT '用户id',
    `account_name`             varchar(255) NOT NULL COMMENT '账户名称',
    `nick_name`         varchar(255) NOT NULL COMMENT '昵称',
    `email`             varchar(255)  NOT NULL,
    `phone`        varchar(255) DEFAULT NULL,
    `if_admin` tinyint(1) UNSIGNED NOT NULL COMMENT '是否是组织管理员',
    `if_delete` tinyint(1) UNSIGNED UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 标签信息表
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`
(
    `id`               bigint(20)   NOT NULL,
    `tag_id`             varchar(255) NOT NULL COMMENT '标签id',
    `tag_name`         varchar(255) NOT NULL COMMENT '标签名',
    `tag_description`             varchar(32)  NOT NULL COMMENT '标签描述',
    `if_delete` tinyint(1) UNSIGNED UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 用户标签信息表
DROP TABLE IF EXISTS `user_tag`;
CREATE TABLE `user_tag`
(
    `id`               bigint(20)   NOT NULL,
    `user_id`         varchar(255) DEFAULT NULL COMMENT '用户id',
    `tag_id`             varchar(255) NOT NULL COMMENT '标签id',
    `if_delete` tinyint(1) UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 用户组信息
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`
(
    `id`               bigint(20)   NOT NULL,
    `group_id`         varchar(255) DEFAULT NULL COMMENT '用户组id',
    `group_name`             varchar(255) NOT NULL COMMENT '用户组名称',
    `group_desc`             varchar(255) NOT NULL COMMENT '用户组描述',
    `if_delete` tinyint(1) UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 用户组树
DROP TABLE IF EXISTS `group_tree`;
CREATE TABLE `group_tree`
(
    `id`               bigint(20)   NOT NULL,
    `group_id`         varchar(255) DEFAULT NULL COMMENT '用户组id',
    `parent_id`             varchar(255) NOT NULL COMMENT '用户组上级id',
    `if_delete` tinyint(1) UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 用户组_用户
DROP TABLE IF EXISTS `group_user`;
CREATE TABLE `group_user`
(
    `id`               bigint(20)   NOT NULL,
    `group_id`         varchar(255) DEFAULT NULL COMMENT '用户组id',
    `user_id`             varchar(255) NOT NULL COMMENT '用户组上级id',
    `if_delete` tinyint(1) UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ⼯作空间管理
-- 空间信息(组织下工作空间)
DROP TABLE IF EXISTS `work_place`;
CREATE TABLE `work_place`
(
    `id`               bigint(20)   NOT NULL,
    `work_space_id`         varchar(255) DEFAULT NULL COMMENT '工作空间id',
    `work_space_desc`             varchar(255) NOT NULL COMMENT '工作空间描述',
    `group_id`         varchar(255) NOT NULL COMMENT '分组id',
    `owner`             varchar(32)  NOT NULL COMMENT '所有者',
    `owner_account_name`        varchar(255) DEFAULT NULL COMMENT '所有者账号',
    `if_allow_share`  tinyint(1) UNSIGNED NOT NULL COMMENT '是否共享',
    `if_allow_publish`  tinyint(1) UNSIGNED NOT NULL COMMENT '是否发布',
    `if_delete` tinyint(1) UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,

    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 空间下用户信息
DROP TABLE IF EXISTS `work_place_user`;
CREATE TABLE `work_place_user`
(
    `id`               bigint(20)   NOT NULL,
    `work_space_id`         varchar(255) DEFAULT NULL COMMENT '工作空间id',
    `user_id`             varchar(255) NOT NULL COMMENT '用户id',
    `if_delete` tinyint(1) UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,

    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 角色信息
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`
(
    `id`               bigint(20)   NOT NULL,
    `role_id`         varchar(255) DEFAULT NULL COMMENT '角色id',
    `role_code`             varchar(255) NOT NULL COMMENT '角色代码',
    `role_name`         varchar(255) NOT NULL COMMENT '角色名称',
    `if_delete` tinyint(1) UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,

    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 用户角色信息
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`
(
    `id`               bigint(20)   NOT NULL,
    `user_id`         varchar(255) DEFAULT NULL COMMENT '角色id',
    `role_id`         varchar(255) DEFAULT NULL COMMENT '角色id',
    `role_code`             varchar(255) NOT NULL COMMENT '角色代码',
    `role_name`         varchar(255) NOT NULL COMMENT '角色名称',
    `if_delete` tinyint(1) UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,

    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- 分享授权

-- 授权信息
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share`
(
    `id`               bigint(20)   NOT NULL,
    `share_id`         varchar(255) DEFAULT NULL COMMENT '分享id',
    `share_to`         varchar(255) DEFAULT NULL COMMENT '分享对象的id, 可能是 userId,也可能是⽤户组 ID。 当 shareToType=2（所有成员）的时候，shareTo 为null ',
    `share_to_type`             varchar(255) NOT NULL COMMENT '分享的类型 0：⽤户 1：⽤户组 2：组织',
    `expire_date`         timestamp(0) NOT NULL COMMENT '分享的有效期限，格式 为unix时间戳 ',
    `report_id`         varchar(255) DEFAULT NULL COMMENT '',
    `share_type`         varchar(255) DEFAULT NULL COMMENT '分享的组件类型',
    `name_of_share_to`         varchar(255) DEFAULT NULL COMMENT '分享的名称',
    `auth_point`         tinyint(1) NOT NULL COMMENT '授权类型。    1：仅查看    3：查看并导出 默认为1，仅查看',
    `if_delete` tinyint(1) UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,

    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 门户菜单
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`
(
    `id`               bigint(20)   NOT NULL,
    `menu_id`             varchar(255) NOT NULL COMMENT '路径参数，菜单id',
    `menu_type`         varchar(255) DEFAULT NULL COMMENT '菜单类型',
    `uri`         varchar(255) NOT NULL COMMENT '',
    `if_show_only_with_access`         tinyint(1) NOT NULL COMMENT '',
    `menu_name`         varchar(255) DEFAULT NULL COMMENT '',
    `if_delete` tinyint(1) UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,

    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 作品
DROP TABLE IF EXISTS `works`;
CREATE TABLE `works`
(
    `id`               bigint(20)   NOT NULL,
    `works_id`         varchar(255) NOT NULL COMMENT '作品id',
    `work_space_id`         varchar(255) NOT NULL COMMENT '工作空间id',
    `work_type`             varchar(255) NOT NULL COMMENT '查询参数，所查询报表类型 （TreeTypeEnum），填空为查询所有类型。类型可选其中： DATAPRODUCT：数据⻔户 PAGE：仪表板 REPORT：电⼦表格 dashboardOfflineQuery：⾃助取数',
    `name`         varchar(255) DEFAULT NULL COMMENT '作品名称',
    `security_level`         varchar(255) DEFAULT NULL COMMENT '',
    `description`         varchar(255) DEFAULT NULL COMMENT '',
    `if_delete` tinyint(1) UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,

    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 用户收藏
DROP TABLE IF EXISTS `user_favorite`;
CREATE TABLE `user_favorite`
(
    `id`               bigint(20)   NOT NULL,
    `user_id`             varchar(255) NOT NULL COMMENT '用户id',
    `works_id`         varchar(255) NOT NULL COMMENT '作品id',
    `favorite_id`         varchar(255) DEFAULT NULL COMMENT '收藏夹id',
    `if_delete` tinyint(1) UNSIGNED NOT NULL COMMENT '是否删除',
    `create_by` bigint(20) NULL DEFAULT NULL,
    `update_by` bigint(20) NULL DEFAULT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,

    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




