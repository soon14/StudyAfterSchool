<!--
 * @Author: wjn
 * @Date: 2020-03-12 16:29:26
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-12 16:29:26
 -->
1、命令帮助
scrapy 

2、创建项目
scrapy startproject 项目名称

3、生成spider（进入项目目录）
scrapy gensipder 爬虫名 爬取域
scrapy gensipder -l   罗列模板
scrapy gensipder -t   指定模板

4、运行爬虫
scrapy crawl 爬虫名称

5、检查代码
scrapy check

6、罗列项目中的爬虫
scrapy list

7、将网页保存为文件并用浏览器打开
用于查看网页中的静态元素
scrapy view http://www.baidu.com


8、进入交互模式
scrapy shell http://www.baidu.com

9、获取scrapy 版本和依赖库
scrapy version
scrapy version -v
