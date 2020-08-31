1. Failure to find <font color=red>依赖目录</font> in http://maven.aliyun.com/nexus/content/repositories/central/ was cached in the local repository, resolution will not be reattempted until the update interval of alimaven has elapsed or updates are forced


由错误信息（was cached in the local repository, resolution will not be reattempted until the update interval of nexus has elapsed or updates are forced）可知，<font color=red>依赖目录</font> 已经被占用，无法进行操作，进入本地仓库对应目录，将其对应版本文件夹删除，重新执行打包命令，成功编译打包




