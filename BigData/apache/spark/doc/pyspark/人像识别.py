'''
Author: wjn
Date: 2020-09-08 16:45:42
LastEditors: wjn
LastEditTime: 2020-09-08 17:19:45
'''
from PIL import Image
import numpy as np


df = spark.read.format("image").load("/dataset/images")
# df.select("image.width", "image.height").rdd.map(lambda x: (x.width,x.width +1)).collect()
# 转为矩阵
np_rdd = df.select("image.data","image.width", "image.height").rdd.map(lambda x: (np.matrix(x[0], dtype='float') / 255.0 ,x[1],x[2]))
# np_rdd.collect()
# 
np_reshape_rdd = np_rdd.map(lambda x: np.resize(x[0], (x[2],x[1])))
np_reshape_rdd.collect()
