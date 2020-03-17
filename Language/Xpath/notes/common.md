<!--
 * @Author: wjn
 * @Date: 2020-03-13 17:14:19
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-13 17:23:36
 -->
# 语法

## 选取节点


表达式| 描述
-|-
nodename| 选取此节点的所有子节点。
/| 从根节点选取。
//| 从匹配选择的当前节点选择文档中的节点，而不考虑它们的位置。
.| 选取当前节点。
..| 选取当前节点的父节点。
@| 选取属性。

示例：

1. 获取所有input标签中包含type=submit属性的value属性

        response.xpath('//input[@type="submit"]/@value').get()


2. 包含href = "image"的所有a 标签

        //a[contains(@href, "image")]