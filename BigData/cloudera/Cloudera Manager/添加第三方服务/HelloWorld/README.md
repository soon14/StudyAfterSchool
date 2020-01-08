[官方地址](https://github.com/cloudera/cm_ext/wiki/CSD-Primer)
# 创建目录
mkdir ECHO-1.0 ECHO-1.0/descriptor ECHO-1.0/scripts

# 创建服务描述文件
vim ECHO-1.0/descriptor/service.sdl
```
{
  "name" : "ECHO",
  "label" : "Echo",
  "description" : "The echo service",
  "version" : "1.0",
  "runAs" : { 
    "user" : "root",
    "group" : "root"
   },  
   "roles" : [
    {
       "name" : "ECHO_WEBSERVER",
       "label" : "Web Server",
       "pluralLabel" : "Web Servers",
       "parameters" : [
        {
          "name" : "port_num",
          "label" : "Webserver port",
          "description" : "The web server port number",
          "required" : "true",
          "type" : "port",
          "default" : 9876
        }
      ],
      "startRunner" : {
         "program" : "scripts/control.sh",
         "args" : [ "start" ],
         "environmentVariables" : {
           "WEBSERVER_PORT" : "${port_num}"         
         }
      }
    }
  ]
}
```
# 创建控制脚本
vim ECHO-1.0/scripts/control.sh

```
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
```

# 打包
```
cd ECHO-1.0
jar -cvf ECHO-1.0.jar *
```

# 移动到/opt/cloudera/csd目录下

# 重启服务
systemctl restart cloudera-scm-server

# 查看日志文件
tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log


# 创建service.mdl
```
{
  "name" : "ECHO",
  "nameForCrossEntityAggregateMetrics" : "echos",
  "version" : 1,
  "metricDefinitions" : [
    {
      "name" : "echo_service_metric_one",
      "label" : "Echo Service Metric One",
      "description" : "This is the Echo Service's first metric.",
      "numeratorUnit" : "bytes",
      "type" : "gauge"
    },
    {
      "name" : "echo_service_metric_two",
      "label" : "Echo Service Metric Two",
      "description" : "This is the Echo Service's second metric.",
      "numeratorUnit" : "echos",
      "type" : "counter"
    },
    {
      "name" : "echo_common_metric",
      "label" : "Echo Service Common Metric",
      "description" : "This is the Echo Service's common metric.",
      "numeratorUnit" : "seconds",
      "type" : "gauge"
    }
  ],
  "metricEntityAttributeDefinitions" : [
    {
      "name" : "echoServiceAttributeOne",
      "label" : "Echo Service Attribute One",
      "description" : "The Echo Service's First Entity Attribute",
      "valueCaseSensitive": false
    },
    {
      "name" : "echoServiceAttributeTwo",
      "label" : "Echo Service Attribute Two",
      "description" : "The Echo Service's Second Entity Attribute",
      "valueCaseSensitive": true
    }
  ],
  "metricEntityTypeDefinitions" : [
    {
      "name" : "ECHO_ENTITY_TYPE_ONE",
      "nameForCrossEntityAggregateMetrics" : "echo_entity_type_ones",
      "entityNameFormat" :  [
         "serviceName",
         "echoServiceAttributeOne"
      ],
      "label" : "Echo Service Entity Type One",
      "labelPlural" : "Echo Service Entity Type Ones",
      "description" : "The Echo Service's First Entity Type",
      "immutableAttributeNames" : [
         "serviceName",
         "echoServiceAttributeOne"
      ],
      "mutableAttributeNames" : [
        "echoServiceAttributeTwo"
      ],
      "parentMetricEntityTypeNames" : [
         "ECHO"
      ],
      "metricDefinitions" : [
        {
          "name" : "echo_entity_type_one_metric_one",
          "label" : "Echo Service Entity Type One Metric One",
          "description" : "This is the Echo Service's Entity Type One's first metric.",
          "numeratorUnit" : "bytes",
          "type" : "gauge"
        },
        {
          "name" : "echo_entity_type_one_metric_two",
          "label" : "Echo Service Entity Type One Metric Two",
          "description" : "This is the Echo Service's Entity Type Two's first metric.",
          "numeratorUnit" : "echos",
          "type" : "counter"
        },
        {
          "name" : "echo_common_metric",
          "label" : "Echo Service Common Metric",
          "description" : "This is the Echo Service's common metric.",
          "numeratorUnit" : "seconds",
          "type" : "gauge"
        }
      ]
    },
    {
      "name" : "ECHO_ENTITY_TYPE_TWO",
      "nameForCrossEntityAggregateMetrics" : "echo_entity_type_twos",
      "entityNameFormat" :  [
         "roleName",
         "echoServiceAttributeOne"
      ],
      "label" : "Echo Service Entity Type Two",
      "labelPlural" : "Echo Service Entity Type Twos",
      "description" : "The Echo Service's Second Entity Type",
      "immutableAttributeNames" : [
         "roleName",
         "echoServiceAttributeOne"
      ],
      "parentMetricEntityTypeNames" : [
         "ECHO-ECHO_WEBSERVER",
         "ECHO_ENTITY_TYPE_ONE"
      ],
      "metricDefinitions" : [
        {
          "name" : "echo_entity_type_two_metric_one",
          "label" : "Echo Service Entity Type Two Metric One",
          "description" : "This is the Echo Service's Entity Type Two's first metric.",
          "numeratorUnit" : "bytes",
          "type" : "gauge"
        },
        {
          "name" : "echo_entity_type_two_metric_two",
          "label" : "Echo Service Entity Type Two Metric Two",
          "description" : "This is the Echo Service's Entity Type Two's second metric.",
          "numeratorUnit" : "echos",
          "type" : "counter"
        },
        {
          "name" : "echo_common_metric",
          "label" : "Echo Service Common Metric",
          "description" : "This is the Echo Service's common metric.",
          "numeratorUnit" : "seconds",
          "type" : "gauge"
        }
      ]
    }
  ],
  "roles" : [
   {
      "name" : "ECHO_MASTER_SERVER",
       "metricDefinitions" : [
         {
          "name" : "echo_master_server_metric_one",
          "label" : "Echo Master Server Metric One",
          "description" : "This is the Echo Service's Master Server's first metric.",
          "numeratorUnit" : "bytes",
          "type" : "gauge"
         },
         {
          "name" : "echo_master_server_metric_two",
          "label" : "Echo Master Server Metric Two",
          "description" : "This is the Echo Service's Master Server's second metric.",
          "numeratorUnit" : "echos",
          "type" : "counter"
         },
         {
          "name" : "echo_common_metric",
          "label" : "Echo Service Common Metric",
          "description" : "This is the Echo Service's common metric.",
          "numeratorUnit" : "seconds",
          "type" : "gauge"
         }
       ]
    },
    {
       "name" : "ECHO_WEBSERVER",
       "metricDefinitions" : [
         {
          "name" : "echo_web_server_metric_one",
          "label" : "Echo Web Server Metric One",
          "description" : "This is the Echo Service's Web Server's first metric.",
          "numeratorUnit" : "bytes",
          "type" : "gauge"
         },
         {
          "name" : "echo_web_server_metric_two",
          "label" : "Echo Web Server Metric Two",
          "description" : "This is the Echo Service's Web Server's second metric.",
          "numeratorUnit" : "echos",
          "type" : "counter"
         },
         {
          "name" : "echo_common_metric",
          "label" : "Echo Service Common Metric",
          "description" : "This is the Echo Service's common metric.",
          "numeratorUnit" : "seconds",
          "type" : "gauge"
         }
       ]
    }
  ]
}
```