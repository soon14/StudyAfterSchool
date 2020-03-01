<!--
 * @Author: wjn
 * @Date: 2020-03-01 13:12:46
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-01 13:12:59
 -->
# 函数

system.file(..., package = "base", lib.loc = NULL, mustWork = FALSE)


参数：...
character vectors, specifying subdirectory and file(s) within some package.  The default, none, returns the root of the package.  Wildcards are not supported. 
特征向量，指定一些包内的子目录和文件（S）。默认情况下，没有返回的包的根。不支持通配符。


参数：package
a character string with the name of a single package. An error occurs if more than one package name is given. 
用一个单一的包的名称的字符串。发生错误，如果多个包名。


参数：lib.loc
a character vector with path names of R libraries. See "Details" for the meaning of the default value of NULL. 
与特征向量的R库的路径名。 NULL默认值的含义，请参阅“详细资料”。


参数：mustWork
logical.  If TRUE, an error is given if there are no matching files. 
逻辑。如果TRUE，给出了一个错误，如果没有匹配的文件。