1. Caused by: Generating splits for a textual index column allowed only in case of "-Dorg.apache.sqoop.splitter.allow_text_splitter=true" property passed as a parameter


解决方法：在sqoop import命令后加参数 sqoop import "-Dorg.apache.sqoop.splitter.allow_text_splitter=true"