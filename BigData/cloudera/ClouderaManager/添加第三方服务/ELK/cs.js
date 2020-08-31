/*
 * @Author: wjn
 * @Date: 2020-08-01 11:33:51
 * @LastEditors: wjn
 * @LastEditTime: 2020-08-01 11:33:52
 */ 


 const logmap = { 'err': 'ERROR', 'info': 'INFO', 'error': 'ERROR', 'warning': 'WARN', 'fatal': 'FATAL', 'debug': 'DEBUG', 'trace': 'TRACE'}
 class KbnLoggerStringFormat extends _log_format.default {
     format(data){
         const tags = data.tags;
         const msg = data.error ? data.error.stack : data.message;
         var level = 'INFO';

         if(tags instanceof Array){
             for(var i = 0; i < tags.length; i++){
                 var tag = tags[i];

                if(logmap[tag] != undefined){
                    level = logmap[tag];
                    break;
                }
             }
         }
         const l = level
         const date = this.extractAndFormatTimestamp(data, 'YYYY-MM-DD HH:mm:ss,SSS')
         if(tags.length > 0){
             return `${date} ${l} kibana: [${tags}]: ${msg}`;
         }else{
             return `${date} ${l} kibana: ${msg}`;
         }
     }
 }