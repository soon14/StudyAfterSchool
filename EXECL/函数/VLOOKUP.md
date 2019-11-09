用于匹配数据表中与一列数据的匹配关系

场景1：根据Sheet1的姓名，填充Sheet2中相同姓名的成绩
![image](https://github.com/wjn0918/Study/blob/master/EXECL/images/%E5%87%BD%E6%95%B0/VLOOKUP_Sheet1.png)
![image](https://github.com/wjn0918/Study/blob/master/EXECL/images/%E5%87%BD%E6%95%B0/VLOOKUP_Sheet2.png)
![image](https://github.com/wjn0918/Study/blob/master/EXECL/images/%E5%87%BD%E6%95%B0/VLOOKUP_R.png)


=VLOOKUP(A2,Sheet1!A:B,2,0)
A2 ---- 需要查询的数据
Sheet1!A:B  ------需要匹配的数据所在的区域
2  ------  需要查询的数据匹配后返回的匹配数据所在列
0  ----  精确匹配


# 注意
1. 匹配数据区域中的值所在的列必须放在第一列
2. 数值类型进行匹配需要转换为文本类型(使用数据->分列...选择保存类型为文本)
3. 没有匹配到的结果为#N/A