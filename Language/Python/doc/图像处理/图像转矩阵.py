'''
Author: wjn
Date: 2020-09-08 15:33:58
LastEditors: wjn
LastEditTime: 2020-09-08 15:34:17
'''
from PIL import Image

from io import BytesIO as Bytes2Data
from io import BufferedReader

def image2Matrix(filename):
    """
    将传入的图像转化为矩阵
    :@param filename: 1、图像路径 2、图像文件 3、图像字符串流
    :return:图像矩阵类型
    """

    # 读取图片
    print(type(filename))
    if isinstance(filename,str) or isinstance(filename,BufferedReader):
        im = Image.open(filename)
    elif isinstance(filename, bytes):
        im = Image.open(Bytes2Data( ))
    # 显示图片
    # im.show()
    width, height = im.size
    im = im.convert("L")
    data = im.getdata()
    data = np.matrix(data, dtype='float') / 255.0
    new_data = np.reshape(data, (height, width))
    return new_data