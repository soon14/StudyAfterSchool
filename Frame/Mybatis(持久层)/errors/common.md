<!--
 * @Author: wjn
 * @Date: 2020-04-22 10:36:10
 * @LastEditors: wjn
 * @LastEditTime: 2020-04-22 10:36:51
 -->
org.springframework.beans.factory.NoSuchBeanDefinitionException

**Application类添加
@MapperScan("com.example.wjn.mypot.mapper")

例如

```
@SpringBootApplication
@MapperScan("com.example.wjn.mypot.mapper")
public class MypotApplication {

    public static void main(String[] args) {
        SpringApplication.run(MypotApplication.class, args);
    }

}
```