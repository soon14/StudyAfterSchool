<!--
 * @Author: wjn
 * @Date: 2020-02-25 20:35:21
 * @LastEditors: wjn
 * @LastEditTime: 2020-02-25 20:35:36
 -->
# 设置本地仓库

添加  GRADLE_USER_HOME  环境变量指定本地路径

# 设置国内镜像

使用阿里云国内镜像
对单个项目生效，在项目中的build.gradle修改内容
```
buildscript {
    repositories {
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public/' }
                maven{ url 'http://maven.aliyun.com/nexus/content/repositories/jcenter'}
    }    
}

allprojects {
    repositories {
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public/' }
        maven{ url 'http://maven.aliyun.com/nexus/content/repositories/jcenter'}
    }
}
```
对所有项目生效，在USER_HOME/.gradle/下创建init.gradle文件

```
allprojects{
    repositories {
        def ALIYUN_REPOSITORY_URL = 'http://maven.aliyun.com/nexus/content/groups/public'
        def ALIYUN_JCENTER_URL = 'http://maven.aliyun.com/nexus/content/repositories/jcenter'
        all { ArtifactRepository repo ->
            if(repo instanceof MavenArtifactRepository){
                def url = repo.url.toString()
                if (url.startsWith('https://repo1.maven.org/maven2')) {
                    project.logger.lifecycle "Repository ${repo.url} replaced by $ALIYUN_REPOSITORY_URL."
                    remove repo
                }
                if (url.startsWith('https://jcenter.bintray.com/')) {
                    project.logger.lifecycle "Repository ${repo.url} replaced by $ALIYUN_JCENTER_URL."
                    remove repo
                }
            }
        }
        maven {
                url ALIYUN_REPOSITORY_URL
            url ALIYUN_JCENTER_URL
        }
    }
}
```