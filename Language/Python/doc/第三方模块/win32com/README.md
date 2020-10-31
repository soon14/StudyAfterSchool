'''
Author: wjn
Date: 2020-10-29 10:59:14
LastEditors: wjn
LastEditTime: 2020-10-31 09:42:51
'''

# 注意加换行符，不然会将前面格式冲掉

# 五号bai=10.5磅=3.70毫米du
# 初号=42磅=14.82毫米zhi
# 小初=36磅=12.70毫米
# 一号=26磅=9.17毫米
# 小一dao=24磅=8.47毫米
# 二号=22磅=7.76毫米
# 小二=18磅=6.35毫米
# 三号内=16磅=5.64毫米
# 小三容=15磅=5.29毫米
# 四号=14磅=4.94毫米
# 小四=12磅=4.23毫米
# 五号=10.5磅=3.70毫米
# 小五=9磅=3.18毫米
# 六号=7.5磅=2.56毫米
# 小六=6.5磅=2.29毫米
# 七号=5.5磅=1.94毫米
# 八号=5磅=1.76毫米



import json
from win32com.client import Dispatch


cm_to_points = 28.35 # 1厘米为28.35磅
page_left = 1.48  # 左侧页边距
page_wide = 19 # 页面宽度
font_size = 0.370  # 五号字
row_height = font_size * 1.5


four_size = 0.494 * cm_to_points


def getJsonRowNumber(data):
    """获取json 字符串行数"""
    return len(formatJson(returnVaule).split("\n"))

def formatJson(data):
    """
    格式化输出json数据
    """
    return json.dumps(json.loads(returnVaule), sort_keys=True, indent=4, separators=(',', ': '))

def generateTitle(doc, data):
    """
    构建2级标题
    """
    styles = doc.Styles
    # 标题2
    normal = styles(-3)
    normal.Font.Name = '宋体'
    normal.Font.Size = four_size
    normal.Font.Color = 0

    s = app.Selection
    s.Style = normal
    s.Text = data
    s.Move(1,2)


def generateBullets(doc,data):
    """
    构建项目符号
    """
    styles = doc.Styles
    # 标题2
    normal = styles(-1)
    normal.Font.Name = '宋体'
    normal.Font.Size = 10
    # normal.Font.Color = 6723891
    # normal.Font.Color = 0

    s = app.Selection
    s.Text = data
    s.Style = normal


    # app.ActiveDocument.ApplyListTemplate = mylsttmp
    # 使用默认 列表https://docs.microsoft.com/zh-cn/office/vba/api/word.listformat.applylisttemplate
    # app.Selection.Range.ListFormat.ApplyBulletDefault()
    # 使用自定义
    mylsttmp = app.ListGalleries(1).ListTemplates(1)
    app.Selection.Range.ListFormat.ApplyListTemplate(mylsttmp)

    app.Selection.MoveRight(1)
    app.Selection.TypeParagraph()
    
    
    # app.Selection.TypeBackspace()
    # 移除项目符号
    app.Selection.Range.ListFormat.RemoveNumbers()



def generateTable(doc,data):
    """
    构建表格
    """
    a = app.Selection.End
    r = doc.Range(a,a) #获取一个范围
    r.Style.Font.Name = "仿宋" #设置字体
    r.Style.Font.Size = "9" #设置字体大小
    # r.InsertBefore("\n" + "表描述" + " " + "表名")  #在这个范围前插入文本
    cn = 4    # 列数
    rn = len(data) + 1   # 行数
    table = doc.Tables.Add(doc.Range(r.End,r.End),rn,cn)  #建一张表格
    table.Rows[0].Cells[0].Range.Text = u"路径参数"
    table.Rows[0].Cells[1].Range.Text = u"类型"
    table.Rows[0].Cells[2].Range.Text = u"描述"
    table.Rows[0].Cells[3].Range.Text = u"是否必需"
    for i in range(len(data)):
        table.Rows[i + 1].Cells[0].Range.Text = data[i]['name']
        table.Rows[i + 1].Cells[1].Range.Text = data[i]['type']
        table.Rows[i + 1].Cells[2].Range.Text = data[i]['desc']
        table.Rows[i + 1].Cells[3].Range.Text = data[i]['required']
    # app.Selection.WholeStory()

    # 线条说明 https://docs.microsoft.com/zh-cn/dotnet/api/microsoft.office.interop.word.wdbordertype?view=word-pia
    for i in range(-6,0):
        # https://docs.microsoft.com/zh-cn/dotnet/api/microsoft.office.interop.word.wdbordertype?view=word-pia 
        # 边框  https://docs.microsoft.com/zh-cn/office/vba/api/word.wdbordertype
        table.Borders(i).LineStyle = 1
        # 线宽 https://docs.microsoft.com/zh-cn/dotnet/api/microsoft.office.interop.word.wdlinewidth?view=word-pia
        table.Borders(i).LineWidth = 2


    app.Selection.WholeStory()
    app.Selection.Move(1,2)

        

def generateTextBox(doc,data):
    """
    构建文本框
    """
    row_number = getJsonRowNumber(data)
    a = app.Selection.End 
    s = doc.Shapes
    # https://docs.microsoft.com/en-us/dotnet/api/microsoft.office.core.msotextorientation?view=office-pia
    # 1 表示横向文本框  (page_left -10) * cm_to_points
    shape = s.AddTextbox(1, page_left * cm_to_points, a, page_wide * cm_to_points ,row_number * row_height * cm_to_points * 1.5)
    shape.TextFrame.TextRange = data
    


    # 布局选项  https://docs.microsoft.com/zh-cn/office/vba/api/word.wdwraptypemerged   
    # 7 表示嵌入型
    shape.WrapFormat.Type = 7

    # 填充
    # shape.Fill.BackColor.RGB = 
    # 退出文本框   wps 和 office 不兼容，本例采用office
    app.Selection.EscapeKey
    app.Selection.Collapse
    # app.Selection.MoveDown(1)

    app.Selection.WholeStory()
    app.Selection.MoveRight(1)
    app.Selection.TypeParagraph()

def readData():
    filePath = 'pro/维稳/脚本/data.json'
    fr = open(filePath,'r',encoding='UTF-8' )
    dataStr = fr.read()
    return json.loads(dataStr)





if __name__ == "__main__":
    css = readData()
    for cs in css:
        no = cs['no']
        title = cs['title']
        title2  = no + ' ' + title + "\r\n"

        api = "接口：" + cs['api']
        desc = "接口描述："+ cs['desc']
        datas = api+ "\n" + desc + "\r\n"

        params = cs['params']

        returnVaule = cs['returnVaule']
        print(formatJson(returnVaule))


        app = Dispatch('Word.Application')
        app.Visible = True
        doc = app.Documents.Open('D:/wk/pro/source/cs.doc')
    
        generateTitle(doc,title2)
        generateBullets(doc,datas)
        generateTable(doc,params)
        generateBullets(doc,"返回参数：")
        generateTextBox(doc,formatJson(returnVaule))

    pass






    