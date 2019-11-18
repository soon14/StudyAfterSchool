在 Makefile 使用 include 关键字可以把别的 Makefile 包含进来，这很像 C 语言的#include，被包含的文件会原模原样的放在当前文件的包含位置。include 的语法是：

include <filename>  filename 可以是当前操作系统 Shell 的文件模式 （可以保含路径和通配符）  在 include前面可以有一些空字符，但是绝不能是[Tab]键开始。include 和<filename>可以用一个或多个空格隔开。举个例子，你有这样几个 Makefile：a.mk、b.mk、c.mk，还有一个文件叫foo.make，以及一个变量$(bar)，其包含了 e.mk 和f.mk，那么，下面的语句：  

 

include foo.make *.mk $(bar)  

等价于：  

include foo.make a.mk b.mk c.mk e.mk f.mk  