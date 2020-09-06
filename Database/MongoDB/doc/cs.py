'''
@Author: wjn
@Date: 2020-03-25 20:54:51
@LastEditors: wjn
@LastEditTime: 2020-03-25 21:01:03
'''

import os

path = r"C:\Users\wjn_0\Downloads\data"
for i in os.listdir(path):
    name = i.split(".")[0]
    a = "mongoimport --db drp --collection %s --file C:\\Users\wjn_0\Downloads\data\%s.json --legacy" (name,name)
    print(a)
    # print(i.split(".")[0])