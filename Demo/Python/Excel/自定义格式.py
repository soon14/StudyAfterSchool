<!--
 * @Author: your name
 * @Date: 2020-02-22 17:19:07
 * @LastEditTime: 2020-02-22 17:19:40
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \StudyAfterSchool\Demo\Python\Excel\自定义格式.md
 -->




# 合并单元格测试

import os
import xlwt
from xlwt import Style



def init_wk():
    """
    初始化excel
    """
    import xlwt
    return xlwt.Workbook()

def save_wk(wk,fileName):
    """
    保存excel
    """
    wk.save(fileName)

def concat_cell(wk_sheet, first_cell_row,first_cell_column,second_cell_row,second_cell_column,content,style):
    """
    合并单元格
    """
    wk_sheet.write_merge(first_cell_row, first_cell_column, second_cell_row, second_cell_column, content,style)

    pass

def modif_pattern(patternColor='gray25'):
    """
    修改背景
    """

    # 设置背景
    pattern = xlwt.Pattern()
    # 设置背景颜色的模式
    pattern.pattern = xlwt.Pattern.SOLID_PATTERN
    # 背景颜色
    pattern.pattern_fore_colour = Style.colour_map[patternColor]

    return pattern
    pass




def modif_font():
    """
    修改字体
    """
    font = xlwt.Font()
    font.bold = True  #加粗

    return font
    pass


def custom_borders():
    """
    添加边框
    """
    borders = xlwt.Borders()  # Create borders

    borders.left = xlwt.Borders.MEDIUM  # 添加边框-虚线边框
    borders.right = xlwt.Borders.MEDIUM  # 添加边框-虚线边框
    borders.top = xlwt.Borders.MEDIUM  # 添加边框-虚线边框
    borders.bottom = xlwt.Borders.MEDIUM  # 添加边框-虚线边框
    '''
    May be: NO_LINE, THIN, MEDIUM, DASHED, DOTTED, THICK, DOUBLE, 
    HAIR, MEDIUM_DASHED, THIN_DASH_DOTTED, MEDIUM_DASH_DOTTED, 
    THIN_DASH_DOT_DOTTED, MEDIUM_DASH_DOT_DOTTED, SLANTED_MEDIUM_DASH_DOTTED, 
    or 0x00 through 0x0D.
    '''
    borders.left_colour = 0x00  # 边框上色
    borders.right_colour = 0x00
    borders.top_colour = 0x00
    borders.bottom_colour = 0x00

    return borders

def custom_style():
    """
    自定义excel风格
    """
    # 初始化样式
    style = xlwt.XFStyle()

    style.font = modif_font()
    style.pattern = modif_pattern()
    style.borders = custom_borders()

    style.alignment.horz = 2  # 字体居中


    return style


if __name__ == "__main__":
    basePath = "D:\\workpalce\\python\\fd\\data"
    os.chdir(basePath)

    wk = init_wk()
    worksheet = wk.add_sheet('My sheet')
    style = custom_style()
    concat_cell(worksheet,0, 0, 0, 3, 'First Merge',style)

    save_wk(wk,'cs.xls')




    pass