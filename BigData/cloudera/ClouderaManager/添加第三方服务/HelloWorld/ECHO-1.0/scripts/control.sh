###
 # @Author: wjn
 # @Date: 2020-07-02 10:13:00
 # @LastEditors: wjn
 # @LastEditTime: 2020-07-02 10:13:08
### 
#!/bin/bash
CMD=$1

case $CMD in
  (start)
    echo "Starting the web server on port [$WEBSERVER_PORT]"
    exec python -m SimpleHTTPServer $WEBSERVER_PORT
    ;;
  (*)
    echo "Don't understand [$CMD]"
    ;;
esac