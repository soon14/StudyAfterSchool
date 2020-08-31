<!--
 * @Author: wjn
 * @Date: 2020-04-29 09:09:15
 * @LastEditors: wjn
 * @LastEditTime: 2020-05-12 11:45:03
 -->

# 常用注解

@TableName

    映射实体和数据库表

@TableId

    指定数据库中主键

@TableField

    指定数据库中字段


# MP (mybatis-plus)

默认id 为数据库主键

## 排除非表字段

1. 添加 transient 关键字   （不参与序列化）
2. 添加 static 关键字   （静态属性）
3. 添加@TableField(exist=false) 注解

## 查询

### 普通查询

selectBatchIds

    List<Integer> idsList = Arrays.asList(1, 2);
    List<TPerson> tPersonList = userMapper.selectBatchIds(idsList);


selectByMap

        Map<String, Object> queryMap = new HashMap<>();
        queryMap.put("name","张三");
        queryMap.put("age",10);
        List<TPerson> tPeople = userMapper.selectByMap(queryMap);
        System.out.println(tPeople);

### 条件构造器


    QueryWrapper<TPerson> queryWrapper = new QueryWrapper<>();
    QueryWrapper<TPerson> wrapper = queryWrapper.like("name", "三").lt("age", 11);
    List<TPerson> tPersonList = userMapper.selectList(wrapper);
    tPersonList.forEach(System.out::println);

1. 数据库函数 动态入参

apply

    apply("date_format(dateColumn,'%Y-%m-%d') = '2008-08-08'")

存在sql注入风险

    apply("date_format(dateColumn,'%Y-%m-%d') = '2008-08-08' or true")



不存在，会将2008-08-08 or true  作为参数

    apply("date_format(dateColumn,'%Y-%m-%d') = {0}", "2008-08-08 or true")


2. 子查询

insql


3. lambda 表达式

    .and(wq -> wq.lt("age", 40).or().isNotNull("email"))

    nested(i -> i.eq("name", "李白").ne("status", "活着"))--->(name = '李白' and status <> '活着')

4. 反向排除指定列

    queryWrapper.select(TPerson.class, info -> !info.getColumn().equals("name") && !info.getColumn().equals("age"))

5. 条件判断condition

    queryWrapper.like(StringUtils.isNotBlank(name),"name",name)

6. 创建条件构造器时传入实体对象

将实体作为条件传入

    TPerson tPerson = new TPerson();
    QueryWrapper<TPerson> queryWrapper = new QueryWrapper<>(tPerson);

字段为等值判断
若想不等值在实体中加入@TableField(condition=SqlCondition.)

7. allEq用法

        Map<String,Object> map = new HashMap<>();
        map.put("name","zhangsan");
        QueryWrapper<TPerson> tPersonQueryWrapper = queryWrapper.allEq(map);


是否允许字段传入比对条件中

    allEq(BiPredicate<R, V> filter, Map<R, V> params)

    queryWrapper.allEq((k, v) -> k.equals("name"), map);


8. lambda 条件构造器

        LambdaQueryWrapper<TPerson> wrapper = new LambdaQueryWrapper<>();
        LambdaQueryWrapper<TPerson> wang = wrapper.like(TPerson::getName, "wang");

防止误写

新增

     List<TPerson> wang1 = new LambdaQueryChainWrapper<TPerson>(PersonMapper).like(TPerson::getName, "wang").list();


9. 自定义sql

版本>=3.0.7

1. 接口中新增

    @Select("select * from user ${ew.customSqlSegment}")
    List<TPerson> selectAll(@Param(Constants.WRAPPER)Wrapper<TPerson> wrapper)

2. xml 中新增

