object 类是静态类（单例对象，不能new）  
成员变量及方法都是<font color=red>静态</font>的，只需用类名.方法/类名.成员变量进行调用

# apply 语法糖(suger)

<font color=red>注意： 只能是静态类使用apply</font>  
List(1,2,3) 就是调用了List.apply(1,2,3)

类() 默认调用的是类.apply()

```
object HelloWorld {


  def main(args: Array[String]): Unit = {


    HelloWorld("小明")
  }

  def apply(x: String ): Unit = {
    print(s"hello:$x")

  }
}
```


