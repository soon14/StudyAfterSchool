# Thymeleaf 

模板引擎


# 依赖

需要额外的依赖
提供非严格html格式
```
		<dependency>
			<groupId>net.sourceforge.nekohtml</groupId>
			<artifactId>nekohtml</artifactId>
			<version>1.9.22</version>
		</dependency>
```

# 配置文件

spring:
  thymeleaf:
    cache: false # 禁用缓存
    mode: LEGACYHTML5 # 非严格的html格式
    encoding: UTF-8
    servlet:
      content-type: text/html

* 严格html格式

符合w3c标准

html 文件添加

```
<!DOCTYPE html SYSTEM "http://www.thymeleaf.org/dtd/xhtml1-strict-thymeleaf-spring4-4.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">

<span th:text="${对象.属性}">静态</span>
```