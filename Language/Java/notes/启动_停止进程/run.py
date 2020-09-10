'''
Author: wjn
Date: 2020-09-03 16:23:02
LastEditors: wjn
LastEditTime: 2020-09-10 14:08:09
'''
import os
import sys

# server_name = "morgana-web"
# server_main_class = "com.wind.morgana.web.MorganaWebApplication"
# build_path = 'D:/wjn/IdeaProjects/morgana/morgana-web/bin/'

# server_name = "org"
# server_main_class = "com.wind.org.OrgBootstrapApplication"
# build_path = "D:/wjn/IdeaProjects/morgana/morgana-setting/org/org-bootstrap/bin/"


# server_name = "dataee"
# server_main_class = "com.wind.dataee.DataeeBootstrapApplication"
# build_path = "D:/wjn/IdeaProjects/morgana/morgana-data/dataee/dataee-bootstrap/bin/"


# server_name = "datars"
# server_main_class = "com.wind.datars.DatarsBootstrapApplication"
# build_path = "D:/wjn/IdeaProjects/morgana/morgana-data/datars/datars-bootstrap/bin/"


# server_name = "dashboard"
# server_main_class = "com.wind.dashboard.DashboardBootstrapApplication"
# build_path = "D:/wjn/IdeaProjects/morgana/morgana-visualization/dashboard/dashboard-bootstrap/bin/"

# server_name = "portal"
# server_main_class = "com.wind.portal.PortalBootstrapApplication"
# build_path = "D:/wjn/IdeaProjects/morgana/morgana-visualization/portal/portal-bootstrap/bin/"


server_name = "fdbdv"
server_main_class = "com.fdbdv.web.WebApplication"
build_path = "D:/wjn/IdeaProjects/fdbdv/src/main/bin/"


path = 'Language/Java/notes/启动_停止进程/'
start_file = path + 'src/start-model.sh'
stop_file = path +'src/stop-model.sh'
out_start_file = build_path + "start-%s.sh" %(server_name)
out_stop_file = build_path + "stop-%s.sh" %(server_name)

def build_start():
    with open(start_file,'r') as fr:
        contents = fr.read()
        contents = contents.replace("<SERVER_NAME>",server_name).replace("<SERVER_MAIN_CLASS>",server_main_class)
        with open(out_start_file, 'w') as fw:
            fw.write(contents)


def build_stop():
    with open(stop_file,'r') as fr:
        contents = fr.read()
        contents = contents.replace("<SERVER_NAME>",server_name)
        with open(out_stop_file, 'w') as fw:
            fw.write(contents)


if __name__ == '__main__':
    build_start()
    build_stop()