mybatis-plus:
  mapper-locations:
    - com/crud/mapper/*


10. 分页查询

新增插件
```
package com.crud.configuration;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MybatisPlusConfiguration {
    @Bean
    public PaginationInterceptor paginationInterceptor(){
        return new PaginationInterceptor();
    }
}

```

        QueryWrapper<TPerson> wrapper = new QueryWrapper<>();
        QueryWrapper<TPerson> queryWrapper = wrapper.like("name", "张");
        Page<TPerson> tPersonPage = new Page<TPerson>(1, 2);
        //  Page<TPerson> tPersonPage = new Page<TPerson>(1, 2,false);   //不查询总记录
        Page<TPerson> tPersonPage1 = userMapper.selectPage(tPersonPage, queryWrapper);
        System.out.println(String.format("总页数；%s,总记录数：%s", tPersonPage1.getPages(),tPersonPage1.getTotal()));
        tPersonPage1.getRecords().forEach(System.out::println);

自定义分页

```
IPage<TPerson> selectUserPage(Page<TPerson> page, @Param(Constants.WRAPPER)Wrapper<TPerson> wrapper);
```

xml

```
select * from user ${ew.customSqlSegment}
```


## 更新

1. 根据id 更新
2. 以条件构造器作为参数的更新方法

3. 条件构造器中set方法使用


# AR模式（Active Record）

实体类对应数据库中的一张表，每个实例即表中的一条数据


实体类需要继承Model类


# 主键策略（IdType）

## 局部策略配置

雪花算法？ Id_work

主键自增策略

    @TableId(type = IdType.AUTO)

默认策略

    @TableId(type = IdType.NONE)

UUID

    @TableId(type = IdType.ASSIGN_UUID)

ID_WORKER

ID_WORKER_STR


## 全局策略配置 

```
mybatis-plus:
  global-config:
    db-config:
      id-type: auto
```


**局部策略优于全局策略**


# 基本配置

**Strategy


ignored 

没有设置的字段会出现在sql语句中

not_empty

null和""都会忽略

## 局部配置

    @TableField(whereStrategy = FieldStrategy.DEFAULT)



# 通用Service

    public interface UserService extends IService<TPerson> 

    @Service
    public class UserServiceImpl extends ServiceImpl<PersonMapper, TPerson> implements UserService {
    }



链式调用

    userService.lambdaQuery().gt(User::getAge,20).list()


    userService.lambdaUpdate().gt(User::getAge,20).set(User::getAge,12).update()

    userService.lambdaUpdate().gt(User::getAge,20).set(User::getAge,12).remove()




## 逻辑删除

```
mybatis-plus:
  global-config:
    db-config:
      logic-delete-field: deleted  #全局逻辑删除字段值 3.3.0开始支持，详情看下面。
      logic-delete-value: 1 # 逻辑已删除值(默认为 1)
      logic-not-delete-value: 0 # 逻辑未删除值(默认为 0)
```

```
    @TableField("is_delete")
    @TableLogic
    private Integer deleted;
```

```
userMapper.deleteById("2");
```


# 自动填充
```
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
```

```
package com.demo.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Slf4j
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("start insert fill ....");
        this.strictInsertFill(metaObject, "createTime", LocalDateTime.class, LocalDateTime.now()); // 起始版本 3.3.0(推荐使用)
//        this.fillStrategy(metaObject, "createTime", LocalDateTime.now()); // 也可以使用(3.3.0 该方法有bug请升级到之后的版本如`3.3.1.8-SNAPSHOT`)
        /* 上面选其一使用,下面的已过时(注意 strictInsertFill 有多个方法,详细查看源码) */
        //this.setFieldValByName("operator", "Jerry", metaObject);
        //this.setInsertFieldValByName("operator", "Jerry", metaObject);

//        this.strictInsertFill(metaObject,"isDelete",String.class,"0");
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update fill ....");
        this.strictUpdateFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now()); // 起始版本 3.3.0(推荐使用)
        this.fillStrategy(metaObject, "updateTime", LocalDateTime.now()); // 也可以使用(3.3.0 该方法有bug请升级到之后的版本如`3.3.1.8-SNAPSHOT`)
        /* 上面选其一使用,下面的已过时(注意 strictUpdateFill 有多个方法,详细查看源码) */
        //this.setFieldValByName("operator", "Tom", metaObject);
        //this.setUpdateFieldValByName("operator", "Tom", metaObject);
    }
}

```



优化

```
    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update fill ....");
        Object updateTime = getFieldValByName("updateTime", metaObject);
        // 自己设置了按设置的，没设置的按默认
        if (updateTime == null) {
            this.strictUpdateFill(metaObject, "updateTime", LocalDateTime.class, LocalDateTime.now()); // 起始版本 3.3.0(推荐使用)
        }

    }
```

# 多租户隔离

https://mp.baomidou.com/guide/tenant.html

https://www.imooc.com/video/20096

# 特定sql过滤

@SqlParser(filter = true)

# 动态表名

public static ThreadLocal<String> myTableName = new ThreadLocal<>()


# sql 注入器

1. 创建定义方法的类

2. 创建注入器

3. 在Mapper中加入自定义方法



# or 和and
queryWrapper.like(StringUtils.isNotEmpty(operationPlan.getTitle()), SomcOperationPlan::getTitle, operationPlan.getTitle())
        .and(wrapper -> wrapper.eq(StringUtils.isNotEmpty(operationPlan.getChargeUser()), SomcOperationPlan::getChargeUser, operationPlan.getChargeUser()).or().eq(StringUtils.isNotEmpty(operationPlan.getExecuteUser()), SomcOperationPlan::getExecuteUser, operationPlan.getExecuteUser()));
