###
 # @Author: wjn
 # @Date: 2020-03-04 14:44:47
 # @LastEditors: wjn
 # @LastEditTime: 2020-03-04 14:45:02
 ###


##Eurkea install
SERVER_NAME=eureka
SERVER_IP=$EUREKA_INSTALL_IP
SERVER_PORT=$EUREKA_PORT
SERVER_HOME=$LINKIS_INSTALL_HOME
echo "$SERVER_NAME-step1: create dir"
if test -z "$SERVER_IP"
then
  SERVER_IP=$local_host
fi
EUREKA_URL=http://$SERVER_IP:$EUREKA_PORT/eureka/

if ! executeCMD $SERVER_IP "test -e $SERVER_HOME"; then
  executeCMD $SERVER_IP  "sudo mkdir -p $SERVER_HOME;sudo chown -R $deployUser:$deployUser $SERVER_HOME"
  isSuccess "create the dir of $SERVER_HOME"
fi

echo "$SERVER_NAME-step2:copy install package"
copyFile $SERVER_IP ${workDir}/share/springcloud/$SERVER_NAME/$SERVER_NAME.zip $SERVER_HOME
isSuccess "copy $SERVER_NAME"
executeCMD $SERVER_IP   "cd $SERVER_HOME/;rm -rf eureka;unzip  $SERVER_NAME.zip > /dev/null;cd -"
echo "$SERVER_NAME-step3:subsitution conf"
eureka_conf_path=$SERVER_HOME/$SERVER_NAME/conf/application-$SERVER_NAME.yml
executeCMD $SERVER_IP   "sed -i ${txt}  \"s#port:.*#port: $SERVER_PORT#g\" $eureka_conf_path"
executeCMD $SERVER_IP   "sed -i ${txt}  \"s#defaultZone:.*#defaultZone: $EUREKA_URL#g\" $eureka_conf_path"
executeCMD $SERVER_IP   "sed -i ${txt}  \"s#hostname:.*#hostname: $SERVER_IP#g\" $eureka_conf_path"
isSuccess "subsitution conf of $SERVER_NAME"
echo "<----------------$SERVER_NAME:end------------------->"
##Eurkea install  end




