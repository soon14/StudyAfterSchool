<!--
 * @Author: wjn
 * @Date: 2020-03-01 11:56:01
 * @LastEditors: wjn
 * @LastEditTime: 2020-03-30 12:02:10
 -->

 # 各类文件转换为思维导图


   **导入依赖包**
   
      library('mindr')

   # 文本转换

   **text -> widget(文本转)**

      input <- c("# Chapter 1", "## Section 1.1", "## Section 1.2", "# Chapter 2")
      mm(from = input, type = "text", root = "mindr")

   # 目录结构转换

   **directory -> widget(目录转)**

      input <- paste0(.libPaths(), "/mindr")[1]
      mm(from = input, type = "dir")
      mm(from = input, type = "dir", widget_name = "mindrtest.html")

   
   ### demo

      input <- paste0(目录, "文件夹")[1]
      mm(from = input, type = "dir")
      mm(from = input, type = "dir", widget_name = "mindrtest.html")

      mm(from = file_path, type = "file", widget_name = "cs.html")

   **directory -> mm(目录转mm文件)**

      mm(from = input, type = "dir", to = "test.mm")
   **directory -> md(目录结构转md文件)**

      mm(from = input, type = "dir", to = "test.md")
   **directory -> txt(目录结构转txt)**

      mm(from = input, type = "dir", to = "test.txt")

# Rmd文件转换

### Rmd -> widget
input <- system.file("examples/r/rmd2r.Rmd", package = "mindr")
mm(from = input, type = "file", root = "mindr")
### Rmd -> r
mm(from = input, type = "file", root = "mindr", to = "test.r")
### Rmd -> mm
mm(from = input, type = "file", root = "mindr", to = "test.mm")

# mm文件转换

### mm -> widget
input <- system.file("examples/mm/bookdownplus.mm", package = "mindr")
mm(from = input, type = "file", root = "mindr")
### mm -> Rmd
mm(from = input, type = "file", root = "mindr", to = "test.Rmd")
### mm -> r
mm(from = input, type = "file", root = "mindr", to = "test.r")


# r文件转换

### r -> widget
input <- system.file("examples/r/r2rmd.R", package = "mindr")
mm(from = input, type = "file", root = "mindr")
### r -> Rmd
mm(from = input, type = "file", root = "mindr", to = "test.Rmd")
### r -> mm
mm(from = input, type = "file", root = "mindr", to = "test.mm")

# md文件转换

   **md文件输出到思维导图**

    input <- system.file("examples/xuer/xuer.md", package = "mindr")
    
    mm(from = input, type = "file", root = "Learning R", to = "learningr.mm")