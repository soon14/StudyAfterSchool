# 多个Excel转换为一个Excel中多个Sheet

```
import pandas as pd
from openpyxl import load_workbook
import os

def _excelAddSheet(csv_name, excelWriter, sheet_name):
    os.chdir(basePath + "r")
    dataframe = pd.read_excel(csv_name)
    book = load_workbook(excelWriter.path)
    excelWriter.book = book
    dataframe.to_excel(excel_writer=excelWriter, sheet_name=sheet_name, index=None)
    excelWriter.close()

def concatExecl(execlsName,execls):
    """合并多个execl到一个"""
    excelWriter = pd.ExcelWriter(os.path.join(outPath, 'all.xlsx'),engine='openpyxl')
    pd.DataFrame().to_excel(os.path.join(outPath, 'all.xlsx'))
    for index,name in enumerate(execlsName):
        sheet_name = execls[index]
        _excelAddSheet(name, excelWriter, sheet_name)

def run():
    execlsName = os.listdir(basePath + "r")
    execls = [i.split(".")[0] for i in execlsName]
    print(execls)
    concatExecl(execlsName,execls)

```


# 向同一个Excel中追加数据

```
sum = 0

def append2execl(sheet,tbName,fieldInfo):
    basePath = "D:\\workpalce\\python\\fd\\"
    os.chdir(basePath)
    global sum
    begin = sum
    print(sum)
    # tbName = "表名"
    data = fieldInfo
    num = len(data)
    sheet.write(begin,0,tbName)
    zs = begin + 1
    sheet.write(zs,0,"序号")
    sheet.write(zs,1,"字段名")
    sheet.write(zs,2,"字段类型")
    sheet.write(zs,3,"是否主键")
    sheet.write(zs,4,"字段注释")
    a = 0
    for i in range(0,num):
        info = data[i]
        id = info[0]
        name = info[1]

        ftype = info[2]
        ifzj = info[3]
        comment = info[4]
        i = i + 1
        content_num = zs + i


        sheet.write(content_num,0,id)
        sheet.write(content_num,1,name)
        sheet.write(content_num,2,ftype)
        sheet.write(content_num,3,ifzj)
        sheet.write(content_num,4,comment)
        a = content_num

    sum = sum + num + 3

def run(tbName,fieldInfo):
    basePath = "D:\\workpalce\\python\\fd\\"
    data = xlrd.open_workbook(basePath + "a.xls",formatting_info=True)
    excel = copy(wb=data) # 完成xlrd对象向xlwt对象转换
    sheet = excel.get_sheet(0) # 获得要操作的页
    append2execl(sheet,tbName,fieldInfo)
    excel.save(basePath + "a.xls")

```