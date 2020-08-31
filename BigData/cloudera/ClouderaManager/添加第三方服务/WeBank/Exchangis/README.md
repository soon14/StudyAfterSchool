[官方地址](https://github.com/cloudera/cm_ext/wiki/CSD-Primer)
# 创建目录
mkdir EXCHANGIS-1.0 EXCHANGIS-1.0/descriptor EXCHANGIS-1.0/scripts

# 创建服务描述文件
vim EXCHANGIS-1.0/descriptor/service.sdl
```
{
  "name" : "EXCHANGIS",
  "label" : "EXCHANGIS",
  "description" : "The EXCHANGIS service",
  "version" : "1.0",
  "runAs" : { 
    "user" : "root",
    "group" : "root"
   },  
   "roles" : [
    {
       "name" : "EXCHANGIS_WEBSERVER",
       "label" : "Web Server",
       "pluralLabel" : "Web Servers",
       "parameters" : [
        {
          "name" : "port_num",
          "label" : "Webserver port",
          "description" : "The web server port number",
          "required" : "true",
          "type" : "port",
          "default" : 9503
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
vim EXCHANGIS-1.0/scripts/control.sh

```
#!/bin/bash
CMD=$1

case $CMD in
  (start)
    EXCHANGIS "Starting the web server on port [$WEBSERVER_PORT]"
    exec python -m SimpleHTTPServer $WEBSERVER_PORT
    ;;
  (*)
    EXCHANGIS "Don't understand [$CMD]"
    ;;
esac
```

# 打包
```
cd EXCHANGIS-1.0
jar -cvf EXCHANGIS-1.0.jar *
```

# 移动到/opt/cloudera/csd目录下

# 重启服务
systemctl restart cloudera-scm-server

# 查看日志文件
tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log


# 创建service.mdl
```
{
  "name" : "EXCHANGIS",
  "nameForCrossEntityAggregateMetrics" : "EXCHANGISs",
  "version" : 1,
  "metricDefinitions" : [
    {
      "name" : "EXCHANGIS_service_metric_one",
      "label" : "EXCHANGIS Service Metric One",
      "description" : "This is the EXCHANGIS Service's first metric.",
      "numeratorUnit" : "bytes",
      "type" : "gauge"
    },
    {
      "name" : "EXCHANGIS_service_metric_two",
      "label" : "EXCHANGIS Service Metric Two",
      "description" : "This is the EXCHANGIS Service's second metric.",
      "numeratorUnit" : "EXCHANGISs",
      "type" : "counter"
    },
    {
      "name" : "EXCHANGIS_common_metric",
      "label" : "EXCHANGIS Service Common Metric",
      "description" : "This is the EXCHANGIS Service's common metric.",
      "numeratorUnit" : "seconds",
      "type" : "gauge"
    }
  ],
  "metricEntityAttributeDefinitions" : [
    {
      "name" : "EXCHANGISServiceAttributeOne",
      "label" : "EXCHANGIS Service Attribute One",
      "description" : "The EXCHANGIS Service's First Entity Attribute",
      "valueCaseSensitive": false
    },
    {
      "name" : "EXCHANGISServiceAttributeTwo",
      "label" : "EXCHANGIS Service Attribute Two",
      "description" : "The EXCHANGIS Service's Second Entity Attribute",
      "valueCaseSensitive": true
    }
  ],
  "metricEntityTypeDefinitions" : [
    {
      "name" : "EXCHANGIS_ENTITY_TYPE_ONE",
      "nameForCrossEntityAggregateMetrics" : "EXCHANGIS_entity_type_ones",
      "entityNameFormat" :  [
         "serviceName",
         "EXCHANGISServiceAttributeOne"
      ],
      "label" : "EXCHANGIS Service Entity Type One",
      "labelPlural" : "EXCHANGIS Service Entity Type Ones",
      "description" : "The EXCHANGIS Service's First Entity Type",
      "immutableAttributeNames" : [
         "serviceName",
         "EXCHANGISServiceAttributeOne"
      ],
      "mutableAttributeNames" : [
        "EXCHANGISServiceAttributeTwo"
      ],
      "parentMetricEntityTypeNames" : [
         "EXCHANGIS"
      ],
      "metricDefinitions" : [
        {
          "name" : "EXCHANGIS_entity_type_one_metric_one",
          "label" : "EXCHANGIS Service Entity Type One Metric One",
          "description" : "This is the EXCHANGIS Service's Entity Type One's first metric.",
          "numeratorUnit" : "bytes",
          "type" : "gauge"
        },
        {
          "name" : "EXCHANGIS_entity_type_one_metric_two",
          "label" : "EXCHANGIS Service Entity Type One Metric Two",
          "description" : "This is the EXCHANGIS Service's Entity Type Two's first metric.",
          "numeratorUnit" : "EXCHANGISs",
          "type" : "counter"
        },
        {
          "name" : "EXCHANGIS_common_metric",
          "label" : "EXCHANGIS Service Common Metric",
          "description" : "This is the EXCHANGIS Service's common metric.",
          "numeratorUnit" : "seconds",
          "type" : "gauge"
        }
      ]
    },
    {
      "name" : "EXCHANGIS_ENTITY_TYPE_TWO",
      "nameForCrossEntityAggregateMetrics" : "EXCHANGIS_entity_type_twos",
      "entityNameFormat" :  [
         "roleName",
         "EXCHANGISServiceAttributeOne"
      ],
      "label" : "EXCHANGIS Service Entity Type Two",
      "labelPlural" : "EXCHANGIS Service Entity Type Twos",
      "description" : "The EXCHANGIS Service's Second Entity Type",
      "immutableAttributeNames" : [
         "roleName",
         "EXCHANGISServiceAttributeOne"
      ],
      "parentMetricEntityTypeNames" : [
         "EXCHANGIS-EXCHANGIS_WEBSERVER",
         "EXCHANGIS_ENTITY_TYPE_ONE"
      ],
      "metricDefinitions" : [
        {
          "name" : "EXCHANGIS_entity_type_two_metric_one",
          "label" : "EXCHANGIS Service Entity Type Two Metric One",
          "description" : "This is the EXCHANGIS Service's Entity Type Two's first metric.",
          "numeratorUnit" : "bytes",
          "type" : "gauge"
        },
        {
          "name" : "EXCHANGIS_entity_type_two_metric_two",
          "label" : "EXCHANGIS Service Entity Type Two Metric Two",
          "description" : "This is the EXCHANGIS Service's Entity Type Two's second metric.",
          "numeratorUnit" : "EXCHANGISs",
          "type" : "counter"
        },
        {
          "name" : "EXCHANGIS_common_metric",
          "label" : "EXCHANGIS Service Common Metric",
          "description" : "This is the EXCHANGIS Service's common metric.",
          "numeratorUnit" : "seconds",
          "type" : "gauge"
        }
      ]
    }
  ],
  "roles" : [
   {
      "name" : "EXCHANGIS_MASTER_SERVER",
       "metricDefinitions" : [
         {
          "name" : "EXCHANGIS_master_server_metric_one",
          "label" : "EXCHANGIS Master Server Metric One",
          "description" : "This is the EXCHANGIS Service's Master Server's first metric.",
          "numeratorUnit" : "bytes",
          "type" : "gauge"
         },
         {
          "name" : "EXCHANGIS_master_server_metric_two",
          "label" : "EXCHANGIS Master Server Metric Two",
          "description" : "This is the EXCHANGIS Service's Master Server's second metric.",
          "numeratorUnit" : "EXCHANGISs",
          "type" : "counter"
         },
         {
          "name" : "EXCHANGIS_common_metric",
          "label" : "EXCHANGIS Service Common Metric",
          "description" : "This is the EXCHANGIS Service's common metric.",
          "numeratorUnit" : "seconds",
          "type" : "gauge"
         }
       ]
    },
    {
       "name" : "EXCHANGIS_WEBSERVER",
       "metricDefinitions" : [
         {
          "name" : "EXCHANGIS_web_server_metric_one",
          "label" : "EXCHANGIS Web Server Metric One",
          "description" : "This is the EXCHANGIS Service's Web Server's first metric.",
          "numeratorUnit" : "bytes",
          "type" : "gauge"
         },
         {
          "name" : "EXCHANGIS_web_server_metric_two",
          "label" : "EXCHANGIS Web Server Metric Two",
          "description" : "This is the EXCHANGIS Service's Web Server's second metric.",
          "numeratorUnit" : "EXCHANGISs",
          "type" : "counter"
         },
         {
          "name" : "EXCHANGIS_common_metric",
          "label" : "EXCHANGIS Service Common Metric",
          "description" : "This is the EXCHANGIS Service's common metric.",
          "numeratorUnit" : "seconds",
          "type" : "gauge"
         }
       ]
    }
  ]
}
```