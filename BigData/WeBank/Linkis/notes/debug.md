export DEBUG_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=10096"

nohup java $DWS_ENGINE_MANAGER_JAVA_OPTS $DEBUG_OPTS -cp $HOME/conf:$HOME/lib/* com.webank.wedatasphere.linkis.DataWorkCloudApplication 2>&1 > $DWS_ENGINE_MANAGER_LOG_PATH/linkis-database.out &