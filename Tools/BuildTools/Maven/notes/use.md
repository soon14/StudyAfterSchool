<!--
 * @Author: wjn
 * @Date: 2020-09-17 10:12:23
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-17 10:16:42
-->
查看依赖树结构：
mvn dependency:tree>tree.txt

* 编译跳过测试

mvn -N install -Dmaven.test.skip=true

-N,--non-recursive Do not recurse into sub-projects

意思是，不递归到子项目(子模块)。


