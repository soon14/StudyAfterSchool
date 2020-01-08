# final 

修饰类/方法/成员变量将不能被继承/重写/修改

# type

定义别名
type S = String

val name: S = "xxx"

```
object HelloWorld extends Hello {
  val name: String = "张三"
  override type T = String

  def main(args: Array[String]): Unit = {
    HelloWorld.say(HelloWorld.name)
  }
}

```

```
trait Hello {
  type T

  def say(s: T): Unit = {
    print(s)
  }
}


```