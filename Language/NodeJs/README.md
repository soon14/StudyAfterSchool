<!--
 * @Author: wjn
 * @Date: 2020-11-04 09:26:52
 * @LastEditors: wjn
 * @LastEditTime: 2020-11-04 09:26:54
-->
1.global变量

例：1.js 中有

function debug(){

   console.log('debug');

}

global.debug = debug;

2.js中require 1.js之后就可以直接调用函数debug了 如下：

require('1.js');

debug();



2.exports方式

1.js中有

var array = 'this is debug';

module.exports.array = array;

2.js中require 1.js但是要使用一个对象接它， 例子如下：

var t= require('1.js');

console.log(t.array);