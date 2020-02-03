错误| 原因| 解决
-|-|-
Device or resource busy|出现上面情况，看谁在用这个目录或者占用| umount 文件，进行删除，如果不行，进行<br>lsof +d 文件 