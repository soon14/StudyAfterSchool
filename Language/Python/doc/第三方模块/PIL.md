<!--
 * @Author: wjn
 * @Date: 2020-09-09 02:15:47
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-09 02:15:47
-->
一、图像路径
最常用的打开图像文件的方式。
# PIL
from PIL import Image
 
# Image path
im_path = "./a.jpg"
 
# 1. path
im1 = Image.open(im_path)
print (' From image path {}'.format(im1))
输出结果：
    



二、图像文件
打开图像文件对象。
# PIL
from PIL import Image
 
# Image path
im_path = "./a.jpg"
 
# 2. file
with open(im_path, 'rb') as f:
    im2 = Image.open(f)
    print (' From image file {}'.format(im2))
输出结果：
    



三、图像字符串流
打开图像字符串流。
  包括但不局限于浏览器传输，跨语言传输等。

# Platform.
import platform
if ('2.' in platform.python_version()):
    from StringIO import StringIO as Bytes2Data
else:
    from io import BytesIO as Bytes2Data
 
# PIL
from PIL import Image
 
# Image path
im_path = "./a.jpg"
 
# 3. Bytes.
with open(im_path, 'rb') as f:
    im_bytes = f.read()
    im3 = Image.open(Bytes2Data(im_bytes))
    print (' From image bytes {}'.format(im3))

输出结果：
    



四、图像压缩包
打开包含图像的压缩包。
  节省磁盘空间，提图像处理速率。

# Platform
import platform
if ('2.' in platform.python_version()):
    from StringIO import StringIO as Bytes2Data
elif ('3.' in platform.python_version()):
    from io import BytesIO as Bytes2Data
 
# Zip
import zipfile
 
# Zip path
zip_path = "./z.zip"
 
# 4. Zip.
z_file = zipfile.ZipFile(zip_path, "r")
for filename in z_file.namelist():
    # Bytes.
    bytes_img = z_file.read(filename)
    if (0 != len(bytes_img)):
        im4 = Image.open(Bytes2Data(bytes_img))
        print(' From zip file {}'.format(im4))
    else: # directory.
        pass

输出结果：
    