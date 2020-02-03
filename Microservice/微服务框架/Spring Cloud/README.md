全套的分布式系统解决方案

相似框架
    apache Dubbo



# pom 文件模板

* 统一依赖管理
* Eureka服务注册发现模块
* 服务提供者
* 服务消费者（Feign）
* 熔断器仪表盘监控
* 路由网关Zuul


# application.yml 模板

* EurekaApplication


# Feign 使用熔断器

需要在配置文件中打开

```
feign:
  hystrix:
    enabled: true

```

# 路由网关过滤器功能



# Spring Cloud 服务配置

阿波罗配置中心

