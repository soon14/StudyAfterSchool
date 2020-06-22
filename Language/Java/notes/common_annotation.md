<!--
 * @Author: wjn
 * @Date: 2020-04-29 09:21:11
 * @LastEditors: wjn
 * @LastEditTime: 2020-04-29 14:57:40
 -->



@PathVariable 路径变量注解

```
    @PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity putUser(@PathVariable Long id){}
```


@Data 

getter、setter 注解

```
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <optional>true</optional>
</dependency>
```

@Value  

用 @Value(“${xxxx}”)注解从配置文件读取值的用法

```
@Value("${init.password}")  
private String initPwd;   
```

@Value(“#{}”) 表示SpEl表达式通常用来获取bean的属性，或者调用bean的某个方法。当然还有可以表示常量
```
@Value("#{1}")  
private int number; //获取数字 1  

@Value("#{'Spring Expression Language'}") //获取字符串常量  
private String str;  

@Value("#{dataSource.url}") //获取bean的属性  
private String jdbcUrl;  
```

@NotNull  
@NotBlank
BindingResult  和@NotNull   @NotBlank  一起使用
@Pattern   正则注解


```
<dependency>
    <groupId>javax.validation</groupId>
    <artifactId>validation-api</artifactId>
    <version>2.0.1.Final</version>
</dependency>
```


**注意在使用@NotBlank等注解时，一定要和@valid一起使用，不然@NotBlank不起作用**


## 案例

entity

```
package com.crud.entity;

import com.baomidou.mybatisplus.annotation.FieldStrategy;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class TPerson extends Model<TPerson> {

    @TableId(type = IdType.ASSIGN_UUID)
    @TableField(whereStrategy = FieldStrategy.DEFAULT)
    private Long id;

    @NotNull(message = "姓名不能为空")
    @Pattern(regexp = ".{6,20}", message = "密码长度为6-20位")
    private String name;

    private Integer age;
}

```

controller

```
package com.crud.controller;


import com.crud.entity.TPerson;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping(value = "/")
public class PersonController {


    @PutMapping(value = "/add", consumes = MediaType.APPLICATION_JSON_VALUE)
    public TPerson addPerson(@Valid @RequestBody TPerson person){
        return person;
    }


    @PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity putUser(@PathVariable Long id,
                           @Valid @RequestBody UserPut userPut,
                           @ApiIgnore BindingResult bindingResult
    ){
        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(400).body(bindingResult.getFieldErrors().get(0).getDefaultMessage());
        }
        return ResponseEntity.ok(userPut);

    }


}



```