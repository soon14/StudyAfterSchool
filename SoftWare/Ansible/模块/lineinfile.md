<!--
 * @Author: wjn
 * @Date: 2020-09-16 10:44:12
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-16 10:46:47
-->

https://www.ityoudao.cn/posts/ansible-modules-lineinfile/

path 参数：

必须指定的参数。
和 file 模块的 path 参数一样，指定要操作的文件。
别名：dest, destfile, name。
state 参数：

确保某一行存在（state=present，替换行）或者不存在（state=absent，删除行）。
默认值为 present。
regexp 参数：

使用 Python 的正则表达式语法匹配文件中的每一行。
替换行（state=present）时，如果有多行文本都匹配，只有最后面被匹配到的那行文本会被替换。
删除行（state=absent）时，如果有多行文本都匹配，这么这些行都会被删除。
如果没有匹配的行，则根据insertbefore或insertafter参数的设置添加指定的行。
替换行时，必须确保正则表达式同时匹配修改前和被line替换后的行来保证语句的幂等性。
line 参数：

指定的一行需要添加到文件中的文本。
替换行（state=present）时，必须指定该参数。
如果设置了backrefs参数，还包含向后引用。
别名：value。
backrefs 参数：

替换行（state=present）时使用。
值为yes或no，默认值no。
如果指定了该参数，insertafter和insertbefore参数会被忽略。
默认值为no，如果没有匹配，则添加一行line。如果匹配了，则把匹配的内容替换为line的内容。
值为yes时，表示开启后向引用，如果没有匹配，则文件保持不变。如果匹配了，把匹配内容替被换为line的内容。
insertafter 参数：

替换行（state=present）时使用。
值为EOF或者正则表达式，默认值为EOF，表示End Of File，插入到文件的末尾。
如果设置为正则表达式，默认将文本插入到正则表达式匹配的最后一行之后；如果指定了firstmatch=yes参数，则插入到匹配的第一行之后。
如果设置为正则表达式，但是没有匹配到任何行，则插入到文件末尾。
如果同时指定了regexp和insertafter参数，仅当regexp没有匹配成功时insertafter参数才会生效。
当使用backrefs参数时，此参数会被忽略。
insertbefore 参数：

替换行（state=present）时使用。
值为BOF或者正则表达式，默认值为BOF，表示Begin Of File，插入到文件的开头。
如果设置为正则表达式，默认将文本插入到正则表达式匹配的最后一行之前；如果指定了firstmatch=yes参数，则插入到匹配的第一行之前。
如果设置为正则表达式，但是没有匹配到任何行，则插入到文件开头。
如果同时指定了regexp和insertbefore参数，仅当regexp没有匹配成功时insertbefore参数才会生效。
当使用backrefs参数时，此参数会被忽略。
firstmatch 参数：

值为yes或no，默认值no。
和insertafter、insertbefore参数一起使用。
值为yes时，表示insertafter、insertbefore参数使用正则表达式匹配的第一行而不是最后一行。
validate 参数：

修改文件之前进行校验。
使用“%s”表示path参数指定的需要修改的文件。
file模块的所有参数，常用的有：

backup：是否在修改文件之前对文件进行备份。
create ：yes：当要操作的文件不存在时，创建对应的文件；默认为no：当要操作的文件不存在时，语句报错。
mode：文件的属性。
owner：文件的属主。
group：文件的属组。