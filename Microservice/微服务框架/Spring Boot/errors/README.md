<!--
 * @Author: wjn
 * @Date: 2020-05-08 10:27:31
 * @LastEditors: wjn
 * @LastEditTime: 2020-05-08 10:27:31
 -->
springCloud 的2.1.0以上版本的，将不再默认支持 FeignClient 的name属性 的相同名字。 
即 ：多个接口上的@FeignClient(“相同服务名”)会报错，overriding is disabled(覆盖 是 禁止的/关闭的)。

解决： 开启 覆盖 就行

spring:
    application:
      name: sxbs-mall-consumer
    # 多个接口上的@FeignClient(“相同服务名”)会报错，overriding is disabled。
    # 设置 为true ,即 允许 同名
    main:
      allow-bean-definition-overriding: true