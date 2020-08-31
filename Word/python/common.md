<!--
 * @Author: wjn
 * @Date: 2020-03-12 16:35:37
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-12 16:36:04
 -->
# 输入图片


```
from docx import Document
from docx.shared import Inches
 
string = '文字内容'
images = '1.jpg'    # 保存在本地的图片
doc = Document()    # doc对象
doc.add_paragraph(string)   # 添加文字
doc.add_picture(images, width=Inches(2))     # 添加图, 设置宽度
doc.save('word文档.docx')  

```